using GlowingTemplate.DAL;
using GlowingTemplate.Models;
using Microsoft.AspNetCore.Mvc;

namespace GlowingTemplate.Areas.Manage.Controllers
{
    [Area("Manage")]
    public class CategoryController : Controller
    {
        private readonly AppDbContext _context;

        public CategoryController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            List<Category> categories= _context.Categories.ToList();
            return View(categories);
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(Category category)
        {
            if(!ModelState.IsValid)
            {
                return View();
            }

            _context.Categories.Add(category);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult Update(int id)
        {
            Category category = _context.Categories.FirstOrDefault(x=>x.Id==id);
            return View(category);
        }
        [HttpPost]
        public IActionResult Update(Category category)
        {
            Category exist = _context.Categories.Find(category.Id);
            exist.Name= category.Name;
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult Delete(int id)
        {
            Category category = _context.Categories.Find(id);
            _context.Categories.Remove(category);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
