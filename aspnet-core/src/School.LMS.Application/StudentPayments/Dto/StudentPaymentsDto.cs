using Abp.Application.Services.Dto;
using School.LMS.StudentEducationalPayment.Dto;
using School.LMS.Students.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.StudentPayments.Dto
{
    public class StudentPaymentsDto:EntityDto
    {
        public StudentDto StudentInfo { get; set; }
        public List<EducationalPaymentDto> EducationalPayments { get; set; }
        public List<BusLineDto> BusLines { get; set; }
    }
}
