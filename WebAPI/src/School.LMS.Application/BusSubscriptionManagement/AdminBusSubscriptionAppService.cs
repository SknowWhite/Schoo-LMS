using Abp.Application.Services;
using Abp.Domain.Repositories;
using School.LMS.BusSubscriptionManagement.Dto;
using CoreM = School.LMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using School.LMS.Models;
using Abp.UI;
using School.LMS.BusFeePlan.Dto;

namespace School.LMS.BusSubscriptionManagement
{
    public class AdminBusSubscriptionAppService : ApplicationService, IAdminBusSubscriptionAppService
    {
        private readonly IRepository<StudentBusSubscription> _busSubscriptionRepo;
        private readonly IRepository<CoreM.BusFeePlan> _busFeePlanRepo;

        public AdminBusSubscriptionAppService(
            IRepository<StudentBusSubscription> subscriptionRepo,
            IRepository<Student> studentRepo,
            IRepository<CoreM.BusFeePlan> busFeePlanRepo)
        {
            _busSubscriptionRepo = subscriptionRepo;
            _busFeePlanRepo = busFeePlanRepo;
        }

        public async Task<List<AdminStudentBusSubscriptionDto>> GetListAsync()
        {
            var studentBusSubscriptions = _busSubscriptionRepo.GetAllIncluding(x=>x.Student,x=>x.BusFeePlan).ToList();
            
            return studentBusSubscriptions.Select(x => new AdminStudentBusSubscriptionDto
            {
                Id = x.Id,
                StudentId = x.StudentId,
                StudentName = x.Student.Name, // Update this property name if needed
                BusFeePlanId = x.BusFeePlanId,
                BusLineName = x.BusFeePlan.Line, // Update this property name if needed
                Notes = x.Notes,
                Status = x.Status
            }).ToList();
        }

        /// <summary>
        /// Updates the bus subscription for a student.
        /// </summary>
        /// <param name="id">The ID of the subscription to update.</param>
        /// <param name="input">The updated subscription details.</param>
        /// <returns>A task representing the asynchronous operation.</returns>

        public async Task UpdateAsync(AdminUpdateStudentBusSubscriptionDto input)
        {
            StudentBusSubscription sub = _busSubscriptionRepo.GetAllIncluding(x => x.Student, x => x.BusFeePlan).Where(x=>x.StudentId==input.StudentId).FirstOrDefault();

            var busLine = await _busFeePlanRepo.FirstOrDefaultAsync(input.BusFeePlanId);
            if (busLine == null)
            {
                throw new UserFriendlyException("Invalid Bus Line");
            }

            sub.BusFeePlanId = input.BusFeePlanId;
            sub.Status = input.Status;
            sub.Notes = input.Notes;

            await _busSubscriptionRepo.UpdateAsync(sub);
        }
        public async Task<List<BusFeePlanDto>> GetBusFeePlansAsync()
        {
            var plans = _busFeePlanRepo.GetAll().ToList();

            return plans.Select(x => new BusFeePlanDto
            {
                Id = x.Id,
                Line = x.Line
            }).ToList();
        }


    }

}
