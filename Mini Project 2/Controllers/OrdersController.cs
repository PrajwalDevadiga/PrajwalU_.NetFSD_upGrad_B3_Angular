using ECommerce.API.Services.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebApplication1.DTOs;

namespace ECommerce.API.Controllers
{
    [ApiController]
    [Route("api/orders")]
    //[Authorize]
    public class OrdersController : ControllerBase
    {
        private readonly IOrderService _service;

        public OrdersController(IOrderService service)
        {
            _service = service;
        }

        // ✅ CREATE ORDER
        [HttpPost]
        public async Task<IActionResult> CreateOrder(OrderDTO orderDto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var result = await _service.CreateOrderAsync(orderDto);

            if (!result.Success)
                return BadRequest(result.Message);

            return Ok(new
            {
                message = result.Message,
                orderId = result.Order.OrderId,
                totalAmount = result.Order.TotalAmount
            });
        }

        // ✅ GET ALL
        [HttpGet]
        public async Task<IActionResult> GetOrders()
        {
            var orders = await _service.GetAllOrdersAsync();
            return Ok(orders);
        }

        // ✅ GET BY ID
        [HttpGet("{id}")]
        public async Task<IActionResult> GetOrder(int id)
        {
            var order = await _service.GetOrderByIdAsync(id);

            if (order == null)
                return NotFound("Order not found");

            return Ok(order);
        }
    }
}