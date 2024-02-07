using GlowingTemplate.DAL;
using GlowingTemplate.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GlowingTemplate.Areas.Manage.Controllers
{
    [Area("Manage")]
    public class TagController : Controller
    {
        private readonly AppDbContext _context;

        public TagController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            List<Tag> tags = _context.Tags.ToList();
            return View(tags);
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(Tag tag)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            _context.Tags.Add(tag);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult Update(int id)
        {
            Tag tag = _context.Tags.FirstOrDefault(x => x.Id == id);
            return View(tag);
        }
        [HttpPost]
        public IActionResult Update(Tag tag)
        {
            Tag exist = _context.Tags.Find(tag.Id);
            exist.Name = tag.Name;
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
        public IActionResult Delete(int id)
        {
            Tag tag = _context.Tags.Find(id);
            _context.Tags.Remove(tag);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
