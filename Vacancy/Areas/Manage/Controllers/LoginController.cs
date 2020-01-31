using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using Vacancy.Areas.Manage.Models;
using Vacancy.Models;

namespace Vacancy.Areas.Manage.Controllers
{
    public class LoginController : Controller
    {
        VacancyEntities db = new VacancyEntities();

        //public JsonResult Test()
        //{
        //    string pass = Crypto.HashPassword("12345");
        //    return Json(pass, JsonRequestBehavior.AllowGet);
        //}

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(Login login)
        {
            if (ModelState.IsValid)
            {
                Admin user = db.Admins.FirstOrDefault(u => u.Email == login.Email);
                if (user != null)
                {
                    if (Crypto.VerifyHashedPassword(user.Password, login.Password))
                    {
                        var g = Guid.NewGuid().ToString();
                        user.Token = g;
                        db.SaveChanges();

                        Response.Cookies["cookie"].Value = user.Token;
                        Response.Cookies["cookie"].Expires = DateTime.Now.AddDays(1);
                        return RedirectToAction("index", "dashboard");
                    }
                }
                else
                {
                    ModelState.AddModelError("Summary", "E-poçt və ya Şifrə yanlışdır");
                }
            }
            return View(login);
        }
    }
}