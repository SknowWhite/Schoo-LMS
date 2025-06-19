using Abp.Authorization;
using School.LMS.Authorization.Roles;
using School.LMS.Authorization.Users;

namespace School.LMS.Authorization
{
    public class PermissionChecker : PermissionChecker<Role, User>
    {
        public PermissionChecker(UserManager userManager)
            : base(userManager)
        {
        }
    }
}
