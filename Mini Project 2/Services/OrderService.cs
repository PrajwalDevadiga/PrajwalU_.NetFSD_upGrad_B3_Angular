using ECommerce.API.Data;
using ECommerce.API.Models;
using ECommerce.API.Repositories.Interfaces;
using ECommerce.API.Services.Interfaces;
using Microsoft.EntityFrameworkCore;
using WebApplication1.DTOs;

namespace ECommerce.API.Services
{
    public class OrderService : IOrderService
    {
        private readonly IOrderRepository _orderRepo;
        private readonly ApplicationDbContext _context;

        public OrderService(IOrderRepository orderRepo, ApplicationDbContext context)
        {
            _orderRepo = orderRepo;
            _context = context;
        }

        public async Task<(bool Success, string Message, Order Order)> CreateOrderAsync(OrderDTO orderDto)
        {
            // 🔴 Validation
            if (orderDto == null || orderDto.Items == null || !orderDto.Items.Any())
                return (false, "Order must contain at least one item", null);

            var orderItems = new List<OrderItem>();
            decimal totalAmount = 0;

            foreach (var item in orderDto.Items)
            {
                if (item.Quantity <= 0)
                    return (false, "Quantity must be greater than 0", null);

                var product = await _context.Products
                    .FirstOrDefaultAsync(p => p.ProductId == item.ProductId);

                if (product == null)
                    return (false, $"Product with ID {item.ProductId} not found", null);

                if (product.Stock < item.Quantity)
                    return (false, $"Insufficient stock for {product.Name}", null);

                decimal itemTotal = product.Price * item.Quantity;
                totalAmount += itemTotal;

                orderItems.Add(new OrderItem
                {
                    ProductId = product.ProductId,
                    Quantity = item.Quantity,
                    Price = product.Price
                });

                // Reduce stock
                product.Stock -= item.Quantity;
            }

            var order = new Order
            {
                UserId = orderDto.UserId,
                OrderDate = DateTime.Now,
                TotalAmount = totalAmount,
                OrderItems = orderItems
            };

            await _orderRepo.AddOrderAsync(order);

            return (true, "Order placed successfully", order);
        }

        public async Task<List<Order>> GetAllOrdersAsync()
        {
            return await _orderRepo.GetAllOrdersAsync();
        }

        public async Task<Order> GetOrderByIdAsync(int id)
        {
            if (id <= 0)
                return null;

            return await _orderRepo.GetOrderByIdAsync(id);
        }
    }
}