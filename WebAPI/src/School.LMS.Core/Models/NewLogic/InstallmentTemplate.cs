using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Abp.Domain.Entities;

namespace School.LMS.Models.NewLogic
{
    public class InstallmentTemplate : Entity<Guid>
    {

        public string Name { get; set; } = default!;
        public InstallmentType Type { get; set; } // Enum: Educational, Bus, Other
        public decimal TotalAmount { get; set; }
        public DateTime StartDate { get; set; } // Visibility start
        public DateTime EndDate { get; set; }   // Visibility end
        public string? Notes { get; set; }
        public DateTime CreatedDate { get; set; }

        public ICollection<InstallmentBreakdown> Breakdowns { get; set; } = new List<InstallmentBreakdown>();
        public ICollection<StudentInstallment> StudentInstallments { get; set; } = new List<StudentInstallment>();
    }

    public class InstallmentBreakdown: Entity<Guid>
    {
        public Guid InstallmentTemplateId { get; set; }
        public string Label { get; set; } = default!;
        public decimal Amount { get; set; }

        public InstallmentTemplate InstallmentTemplate { get; set; } = default!;
    }
        public class StudentInstallment : Entity<Guid>
        {
            public int StudentId { get; set; }
            public Guid InstallmentTemplateId { get; set; }

            public decimal Amount { get; set; }
            public string? Notes { get; set; }
            public DateTime? DueDate { get; set; }
            public InstallmentStatus Status { get; set; } = InstallmentStatus.New;
            public string? InvoiceUrl { get; set; }
            public string? TransactionId { get; set; }
            public DateTime InvoiceLastUpdate { get; set; }
            public Student Student { get; set; } = default!;
            public InstallmentTemplate InstallmentTemplate { get; set; } = default!;
            public ICollection<StudentInstallmentPayment> Payments { get; set; } = new List<StudentInstallmentPayment>();
        }
    public class StudentInstallmentPayment : Entity<Guid>
    {
        public Guid StudentInstallmentId { get; set; }

        public decimal PaidAmount { get; set; }
        public DateTime PaymentDate { get; set; }
        public string? PaymentReference { get; set; }

        public StudentInstallment StudentInstallment { get; set; } = default!;
    }
    public enum InstallmentType
    {
        Educational = 0,
        Bus = 1,
        Other = 2
    }
    public enum InstallmentStatus
    {
        New = 0,
        Pending = 1,
        Paid = 2,
        Failed=3
    }


}
