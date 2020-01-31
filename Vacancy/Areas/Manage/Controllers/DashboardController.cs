using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using Vacancy.Areas.Helpers;
using Vacancy.Models;

namespace Vacancy.Areas.Manage.Controllers
{
    [AuthLogin]
    public class DashboardController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Logout()
        {
            if (Request.Cookies["cookie"] != null)
            {
                HttpCookie myCookie = new HttpCookie("cookie")
                {
                    Expires = DateTime.Now.AddDays(-1)
                };
                Response.Cookies.Add(myCookie);
            }
            return RedirectToAction("index", "login");
        }
    }
}