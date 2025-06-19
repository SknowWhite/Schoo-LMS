using Abp.Application.Services;
using School.LMS.Authorization.Roles;
using School.LMS.Models;
using School.LMS.Students.Dto;
using Abp.Domain.Repositories;
using System.Threading.Tasks;
using Abp.Application.Services.Dto;
using System.Collections.Generic;
using Abp.EntityFrameworkCore.Repositories;
using System.Linq;
using School.LMS.Helpers;
using School.LMS.Authorization.Users;
using Abp.Authorization.Users;

namespace School.LMS.Students
{
    public class StudentImportService : AsyncCrudAppService<Student, StudentDto, int, PagedStudentResultRequestDto, StudentDto, StudentDto>, IStudentImportService
    {
        private readonly RoleManager _roleManager;
        private readonly UserManager _userRole;
        private readonly UserRegistrationManager _userRegisterationManager;

        public StudentImportService(IRepository<Student> repository, UserManager userRegistrationManager,RoleManager roleManager,UserRegistrationManager registrationManager)
            : base(repository)
        {
            _userRole = userRegistrationManager;
            _roleManager = roleManager;
            _userRegisterationManager = registrationManager;
        }
        public override async Task<PagedResultDto<StudentDto>> GetAllAsync(PagedStudentResultRequestDto input)
        {
            CheckGetAllPermission();

            var query = CreateFilteredQuery(input);
            if (input != null && !string.IsNullOrEmpty(input.Keyword))
            {
                query = query.Where(x => x.Name.ToLower().Contains(input.Keyword.ToLower()));
            }


            var totalCount = await AsyncQueryableExecuter.CountAsync(query);

            query = ApplySorting(query, input);
            query = ApplyPaging(query, input);

            var entities = await AsyncQueryableExecuter.ToListAsync(query);
            List<StudentDto> result = new List<StudentDto>();
            foreach (var entity in entities)
            {
                result.Add(entity.MapToStudentDto());
            }

            return new PagedResultDto<StudentDto>(totalCount, result);
        }

        public async Task ImportStudents(List<StudentDto> studentDtos)
        {
            List<Student> students = new List<Student>();
            foreach (var studentDto in studentDtos)
            {
                var student = MapToEntity(studentDto);
                students.Add(student);


            }

            Repository.Delete(x => x.Id > 0); // Delete existing records
            Repository.InsertRange(students);
        // await CreateUsersForStudents(studentDtos);
        }

        public override async Task<StudentDto> CreateAsync(StudentDto input)
        {
            CheckCreatePermission();

            input.Id = 0; // Ensure the ID is set to 0 for new entities
            var entity = MapToEntity(input);

            await Repository.InsertAsync(entity);
            await CurrentUnitOfWork.SaveChangesAsync();

            return entity.MapToStudentDto();
        }

        public override async Task<StudentDto> UpdateAsync(StudentDto input)
        {
            CheckUpdatePermission();

            var entity = await GetEntityByIdAsync(input.Id);

            MapToEntity(input, entity);
            await CurrentUnitOfWork.SaveChangesAsync();

            return entity.MapToStudentDto();
        }

        public Task DeleteStudent(int id)
        {
            CheckDeletePermission();

            return Repository.DeleteAsync(id);
        }

        public override async Task<StudentDto> GetAsync(EntityDto<int> input)
        {
            CheckGetPermission();

            var entity = await GetEntityByIdAsync(input.Id);
            return entity.MapToStudentDto();
        }

        private async Task CreateUsersForStudents(List<StudentDto> students)
        {
            foreach (var student in students)
            {


                var user = new User
                {
                    TenantId = 1,
                    Name = student.Name,
                    Surname = student.Name,
                    EmailAddress = student.Name + "@NLS.com",
                    IsActive = true,
                    UserName = student.MobileNumber,
                    IsEmailConfirmed = true,
                    Roles = new List<UserRole>()
                };

                user.SetNormalizedNames();

                foreach (var defaultRole in _roleManager.Roles.Where(r => r.IsDefault).ToList())
                {
                    user.Roles.Add(new UserRole(1, user.Id, defaultRole.Id));
                }

                await _userRole.InitializeOptionsAsync(1);

                await _userRole.CreateAsync(user, student.StudentId);
               
            }
            await CurrentUnitOfWork.SaveChangesAsync();

        }
    }
}
