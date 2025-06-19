using School.LMS.BusFeePlan.Dto;
using School.LMS.BusSubscriptionManagement.Dto;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace School.LMS.BusSubscriptionManagement
{
    public interface IAdminBusSubscriptionAppService
    {
        public Task<List<AdminStudentBusSubscriptionDto>> GetListAsync();
        public Task UpdateAsync(AdminUpdateStudentBusSubscriptionDto input);
        public Task<List<BusFeePlanDto>> GetBusFeePlansAsync();


    }
}