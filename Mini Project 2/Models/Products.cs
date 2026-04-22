using System.ComponentModel.DataAnnotations;

namespace ECommerce.API.Models
{
    public class Product
    {
        public int ProductId { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        [Required]
        public string Description { get; set; }

        [Range(1, 100000)]
        public decimal Price { get; set; }

        public string ImageUrl { get; set; }

        [Range(0, 1000)]
        public int Stock { get; set; }
    }
}