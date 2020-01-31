using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Vacancy.Models;
namespace Vacancy.Controllers
{
    public class JobDetailController : BaseController
    {
        VacancyEntities db = new VacancyEntities();
        public ActionResult Index(int id)
        {
            string CurrentLang = CurrentLanguageCode.ToString().ToUpper();
            ViewBag.Lang = CurrentLang;
            ViewModelJobDetail datas = new ViewModelJobDetail();
            datas.Vacancy = db.JobLangs.FirstOrDefault(w => w.Language.Name == CurrentLang && w.Job.Status == true && w.JobId==id);
            datas.Vacancies = db.JobLangs.Where(w => w.Language.Name == CurrentLang && w.Job.Status == true && w.Job.CategoryId == datas.Vacancy.Job.CategoryId && w.JobId !=id).OrderByDescending(o=>o.Id).Take(3).ToList();
            if (datas.Vacancy != null)
            {
                return View(datas);
            }
            return RedirectToAction("Index", "Home", new { Area = "", lang = CurrentLang });

            
        }
    }
}