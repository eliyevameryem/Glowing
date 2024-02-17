using Microsoft.AspNetCore.Mvc;

namespace GlowingTemplate.Controllers
{
    public class CardController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
