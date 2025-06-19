using System.ComponentModel.DataAnnotations;

namespace School.LMS.Users.Dto
{
    public class ChangeUserLanguageDto
    {
        [Required]
        public string LanguageName { get; set; }
    }
}