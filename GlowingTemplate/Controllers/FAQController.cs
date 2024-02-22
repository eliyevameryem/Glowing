using Microsoft.AspNetCore.Mvc;

namespace GlowingTemplate.Controllers
{
    public class FAQController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
