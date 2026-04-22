using System.ComponentModel.DataAnnotations;
using WebApplication1.DTOs;

namespace WebApplication1.DTOs
{
    public class OrderDTO
    {
        [Required]
        public int UserId { get; set; }

        [Required]
        public List<OrderItemDTO> Items { get; set; }
    }
}