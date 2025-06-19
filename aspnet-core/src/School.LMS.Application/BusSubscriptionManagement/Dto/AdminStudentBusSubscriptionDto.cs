using Abp.Application.Services.Dto;
using Abp.Domain.Entities;
using School.LMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.BusSubscriptionManagement.Dto
{
    public class AdminStudentBusSubscriptionDto : Entity
    {
        public int StudentId { get; set; }
        public string StudentName { get; set; } // From Student entity
        public int BusFeePlanId { get; set; }
        public string BusLineName { get; set; } // From BusFeePlan
        public string Notes { get; set; }
        public subscriptionStatus Status { get; set; }
    }

    public class AdminUpdateStudentBusSubscriptionDto
    {
        public int StudentId { get; set; }
        public int BusFeePlanId { get; set; }
        public string Notes { get; set; }
        public subscriptionStatus Status { get; set; }
    }
}
