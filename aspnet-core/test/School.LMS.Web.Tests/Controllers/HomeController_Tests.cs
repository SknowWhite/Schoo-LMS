using System.Threading.Tasks;
using School.LMS.Models.TokenAuth;
using School.LMS.Web.Controllers;
using Shouldly;
using Xunit;

namespace School.LMS.Web.Tests.Controllers
{
    public class HomeController_Tests: LMSWebTestBase
    {
        [Fact]
        public async Task Index_Test()
        {
            await AuthenticateAsync(null, new AuthenticateModel
            {
                UserNameOrEmailAddress = "admin",
                Password = "123qwe"
            });

            //Act
            var response = await GetResponseAsStringAsync(
                GetUrl<HomeController>(nameof(HomeController.Index))
            );

            //Assert
            response.ShouldNotBeNullOrEmpty();
        }
    }
}