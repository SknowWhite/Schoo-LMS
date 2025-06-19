using System.Threading.Tasks;
using Abp.Application.Services;
using School.LMS.Sessions.Dto;

namespace School.LMS.Sessions
{
    public interface ISessionAppService : IApplicationService
    {
        Task<GetCurrentLoginInformationsOutput> GetCurrentLoginInformations();
    }
}
