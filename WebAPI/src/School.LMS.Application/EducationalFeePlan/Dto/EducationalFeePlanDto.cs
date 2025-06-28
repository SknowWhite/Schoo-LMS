using Abp.Application.Services.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.EducationalFeePlan.Dto
{
    public class EducationalFeePlanDto : EntityDto
    {
        public string Grade { get; set; }
        public decimal ExpectedTotalAmount { get; set; }
        public decimal FullAmountWith5PercentDiscount { get; set; }
        public DateTime FullAmountDueDate { get; set; }
        // in EducationalPaymentDto or equivalent
        public string InvoiceNumber { get; set; }


        public List<EducationalInstallmentDto> Installments { get; set; }
    }

    public class EducationalInstallmentDto : EntityDto
    {
        public int Order { get; set; } // 1-4
        public decimal Amount { get; set; }
        public DateTime DueDate { get; set; }
        // in EducationalPaymentDto or equivalent
        public string InvoiceNumber { get; set; }

    }

}
