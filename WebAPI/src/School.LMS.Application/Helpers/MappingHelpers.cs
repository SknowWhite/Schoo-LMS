using School.LMS.EducationalFeePlan.Dto;
using School.LMS.Models;
using School.LMS.Students.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.Helpers
{
    public static class MappingHelpers
    {
        public static StudentDto MapToStudentDto(this Student student)
        {
            StudentDto studentDto = new StudentDto();
            studentDto.Id = student.Id;
            studentDto.StudentId = student.StudentId;
            studentDto.Name = student.Name;
            studentDto.Status = student.Status;
            studentDto.MobileNumber = student.MobileNumber;
            studentDto.PreviousAmount = student.PreviousAmount;
            studentDto.Grade = student.Grade;

            return studentDto;
        }
     
    }
}
