using Abp.Application.Services;
using Abp.Domain.Repositories;
using Abp.Timing;
using Abp.UI;
using School.LMS.BusFeePlan.Dto;
using School.LMS.EducationalFeePlan.Dto;
using School.LMS.Helpers;
using School.LMS.Models;
using School.LMS.StudentEducationalPayment.Dto;
using School.LMS.Students.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.StudentEducationalPayment
{
    public class StudentPaymentAppService : ApplicationService
    {
        private readonly IRepository<Models.StudentEducationalPayment> _eduPaymentRepo;
        private readonly IRepository<Models.StudentBusPayment> _busPaymentRepo;
        private readonly IRepository<EducationalInstallment> _installmentRepo;
        private readonly IRepository<BusInstallment> _busInstallmentRepo;
        private readonly IRepository<StudentBusSubscription> _busSubscriptionRepo;
        private readonly IRepository<Student> _studentRepo;

        private readonly IRepository<Models.EducationalFeePlan> _eduFeePlanRepo;
        private readonly IRepository<Models.BusFeePlan> _busFeePlanRepo;

        public StudentPaymentAppService(
            IRepository<Models.StudentEducationalPayment> eduPaymentRepo,
            IRepository<Models.StudentBusPayment> busPaymentRepo,
            IRepository<EducationalInstallment> installmentRepo,
            IRepository<StudentBusSubscription> busSubscriptionRepo,
            IRepository<Student> studentRepo,
            IRepository<Models.EducationalFeePlan> eduPlanRepo,
            IRepository<Models.BusFeePlan> busPlanRepo,
            IRepository<BusInstallment> busInstallmentRepo)
        {
            _eduPaymentRepo = eduPaymentRepo;
            _installmentRepo = installmentRepo;
            _busSubscriptionRepo = busSubscriptionRepo;
            _studentRepo = studentRepo;
            _eduFeePlanRepo = eduPlanRepo;
            _busFeePlanRepo = busPlanRepo;
            _busInstallmentRepo = busInstallmentRepo;
            _busPaymentRepo = busPaymentRepo;
        }

        public async Task<StudentPaymentDetailsDto> GetStudentPaymentDetailsAsync(string studentId)
        {
            // Get student data

            var student = _studentRepo.GetAll()
                .Where(x => x.StudentId == studentId)
                .FirstOrDefault();

            if (student == null)
                throw new UserFriendlyException("Student not found");

            var studentDto = student.MapToStudentDto();

            // Get educational fee plan based on grade
            EducationalFeePlanDto studentEduFeePlan = _eduFeePlanRepo
                .GetAllIncluding(x => x.Installments)
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

            if (studentEduFeePlan == null)
                throw new UserFriendlyException("No educational fee plan found for this grade");

            // Generate default pending installment payments
            var eduPayments = studentEduFeePlan.Installments.Select(i => new EducationalPaymentDto
            {
                Id = i.Id,
                InstallmentName = $"Installment {i.Order}",
                PaymentDate = i.DueDate,
                AmountPaid = i.Amount,
                PaymentStatus = PaymentStatus.New,
                IsFullPayment = false
            }).ToList();

            // Check for existing actual payments
            var actualPayments = _eduPaymentRepo
                .GetAllIncluding(x => x.Installment)
                .Where(x => x.StudentId == student.Id)
                .ToList();

            if (actualPayments.Any())
            {
                if (actualPayments.Any(x => x.IsFullPayment)) {
                    eduPayments = new List<EducationalPaymentDto>();
                    eduPayments.Add(new EducationalPaymentDto()
                    {
                        Id = actualPayments.First().Id,
                        AmountPaid=actualPayments.First().AmountPaid,
                        PaymentStatus = actualPayments.First().PaymentStatus,
                        IsFullPayment = true,
                        InstallmentName="Full Payment",
                        PaymentDate=actualPayments.First().PaymentDate,
                    });

                }
                else
                {
                    foreach (var item in actualPayments)
                    {
                        eduPayments.First(x => x.Id == item.EducationalInstallmentId).PaymentDate = item.PaymentDate;
                        eduPayments.First(x => x.Id == item.EducationalInstallmentId).PaymentStatus = item.PaymentStatus;

                    }
                }
                

                
            }
            else
            {
                // If no payments yet, assume full payment is available
                eduPayments.Insert(0, new EducationalPaymentDto
                {
                    InstallmentName = "Full Payment",
                    PaymentDate = studentEduFeePlan.FullAmountDueDate,
                    AmountPaid = studentEduFeePlan.FullAmountWith5PercentDiscount,
                    PaymentStatus = PaymentStatus.New,
                    IsFullPayment = true
                });
            }

            // Get student's current bus subscriptions
            var studentBusSubscriptions = _busSubscriptionRepo.GetAll()
                .Where(x => x.StudentId == student.Id)
                .ToList();

            // Get all bus lines and map to DTOs
          

            // Load all bus lines into memory
            var allBusLines = _busFeePlanRepo.GetAll().ToList();

            // Project BusLineDto with subscription info
            var busLines = allBusLines.Select(line => new BusLineDto
            {
                Id = line.Id,
                Name = line.Line,
                ExpectedAmount = line.ExpectedTotalAmount,
                IsSubscribed = studentBusSubscriptions.Any(s => s.BusFeePlanId == line.Id),
                SubscriptionStatus = studentBusSubscriptions
                    .FirstOrDefault(s => s.BusFeePlanId == line.Id)?.Status.ToString() ?? "NotSubscribed"
            }).ToList();

            // Final DTO
            return new StudentPaymentDetailsDto
            {
                StudentInfo = studentDto,
                EducationalPayments = eduPayments,
                BusLines = busLines
            };
        }

        public async Task<StudentPaymentBusDetailsDto> GetStudentPaymentBusDetailsAsync(string studentId)
        {
            var student = _studentRepo.GetAll()
             .Where(x => x.StudentId == studentId)
             .FirstOrDefault();

            if (student == null)
                throw new UserFriendlyException("Student not found");

            var studentDto = student.MapToStudentDto();

            StudentBusSubscription studentBusSubscription = _busSubscriptionRepo.GetAllIncluding(x => x.BusFeePlan).Where(x=>x.StudentId==studentDto.Id).FirstOrDefault();
            BusFeePlanDto busPlanFees = _busFeePlanRepo.GetAllIncluding(x => x.Installments)
                .Where(x => x.Id == studentBusSubscription.BusFeePlanId)
                .Select(x=>new BusFeePlanDto()
                {
                    Id = x.Id,
                    Line = x.Line,
                    ExpectedTotalAmount = x.ExpectedTotalAmount,
                    FullAmountWith5PercentDiscount = x.FullAmountWith5PercentDiscount,
                    FullAmountDueDate = x.FullAmountDueDate,
                    Installments = x.Installments.Select(i => new BusInstallmentDto
                    {
                        Id = i.Id,
                        Amount = i.Amount,
                        DueDate = i.DueDate,
                        Order = i.Order
                    }).ToList()
                }
                ).FirstOrDefault();

            if (busPlanFees == null)
                throw new UserFriendlyException("No bus fee plan found for this bus subscription");

            // Generate default pending installment payments
            var busPayments = busPlanFees.Installments.Select(i => new BusPaymentDto
            {
                Id = i.Id,
                InstallmentName = $"Installment {i.Order}",
                PaymentDate = i.DueDate,
                AmountPaid = i.Amount,
                PaymentStatus = PaymentStatus.New,
                IsFullPayment = false
            }).ToList();

            // Check for existing actual payments
            var actualPayments = _busPaymentRepo
                .GetAllIncluding(x => x.Installment)
                .Where(x => x.BusSubscriptionId == studentBusSubscription.Id)
                .ToList();

            if (actualPayments.Any())
            {
                if (actualPayments.Any(x => x.IsFullPayment))
                {
                    busPayments =
                    [
                        new BusPaymentDto()
                        {
                            Id = actualPayments.First().Id,
                            AmountPaid = actualPayments.First().AmountPaid,
                            PaymentStatus = actualPayments.First().Status,
                            IsFullPayment = true,
                            InstallmentName = "Full Payment",
                            PaymentDate = actualPayments.First().PaymentDate,
                        },
                    ];

                }
                else
                {
                    foreach (var item in actualPayments)
                    {
                        busPayments.First(x => x.Id == item.BusInstallmentId).PaymentDate = item.PaymentDate;
                        busPayments.First(x => x.Id == item.BusInstallmentId).PaymentStatus = item.Status;

                    }
                }



            }
            else
            {
                // If no payments yet, assume full payment is available
                busPayments.Insert(0, new BusPaymentDto
                {
                    InstallmentName = "Full Payment",
                    PaymentDate = busPlanFees.FullAmountDueDate,
                    AmountPaid = busPlanFees.ExpectedTotalAmount,
                    PaymentStatus = PaymentStatus.New,
                    IsFullPayment = true
                });
            }

            // Get student's current bus subscriptions
            var studentBusSubscriptions = _busSubscriptionRepo.GetAll()
                .Where(x => x.StudentId == student.Id)
                .ToList();


            // Final DTO
            return new StudentPaymentBusDetailsDto
            {
                StudentInfo = studentDto,
                BusPayments = busPayments,
                BusSubscriptionDto = new BusSubscriptionDto() { 
                    LineName= studentBusSubscription.BusFeePlan.Line,
                    Notes= studentBusSubscription.Notes,
                    Status= studentBusSubscription.Status,
                    SubscriptionDate= studentBusSubscription.SubscriptionDate
                }
            };
        }
        public async Task SubmitBusPaymentAsync(StudentBusPaymentInputDto input)
        {
            var student = _studentRepo.GetAll()
             .Where(x => x.StudentId == input.StudentId.ToString())
             .FirstOrDefault();

            var busSubscription = _busSubscriptionRepo.GetAll().Where(x => x.StudentId == student.Id).FirstOrDefault();

            if (input.IsFullPayment)
            {
                var payment = new Models.StudentBusPayment
                {
                    BusSubscriptionId= busSubscription.Id,
                    BusSubscription= busSubscription,
                    IsFullPayment = true,
                    AmountPaid = input.AmountPaid,
                    PaymentDate = input.PaymentDate,
                    Status = PaymentStatus.Pending
                };
                await _busPaymentRepo.InsertAsync(payment);
            }
            else if (input.SelectedInstallmentIds?.Any() == true)
            {
                foreach (var installmentId in input.SelectedInstallmentIds)
                {
                    var installment = await _busInstallmentRepo.GetAsync(installmentId);

                    var payment = new StudentBusPayment
                    {
                        BusSubscriptionId= busSubscription.Id,
                        BusSubscription= busSubscription,
                        BusInstallmentId= installment.Id,
                        IsFullPayment = false,
                        AmountPaid = installment.Amount,
                        PaymentDate = input.PaymentDate,
                        Status = PaymentStatus.Pending
                    };

                    await _busPaymentRepo.InsertAsync(payment);
                }
            }
        }
        public async Task SubmitEducationalPaymentAsync(StudentEducationalPaymentInputDto input)
        {
            var student = _studentRepo.GetAll()
             .Where(x => x.StudentId == input.StudentId.ToString())
             .FirstOrDefault();
            if (input.IsFullPayment)
            {
                var payment = new Models.StudentEducationalPayment
                {
                    StudentId = student.Id,
                    IsFullPayment = true,
                    AmountPaid = input.AmountPaid,
                    PaymentDate = input.PaymentDate,
                    PaymentStatus = PaymentStatus.Pending
                };
                await _eduPaymentRepo.InsertAsync(payment);
            }
            else if (input.SelectedInstallmentIds?.Any() == true)
            {
                foreach (var installmentId in input.SelectedInstallmentIds)
                {
                    var installment = await _installmentRepo.GetAsync(installmentId);

                    var payment = new Models.StudentEducationalPayment
                    {
                        StudentId = student.Id,
                        EducationalInstallmentId = installment.Id,
                        IsFullPayment = false,
                        AmountPaid = installment.Amount,
                        PaymentDate = input.PaymentDate,
                        PaymentStatus = PaymentStatus.Pending
                    };

                    await _eduPaymentRepo.InsertAsync(payment);
                }
            }
        }

        public async Task SubscribeToBusAsync(BusSubscriptionRequestDto input)
        {
            var student = _studentRepo.GetAll()
           .Where(x => x.StudentId == input.StudentId.ToString())
           .FirstOrDefault();
            var subscription = new StudentBusSubscription
            {
                StudentId = student.Id,
                BusFeePlanId = input.BusLineId,
                Notes = input.Note,
                Status = subscriptionStatus.Pending,
                SubscriptionDate = DateTime.Now
            };

            await _busSubscriptionRepo.InsertAsync(subscription);
        }

        public async Task<StudentDto> GetStudentByName(string studentName)
        {
            var student = _studentRepo.GetAll()
             .Where(x => x.Name.Trim().ToLower() == studentName.Trim().ToLower())
             .FirstOrDefault();
            return student.MapToStudentDto();
        }
      
    }

}
