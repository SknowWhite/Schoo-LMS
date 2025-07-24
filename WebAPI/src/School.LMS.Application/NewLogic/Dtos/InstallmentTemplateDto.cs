using Abp.Application.Services.Dto;
using Abp.Domain.Entities;
using School.LMS.Models.NewLogic;
using School.LMS.Students.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.NewLogic.Dtos
{
    public class InstallmentTemplateDto:EntityDto<Guid>
    {
        public string Name { get; set; } = default!;
        public InstallmentType Type { get; set; }
        public decimal TotalAmount { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string? Notes { get; set; }
        public List<InstallmentBreakdownDto> Breakdowns { get; set; } = new();
    }
    public class CreateUpdateInstallmentTemplateDto
    {
        public string Name { get; set; } = default!;
        public InstallmentType Type { get; set; }
        public decimal TotalAmount { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string? Notes { get; set; }
        public List<CreateUpdateInstallmentBreakdownDto> Breakdowns { get; set; } = new();
    }

    public class InstallmentBreakdownDto : EntityDto<Guid>
    {
        public string Label { get; set; } = default!;
        public decimal Amount { get; set; }
    }
    public class CreateUpdateInstallmentBreakdownDto
    {
        public string Label { get; set; } = default!;
        public decimal Amount { get; set; }
    }
    public class StudentInstallmentDto : EntityDto<Guid>
    {
        public int StudentId { get; set; }
        public Guid InstallmentTemplateId { get; set; }
        public decimal Amount { get; set; }
        public string? Notes { get; set; }
        public DateTime? DueDate { get; set; }
        public InstallmentStatus Status { get; set; }
        public string? InvoiceUrl { get; set; }
        public string? TransactionId { get; set; }
        public DateTime InvoiceLastUpdate { get; set; }
        public StudentDto? Student { get; set; }                    // ← NEW
        public InstallmentTemplateDto? InstallmentTemplate { get; set; }  // ← NEW
    }

}
