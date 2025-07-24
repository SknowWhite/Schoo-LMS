using AutoMapper;
using School.LMS.Models;
using School.LMS.Models.NewLogic;
using School.LMS.NewLogic.Dtos;
using School.LMS.Students.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace School.LMS.NewLogic
{
    public class InstallmentAutoMapperProfile : Profile
    {
        public InstallmentAutoMapperProfile()
        {
            CreateMap<InstallmentTemplate, InstallmentTemplateDto>();
            CreateMap<CreateUpdateInstallmentTemplateDto, InstallmentTemplate>();

            CreateMap<InstallmentBreakdown, InstallmentBreakdownDto>();
            CreateMap<CreateUpdateInstallmentBreakdownDto, InstallmentBreakdown>();
            CreateMap<Student, StudentDto>();
            CreateMap<StudentDto, Student>();

            CreateMap<StudentInstallment, StudentInstallmentDto>()
            .ForMember(dest => dest.Student, opt => opt.MapFrom(src => src.Student))
            .ForMember(dest => dest.InstallmentTemplate, opt => opt.MapFrom(src => src.InstallmentTemplate));

        }
    }

}
