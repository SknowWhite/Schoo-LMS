using Abp.Application.Services;
using Abp.Domain.Repositories;
using School.LMS.BusSubscriptionManagement;
using School.LMS.EducationalFeePlan.Dto;
using School.LMS.Helpers;
using School.LMS.Models;
using School.LMS.StudentEducationalPayment.Dto;
using School.LMS.StudentPayments.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.StudentPayments
{
    public class StudentPaymentsAppService : ApplicationService, IStudentPaymentAppService
    {
        private readonly IRepository<Models.StudentEducationalPayment> _eduPaymentRepo;
        private readonly IRepository<EducationalInstallment> _installmentRepo;
        private readonly IRepository<StudentBusSubscription> _busSubscriptionRepo;
        private readonly IRepository<Student> _studentRepo;

        private readonly IRepository<Models.EducationalFeePlan> _eduFeePlanRepo;
        private readonly IRepository<Models.BusFeePlan> _busFeePlanRepo;

        public StudentPaymentsAppService(
            IRepository<Models.StudentEducationalPayment> eduPaymentRepo,
            IRepository<EducationalInstallment> installmentRepo,
            IRepository<StudentBusSubscription> busSubscriptionRepo,
            IRepository<Student> studentRepo,
            IRepository<Models.EducationalFeePlan> eduFeePlanRepo,
            IRepository<Models.BusFeePlan> busFeePlanRepo)
        {
            _eduPaymentRepo = eduPaymentRepo;
            _installmentRepo = installmentRepo;
            _busSubscriptionRepo = busSubscriptionRepo;
            _studentRepo = studentRepo;
            _eduFeePlanRepo = eduFeePlanRepo;
            _busFeePlanRepo = busFeePlanRepo;
            
        }
        public async Task<List<StudentPaymentDetailsDto>> GetListAsync()
        {
            var students = _studentRepo.GetAllIncluding(x => x.EducationalPayments,x=>x.BusSubscriptions).ToList(); // Optional: Include more if needed
            var allBusLines = _busFeePlanRepo.GetAll().ToList();
            var allEduPlans = _eduFeePlanRepo.GetAllIncluding(x => x.Installments).ToList();
            var allEduPayments = _eduPaymentRepo.GetAllIncluding(x => x.Installment).ToList();
            var allBusSubscriptions = _busSubscriptionRepo.GetAll().ToList();

            var result = new List<StudentPaymentDetailsDto>();

            foreach (var student in students)
            {
                var studentDto = student.MapToStudentDto();

                // --- Educational Plan ---
                var studentEduFeePlan = allEduPlans
                    .Where(x => x.Grade == student.Grade)
                    .Select(x => new EducationalFeePlanDto
                    {
                        Id = x.Id,
                        Grade = x.Grade,
                        ExpectedTotalAmount = x.ExpectedTotalAmount,
                        FullAmountWith5PercentDiscount = x.FullAmountWith5PercentDiscount,
                        FullAmountDueDate = x.FullAmountDueDate,
                        Installments = x.Installments.Select(i => new EducationalInstallmentDto
                        {
                            Id = i.Id,
                            Amount = i.Amount,
                            DueDate = i.DueDate,
                            Order = i.Order
                        }).ToList()
                    })
                    .FirstOrDefault();

                var eduPayments = new List<EducationalPaymentDto>();

                if (studentEduFeePlan != null)
                {
                    eduPayments = studentEduFeePlan.Installments.Select(i => new EducationalPaymentDto
                    {
                        Id = i.Id,
                        InstallmentName = $"Installment {i.Order}",
                        PaymentDate = i.DueDate,
                        AmountPaid = i.Amount,
                        PaymentStatus = PaymentStatus.New,
                        IsFullPayment = false
                    }).ToList();

                    var actualPayments = allEduPayments
                        .Where(x => x.StudentId == student.Id)
                        .ToList();

                    if (actualPayments.Any())
                    {
                        if (actualPayments.Any(x => x.IsFullPayment))
                        {
                            var first = actualPayments.First();
                            eduPayments = new List<EducationalPaymentDto>
                    {
                        new EducationalPaymentDto
                        {
                            Id = first.Id,
                            AmountPaid = first.AmountPaid,
                            PaymentStatus = first.PaymentStatus,
                            IsFullPayment = true,
                            InstallmentName = "Full Payment",
                            PaymentDate = first.PaymentDate
                        }
                    };
                        }
                        else
                        {
                            foreach (var payment in actualPayments)
                            {
                                var dto = eduPayments.FirstOrDefault(x => x.Id == payment.EducationalInstallmentId);
                                if (dto != null)
                                {
                                    dto.PaymentDate = payment.PaymentDate;
                                    dto.PaymentStatus = payment.PaymentStatus;
                                }
                            }
                        }
                    }
                    else
                    {
                        // No payments, allow full payment
                        eduPayments.Insert(0, new EducationalPaymentDto
                        {
                            InstallmentName = "Full Payment",
                            PaymentDate = studentEduFeePlan.FullAmountDueDate,
                            AmountPaid = studentEduFeePlan.FullAmountWith5PercentDiscount,
                            PaymentStatus = PaymentStatus.New,
                            IsFullPayment = true
                        });
                    }
                }

                // --- Bus Subscription ---
                var studentBusSubscriptions = allBusSubscriptions
                    .Where(x => x.StudentId == student.Id)
                    .ToList();

                var busLines = allBusLines.Select(line => new BusLineDto
                {
                    Id = line.Id,
                    Name = line.Line,
                    ExpectedAmount = line.ExpectedTotalAmount,
                    IsSubscribed = studentBusSubscriptions.Any(s => s.BusFeePlanId == line.Id),
                    SubscriptionStatus = studentBusSubscriptions
                        .FirstOrDefault(s => s.BusFeePlanId == line.Id)?.Status.ToString() ?? "NotSubscribed"
                }).ToList();

                result.Add(new StudentPaymentDetailsDto
                {
                    StudentInfo = studentDto,
                    EducationalPayments = eduPayments,
                    BusLines = busLines
                });
            }

            return result;
        }


    }
}
