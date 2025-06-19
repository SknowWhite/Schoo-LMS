using Abp.Domain.Entities;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace School.LMS.Models
{
    public class StudentEducationalPayment : Entity
    {
        [Required]
        public int StudentId { get; set; }

        [ForeignKey(nameof(StudentId))]
        public Student Student { get; set; }

        public int? EducationalInstallmentId { get; set; }

        [ForeignKey(nameof(EducationalInstallmentId))]
        public EducationalInstallment Installment { get; set; }

        public bool IsFullPayment { get; set; }

        public DateTime PaymentDate { get; set; }

        public decimal AmountPaid { get; set; }

        public PaymentStatus PaymentStatus { get; set; }
        public DateTime PaymentStatusLastUpdate { get; set; }
        public string? TransactionId { get; set; }

        public string? InvoiceNumber { get; set; }



    }
    public enum PaymentStatus
    {
        New = 0,
        Pending=1,
        Paid = 2,
        Failed = 3,
        Canceled=4
    }

}
