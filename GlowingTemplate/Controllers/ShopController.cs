using GlowingTemplate.DAL;
using GlowingTemplate.Models;
using GlowingTemplate.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace GlowingTemplate.Controllers
{
    public class ShopController : Controller
    {
        private readonly AppDbContext _context;
        

        public ShopController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        public async Task<IActionResult> Detail(int id)
        {
            Product product=await _context.Products.Include(i => i.ProductImages)
                .Include(c => c.Category)
                .Include(p => p.PrdSizes).ThenInclude(s => s.Size)
                .FirstOrDefaultAsync(p => p.Id == id);


            return View(product);
        }

        public IActionResult AddBasket(int id)
        {
            var product=_context.Products.FirstOrDefault(i => i.Id == id);
            if (product == null) return NotFound();
            List<BasketCookieVM> basket;

            if (Request.Cookies["Basket"]==null)
            {
                BasketCookieVM basketCookieVM = new BasketCookieVM()
                {
                    Id = id,
                    Count = 1
                };
                basket = new List<BasketCookieVM>();
                basket.Add(basketCookieVM);
            }
            else
            {
                basket = JsonConvert.DeserializeObject<List<BasketCookieVM>>(Request.Cookies["Basket"]);
                var existBasket=basket.FirstOrDefault(p=>p.Id== id);
                if (existBasket!=null)
                {
                    existBasket.Count += 1;
                }
                else
                {
                    BasketCookieVM basketCookieVM = new BasketCookieVM()
                    {
                        Id = id,
                        Count = 1
                    };
                    basket.Add(basketCookieVM);
                }
            }
            return RedirectToAction("Index", "Home");

        }

        public IActionResult GetBasket()
        {
            var cookie = Request.Cookies["Basket"];
            return Content(cookie);
        }
    }
}
