using GlowingTemplate.DAL;
using GlowingTemplate.Models;
using GlowingTemplate.ViewModels.Account;

using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace GlowingTemplate.Controllers
{
    [AutoValidateAntiforgeryToken]
    public class AccountController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;

        public AccountController(UserManager<AppUser> userManager, SignInManager<AppUser> signInManager)
        {
            this._userManager = userManager;
            this._signInManager = signInManager;
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

    }
}
