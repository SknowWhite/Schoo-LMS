using System.Threading.Tasks;
using Abp.Authorization;
using Abp.Runtime.Session;
using School.LMS.Configuration.Dto;

namespace School.LMS.Configuration
{
    [AbpAuthorize]
    public class ConfigurationAppService : LMSAppServiceBase, IConfigurationAppService
    {
        public async Task ChangeUiTheme(ChangeUiThemeInput input)
        {
            await SettingManager.ChangeSettingForUserAsync(AbpSession.ToUserIdentifier(), AppSettingNames.UiTheme, input.Theme);
        }
    }
}
