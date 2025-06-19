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
    public class BusFeePlan:Entity
    {

        [Required]
        public string Line { get; set; }

        public decimal ExpectedTotalAmount { get; set; }

        public decimal FullAmountWith5PercentDiscount { get; set; }

        public DateTime FullAmountDueDate { get; set; }

        public ICollection<BusInstallment> Installments { get; set; }
    }

    public class BusInstallment : Entity
    {

        [Required]
        public int BusFeePlanId { get; set; }

        [ForeignKey(nameof(BusFeePlanId))]
        public BusFeePlan FeePlan { get; set; }

        public int Order { get; set; }

        public decimal Amount { get; set; }

        public DateTime DueDate { get; set; }
    }

}
