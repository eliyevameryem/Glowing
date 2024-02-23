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
            List<Product> products = _context.Products.ToList();
            return View(products);
        }
        public async Task<IActionResult> Detail(int id)
        {
            Product product=await _context.Products.Include(i => i.ProductImages)
                .Include(c => c.Category)
                .FirstOrDefaultAsync(p => p.Id == id);


            return View(product);
        }

        public IActionResult GetBasket()
        {
            var cookie = Request.Cookies["Basket"];
            return Content(cookie);
        }
    }
}
