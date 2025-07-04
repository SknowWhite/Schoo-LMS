using Abp.Application.Services;
using Abp.Domain.Repositories;
using Abp.UI;
using Abp.Web.Models;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using School.LMS.BusFeePlan.Dto;
using School.LMS.EducationalFeePlan.Dto;
using School.LMS.Helpers;
using School.LMS.Models;
using School.LMS.StudentEducationalPayment.Dto;
using School.LMS.Students.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
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
        private readonly FawryService _fawryService;

        public StudentPaymentAppService(
            IRepository<Models.StudentEducationalPayment> eduPaymentRepo,
            IRepository<Models.StudentBusPayment> busPaymentRepo,
            IRepository<EducationalInstallment> installmentRepo,
            IRepository<StudentBusSubscription> busSubscriptionRepo,
            IRepository<Student> studentRepo,
            IRepository<Models.EducationalFeePlan> eduPlanRepo,
            IRepository<Models.BusFeePlan> busPlanRepo,
            IRepository<BusInstallment> busInstallmentRepo,
            FawryService fawryService)
        {
            _eduPaymentRepo = eduPaymentRepo;
            _installmentRepo = installmentRepo;
            _busSubscriptionRepo = busSubscriptionRepo;
            _studentRepo = studentRepo;
            _eduFeePlanRepo = eduPlanRepo;
            _busFeePlanRepo = busPlanRepo;
            _busInstallmentRepo = busInstallmentRepo;
            _busPaymentRepo = busPaymentRepo;
            _fawryService = fawryService;
        }

        public async Task<StudentPaymentDetailsDto> GetStudentPaymentDetailsAsync(string studentId)
        {
            var student = _studentRepo.GetAll()
                .FirstOrDefault(x => x.StudentId == studentId);

            if (student == null)
                throw new UserFriendlyException("Student not found");

            var studentDto = student.MapToStudentDto();

            var studentEduFeePlan = _eduFeePlanRepo
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

            var eduPayments = studentEduFeePlan.Installments.Select(i => new EducationalPaymentDto
            {
                Id = i.Id,
                InstallmentName = $"Installment {i.Order}",
                PaymentDate = i.DueDate,
                AmountPaid = i.Amount,
                PaymentStatus = PaymentStatus.New,
                IsFullPayment = false,
                InvoiceNumber = null
            }).ToList();

            var actualPayments = _eduPaymentRepo
                .GetAllIncluding(x => x.Installment)
                .Where(x => x.StudentId == student.Id)
                .ToList();

            if (actualPayments.Any())
            {
                if (actualPayments.Any(x => x.IsFullPayment))
                {
                    var fullPayment = actualPayments.First(x => x.IsFullPayment);

                    eduPayments = new List<EducationalPaymentDto>
            {
                new EducationalPaymentDto
                {
                    Id = fullPayment.Id,
                    AmountPaid = fullPayment.AmountPaid,
                    PaymentStatus = fullPayment.PaymentStatus,
                    IsFullPayment = true,
                    InstallmentName = "Full Payment",
                    PaymentDate = fullPayment.PaymentDate,
                    InvoiceNumber =     $"https://atfawry.fawrystaging.com/invoice-ui/pay/{fullPayment.InvoiceNumber}"
                }
            };
                }
                else
                {
                    foreach (var item in actualPayments)
                    {
                        var target = eduPayments.FirstOrDefault(x => x.Id == item.EducationalInstallmentId);
                        if (target != null)
                        {
                            target.PaymentDate = item.PaymentDate;
                            target.PaymentStatus = item.PaymentStatus;
                            target.InvoiceNumber = $"https://atfawry.fawrystaging.com/invoice-ui/pay/{item.InvoiceNumber}";
                        }
                    }
                }
            }
            else
            {
                eduPayments.Insert(0, new EducationalPaymentDto
                {
                    InstallmentName = "Full Payment",
                    PaymentDate = studentEduFeePlan.FullAmountDueDate,
                    AmountPaid = studentEduFeePlan.FullAmountWith5PercentDiscount,
                    PaymentStatus = PaymentStatus.New,
                    IsFullPayment = true,
                    InvoiceNumber = null
                });
            }

            var studentBusSubscriptions = _busSubscriptionRepo.GetAll()
                .Where(x => x.StudentId == student.Id)
                .ToList();

            var allBusLines = _busFeePlanRepo.GetAll().ToList();

            var busLines = allBusLines.Select(line => new BusLineDto
            {
                Id = line.Id,
                Name = line.Line,
                ExpectedAmount = line.ExpectedTotalAmount,
                IsSubscribed = studentBusSubscriptions.Any(s => s.BusFeePlanId == line.Id),
                SubscriptionStatus = studentBusSubscriptions
                    .FirstOrDefault(s => s.BusFeePlanId == line.Id)?.Status.ToString() ?? "NotSubscribed"
            }).ToList();

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

            StudentBusSubscription studentBusSubscription = _busSubscriptionRepo.GetAllIncluding(x => x.BusFeePlan).Where(x => x.StudentId == studentDto.Id).FirstOrDefault();
            BusFeePlanDto busPlanFees = _busFeePlanRepo.GetAllIncluding(x => x.Installments)
                .Where(x => x.Id == studentBusSubscription.BusFeePlanId)
                .Select(x => new BusFeePlanDto()
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
                BusSubscriptionDto = new BusSubscriptionDto()
                {
                    LineName = studentBusSubscription.BusFeePlan.Line,
                    Notes = studentBusSubscription.Notes,
                    Status = studentBusSubscription.Status,
                    SubscriptionDate = studentBusSubscription.SubscriptionDate
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
                    BusSubscriptionId = busSubscription.Id,
                    BusSubscription = busSubscription,
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
                        BusSubscriptionId = busSubscription.Id,
                        BusSubscription = busSubscription,
                        BusInstallmentId = installment.Id,
                        IsFullPayment = false,
                        AmountPaid = installment.Amount,
                        PaymentDate = input.PaymentDate,
                        Status = PaymentStatus.Pending
                    };

                    await _busPaymentRepo.InsertAsync(payment);
                }
            }
        }
        public async Task<string> SubmitEducationalPaymentAsync(StudentEducationalPaymentInputDto input)
        {
            var student = _studentRepo.GetAll()
                .FirstOrDefault(x => x.StudentId == input.StudentId.ToString());

            if (student == null)
                throw new UserFriendlyException("Student not found");

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

                var invoiceData = await _fawryService.CreatePaymentLinkAsync(
                    student.Name,
                    student.StudentId,
                    student.MobileNumber,
                    Convert.ToDouble(payment.AmountPaid),
                    "Full amount Educational Fees"
                );

                if (string.IsNullOrEmpty(invoiceData.invoiceNumber))
                    throw new UserFriendlyException("Failed to create payment link");

                payment.InvoiceNumber = invoiceData.invoiceNumber;
                payment.TransactionId = invoiceData.businessReference;

                await _eduPaymentRepo.InsertAsync(payment);
                string paymentLink = $"https://atfawry.fawrystaging.com/invoice-ui/pay/{payment.InvoiceNumber}";
                return paymentLink;
            }

            if (input.SelectedInstallmentIds.HasValue)
            {
                var installment = await _installmentRepo.GetAsync(input.SelectedInstallmentIds.Value);

                var payment = new Models.StudentEducationalPayment
                {
                    StudentId = student.Id,
                    EducationalInstallmentId = installment.Id,
                    IsFullPayment = false,
                    AmountPaid = installment.Amount,
                    PaymentDate = input.PaymentDate,
                    PaymentStatus = PaymentStatus.Pending
                };

                var invoiceData = await _fawryService.CreatePaymentLinkAsync(
                    student.Name,
                    student.StudentId,
                    student.MobileNumber,
                    Convert.ToDouble(payment.AmountPaid),
                    $"Educational Installment #{installment.Order}"
                );

                if (string.IsNullOrEmpty(invoiceData.invoiceNumber))
                    throw new UserFriendlyException("Failed to create payment link");

                payment.InvoiceNumber = invoiceData.invoiceNumber;
                payment.TransactionId = invoiceData.businessReference;

                await _eduPaymentRepo.InsertAsync(payment);
                string paymentLink = $"https://atfawry.fawrystaging.com/invoice-ui/pay/{payment.InvoiceNumber}";

                return paymentLink;
            }

            throw new UserFriendlyException("Please select a valid installment.");
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
        public async Task<string> CreateFawryPaymentLinkAsync(string studentId, double amount, string description)
        {
            var student = _studentRepo.GetAll()
                .Where(x => x.StudentId == studentId)
                .FirstOrDefault();

            if (student == null)
                throw new UserFriendlyException("Student not found");

            using (var client = new HttpClient())
            {
                // Step 1: Login to Fawry to get token
                var loginPayload = new
                {
                    userIdentifier = "I.accounting@nozhaschools.com",
                    password = "P#ssw0rd"
                };

                var loginContent = new StringContent(JsonConvert.SerializeObject(loginPayload), System.Text.Encoding.UTF8, "application/json");
                var loginResponse = await client.PostAsync("https://atfawry.fawrystaging.com/user-api/auth/login", loginContent);
                var loginResponseContent = await loginResponse.Content.ReadAsStringAsync();
                dynamic loginResult = JsonConvert.DeserializeObject(loginResponseContent);
                string token = loginResult?.token;

                if (string.IsNullOrEmpty(token))
                    throw new Exception("Failed to retrieve token from Fawry");

                // Step 2: Create payment link
                var requestUrl = "https://atfawry.fawrystaging.com/invoice-api/invoices/payment-link";
                DateTime currentDate = DateTime.UtcNow;
                string currentDateString = currentDate.ToString("yyyy-MM-dd");
                var payload = new
                {
                    sendingDate = currentDateString,
                    expiryDate = currentDate.AddDays(7).ToString("yyyy-MM-dd"),
                    note = description,
                    releaseDate = currentDateString,
                    alertMerchantUponExpiry = false,
                    customer = new
                    {
                        name = student.Name,
                        email = student.StudentId,
                        mobile = student.MobileNumber
                    },
                    amount = amount,
                    preferredPaymentMethod = "PayAtFawry",
                    communicationLang = "en-gb",
                    businessReference = currentDateString + "-" + student.StudentId,

                };

                var jsonPayload = JsonConvert.SerializeObject(payload);
                var httpContent = new StringContent(jsonPayload, System.Text.Encoding.UTF8, "application/json");

                client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);

                var response = await client.PostAsync(requestUrl, httpContent);
                var responseContent = await response.Content.ReadAsStringAsync();

                dynamic result = JsonConvert.DeserializeObject(responseContent);
                return result?.paymentLink ?? "No payment link returned";
            }
        }

        [DontWrapResult]
        public async Task<PagedResultDto<StudentEductionalPaymentDto>> GetAllStudentWithPaymentsAsync(string name, string phoneNumber, string installments,string grade, string studentId ,int pageNumber = 1, int pageSize = 10)
        {
            var query = _studentRepo.GetAll()
                .Include(s => s.EducationalPayments).ThenInclude(e => e.Installment)
                .Include(s => s.BusSubscriptions).ThenInclude(bs => bs.Payments).ThenInclude(p => p.Installment)
                .AsQueryable();

            // Apply filters
            if (!string.IsNullOrWhiteSpace(name))
                query = query.Where(s => s.Name.Contains(name));

            if (!string.IsNullOrWhiteSpace(phoneNumber))
                query = query.Where(s => s.MobileNumber.Contains(phoneNumber));

            if (!string.IsNullOrWhiteSpace(studentId))
                query = query.Where(s => s.StudentId.Contains(studentId));

            if (!string.IsNullOrWhiteSpace(grade))
                query = query.Where(s => s.Grade.Contains(grade));

            if (!string.IsNullOrWhiteSpace(installments))
                query = ApplyInstallmentFilter(query, installments);

            var totalCount = await query.CountAsync();

            var students = await query
                .Skip((pageNumber - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            var studentDtos = students.Select(MapToDto).ToList();

            return new PagedResultDto<StudentEductionalPaymentDto>
            {
                Items = studentDtos,
                TotalCount = totalCount,
                PageNumber = pageNumber
            };
        }

        private IQueryable<Student> ApplyInstallmentFilter(IQueryable<Student> query, string installments)
        {
            switch (installments)
            {
                case "installment1":
                    return query.Where(x =>
                        x.EducationalPayments
                            .OrderByDescending(e => e.PaymentDate)
                            .Where(e => e.PaymentStatus == PaymentStatus.Paid && e.Installment.DueDate >= DateTime.Now)
                            .Select(e => e.Installment.Order)
                            .FirstOrDefault() == 1);

                case "installment2":
                    return query.Where(x =>
                        x.EducationalPayments
                            .OrderByDescending(e => e.PaymentDate)
                            .Where(e => e.PaymentStatus == PaymentStatus.Paid && e.Installment.DueDate >= DateTime.Now)
                            .Select(e => e.Installment.Order)
                            .FirstOrDefault() == 2);

                case "installment3":
                    return query.Where(x =>
                        x.EducationalPayments
                            .OrderByDescending(e => e.PaymentDate)
                            .Where(e => e.PaymentStatus == PaymentStatus.Paid && e.Installment.DueDate >= DateTime.Now)
                            .Select(e => e.Installment.Order)
                            .FirstOrDefault() == 3);

                case "installment4":
                    return query.Where(x =>
                        x.EducationalPayments
                            .OrderByDescending(e => e.PaymentDate)
                            .Where(e => e.PaymentStatus == PaymentStatus.Paid && e.Installment.DueDate >= DateTime.Now)
                            .Select(e => e.Installment.Order)
                            .FirstOrDefault() == 4);

                case "full":
                    return query.Where(x =>
                        x.EducationalPayments
                            .OrderByDescending(e => e.PaymentDate)
                            .Where(e => e.PaymentStatus == PaymentStatus.Paid && e.Installment.DueDate >= DateTime.Now)
                            .Select(e => e.IsFullPayment)
                            .FirstOrDefault() == true);

                case "bus":
                    return query.Where(x =>
                        x.BusSubscriptions.Any(bs =>
                            bs.Payments
                                .Where(p => p.Status == PaymentStatus.Paid)
                                .OrderByDescending(p => p.PaymentDate)
                                .Select(p => p.Installment.DueDate)
                                .FirstOrDefault() >= DateTime.Now
                        )
                    );


                default:
                    return query; // No filtering
            }
        }

        private StudentEductionalPaymentDto MapToDto(Student s)
        {
            var latestPayment = GetLatestPaidEducationalPayment(s);

            return new StudentEductionalPaymentDto
            {
                StudentId = int.Parse(s.StudentId),
                Name = s.Name,
                AmountPaid = latestPayment?.AmountPaid,
                PaymentDate = latestPayment?.PaymentDate,
                Installments = GetInstallments(latestPayment?.Installment, latestPayment?.IsFullPayment ?? false),
                Grade = s.Grade,
                MobileNumber = s.MobileNumber,
                PreviousAmount = GetPreviousAmount(latestPayment),
                IsBusSubscribed = IsBusSubscribed(s.BusSubscriptions),
                BusInstallments = GetBusInstallments(s.BusSubscriptions)
            };
        }

        private School.LMS.Models.StudentEducationalPayment? GetLatestPaidEducationalPayment(Student student)
        {
            return student.EducationalPayments?
                .Where(p => p.PaymentStatus == PaymentStatus.Paid)
                .OrderByDescending(p => p.PaymentDate)
                .FirstOrDefault();
        }
        private string GetInstallments(EducationalInstallment? installment, bool isFullPayment)
        {
            if (isFullPayment)
                return "Full";

            if (installment == null)
                return "";

            return installment.Order switch
            {
                1 => "1",
                2 => "1, 2",
                3 => "1, 2, 3",
                4 => "1, 2, 3, 4",
                _ => throw new UserFriendlyException("Invalid installment order")
            };
        }
        private bool IsBusSubscribed(ICollection<StudentBusSubscription> busSubscriptions)
        {
            var latestPaid = busSubscriptions?
                .SelectMany(bs => bs.Payments)
                .Where(p => p.Status == PaymentStatus.Paid)
                .OrderByDescending(p => p.PaymentDate)
                .FirstOrDefault();

            return latestPaid?.Installment?.DueDate >= DateTime.Now;
        }

        private string GetBusInstallments(ICollection<StudentBusSubscription> busSubscriptions)
        {
            var latestPaid = busSubscriptions?
                .SelectMany(bs => bs.Payments)
                .Where(p => p.Status == PaymentStatus.Paid)
                .OrderByDescending(p => p.PaymentDate)
                .FirstOrDefault();

            if (latestPaid?.Installment is null || latestPaid.Installment.DueDate < DateTime.Now)
                return "";

            return GetInstallments(latestPaid.Installment, latestPaid.IsFullPayment);
        }

        private string GetInstallments(BusInstallment installment, bool isFullPayment)
        {
            if (isFullPayment)
                return "Full";

            if (installment == null)
                return "";

            return installment.Order switch
            {
                1 => "1",
                2 => "1, 2",
                3 => "1, 2, 3",
                4 => "1, 2, 3, 4",
                _ => throw new UserFriendlyException("Invalid installment order")
            };
        }
        private decimal? GetPreviousAmount(Models.StudentEducationalPayment studentEducationalPayment)
        {
            if (studentEducationalPayment == null) return 0;
            return studentEducationalPayment.IsFullPayment ? studentEducationalPayment?.AmountPaid : studentEducationalPayment?.Installment?.Amount ?? 0;
        }
    }

}
