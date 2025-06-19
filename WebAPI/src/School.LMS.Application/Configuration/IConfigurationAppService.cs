using System.Threading.Tasks;
using School.LMS.Configuration.Dto;

namespace School.LMS.Configuration
{
    public interface IConfigurationAppService
    {
        Task ChangeUiTheme(ChangeUiThemeInput input);
    }
}
