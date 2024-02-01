using Microsoft.AspNetCore.Mvc;

namespace GlowingTemplate.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
