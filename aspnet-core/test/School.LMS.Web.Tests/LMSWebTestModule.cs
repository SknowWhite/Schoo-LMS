using Abp.AspNetCore;
using Abp.AspNetCore.TestBase;
using Abp.Modules;
using Abp.Reflection.Extensions;
using School.LMS.EntityFrameworkCore;
using School.LMS.Web.Startup;
using Microsoft.AspNetCore.Mvc.ApplicationParts;

namespace School.LMS.Web.Tests
{
    [DependsOn(
        typeof(LMSWebMvcModule),
        typeof(AbpAspNetCoreTestBaseModule)
    )]
    public class LMSWebTestModule : AbpModule
    {
        public LMSWebTestModule(LMSEntityFrameworkModule abpProjectNameEntityFrameworkModule)
        {
            abpProjectNameEntityFrameworkModule.SkipDbContextRegistration = true;
        } 
        
        public override void PreInitialize()
        {
            Configuration.UnitOfWork.IsTransactional = false; //EF Core InMemory DB does not support transactions.
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(LMSWebTestModule).GetAssembly());
        }
        
        public override void PostInitialize()
        {
            IocManager.Resolve<ApplicationPartManager>()
                .AddApplicationPartsIfNotAddedBefore(typeof(LMSWebMvcModule).Assembly);
        }
    }
}