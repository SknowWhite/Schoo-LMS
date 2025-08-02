using Abp.Application.Services;
using Abp.Application.Services.Dto;
using Abp.Authorization.Users;
using Abp.Domain.Repositories;
using Abp.Domain.Uow;
using Abp.EntityFrameworkCore.Repositories;
using Microsoft.AspNetCore.Identity;
using School.LMS.Authorization;
using School.LMS.Authorization.Roles;
using School.LMS.Authorization.Users;
using School.LMS.Helpers;
using School.LMS.Models;
using School.LMS.Students.Dto;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace School.LMS.Students
{
    public class StudentImportService : AsyncCrudAppService<Student, StudentDto, int, PagedStudentResultRequestDto, StudentDto, StudentDto>, IStudentImportService
    {
        private readonly RoleManager _roleManager;
        private readonly UserManager _userManager;
        private readonly UserRegistrationManager _userRegisterationManager;
        private readonly IUnitOfWorkManager _unitOfWorkManager;

        public StudentImportService(IRepository<Student> repository, UserManager userRegistrationManager,RoleManager roleManager,UserRegistrationManager registrationManager, IUnitOfWorkManager unitofWorkManager)
            : base(repository)
        {
            _userManager = userRegistrationManager;
            _roleManager = roleManager;
            _userRegisterationManager = registrationManager;
            _unitOfWorkManager = unitofWorkManager;
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
                var exists = (await Repository.CountAsync(x => x.StudentId == student.StudentId)) > 0;
                if (!exists)
                {
                    await Repository.InsertAsync(student);
                    // create user for the new student
                    await CreateUsersForStudents(studentDto);

                }
                else
                {
                    // update existing student
                    var existingStudent = await Repository.FirstOrDefaultAsync(x => x.StudentId == student.StudentId);
                    if (existingStudent != null)
                    {
                        existingStudent.Name = student.Name;
                        existingStudent.Grade = student.Grade;
                      //  existingStudent.MobileNumber = student.MobileNumber;
                        existingStudent.Status = student.Status;
                        existingStudent.PreviousAmount = student.PreviousAmount;
                    }
                    await Repository.UpdateAsync(existingStudent);

                    //var existingUser= _userManager.GetUsersAsync().Result.FirstOrDefault(x=>x.Surname== student.Name);
                  //  if (existingUser != null)
                  //      await _userManager.DeleteAsync(existingUser); // delete old created user if exists


                 //   await CreateUsersForStudents(studentDto); // create new user for the updated student
                }

                students.Add(student);


            }

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

        private async Task CreateUsersForStudents(StudentDto student)
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

               

                await _userManager.InitializeOptionsAsync(1);

            _userManager.UserValidators.Clear();
            _userManager.UserValidators.Add(new UserValidator());
            _userManager.PasswordValidators.Clear();
            var x=    _userManager.CreateAsync(user, student.StudentId).Result;
            await CurrentUnitOfWork.SaveChangesAsync();
            await _unitOfWorkManager.Current.SaveChangesAsync();
            User user1 = await _userManager.FindByNameAsync(student.MobileNumber);
            await _userManager.SetRolesAsync(user1, ["Student"]);


            await CurrentUnitOfWork.SaveChangesAsync();
            await _unitOfWorkManager.Current.SaveChangesAsync();



        }
    }

    public  class UserValidator: IUserValidator<User>
    {
        public Task<IdentityResult> ValidateAsync(UserManager<User> manager, User user)
        {
            // Implement custom validation logic here
            return Task.FromResult(IdentityResult.Success);
        }
    }
   
    }
