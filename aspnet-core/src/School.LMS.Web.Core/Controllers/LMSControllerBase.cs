using Abp.AspNetCore.Mvc.Controllers;
using Abp.IdentityFramework;
using Microsoft.AspNetCore.Identity;

namespace School.LMS.Controllers
{
    public abstract class LMSControllerBase: AbpController
    {
        protected LMSControllerBase()
        {
            LocalizationSourceName = LMSConsts.LocalizationSourceName;
        }

        protected void CheckErrors(IdentityResult identityResult)
        {
            identityResult.CheckErrors(LocalizationManager);
        }
    }
}
