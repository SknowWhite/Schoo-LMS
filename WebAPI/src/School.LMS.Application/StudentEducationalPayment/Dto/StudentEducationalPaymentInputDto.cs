using Abp.Application.Services.Dto;
using School.LMS.Models;
using School.LMS.Students.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.StudentEducationalPayment.Dto
{
    public class StudentEducationalPaymentInputDto:EntityDto
    {
        public int StudentId { get; set; }
        public bool IsFullPayment { get; set; }
        public decimal AmountPaid { get; set; }
        public DateTime PaymentDate { get; set; }
        public int? SelectedInstallmentIds { get; set; }
    }

    public class StudentBusPaymentInputDto : EntityDto
    {
        public int StudentId { get; set; }
        public bool IsFullPayment { get; set; }
        public decimal AmountPaid { get; set; }
        public DateTime PaymentDate { get; set; }
        public List<int>? SelectedInstallmentIds { get; set; }
    }
    public class BusSubscriptionRequestDto : EntityDto
    {
        public int StudentId { get; set; }
        public int BusLineId { get; set; }
        public string Note { get; set; }
    }

    public class StudentPaymentDetailsDto
    {
        public StudentDto StudentInfo { get; set; }
        public List<EducationalPaymentDto> EducationalPayments { get; set; }
        public List<BusLineDto> BusLines { get; set; }
    }

    public class BusPaymentDetails
    {
        public StudentDto StudentInfo { get; set; }
        public List<BusLineDto> BusLines { get; set; }
    }
    public class StudentPaymentBusDetailsDto
    {
        public StudentDto StudentInfo { get; set; }
        public BusSubscriptionDto BusSubscriptionDto { get; set; }
        public List<BusPaymentDto> BusPayments {get;set;}
    }


    public class EducationalPaymentDto:EntityDto
    {
        public string PaymentType => IsFullPayment ? "Full" : "Installment";
        public string? InstallmentName { get; set; }
        public DateTime PaymentDate { get; set; }
        public decimal AmountPaid { get; set; }
        public PaymentStatus PaymentStatus { get; set; }
        public bool IsFullPayment { get; set; }
        public string? InvoiceNumber { get; set; }
    }

    public class BusPaymentDto : EntityDto
    {
        public string PaymentType => IsFullPayment ? "Full" : "Installment";
        public string? InstallmentName { get; set; }
        public DateTime PaymentDate { get; set; }
        public decimal AmountPaid { get; set; }
        public PaymentStatus PaymentStatus { get; set; }
        public bool IsFullPayment { get; set; }
    }

    public class BusSubscriptionDto
    {
        public string LineName { get; set; }
        public string Notes { get; set; }
        public subscriptionStatus Status { get; set; }
        public DateTime SubscriptionDate { get; set; }
    }

    public class BusLineDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal ExpectedAmount { get; set; }
        public string Notes { get; set; }

        public bool IsSubscribed { get; set; }
        public string SubscriptionStatus { get; set; } // "Pending", "Approved", etc.
    }


    public class StudentEductionalPaymentDto : EntityDto
    {
        public int? StudentId { get; set; }
        public string Name { get; set; }
        public decimal? AmountPaid { get; set; }
        public DateTime? PaymentDate { get; set; }
        public string Installments { get; set; }
        public string Grade { get; set; }
        public string? MobileNumber { get; set; }
        public decimal? PreviousAmount { get; set; }
        public bool IsBusSubscribed { get; set; }
        public string BusInstallments { get; set; }
    }

    public class PagedResultDto<T>
    {
        public List<T> Items { get; set; }
        public int TotalCount { get; set; }
        public int PageNumber { get; set; }

        public PagedResultDto()
        {
            Items = new List<T>();
        }
    }


}
