using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abp.Auditing;
using School.LMS.Sessions.Dto;
using School.LMS.Users.Dto;

namespace School.LMS.Sessions
{
    public class SessionAppService : LMSAppServiceBase, ISessionAppService
    {
        [DisableAuditing]
        public async Task<GetCurrentLoginInformationsOutput> GetCurrentLoginInformations()
        {
            var output = new GetCurrentLoginInformationsOutput
            {
                Application = new ApplicationInfoDto
                {
                    Version = AppVersionHelper.Version,
                    ReleaseDate = AppVersionHelper.ReleaseDate,
                    Features = new Dictionary<string, bool>()
                }
            };

            if (AbpSession.TenantId.HasValue)
            {
                output.Tenant = ObjectMapper.Map<TenantLoginInfoDto>(await GetCurrentTenantAsync());
            }

            if (AbpSession.UserId.HasValue)
            {
                var currentUser = await GetCurrentUserAsync(); 

                var roles = await UserManager.GetRolesAsync(currentUser); 

                var userDto = ObjectMapper.Map<UserLoginInfoDto>(currentUser);
                userDto.Roles = roles.ToList();
                output.User = userDto;
            }

            return output;
        }
    }
}
