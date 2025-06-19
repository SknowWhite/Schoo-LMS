using System.Linq;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Abp.Authorization;
using Abp.Authorization.Roles;
using Abp.Authorization.Users;
using Abp.MultiTenancy;
using School.LMS.Authorization;
using School.LMS.Authorization.Roles;
using School.LMS.Authorization.Users;
using School.LMS.Models;
using System.Collections.Generic;
using System.Net.Mail;

namespace School.LMS.EntityFrameworkCore.Seed.Tenants
{
    public class TenantRoleAndUserBuilder
    {
        private readonly LMSDbContext _context;
        private readonly int _tenantId;

        public TenantRoleAndUserBuilder(LMSDbContext context, int tenantId)
        {
            _context = context;
            _tenantId = tenantId;
        }

        public void Create()
        {
            CreateRolesAndUsers();
            CreateRolesForStudents();
            CreateStudentUsers();
        }

        private void CreateRolesAndUsers()
        {
            // Admin role

            var adminRole = _context.Roles.IgnoreQueryFilters().FirstOrDefault(r => r.TenantId == _tenantId && r.Name == StaticRoleNames.Tenants.Admin);
            if (adminRole == null)
            {
                adminRole = _context.Roles.Add(new Role(_tenantId, StaticRoleNames.Tenants.Admin, StaticRoleNames.Tenants.Admin) { IsStatic = true }).Entity;
                _context.SaveChanges();
            }

            // Grant all permissions to admin role

            var grantedPermissions = _context.Permissions.IgnoreQueryFilters()
                .OfType<RolePermissionSetting>()
                .Where(p => p.TenantId == _tenantId && p.RoleId == adminRole.Id)
                .Select(p => p.Name)
                .ToList();

            var permissions = PermissionFinder
                .GetAllPermissions(new LMSAuthorizationProvider())
                .Where(p => p.MultiTenancySides.HasFlag(MultiTenancySides.Tenant) &&
                            !grantedPermissions.Contains(p.Name))
                .ToList();

            if (permissions.Any())
            {
                _context.Permissions.AddRange(
                    permissions.Select(permission => new RolePermissionSetting
                    {
                        TenantId = _tenantId,
                        Name = permission.Name,
                        IsGranted = true,
                        RoleId = adminRole.Id
                    })
                );
                _context.SaveChanges();
            }

            // Admin user

            var adminUser = _context.Users.IgnoreQueryFilters().FirstOrDefault(u => u.TenantId == _tenantId && u.UserName == AbpUserBase.AdminUserName);
            if (adminUser == null)
            {
                adminUser = User.CreateTenantAdminUser(_tenantId, "admin@defaulttenant.com");
                adminUser.Password = new PasswordHasher<User>(new OptionsWrapper<PasswordHasherOptions>(new PasswordHasherOptions())).HashPassword(adminUser, "123qwe");
                adminUser.IsEmailConfirmed = true;
                adminUser.IsActive = true;

                _context.Users.Add(adminUser);
                _context.SaveChanges();

                // Assign Admin role to admin user
                _context.UserRoles.Add(new UserRole(_tenantId, adminUser.Id, adminRole.Id));
                _context.SaveChanges();
            }
        }
        private void CreateRolesForStudents()
        {
            // Admin role

            var studentRole = _context.Roles.IgnoreQueryFilters().FirstOrDefault(r => r.TenantId == _tenantId && r.Name == StaticRoleNames.Tenants.Student);
            if (studentRole == null)
            {
                studentRole = _context.Roles.Add(new Role(_tenantId, StaticRoleNames.Tenants.Student, StaticRoleNames.Tenants.Student) { IsStatic = true }).Entity;
                _context.SaveChanges();
            }

            // Grant all permissions to admin role

            var grantedPermissions = _context.Permissions.IgnoreQueryFilters()
                .OfType<RolePermissionSetting>()
                .Where(p => p.TenantId == _tenantId && p.RoleId == studentRole.Id)
                .Select(p => p.Name)
                .ToList();

            var permissions = PermissionFinder
                .GetAllPermissions(new LMSAuthorizationProvider())
                .Where(p => p.MultiTenancySides.HasFlag(MultiTenancySides.Tenant) &&
                            !grantedPermissions.Contains(p.Name))
                .ToList();

            if (permissions.Any())
            {
                _context.Permissions.AddRange(
                    permissions.Select(permission => new RolePermissionSetting
                    {
                        TenantId = _tenantId,
                        Name = permission.Name,
                        IsGranted = true,
                        RoleId = studentRole.Id
                    })
                );
                _context.SaveChanges();
            }

            //// Admin user

            //var adminUser = _context.Users.IgnoreQueryFilters().FirstOrDefault(u => u.TenantId == _tenantId && u.UserName == AbpUserBase.AdminUserName);
            //if (adminUser == null)
            //{
            //    adminUser = User.CreateTenantAdminUser(_tenantId, "admin@defaulttenant.com");
            //    adminUser.Password = new PasswordHasher<User>(new OptionsWrapper<PasswordHasherOptions>(new PasswordHasherOptions())).HashPassword(adminUser, "123qwe");
            //    adminUser.IsEmailConfirmed = true;
            //    adminUser.IsActive = true;

            //    _context.Users.Add(adminUser);
            //    _context.SaveChanges();

            //    // Assign Admin role to admin user
            //    _context.UserRoles.Add(new UserRole(_tenantId, adminUser.Id, studentRole.Id));
            //    _context.SaveChanges();
            //}
        }
        private void CreateStudentUsers()
        {
            List<Student> students = _context.Students.IgnoreQueryFilters().ToList();
            foreach (var student in students)
            {
                CreateUserForStudents(student);
            }
        }
        private void CreateUserForStudents(Student student)
        {
            var studentRole = _context.Roles.IgnoreQueryFilters().FirstOrDefault(r => r.TenantId == _tenantId && r.Name == StaticRoleNames.Tenants.Student);

            var adminUser = _context.Users.IgnoreQueryFilters().FirstOrDefault(u => u.TenantId == _tenantId && u.UserName == student.MobileNumber);
            if (adminUser == null)
            {
                adminUser = new User
                {
                    TenantId = _tenantId,
                    UserName = student.MobileNumber,
                    Name = student.Name,
                    Surname = student.Name,
                    EmailAddress = student.Name+"@LMS.com",
                    Roles = new List<UserRole>()
                };

                adminUser.SetNormalizedNames();
                adminUser.Password = new PasswordHasher<User>(new OptionsWrapper<PasswordHasherOptions>(new PasswordHasherOptions())).HashPassword(adminUser, student.StudentId);
                adminUser.IsEmailConfirmed = true;
                adminUser.IsActive = true;

                _context.Users.Add(adminUser);
                _context.SaveChanges();

                // Assign Student role to Student user
                _context.UserRoles.Add(new UserRole(_tenantId, adminUser.Id, studentRole.Id));
                _context.SaveChanges();
            }
        }
    }
}
