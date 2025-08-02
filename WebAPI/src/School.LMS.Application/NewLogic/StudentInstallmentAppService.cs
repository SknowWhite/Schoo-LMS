using Abp.Application.Services;
using Abp.Domain.Entities;
using Abp.Domain.Repositories;
using Abp.Timing;
using Abp.UI;
using AutoMapper;
using AutoMapper.Internal.Mappers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using School.LMS.Models;
using School.LMS.Models.NewLogic;
using School.LMS.NewLogic.Dtos;
using School.LMS.StudentEducationalPayment;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic.Core;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.NewLogic
{
    public class StudentInstallmentAppService : ApplicationService
    {
        private readonly IRepository<StudentInstallment, Guid> _studentInstallmentRepo;
        private readonly IRepository<InstallmentTemplate, Guid> _templateRepo;
        private readonly IRepository<Student> _studentRepo;
        private readonly IMapper _mapper;
        private readonly FawryService _fawryService;
        public StudentInstallmentAppService(
            IRepository<StudentInstallment, Guid> studentInstallmentRepo,
            IRepository<InstallmentTemplate, Guid> templateRepo,
             IRepository<Student> studentRepo,IMapper mapper, FawryService fawryService)
        {
            _studentInstallmentRepo = studentInstallmentRepo;
            _templateRepo = templateRepo;
            _mapper = mapper;   
            _studentRepo = studentRepo;
            _fawryService = fawryService;
        }

        [HttpGet]
        public async Task<List<StudentInstallmentDto>> GetAllForAdminAsync()
        {
            var result = await _studentInstallmentRepo
        .GetAllIncluding(x => x.Student, x => x.InstallmentTemplate, x => x.InstallmentTemplate.Breakdowns)
                .ToListAsync();

            
            return _mapper.Map<List<StudentInstallment>, List<StudentInstallmentDto>>(result);
        }

        [HttpGet]
        public async Task<List<StudentInstallmentDto>> GetValidForStudentAsync(int studentId)
        {
            var now = Clock.Now;

            int studId=_studentRepo.FirstOrDefault(x=>x.StudentId==studentId.ToString()).Id;
            var result = await _studentInstallmentRepo
                .GetAllIncluding(x => x.InstallmentTemplate, x => x.InstallmentTemplate.Breakdowns)
                .Where(x => x.StudentId == studId &&
                            x.InstallmentTemplate.StartDate <= now )
                .ToListAsync();

            return _mapper.Map<List<StudentInstallment>, List<StudentInstallmentDto>>(result);
        }

        [HttpPut]
        public async Task<StudentInstallmentDto> UpdateStudentInstallmentAsync(UpdateInstallmentForStudent input)
        {
            var installment = await _studentInstallmentRepo.GetAsync(input.Id);
            if (installment.Status != InstallmentStatus.New)
                throw new UserFriendlyException("Only New installments can be updated.");

            installment.Amount = input.Amount;
            installment.DueDate = input.DueDate;
            await _studentInstallmentRepo.UpdateAsync(installment);
            return _mapper.Map<StudentInstallment, StudentInstallmentDto>(installment);
        }
        [HttpGet]
        public async Task<StudentInstallmentDto> GenerateInvoice(Guid id)
        {
            var installment = await _studentInstallmentRepo.GetAllIncluding(x=>x.Student,x=>x.InstallmentTemplate).Where(x=>x.Id==id).FirstAsync();
            if (installment.Status == InstallmentStatus.Paid)
                throw new UserFriendlyException("Can't pay a paid invoice.");



            var invoiceData = await _fawryService.CreatePaymentLinkAsync(installment.Student.Name, installment.Student.StudentId, installment.Student.MobileNumber,Convert.ToDouble(installment.Amount),installment.InstallmentTemplate.Name);


            if (string.IsNullOrEmpty(invoiceData.invoiceNumber))
                throw new UserFriendlyException("Failed to create payment link");

            installment.InvoiceUrl = $"https://atfawry.fawrystaging.com/invoice-ui/pay/{invoiceData.invoiceNumber}";
            installment.TransactionId = invoiceData.businessReference;
            installment.Status = InstallmentStatus.Pending;

            await _studentInstallmentRepo.UpdateAsync(installment);
            return _mapper.Map<StudentInstallment, StudentInstallmentDto>(installment);
        }
    }

    public class UpdateInstallmentForStudent
    {
        public Guid Id { get; set; }
        public decimal Amount { get; set; }
        public DateTime DueDate { get; set; }
    }

}
