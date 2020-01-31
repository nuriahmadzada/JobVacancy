using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Vacancy.Models;

namespace Vacancy.Controllers
{
    public class HomeController : BaseController
    {
        readonly VacancyEntities db = new VacancyEntities();
        public ActionResult Index()
        {
            string CurrentLang  = CurrentLanguageCode.ToString().ToUpper();
            ViewBag.Lang = CurrentLang;
            ViewmodelHome data = new ViewmodelHome();
            data.Jobs = db.JobLangs.Where(w => w.Language.Name == CurrentLang && w.Job.Status == true).ToList();
            data.Locations = db.Locations.Where(w => w.Status == true).ToList();
            data.CategoryLangs = db.CategoryLangs.Where(w => w.Status == true && w.Language.Name == CurrentLang).ToList();
            data.Companies = db.Companies.Where(w => w.Status == true).ToList();
            return View(data);
        }

        
        public ActionResult Search(int? LocationId, int? CategoryId, string Text)
        {
            string CurrentLang = CurrentLanguageCode.ToString().ToUpper();
            ViewBag.Lang = CurrentLang;
            List<JobLang> list = db.JobLangs.Where(l => l.Status == true && l.Job.CategoryId == CategoryId && l.Job.Location1.Id == LocationId && l.Language.Name == CurrentLang && l.Title.Contains(Text))
                .ToList();
            return View(list);
        }

        [HttpPost]
        public ActionResult Subscribe(Subscriber subscriber)
        {
            if (ModelState.IsValid)
            {
                subscriber.Status = true;
                db.Subscribers.Add(subscriber);
                db.SaveChanges();
            }
            return RedirectToAction("index");
        } 
    }
}