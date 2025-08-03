using Abp.Application.Services;
using Abp.Domain.Entities;
using Abp.Domain.Repositories;
using Abp.Timing;
using AutoMapper;
using AutoMapper.Internal.Mappers;
using ClosedXML.Excel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using School.LMS.Models;
using School.LMS.Models.NewLogic;
using School.LMS.NewLogic.Dtos;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace School.LMS.NewLogic
{
    public class InstallmentTemplateAppService : ApplicationService, IInstallmentTemplateAppService
    {
        private readonly IRepository<InstallmentTemplate, Guid> _templateRepo;
        private readonly IRepository<Student> _studentRepo;
        private readonly IRepository<StudentInstallment, Guid> _studentInstallmentRepo;
        private readonly IMapper _mapper;

        public InstallmentTemplateAppService(
            IRepository<InstallmentTemplate, Guid> templateRepo,
            IRepository<Student> studentRepo,
            IRepository<StudentInstallment, Guid> studentInstallmentRepo,
            IMapper objectMapper)
        {
            _templateRepo = templateRepo;
            _studentRepo = studentRepo;
            _studentInstallmentRepo = studentInstallmentRepo;
            _mapper = objectMapper;
        }

        public async Task<List<InstallmentTemplateDto>> GetListAsync()
        {
            var queryable = await _templateRepo.GetAllAsync();

            var templates = await queryable
                .Include(t => t.Breakdowns)
                .ToListAsync();

            return _mapper.Map<List<InstallmentTemplate>, List<InstallmentTemplateDto>>(templates);

        }
        public  List<string> GetGradeListAsync()
        {
            return  _studentRepo.GetAll().Select(x=>x.Grade).ToList();
        }
        public async Task<InstallmentTemplateDto> GetAsync(Guid id)
        {
            var queryable = await _templateRepo.GetAllAsync();

            var template = await queryable
                .Include(t => t.Breakdowns)
                .FirstOrDefaultAsync(x => x.Id == id);

            if (template == null)
                throw new EntityNotFoundException(typeof(InstallmentTemplate), id);

            return _mapper.Map<InstallmentTemplate, InstallmentTemplateDto>(template);
        }

        public async Task<InstallmentTemplateDto> CreateAsync(CreateUpdateInstallmentTemplateDto input)
        {
            var entity = _mapper.Map<CreateUpdateInstallmentTemplateDto, InstallmentTemplate>(input);
            entity.CreatedDate = Clock.Now;

            await _templateRepo.InsertAsync(entity);

            return _mapper.Map<InstallmentTemplate, InstallmentTemplateDto>(entity);
        }

        public async Task<InstallmentTemplateDto> UpdateAsync(UpdateInstallmentTemplateInput model)
        {
            var entity = await _templateRepo.GetAsync(model.Id);
            _mapper.Map(model.Input, entity);

            await _templateRepo.UpdateAsync(entity);

            return _mapper.Map<InstallmentTemplate, InstallmentTemplateDto>(entity);
        }

        [HttpPost]
        public async Task DeleteAsync(AssignInstallmentTemplateInput input)
        {
            await _templateRepo.DeleteAsync(input.Id);
        }

        public async Task AssignToAllStudentsAsync(AssignInstallmentTemplateInput input)
        {
            var template = await _templateRepo.GetAsync(input.Id);
            var students = (await _studentRepo.GetAllAsync()).AsNoTracking().ToList();

            foreach (var student in students)
            {
                var exists = (await _studentInstallmentRepo.CountAsync(x => x.StudentId == student.Id)) > 0;
             

                if (!exists)
                {
                    await _studentInstallmentRepo.InsertAsync(new StudentInstallment
                    {
                        StudentId = student.Id,
                        InstallmentTemplateId = template.Id,
                        Amount = template.TotalAmount,
                        Status = InstallmentStatus.New,
                        DueDate = template.EndDate,
                        Notes = template.Notes,                        
                    });
                }
            else
                {
                    var installment = await _studentInstallmentRepo.FirstOrDefaultAsync(x => x.StudentId == student.Id && x.InstallmentTemplateId == template.Id && x.Status != InstallmentStatus.Paid);
                    if (installment != null)
                    {
                        installment.Amount = template.TotalAmount;
                        installment.DueDate = template.EndDate;
                        await _studentInstallmentRepo.UpdateAsync(installment);
                    }
                }
            }
        }
        [HttpPost]
        public async Task AssignToGradeAsync(AssignToGradeInput input)
        {
            var students = await _studentRepo.GetAllListAsync(s => s.Grade == input.Grade);
            foreach (var student in students)
            {
                var exists = await _studentInstallmentRepo.CountAsync(x => x.StudentId == student.Id && x.InstallmentTemplateId == input.TemplateId)>0;
                if (!exists)
                {
                    await _studentInstallmentRepo.InsertAsync(new StudentInstallment
                    {
                        StudentId = student.Id,
                        InstallmentTemplateId = input.TemplateId,
                        Amount = (await _templateRepo.GetAsync(input.TemplateId)).TotalAmount,
                        DueDate = (await _templateRepo.GetAsync(input.TemplateId)).EndDate
                    });
                }
            }
        }

        [HttpPost]
        public async Task AssignToStudentsAsync(AssignToStudentsInput input)
        {
            foreach (var studentId in input.StudentIds)
            {
                var exists = await _studentInstallmentRepo.CountAsync(x => x.StudentId == studentId && x.InstallmentTemplateId == input.TemplateId)>0;
                if (!exists)
                {
                    await _studentInstallmentRepo.InsertAsync(new StudentInstallment
                    {
                        StudentId = studentId,
                        InstallmentTemplateId = input.TemplateId,
                        Amount = (await _templateRepo.GetAsync(input.TemplateId)).TotalAmount,
                        DueDate = (await _templateRepo.GetAsync(input.TemplateId)).EndDate
                    });
                }
            }
        }
        [HttpGet]
        public IActionResult DownloadExcelTemplate()
        {
            using var workbook = new XLWorkbook();
            var worksheet = workbook.AddWorksheet("Assignments");

            // Header
            worksheet.Cell(1, 1).Value = "StudentId";
            worksheet.Cell(1, 2).Value = "StudentName";
            worksheet.Cell(1, 3).Value = "TemplateName";
            worksheet.Cell(1, 4).Value = "StartDate";
            worksheet.Cell(1, 5).Value = "DueDate";
            worksheet.Cell(1, 6).Value = "Amount";
            worksheet.Cell(1, 7).Value = "Notes";

            // Sample row with DateTime and formatting
            worksheet.Cell(2, 1).Value = "123";
            worksheet.Cell(2, 2).Value = "Ahmed Ali";
            worksheet.Cell(2, 3).Value = "Term 1";

            worksheet.Cell(2, 4).Value = new DateTime(2025, 9, 1);
            worksheet.Cell(2, 4).Style.DateFormat.Format = "dd-MM-yyyy";

            worksheet.Cell(2, 5).Value = new DateTime(2025, 12, 1);
            worksheet.Cell(2, 5).Style.DateFormat.Format = "dd-MM-yyyy";

            worksheet.Cell(2, 6).Value = 500;
            worksheet.Cell(2, 7).Value = "Optional notes";

            // Optional: Apply format to entire StartDate and DueDate columns
            worksheet.Column(4).Style.DateFormat.Format = "dd-MM-yyyy";
            worksheet.Column(5).Style.DateFormat.Format = "dd-MM-yyyy";

            using var stream = new MemoryStream();
            workbook.SaveAs(stream);
            stream.Seek(0, SeekOrigin.Begin);

            return new FileContentResult(stream.ToArray(),
                "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
            {
                FileDownloadName = "StudentInstallmentsTemplate.xlsx"
            };
        }


        [HttpPost]
        public async Task<ExcelUploadResult> UploadStudentTemplateExcel(IFormFile file)
        {
            var result = new ExcelUploadResult();

            using var stream = new MemoryStream();
            await file.CopyToAsync(stream);
            using var workbook = new XLWorkbook(stream);
            var ws = workbook.Worksheet(1);

            for (int row = 2; row <= ws.LastRowUsed().RowNumber(); row++)
            {
                try
                {
                    var dto = new ExcelStudentTemplateAssignmentDto
                    {
                        StudentId = ws.Cell(row, 1).GetValue<string>()?.Trim(),
                        StudentName = ws.Cell(row, 2).GetValue<string>()?.Trim(),
                        TemplateName = ws.Cell(row, 3).GetValue<string>()?.Trim(),
                        StartDate = DateTime.Parse(ws.Cell(row, 4).GetValue<string>()),
                        DueDate = DateTime.Parse(ws.Cell(row, 5).GetValue<string>()),
                        Amount = decimal.Parse(ws.Cell(row, 6).GetValue<string>()),
                        Notes = ws.Cell(row, 7).GetValue<string>()?.Trim()
                    };

                    await AssignTemplateRowAsync(dto);
                    result.SuccessCount++;
                }
                catch (Exception ex)
                {
                    result.ErrorCount++;
                    result.Errors.Add($"Row {row}: {ex.Message}");
                }
            }

            return result;
        }

        public async Task AssignTemplateRowAsync(ExcelStudentTemplateAssignmentDto dto)
        {
            // 1. Get or create student
            var student = await _studentRepo.FirstOrDefaultAsync(s => s.StudentId == dto.StudentId);
            if (student == null)
                      return;

            // 2. Get or create installment template by name
            var template = await _templateRepo.FirstOrDefaultAsync(t => t.Name == dto.TemplateName);
            if (template == null)
            {
                template = new InstallmentTemplate
                {
                    Name = dto.TemplateName,
                    TotalAmount = dto.Amount,
                    StartDate = dto.StartDate,
                    EndDate = dto.DueDate,
                    Notes = dto.Notes,
                    Type = InstallmentType.Other,
                    Breakdowns = new List<InstallmentBreakdown>() // You can customize this
                };

                await _templateRepo.InsertAsync(template);
            }

            // 3. Check if student already has this template assigned
            var studentInstallment = await _studentInstallmentRepo.FirstOrDefaultAsync(
                si => si.StudentId == student.Id && si.InstallmentTemplateId == template.Id);

            if (studentInstallment == null)
            {
                // Create new
                studentInstallment = new StudentInstallment
                {
                    StudentId = student.Id,
                    InstallmentTemplateId = template.Id,
                    Amount = dto.Amount,
                    Notes = dto.Notes,
                    DueDate = dto.DueDate,
                    Status = InstallmentStatus.New,
                    InvoiceLastUpdate = DateTime.UtcNow
                };

                await _studentInstallmentRepo.InsertAsync(studentInstallment);
            }
            else
            {
                // Update existing
                studentInstallment.Amount = dto.Amount;
                studentInstallment.Notes = dto.Notes;
                studentInstallment.DueDate = dto.DueDate;
                studentInstallment.InvoiceLastUpdate = DateTime.UtcNow;

                await _studentInstallmentRepo.UpdateAsync(studentInstallment);
            }
        }


    }
    public class UpdateInstallmentTemplateInput
    {
        public Guid Id { get; set; }
        public CreateUpdateInstallmentTemplateDto Input { get; set; } = new();
    }
    public class AssignInstallmentTemplateInput
    {
        public Guid Id { get; set; }
       
    }
    public class AssignToGradeInput
    {
        public string Grade { get; set; }
        public Guid TemplateId { get; set; }
    }

    public class AssignToStudentsInput
    {
        public List<int> StudentIds { get; set; }
        public Guid TemplateId { get; set; }
    }
    public class ExcelStudentTemplateAssignmentDto
    {
        public string StudentId { get; set; }
        public string StudentName { get; set; }
        public string TemplateName { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime DueDate { get; set; }
        public decimal Amount { get; set; }
        public string? Notes { get; set; }
    }
    public class ExcelUploadResult
    {
        public int SuccessCount { get; set; }
        public int ErrorCount { get; set; }
        public List<string> Errors { get; set; } = new();
    }

}
