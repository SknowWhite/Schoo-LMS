using Abp.Application.Services;
using Abp.Domain.Repositories;
using Abp.Web.Models;
using School.LMS.HomePageDashboard.Dto;
using School.LMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.HomePageDashboard
{
    /// <summary>
    /// Application service for providing data and operations used in the Home Page Dashboard.
    /// </summary>
    public class HomePageDashboardApplicationService : ApplicationService
    {
        private readonly IRepository<Models.StudentEducationalPayment> _eduPaymentRepo;
        private readonly IRepository<Models.StudentBusPayment> _busPaymentRepo;
        private readonly IRepository<Models.BusFeePlan> _busFeePlanRepo;
        private readonly IRepository<Student> _studentRepo;

        /// <summary>
        /// Initializes a new instance of the <see cref="HomePageDashboardApplicationService"/> class.
        /// </summary>

        public HomePageDashboardApplicationService(IRepository<Models.StudentEducationalPayment> eduPaymentRepo,
                                                   IRepository<StudentBusPayment> busPaymentRepo,
                                                   IRepository<Student> studentRepo,
                                                   IRepository<Models.BusFeePlan> busFeePlanRepo)
        {
            _eduPaymentRepo = eduPaymentRepo;
            _busPaymentRepo = busPaymentRepo;
            _studentRepo = studentRepo;
            _busFeePlanRepo = busFeePlanRepo;
        }
        /// <summary>
        /// Gets the dashboard statistics for the home page.
        /// </summary>
        /// <returns>A <see cref="HomepageDashboardDTO"/> containing aggregated data.</returns>
        [DontWrapResult]
        public HomepageDashboardDTO GetHomepageDashboard()
        {
            return new HomepageDashboardDTO()
            {
                BusLinesCount = _busFeePlanRepo.Count(),
                StudentCount = _studentRepo.Count(),
                StudentFullPaidCount = _eduPaymentRepo.GetAll().Where(e => e.IsFullPayment).Count(),
                StudentSubscribedToBusCount = _busPaymentRepo.GetAll().Where(e => e.IsFullPayment || e.BusInstallmentId!=null).Count(),
            };
        }
    }
}
