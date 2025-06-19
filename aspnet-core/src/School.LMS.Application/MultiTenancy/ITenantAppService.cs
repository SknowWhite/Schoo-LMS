using Abp.Application.Services;
using School.LMS.MultiTenancy.Dto;

namespace School.LMS.MultiTenancy
{
    public interface ITenantAppService : IAsyncCrudAppService<TenantDto, int, PagedTenantResultRequestDto, CreateTenantDto, TenantDto>
    {
    }
}

