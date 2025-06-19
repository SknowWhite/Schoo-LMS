using Abp.Application.Services.Dto;
using Abp.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.EducationalFeePlan.Dto
{
    public class EducationalFeeFromExcelDto : EntityDto
    {
        public string Grade { get; set; }
        public decimal ExpectedAmount { get; set; }
        public Installment FirstInstallment { get; set; }
        public Installment SecondInstallment { get; set; }
        public Installment ThirdInstallment { get; set; }
        public Installment FourthInstallment { get; set; }
        public Installment fullAmountWithDiscount { get; set; }
    }
    public class Installment
    {
        public decimal Amount { get; set; }
        public DateTime DueDate { get; set; }
    }
}
