using GlowingTemplate.DAL;
using GlowingTemplate.Models;
using GlowingTemplate.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace GlowingTemplate.Controllers
{
    public class CartController : Controller
    {
        AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public CartController(AppDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        public async Task<IActionResult> Index()
        {


            List<BasketCookieVM> basketItems = new List<BasketCookieVM>();
            if (User.Identity.IsAuthenticated)
            {
                AppUser user = await _userManager.FindByNameAsync(User.Identity.Name);
                List<BasketItem> userBasket = await _context.BasketItems
                    .Where(b => b.AppUserId == user.Id && b.OrderId == null)
                    .Include(c=>c.Product)
                    .ThenInclude(p => p.ProductImages
                    .Where(pi => pi.IsPrime == true)).ToListAsync();
                foreach (var item in userBasket)
                {
                    basketItems.Add(new BasketCookieVM()
                    {
                       Count= item.Count,
                       Id= item.Id,
                    });
                }
            }
            else
            {


                List<BasketCookieVM> basketCookies = new List<BasketCookieVM>();
                if (Request.Cookies["Basket"] != null)
                {
                    basketCookies = JsonConvert.DeserializeObject<List<BasketCookieVM>>(Request.Cookies["Basket"]);
                    foreach (var item in basketCookies)
                    {
                        Product product = _context.Products.Where(p => p.IsDeleted == false).Include(p => p.ProductImages.Where(pi => pi.IsPrime == true)).FirstOrDefault(p => p.Id == item.Id);

                        if (product == null)
                        {

                            continue;
                        }

                        basketItems.Add(new BasketCookieVM()
                        {
                            Id = item.Id,
                            Count = item.Count
                        });
                    }
                }

                Response.Cookies.Append("Basket", JsonConvert.SerializeObject(basketCookies));

            }
            return View(basketItems);


        }
        public async Task<IActionResult> AddBasket(int id)
        {
            var product = _context.Products.Where(p => p.IsDeleted == false).FirstOrDefault(p => p.Id == id);
            if (product == null) return NotFound();

            if (User.Identity.IsAuthenticated)
            {
                AppUser user = await _userManager.FindByNameAsync(User.Identity.Name);
                BasketItem existItem = await _context.BasketItems
                    .FirstOrDefaultAsync(p => p.AppUserId == user.Id && p.ProductId == product.Id && p.OrderId == null);

                if (existItem != null)
                {
                    existItem.Count++;
                }
                else
                {
                    BasketItem basketItem = new BasketItem()
                    {
                        AppUser = user,
                        Product = product,
                        Count = 1,
                        Price = product.Price,

                    };
                    _context.BasketItems.Add(basketItem);

                }
                await _context.SaveChangesAsync();


            }
            else
            {
                List<BasketCookieVM> basket;
                if (Request.Cookies["Basket"] == null)
                {
                    BasketCookieVM basketCookieVm = new BasketCookieVM()
                    {
                        Id = id,
                        Count = 1
                    };
                    basket = new List<BasketCookieVM>();
                    basket.Add(basketCookieVm);
                }
                else
                {
                    basket = JsonConvert.DeserializeObject<List<BasketCookieVM>>(Request.Cookies["Basket"]);
                    var existBasket = basket.FirstOrDefault(p => p.Id == id);
                    if (existBasket != null)
                    {
                        existBasket.Count += 1;
                    }
                    else
                    {
                        BasketCookieVM basketCookieVm = new BasketCookieVM()
                        {
                            Id = id,
                            Count = 1
                        };
                        basket.Add(basketCookieVm);
                    }
                }
                var json = JsonConvert.SerializeObject(basket);
                Response.Cookies.Append("Basket", json);
            }






            return RedirectToAction(nameof(Index), "Home");
        }

        public IActionResult RemoveBasket(int id)
        {
            string json = Request.Cookies["Basket"];
            if(json != null)
            {
                List<BasketCookieVM> basket = JsonConvert.DeserializeObject<List<BasketCookieVM>>(json);
               BasketCookieVM product=basket.FirstOrDefault(p => p.Id == id);
                if(product != null)
                {
                    basket.Remove(product);
                }
                Response.Cookies.Append("Basket", JsonConvert.SerializeObject(basket));
            }


            return RedirectToAction("Index", "Home");
        }
    }
}
