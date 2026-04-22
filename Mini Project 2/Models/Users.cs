using System.ComponentModel.DataAnnotations;

namespace ECommerce.API.Models
{
    public class User
    {
        public int UserId { get; set; }

        [Required]
        public string Name { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        [Required]
        public string Password { get; set; }
        [Required]
        public string Role { get; set; }

    }
}
