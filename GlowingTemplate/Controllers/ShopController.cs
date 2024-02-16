using GlowingTemplate.DAL;
using GlowingTemplate.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

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
    }
}
