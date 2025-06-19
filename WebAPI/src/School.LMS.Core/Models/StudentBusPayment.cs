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
    public class StudentBusPayment:Entity
    {

        [Required]
        public int BusSubscriptionId { get; set; }

        [ForeignKey(nameof(BusSubscriptionId))]
        public StudentBusSubscription BusSubscription { get; set; }

        public int? BusInstallmentId { get; set; }

        [ForeignKey(nameof(BusInstallmentId))]
        public BusInstallment Installment { get; set; }

        public bool IsFullPayment { get; set; }

        public DateTime PaymentDate { get; set; }

        public decimal AmountPaid { get; set; }
        public PaymentStatus Status { get; set; }
        public DateTime? PaymentStatusLastUpdate { get; set; }

        public string? TransactionId { get; set; }

        public string? InvoiceNumber { get; set; }


    }

}
