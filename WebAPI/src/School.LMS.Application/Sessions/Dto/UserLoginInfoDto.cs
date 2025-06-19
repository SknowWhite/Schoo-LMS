using Abp.Application.Services.Dto;
using Abp.AutoMapper;
using School.LMS.Authorization.Users;

namespace School.LMS.Sessions.Dto
{
    [AutoMapFrom(typeof(User))]
    public class UserLoginInfoDto : EntityDto<long>
    {
        public string Name { get; set; }

        public string Surname { get; set; }

        public string UserName { get; set; }

        public string EmailAddress { get; set; }
    }
}
