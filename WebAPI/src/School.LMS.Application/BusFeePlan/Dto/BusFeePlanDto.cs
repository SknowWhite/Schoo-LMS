using Abp.Application.Services.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.BusFeePlan.Dto
{
    public class BusFeePlanDto : EntityDto
    {
        public string Line { get; set; }
        public decimal ExpectedTotalAmount { get; set; }
        public decimal FullAmountWith5PercentDiscount { get; set; }
        public DateTime FullAmountDueDate { get; set; }
        public string InvoiceNumber { get; set; }

        public List<BusInstallmentDto> Installments { get; set; }
    }

    public class BusInstallmentDto : EntityDto
    {
        public int Order { get; set; }
        public decimal Amount { get; set; }
        public DateTime DueDate { get; set; }
        public string InvoiceNumber { get; set; }
    }

}
