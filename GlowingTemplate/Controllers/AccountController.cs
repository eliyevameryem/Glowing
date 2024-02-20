using GlowingTemplate.DAL;
using GlowingTemplate.Helpers;
using GlowingTemplate.Models;
using GlowingTemplate.ViewModels.Account;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace GlowingTemplate.Controllers
{
    [AutoValidateAntiforgeryToken]
    public class AccountController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly AppDbContext _context;

        public AccountController(UserManager<AppUser> userManager, SignInManager<AppUser> signInManager, RoleManager<IdentityRole> roleManager, AppDbContext context)
        {
            this._userManager = userManager;
            this._signInManager = signInManager;
            this._roleManager = roleManager;
            this._context = context;
        }
        public IActionResult Register()
        {


            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register(RegisterVM registerVM)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            AppUser user = new AppUser()
            {
                Email = registerVM.Email,
                Name = registerVM.Name,
                Surname = registerVM.Surname,
                UserName = registerVM.Username

            };

            IdentityResult result = await _userManager.CreateAsync(user, registerVM.Password);
            if (!result.Succeeded)
            {
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError("", error.Description);
                    return View();
                }
            }

            //await _roleManager.AddToRoleAsync("Admin");
            return RedirectToAction("Index", "Home");

        }
        public IActionResult Login()
        {

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginVM loginVM)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            var exist = await _userManager.FindByEmailAsync(loginVM.UserName);
            if (exist == null)
            {
                exist = await _userManager.FindByNameAsync(loginVM.UserName);

                if (exist == null)
                {
                    ModelState.AddModelError("", "UserName ve ya Password yalnisdir");
                    return View();
                }
            }

            var SignInCheck = await _signInManager.CheckPasswordSignInAsync(exist, loginVM.Password, true);
            if (!SignInCheck.Succeeded)
            {
                ModelState.AddModelError("", "UserName ve ya Password yalnisdir");
                return View();
            }

            if (SignInCheck.IsLockedOut)
            {
                ModelState.AddModelError("", "Birazdan yeniden cehd dersiz");
                return View();
            }

            await _signInManager.SignInAsync(exist, loginVM.RememberMe);

            return RedirectToAction("Index", "Home");

        }

        public async Task<IActionResult> LogOut()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("Index", "Home");
        }
        public async Task<IActionResult> CreateRole()
        {
            foreach (var role in Enum.GetValues(typeof(UserRole)))
            {
                if (!await _roleManager.RoleExistsAsync(role.ToString()))
                {
                    await _roleManager.CreateAsync(new IdentityRole()
                    {
                        Name = role.ToString(),
                    });
                }
            }

            return RedirectToAction(nameof(Index), "home");
        }
        //[Authorize]
        //public async Task<IActionResult> MyAccount()
        //{

        //    AppUser user = await _userManager.FindByNameAsync(User.Identity.Name);
        //    if (user == null)
        //    {
        //        return RedirectToAction(nameof(Index), "Home");
        //    }
        //    List<Order> userOrders = await _context.Orders.Where(o => o.AppUserId == user.Id).Include(o => o.BasketItems).ToListAsync();
        //    MyAccountVm accountVm = new MyAccountVm()
        //    {
        //        Orders = userOrders
        //    };




        //    return View(accountVm);
        //}

    } 
}



