using Microsoft.AspNetCore.Mvc;

namespace WebApplication4.Controllers
{
    [Route("feedback")]
    public class FeedbackController : Controller
    {
        [HttpGet("index")]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost("submit")]
        public IActionResult Submit(string name, string comments, int rating)
        {
            if (rating >= 4)
                ViewData["Message"] = "Thank You for your feedback!";
            else
                ViewData["Message"] = "We will improve based on your feedback.";

            return View("Index");
        }
    }
}