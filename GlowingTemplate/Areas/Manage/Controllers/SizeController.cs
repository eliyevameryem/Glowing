using GlowingTemplate.DAL;
using GlowingTemplate.Models;
using Microsoft.AspNetCore.Mvc;


namespace GlowingTemplate.Areas.Manage.Controllers
{
    public class SizeController : Controller
    {
        private readonly AppDbContext _context;

        public SizeController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            List<Size> size = _context.Sizes.ToList();
            return View(size);
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(Size size)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            _context.Sizes.Add(size);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult Update(int id)
        {
            Size size = _context.Sizes.FirstOrDefault(x => x.Id == id);
            return View(size);
        }
        [HttpPost]
        public IActionResult Update(Size size)
        {
            Size exist = _context.Sizes.Find(size.Id);
            exist.Name = size.Name;
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult Delete(int id)
        {
            Size size = _context.Sizes.Find(id);
            _context.Sizes.Remove(size);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}

