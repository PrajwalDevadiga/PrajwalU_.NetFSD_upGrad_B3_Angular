using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace ECommerce.API.Models
{
    public class OrderItem
    {
        public int OrderItemId { get; set; }

        [Required]
        public int ProductId { get; set; }

        [Range(1, 100)]
        public int Quantity { get; set; }

        public decimal Price { get; set; }

        public int OrderId { get; set; }

        [JsonIgnore]
        public Order Order { get; set; }
    }
}