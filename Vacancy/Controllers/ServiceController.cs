using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Vacancy.Models;

namespace Vacancy.Controllers
{
    public class ServiceController : BaseController
    {
        VacancyEntities db = new VacancyEntities();
        public ActionResult Index()
        {
            string CurrentLang = CurrentLanguageCode.ToString().ToUpper();
            ViewBag.Lang = CurrentLang;
            ViewModelService data = new ViewModelService();
            data.service = db.Services.Where(l => l.Language.Name == CurrentLang).FirstOrDefault();
            data.serviceElements = db.ServiceElements.Where(l => l.Language.Name == CurrentLang).ToList();
            return View(data);
        }
    }
}