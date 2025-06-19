using School.LMS.StudentEducationalPayment.Dto;
using School.LMS.StudentPayments.Dto;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace School.LMS.StudentPayments
{
    public interface IStudentPaymentAppService
    {
        Task<List<StudentPaymentDetailsDto>> GetListAsync();
    }
}
