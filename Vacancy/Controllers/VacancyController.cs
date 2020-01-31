using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Vacancy.Models;

namespace Vacancy.Controllers
{
    public class VacancyController : BaseController
    {
        VacancyEntities db = new VacancyEntities();
        public ActionResult Index()
        {
            string CurrentLang = CurrentLanguageCode.ToString().ToUpper();
            ViewBag.Lang = CurrentLang;
            ViewmodelHome data = new ViewmodelHome();
            data.Jobs = db.JobLangs.Where(w => w.Language.Name == CurrentLang && w.Job.Status == true).ToList();
            data.CategoryLangs = db.CategoryLangs.Where(w => w.Language.Name == CurrentLang && w.Status == true).ToList();
            data.Locations = db.Locations.Where(w => w.Status == true).ToList();
            data.Experiences = db.Experiences.Where(w => w.Status == true).ToList();
            data.JobTypeLangs = db.JobTypeLangs.Where(w => w.Language.Name == CurrentLang && w.Status == true).ToList();
            return View(data);
        }
    }
}