using ECommerce.API.Models;
using WebApplication1.DTOs;

namespace ECommerce.API.Services.Interfaces
{
    public interface IOrderService
    {
        Task<(bool Success, string Message, Order Order)> CreateOrderAsync(OrderDTO orderDto);
        Task<List<Order>> GetAllOrdersAsync();
        Task<Order> GetOrderByIdAsync(int id);
    }
}