using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Vacancy.Models;

namespace Vacancy.Controllers
{
    public class AboutUsController : BaseController
    {
        VacancyEntities db = new VacancyEntities();
        public ActionResult Index()
        {
            string CurrentLang = CurrentLanguageCode.ToString().ToUpper();
            ViewBag.Lang = CurrentLang;
            About aboutus = db.Abouts.Where(w => w.Language.Name == CurrentLang).FirstOrDefault();
            return View(aboutus);
        }
    }
}