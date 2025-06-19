using Microsoft.AspNetCore.Mvc;
using School.LMS.Controllers;

namespace School.LMS.Web.Host.Controllers
{
    public class StudentController : LMSControllerBase
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
