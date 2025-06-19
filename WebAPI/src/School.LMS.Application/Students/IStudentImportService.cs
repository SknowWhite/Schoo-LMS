using Abp.Application.Services;
using School.LMS.Roles.Dto;
using School.LMS.Students.Dto;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace School.LMS.Students
{
    public interface IStudentImportService : IAsyncCrudAppService<StudentDto, int, PagedStudentResultRequestDto, StudentDto, StudentDto>
    {
         Task ImportStudents(List<StudentDto> studentDtos);
    }
}
