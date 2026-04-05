using Microsoft.AspNetCore.Mvc;

namespace WebApplication1.Controllers
{
    [Route("student")]
    public class StudentController : Controller
    {
        
        [HttpGet("register")]
        public IActionResult Register()
        {
            return View();
        }

        
        [HttpPost("register")]
        public IActionResult Register(string studentName, int age, string course)
        {
            
            ViewBag.Name = studentName;
            ViewBag.Age = age;
            ViewBag.Course = course;

            
            return RedirectToAction("Display");
        }

        
        [HttpGet("display")]
        public IActionResult Display()
        {
            return View();
        }
    }
}