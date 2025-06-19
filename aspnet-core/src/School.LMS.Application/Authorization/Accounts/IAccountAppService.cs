using System.Threading.Tasks;
using Abp.Application.Services;
using School.LMS.Authorization.Accounts.Dto;

namespace School.LMS.Authorization.Accounts
{
    public interface IAccountAppService : IApplicationService
    {
        Task<IsTenantAvailableOutput> IsTenantAvailable(IsTenantAvailableInput input);

        Task<RegisterOutput> Register(RegisterInput input);
    }
}
