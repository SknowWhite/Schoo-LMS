using Abp.Application.Services;
using Abp.Dependency;
using Abp.Domain.Repositories;
using Abp.Domain.Uow;
using School.LMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.StudentEducationalPayment
{
    public class FawryInvoiceStatusChecker  : ApplicationService
    {
        private readonly IRepository<Models.StudentEducationalPayment> _eduPaymentRepo;
        private readonly FawryService _fawryService;
        private readonly IUnitOfWorkManager _unitOfWorkManager;
        private readonly IRepository<Student> _studentRepo;


        public FawryInvoiceStatusChecker(
            IRepository<Models.StudentEducationalPayment> eduPaymentRepo, IRepository<Student> studentRepo,
            FawryService fawryService, IUnitOfWorkManager unitOfWorkManager)
        {
            _eduPaymentRepo = eduPaymentRepo;
            _fawryService = fawryService;
            _unitOfWorkManager = unitOfWorkManager;
            _studentRepo = studentRepo;
        }

        public async Task CheckPendingInvoicesAsync()
        {
            using (var uow = _unitOfWorkManager.Begin())
            {
                var pendingPayments = _eduPaymentRepo.GetAll()
                    .Where(x => x.PaymentStatus == PaymentStatus.Pending && x.InvoiceNumber != null)
                    .ToList();

                foreach (var payment in pendingPayments)
                {
                    var statusDto = await _fawryService.GetInvoiceStatusAsync(payment.InvoiceNumber.Substring(payment.InvoiceNumber.LastIndexOf('/') + 1));

                    if (statusDto == null || string.IsNullOrEmpty(statusDto.paymentStatus.code))
                        continue;

                    switch (statusDto.paymentStatus.code?.ToUpperInvariant())
                    {
                        case "PAID":
                            payment.PaymentStatus = PaymentStatus.Paid;
                            break;
                        case "UNPAID":
                            payment.PaymentStatus = PaymentStatus.Pending;
                            break;
                        case "CANCELED":
                            payment.PaymentStatus = PaymentStatus.Canceled;
                            break;
                        case "EXPIRED":
                            payment.PaymentStatus = PaymentStatus.Failed;
                            break;
                        default:
                            continue;
                    }

                    // Optionally refresh paymentUrl
                    if (!string.IsNullOrEmpty(statusDto.paymentUrl))
                    {
                        payment.InvoiceNumber = statusDto.paymentUrl;
                    }

                    payment.PaymentStatusLastUpdate = DateTime.UtcNow;
                    
                    await _eduPaymentRepo.UpdateAsync(payment);
                     _studentRepo.FirstOrDefault(payment.StudentId).PreviousAmount = 0; // Reset previous amount

                }

                await uow.CompleteAsync();
            }
        }
    }

}
