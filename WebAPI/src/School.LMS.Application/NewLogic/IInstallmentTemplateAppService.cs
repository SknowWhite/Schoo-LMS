using Abp.Application.Services;
using School.LMS.NewLogic.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.NewLogic
{
    public interface IInstallmentTemplateAppService : IApplicationService
    {
        Task<List<InstallmentTemplateDto>> GetListAsync();
        Task<InstallmentTemplateDto> GetAsync(Guid id);
        Task<InstallmentTemplateDto> CreateAsync(CreateUpdateInstallmentTemplateDto input);
        Task<InstallmentTemplateDto> UpdateAsync(UpdateInstallmentTemplateInput input);
        Task DeleteAsync(AssignInstallmentTemplateInput input);

        Task AssignToAllStudentsAsync(AssignInstallmentTemplateInput input );
    }

}
