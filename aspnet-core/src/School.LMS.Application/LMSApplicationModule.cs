using Abp.AutoMapper;
using Abp.Modules;
using Abp.Reflection.Extensions;
using School.LMS.Authorization;

namespace School.LMS
{
    [DependsOn(
        typeof(LMSCoreModule), 
        typeof(AbpAutoMapperModule))]
    public class LMSApplicationModule : AbpModule
    {
        public override void PreInitialize()
        {
            Configuration.Authorization.Providers.Add<LMSAuthorizationProvider>();
        }

        public override void Initialize()
        {
            var thisAssembly = typeof(LMSApplicationModule).GetAssembly();

            IocManager.RegisterAssemblyByConvention(thisAssembly);

            Configuration.Modules.AbpAutoMapper().Configurators.Add(
                // Scan the assembly for classes which inherit from AutoMapper.Profile
                cfg => cfg.AddMaps(thisAssembly)
            );
        }
    }
}
