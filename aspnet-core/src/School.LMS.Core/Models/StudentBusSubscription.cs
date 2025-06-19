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
    public class StudentBusSubscription:Entity
    {

        [Required]
        public int StudentId { get; set; }

        [ForeignKey(nameof(StudentId))]
        public Student Student { get; set; }

        public int BusFeePlanId { get; set; }

        [ForeignKey(nameof(BusFeePlanId))]
        public BusFeePlan BusFeePlan { get; set; }

        public DateTime SubscriptionDate { get; set; }

        public subscriptionStatus Status { get; set; } // Pending, Approved, Rejected

        public ICollection<StudentBusPayment> Payments { get; set; }
        public string Notes { get; set; }
    }
    public enum subscriptionStatus
    {
        Pending = 0,
        Approved = 1,
        Rejected = 2
    }
   

}
