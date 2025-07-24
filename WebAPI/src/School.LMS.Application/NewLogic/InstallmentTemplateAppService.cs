using Abp.Application.Services;
using Abp.Domain.Entities;
using Abp.Domain.Repositories;
using Abp.Timing;
using AutoMapper;
using AutoMapper.Internal.Mappers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using School.LMS.Models;
using School.LMS.Models.NewLogic;
using School.LMS.NewLogic.Dtos;
using System;
using System.Collections.Generic;
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
                        DueDate = template.EndDate
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

}
