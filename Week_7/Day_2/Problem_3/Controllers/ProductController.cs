using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using WebApplication3.Models;

namespace YourApp.Controllers
{
    [Route("product")]
    public class ProductController : Controller
    {
        [HttpGet("index")]
        public IActionResult Index()
        {
            var data = HttpContext.Session.GetString("Products");

            List<Product> products;

            if (data == null)
                products = new List<Product>();
            else
                products = JsonSerializer.Deserialize<List<Product>>(data);

            ViewBag.Products = products;

            return View();
        }

        [HttpPost("add")]
        public IActionResult Add(string productName, double price, int quantity)
        {
            var data = HttpContext.Session.GetString("Products");

            List<Product> products;

            if (data == null)
                products = new List<Product>();
            else
                products = JsonSerializer.Deserialize<List<Product>>(data);

            Product p = new Product();
            p.ProductName = productName;
            p.Price = price;
            p.Quantity = quantity;

            products.Add(p);

            var json = JsonSerializer.Serialize(products);
            HttpContext.Session.SetString("Products", json);

            ViewBag.Products = products;

            return View("Index");
        }
    }
}