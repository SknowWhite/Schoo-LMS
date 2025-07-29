using Abp.Application.Services;
using Abp.Domain.Repositories;
using Abp.Domain.Uow;
using School.LMS.Models;
using School.LMS.Models.NewLogic;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace School.LMS.StudentEducationalPayment
{
    public class FawryInvoiceStatusChecker  : ApplicationService
    {
        private readonly IRepository<StudentInstallment, Guid> _studentInstallmentRepo;
        private readonly FawryService _fawryService;
        private readonly IUnitOfWorkManager _unitOfWorkManager;
        private readonly IRepository<Student> _studentRepo;


        public FawryInvoiceStatusChecker(
            IRepository<StudentInstallment, Guid> studentInstallmentRepo, IRepository<Student> studentRepo,
            FawryService fawryService, IUnitOfWorkManager unitOfWorkManager)
        {
            _studentInstallmentRepo = studentInstallmentRepo;
            _fawryService = fawryService;
            _unitOfWorkManager = unitOfWorkManager;
            _studentRepo = studentRepo;
        }

        public async Task CheckPendingInvoicesAsync()
        {
            using (var uow = _unitOfWorkManager.Begin())
            {
                var pendingPayments = _studentInstallmentRepo.GetAll()
                    .Where(x => x.Status == InstallmentStatus.Pending && x.InvoiceUrl != null)
                    .ToList();

                foreach (var payment in pendingPayments)
                {
                    var statusDto = await _fawryService.GetInvoiceStatusAsync(payment.InvoiceUrl.Substring(payment.InvoiceUrl.LastIndexOf('/') + 1));

                    if (statusDto == null || string.IsNullOrEmpty(statusDto.paymentStatus.code))
                        continue;

                    switch (statusDto.paymentStatus.code?.ToUpperInvariant())
                    {
                        case "PAID":
                            payment.Status = InstallmentStatus.Paid;
                            break;
                        case "UNPAID":
                            payment.Status = InstallmentStatus.Pending;
                            break;
                        case "EXPIRED":
                            payment.Status = InstallmentStatus.Failed;
                            break;
                        default:
                            continue;
                    }

                    // Optionally refresh paymentUrl
                    if (!string.IsNullOrEmpty(statusDto.paymentUrl))
                    {
                        payment.InvoiceUrl = statusDto.paymentUrl;
                    }

                    payment.InvoiceLastUpdate = DateTime.UtcNow;
                    
                    await _studentInstallmentRepo.UpdateAsync(payment);
                     _studentRepo.FirstOrDefault(payment.StudentId).PreviousAmount = 0; // Reset previous amount

                }

                await uow.CompleteAsync();
            }
        }
    }

}
