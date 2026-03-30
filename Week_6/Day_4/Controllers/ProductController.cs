using Microsoft.AspNetCore.Mvc;
using WebApplication2.Models;

namespace WebApplication2.Controllers
{
    public class ProductController : Controller
    {
        public IActionResult Index()
        {
            List<Product> products = new List<Product>
            {
                new Product
                {
                    ProductId = 1,
                    ProductName = "Mobile",
                    Category = "Electronics",
                    Price = 25000
                },
                new Product
                {
                    ProductId = 2,
                    ProductName = "Computer",
                    Category = "Electronics",
                    Price = 40000
                },
                new Product
                {
                    ProductId = 3,
                    ProductName = "Shirt",
                    Category = "Cloth",
                    Price = 5000
                },
                new Product
                {
                    ProductId = 4,
                    ProductName = "Laptop",
                    Category = "Electronics",
                    Price = 50000
                }
            };
            

            return View(products);
        }

        public IActionResult Details(int id)
        {
            Product proObj = new Product { ProductId = 1, ProductName = "Shirt", Category = "Cloth", Price = 4000 };
            return View(proObj);
        }
    }
}
