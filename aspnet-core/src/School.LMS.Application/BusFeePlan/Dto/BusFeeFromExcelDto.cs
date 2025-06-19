using Abp.Application.Services.Dto;
using School.LMS.EducationalFeePlan.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.BusFeePlan.Dto
{
    public class BusFeeFromExcelDto:EntityDto
    {
        public string Line { get; set; }
        public decimal ExpectedAmount { get; set; }
        public Installment FirstInstallment { get; set; }
        public Installment SecondInstallment { get; set; }
        public Installment ThirdInstallment { get; set; }
        public Installment FourthInstallment { get; set; }
        public Installment fullAmountWithDiscount { get; set; }
    }
}
