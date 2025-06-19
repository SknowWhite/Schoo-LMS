using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Abp.Domain.Entities;

namespace School.LMS.Models
{
    public class EducationalFeePlan : Entity
    {
        [Required]
        public string Grade { get; set; }

        public decimal ExpectedTotalAmount { get; set; }

        public decimal FullAmountWith5PercentDiscount { get; set; }

        public DateTime FullAmountDueDate { get; set; }

        public ICollection<EducationalInstallment> Installments { get; set; }
    }

    public class EducationalInstallment : Entity
    {
       

        [Required]
        public int EducationalFeePlanId { get; set; }

        [ForeignKey(nameof(EducationalFeePlanId))]
        public EducationalFeePlan FeePlan { get; set; }

        public int Order { get; set; } // 1 to 4

        public decimal Amount { get; set; }

        public DateTime DueDate { get; set; }
    }

}
