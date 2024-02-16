using GlowingTemplate.Areas.Manage.ViewModels;
using GlowingTemplate.Areas.Manage.ViewModels.Product;
using GlowingTemplate.DAL;
using GlowingTemplate.Helpers;
using GlowingTemplate.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis;
using Microsoft.EntityFrameworkCore;

namespace GlowingTemplate.Areas.Manage.Controllers
{
    [Area("Manage")]
    public class ProductController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;

        public ProductController(AppDbContext context,IWebHostEnvironment env)
        {
            this._context = context;
            this._env = env;
        }
        public async Task<IActionResult> Index()
        {
            ViewBag.Size = await _context.Products.ToListAsync();
            ViewBag.Categories = await _context.Categories.ToListAsync();
            List<Product> products = await _context.Products
                .Include(p => p.ProductImages)
                .Include(p => p.Category)
                .Include(p=>p.ProductImages)
                .ToListAsync();

            return View(products);
        }
        public async Task<IActionResult> Create()
        {
            ViewBag.Size=await _context.Products.ToListAsync();
            ViewBag.Categories = await _context.Categories.ToListAsync();
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(ProductCreateVM productVM)
        {
            ViewBag.Size = await _context.Products.ToListAsync();
            ViewBag.Categories = await _context.Categories.ToListAsync();

            if (productVM == null) return NotFound();

            if(!ModelState.IsValid)
            {
                return View();
            }


            if(!await _context.Categories.AnyAsync(x => x.Id == productVM.CategoryId))
            {
                ModelState.AddModelError("CategoryId", "There was no such category");
                return View();
            }
            if (!await _context.Sizes.AnyAsync(x => x.Id == productVM.SizeId))
            {
                ModelState.AddModelError("SizeId", "There was no such size");
                return View();
            }
            Product product = new Product()
            {
                Name = productVM.Name,
                Description = productVM.Description,
                Price = productVM.Price,
                SKU = productVM.SKU,
                CategoryId = productVM.CategoryId,
                SizeId = productVM.SizeId,
                ProductImages = new List<ProductImage>(),
            };
            if (!productVM.MainPhoto.CheckLength(20000000))
            {
                ModelState.AddModelError("MainPhoto", "Duzgun olculu sekil daxil elemediniz");
                return View(productVM);
            }
            if (!productVM.MainPhoto.CheckType("image/"))
            {
                ModelState.AddModelError("MainPhoto", "Sekil daxil edin");
                return View(productVM);
            }
            if (!productVM.HoverPhoto.CheckLength(20000000))
            {
                ModelState.AddModelError("HoverPhoto", "Duzgun olculu sekil daxil elemediniz");
                return View();
            }
            if (!productVM.HoverPhoto.CheckType("image/"))
            {
                ModelState.AddModelError("HoverPhoto", "Sekil daxil edin");
                return View(productVM);
            }
            ProductImage mainphoto = new ProductImage()
            {
                IsPrime = true,
                Product = product,
                ImageUrl = productVM.MainPhoto.CreateFile(_env.WebRootPath, @"\upload\product\")
            };
            ProductImage hoverphoto = new ProductImage()
            {
                IsPrime = false,
                Product = product,
                ImageUrl = productVM.HoverPhoto.CreateFile(_env.WebRootPath, @"\upload\product\")
            };

            product.ProductImages.Add(mainphoto);
            product.ProductImages.Add(hoverphoto);
            TempData["Error"] = "";
            foreach (IFormFile imgfile in productVM.Photo)
            {
                if (!imgfile.CheckLength(20000000))
                {
                    TempData["Error"] += $"{imgfile.FileName} seklin olcusu coxdu ";
                    continue;
                }
                if (!imgfile.CheckType("image/"))
                {
                    TempData["Error"] += $"{imgfile.FileName} seklin tipi uygin deyl ";

                    continue;
                }
                ProductImage productImage = new ProductImage()
                {
                    IsPrime = null,
                    Product = product,
                    ImageUrl = imgfile.CreateFile(_env.WebRootPath, @"\upload\product\")
                };
                product.ProductImages.Add(productImage);

            }

            


            await _context.Products.AddAsync(product);
            await _context.SaveChangesAsync();
            


            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Update(int id)
        {
            ViewBag.Size = await _context.Products.ToListAsync();
            ViewBag.Categories = await _context.Categories.ToListAsync();
            Product exist=await _context.Products
                .Include(c=>c.Category)
                .Include(p=>p.ProductImages)
                .FirstOrDefaultAsync(x => x.Id == id);
            if (exist == null) return NotFound();

            ProductUpdateVM productVM = new ProductUpdateVM()
            {
                Name= exist.Name,
                Description= exist.Description,
                Price = exist.Price,
                SKU = exist.SKU,
                CategoryId= exist.CategoryId,
                SizeId= exist.SizeId,
                ProductImagesVM=new List<ProductImageVM>()

            };

            foreach (var item in exist.ProductImages)
            {
                ProductImageVM productImageVM = new ProductImageVM()
                {
                    Id= item.Id,
                    ImgUrl=item.ImageUrl,
                    IsPrime=item.IsPrime,
                };

                productVM.ProductImagesVM.Add(productImageVM);
            }



            return View(productVM);


        }

        [HttpPost]

        public async Task<IActionResult> Update(int id, ProductUpdateVM productUpdateVM)
        {
            ViewBag.Size = await _context.Products.ToListAsync();
            ViewBag.Categories = await _context.Categories.ToListAsync();
            Product exist = await _context.Products
                .Include(p => p.Category)
                .Include(p => p.ProductImages)
                .FirstOrDefaultAsync(x => x.Id == id);
            if (exist == null) return NotFound();

            if (ModelState.IsValid)
            {
                return View();
            }




            if (!await _context.Categories.AnyAsync(x => x.Id == productUpdateVM.CategoryId))
            {
                ModelState.AddModelError("CategoryId", "There was no such category");
                return View();
            }
            if (!await _context.Sizes.AnyAsync(x => x.Id == productUpdateVM.SizeId))
            {
                ModelState.AddModelError("SizeId", "There was no such size");
                return View();
            }

            exist.CategoryId = productUpdateVM.CategoryId;
            exist.SizeId = productUpdateVM.SizeId;
            exist.Price = productUpdateVM.Price;
            exist.SKU = productUpdateVM.SKU;
            exist.Description = productUpdateVM.Description;


            if (productUpdateVM.MainPhoto != null)
            {
                if (!productUpdateVM.MainPhoto.CheckLength(20000000))
                {
                    ModelState.AddModelError("MainPhoto", "Duzgun olculu sekil daxil elemediniz");
                    return View(productUpdateVM);
                }
                if (!productUpdateVM.MainPhoto.CheckType("image/"))
                {
                    ModelState.AddModelError("MainPhoto", "Sekil daxil edin");
                    return View(productUpdateVM);
                }

                var existMainPhoto = exist.ProductImages.FirstOrDefault(p => p.IsPrime == true);
                existMainPhoto.ImageUrl.DeleteFile(_env.WebRootPath, @"/upload/product/");
                ProductImage productImage = new ProductImage()
                {
                    ImageUrl = productUpdateVM.MainPhoto.CreateFile(_env.WebRootPath, @"/upload/product/"),
                    ProductId = exist.Id,
                    IsPrime = true

                };

                exist.ProductImages.Add(productImage);


            }
            if (productUpdateVM.HoverPhoto != null)
            {
                if (!productUpdateVM.HoverPhoto.CheckLength(20000000))
                {
                    ModelState.AddModelError("HoverPhoto", "Duzgun olculu sekil daxil elemediniz");
                    return View(productUpdateVM);
                }
                if (!productUpdateVM.HoverPhoto.CheckType("image/"))
                {
                    ModelState.AddModelError("HoverPhoto", "Sekil daxil edin");
                    return View(productUpdateVM);
                }

                var existHoverPhoto = exist.ProductImages.FirstOrDefault(p => p.IsPrime == false);
                existHoverPhoto.ImageUrl.DeleteFile(_env.WebRootPath, @"/upload/product/");
                ProductImage productImage = new ProductImage()
                {
                    ImageUrl = productUpdateVM.HoverPhoto.CreateFile(_env.WebRootPath, @"/upload/product/"),
                    ProductId = exist.Id,
                    IsPrime = false

                };

                exist.ProductImages.Add(productImage);


            }

            List<ProductImage> removeList = exist.ProductImages.Where(pt => !productUpdateVM.ImageIds.Contains(pt.Id) && pt.IsPrime == null).ToList();
            if (removeList.Count > 0)
            {
                foreach (var item in removeList)
                {
                    exist.ProductImages.Remove(item);
                    item.ImageUrl.DeleteFile(_env.WebRootPath, @"\upload\product\");
                }
            }

            if(productUpdateVM.Photo!=null)
            {
                foreach (IFormFile imgFile in productUpdateVM.Photo)
                {
                    if (!imgFile.CheckType("image/"))
                    {
                        TempData["Error"] += $"{imgFile.FileName} uygun tipde deyil ";
                        continue;
                    }
                    if (!imgFile.CheckLength(2097152))
                    {
                        TempData["Error"] += $"{imgFile.FileName} file-nin olcusu coxdur";
                        continue;
                    }
                    ProductImage productImage = new ProductImage()
                    {
                        IsPrime = null,
                        ProductId = exist.Id,
                        ImageUrl = imgFile.CreateFile(_env.WebRootPath, "/Upload/Product/")
                    };
                    exist.ProductImages.Add(productImage);
                }
            }

        await _context.Products.AddAsync(exist);
            await _context.SaveChangesAsync();

            return RedirectToAction("Index");


        }


        public async Task<IActionResult> Delete(int id)
        {
            Product product=await _context.Products.Include(p=>p.ProductImages).FirstOrDefaultAsync(p => p.Id == id);
            if(product == null) return NotFound();

            foreach (var item in product.ProductImages)
            {
                item.ImageUrl.DeleteFile(_env.WebRootPath, @"\upload\product\");
            }
            _context.Products.Remove(product);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
               
            
        }
    }
}
