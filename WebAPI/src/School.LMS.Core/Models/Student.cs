using Abp.AutoMapper;
using Abp.Domain.Entities;
using Abp.Domain.Entities.Auditing;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.Models
{
   

    public class Student:Entity
    {
        public string StudentId { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string Grade { get; set; }

        [Required]
        public string MobileNumber { get; set; }

        public string Status { get; set; } // e.g., Active, Graduated

        public decimal PreviousAmount { get; set; }

        public virtual ICollection<StudentEducationalPayment> EducationalPayments { get; set; }

        public virtual ICollection<StudentBusSubscription> BusSubscriptions { get; set; }
    }


}
