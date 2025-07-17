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

namespace School.LMS.BusFeePlan.Dto
{
    public class BusFeeService : AsyncCrudAppService<Models.BusFeePlan, BusFeeFromExcelDto>
    {
        private readonly IRepository<Models.BusInstallment> _busInstallmentsRepository;

        public BusFeeService(IRepository<Models.BusFeePlan> repository, IRepository<BusInstallment> busInstallmentsRepository) : base(repository)
        {
            _busInstallmentsRepository = busInstallmentsRepository;
        }

        public async Task ImportBusFee(List<BusFeeFromExcelDto> educationalFeeDtos)
        {
            if (educationalFeeDtos == null || educationalFeeDtos.Count == 0)
            {
                throw new ArgumentException("Educational fee data cannot be null or empty.");
            }
            await _busInstallmentsRepository.DeleteAsync(x => x.Id > 0);
            await Repository.BatchDeleteAsync(x => x.Id > 0);

            await Repository.InsertRangeAsync(educationalFeeDtos.Select(MapToEntity).ToList());
        }
        public async Task<List<BusFeeFromExcelDto>> GetAllBusFees()
        {
            var educationalFees =  Repository.GetAllIncluding(x => x.Installments).ToList();
            var x= educationalFees.Select(MapToDto).ToList();
            return x;
        }

        private Models.BusFeePlan MapToEntity(BusFeeFromExcelDto busFeeFromExcelDto)
        {
            return new Models.BusFeePlan
            {
                Line = busFeeFromExcelDto.Line,
                ExpectedTotalAmount = busFeeFromExcelDto.ExpectedAmount,
                FullAmountWith5PercentDiscount = busFeeFromExcelDto.fullAmountWithDiscount.Amount,
                FullAmountDueDate = busFeeFromExcelDto.fullAmountWithDiscount.DueDate,
                Installments = new List<Models.BusInstallment>
                {
                    new Models.BusInstallment
                    {
                        Order = 1,
                        Amount = busFeeFromExcelDto.FirstInstallment.Amount,
                        DueDate = busFeeFromExcelDto.FirstInstallment.DueDate
                    },
                    new Models.BusInstallment
                    {
                        Order = 2,
                        Amount = busFeeFromExcelDto.SecondInstallment.Amount,
                        DueDate = busFeeFromExcelDto.SecondInstallment.DueDate
                    },
                    new Models.BusInstallment
                    {
                        Order = 3,
                        Amount = busFeeFromExcelDto.ThirdInstallment.Amount,
                        DueDate = busFeeFromExcelDto.ThirdInstallment.DueDate
                    },
                    new Models.BusInstallment
                    {
                        Order = 4,
                        Amount = busFeeFromExcelDto.FourthInstallment.Amount,
                        DueDate =   busFeeFromExcelDto.FourthInstallment.DueDate
                    }
                }
            };
        }

        private BusFeeFromExcelDto MapToDto(Models.BusFeePlan busFeePlan)
        {
            BusFeeFromExcelDto x = new BusFeeFromExcelDto();


            x.Id = busFeePlan.Id;
            x.Line = busFeePlan.Line;
                x.ExpectedAmount = busFeePlan.ExpectedTotalAmount;
                x.FirstInstallment = new Installment
                {
                    Amount = busFeePlan.Installments.First(x=>x.Order==1).Amount,
                    DueDate = busFeePlan.Installments.First(x => x.Order == 1).DueDate
                };
                x.SecondInstallment = new Installment
                {
                    Amount = busFeePlan.Installments.First(x => x.Order == 2).Amount,
                    DueDate = busFeePlan.Installments.First(x => x.Order == 2).DueDate
                };
            x.ThirdInstallment = new Installment
                {
                    Amount = busFeePlan.Installments.First(x => x.Order == 3).Amount,
                    DueDate = busFeePlan.Installments.First(x => x.Order == 3).DueDate
                };
            x.FourthInstallment = new Installment
                {
                    Amount = busFeePlan.Installments.First(x => x.Order == 4).Amount,
                    DueDate = busFeePlan.Installments.First(x => x.Order == 4).DueDate
                };
            x.fullAmountWithDiscount = new Installment
            {
                Amount = busFeePlan.FullAmountWith5PercentDiscount,
                DueDate = busFeePlan.FullAmountDueDate
            };
            return x;
        }
    }
}
