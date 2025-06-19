using Abp.Application.Services;
using Abp.Domain.Repositories;
using Abp.EntityFrameworkCore.Repositories;
using School.LMS.EducationalFeePlan.Dto;
using School.LMS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.EducationalFeePlan
{
    public class EducationFeeService : AsyncCrudAppService<Models.EducationalFeePlan, EducationalFeeFromExcelDto>
    {
        private readonly IRepository<Models.EducationalInstallment> _educationalInstallmentsRepository;
        public EducationFeeService(IRepository<Models.EducationalFeePlan> repository, IRepository<EducationalInstallment> educationalInstallmentsRepository) : base(repository)
        {
            _educationalInstallmentsRepository = educationalInstallmentsRepository;
        }


        public async Task ImportEducationalFee(List<EducationalFeeFromExcelDto> educationalFeeDtos) 
        {
            if(educationalFeeDtos == null || educationalFeeDtos.Count == 0)
            {
                throw new ArgumentException("Educational fee data cannot be null or empty.");
            }
            await _educationalInstallmentsRepository.DeleteAsync(x => x.Id > 0);
            await Repository.BatchDeleteAsync(x => x.Id > 0);
            await Repository.InsertRangeAsync(educationalFeeDtos.Select(MapToEntity).ToList());
        }
        public async Task<List<EducationalFeeFromExcelDto>> GetAllEducationalFees()
        {
            var educationalFees =  Repository.GetAllIncluding(x=>x.Installments);
            return educationalFees.Select(MaptoDto).ToList();
        }
        private Models.EducationalFeePlan MapToEntity(EducationalFeeFromExcelDto educationalFeeDto)
        {
            return new Models.EducationalFeePlan
            {
                Grade = educationalFeeDto.Grade,
                ExpectedTotalAmount = educationalFeeDto.ExpectedAmount,
                FullAmountWith5PercentDiscount = educationalFeeDto.fullAmountWithDiscount.Amount,
                FullAmountDueDate = educationalFeeDto.fullAmountWithDiscount.DueDate,
                Installments = new List<Models.EducationalInstallment>
                {
                    new Models.EducationalInstallment
                    {
                        Order = 1,
                        Amount = educationalFeeDto.FirstInstallment.Amount,
                        DueDate = educationalFeeDto.FirstInstallment.DueDate
                    },
                    new Models.EducationalInstallment
                    {
                        Order = 2,
                        Amount = educationalFeeDto.SecondInstallment.Amount,
                        DueDate = educationalFeeDto.SecondInstallment.DueDate
                    },
                    new Models.EducationalInstallment
                    {
                        Order = 3,
                        Amount = educationalFeeDto.ThirdInstallment.Amount,
                        DueDate = educationalFeeDto.ThirdInstallment.DueDate
                    },
                    new Models.EducationalInstallment
                    {
                        Order = 4,
                        Amount = educationalFeeDto.FourthInstallment.Amount,
                        DueDate = educationalFeeDto.FourthInstallment.DueDate
                    }
                }
            };
        }

        private  EducationalFeeFromExcelDto MaptoDto(Models.EducationalFeePlan educationalFeePlan)
        {
            return new EducationalFeeFromExcelDto
            {
                Id = educationalFeePlan.Id,
                Grade = educationalFeePlan.Grade,
                ExpectedAmount = educationalFeePlan.ExpectedTotalAmount,
                fullAmountWithDiscount = new Installment
                {
                    Amount = educationalFeePlan.FullAmountWith5PercentDiscount,
                    DueDate = educationalFeePlan.FullAmountDueDate
                },
                FirstInstallment = new Installment
                {
                    Amount = educationalFeePlan.Installments.FirstOrDefault(i => i.Order == 1)?.Amount ?? 0,
                    DueDate = educationalFeePlan.Installments.FirstOrDefault(i => i.Order == 1)?.DueDate ?? DateTime.MinValue
                },
                SecondInstallment = new Installment
                {
                    Amount = educationalFeePlan.Installments.FirstOrDefault(i => i.Order == 2)?.Amount ?? 0,
                    DueDate = educationalFeePlan.Installments.FirstOrDefault(i => i.Order == 2)?.DueDate ?? DateTime.MinValue
                },
                ThirdInstallment = new Installment
                {
                    Amount = educationalFeePlan.Installments.FirstOrDefault(i => i.Order == 3)?.Amount ?? 0,
                    DueDate = educationalFeePlan.Installments.FirstOrDefault(i => i.Order == 3)?.DueDate ?? DateTime.MinValue
                },
                FourthInstallment = new Installment
                {
                    Amount = educationalFeePlan.Installments.FirstOrDefault(i => i.Order == 4)?.Amount ?? 0,
                    DueDate = educationalFeePlan.Installments.FirstOrDefault(i => i.Order == 4)?.DueDate ?? DateTime.MinValue
                }
            };
        }
    }
    
}
