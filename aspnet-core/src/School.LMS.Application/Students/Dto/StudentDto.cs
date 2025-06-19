using Abp.Application.Services.Dto;
using Abp.AutoMapper;
using School.LMS.Models;
using System.Threading.Tasks;
namespace School.LMS.Students.Dto
{
    [AutoMapTo(typeof(Student))]
    public class StudentDto:EntityDto
    {
        public string StudentId { get; set; }
        public string Name { get; set; }
        public string Grade { get; set; }
        public string MobileNumber { get; set; }
        public string Status { get; set; }
        public decimal PreviousAmount { get; set; }
    }
}
