using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Vacancy.Areas.Helpers;
using Vacancy.Models;

namespace Vacancy.Areas.Manage.Controllers
{
    [AuthLogin]
    public class ServicesController : Controller
    {
        VacancyEntities db = new VacancyEntities();

        public ActionResult Index()
        {
            List<ServiceElement> serviceElements = db.ServiceElements.ToList();
            return View(serviceElements);
        }

        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.Langs = db.Languages.ToList();
            return View();
        }

        [HttpPost]
        public ActionResult Create(int[] LangId, string[] Question, string[] Answer)
        {
            for (int i = 0; i < LangId.Count(); i++)
            {
                ServiceElement newServiceElement = new ServiceElement();
                newServiceElement.LangId = LangId[i];
                newServiceElement.Question = Question[i];
                newServiceElement.Answer = Answer[i];
                db.ServiceElements.Add(newServiceElement);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int Id)
        {
            List<ServiceElement> serviceElements = db.ServiceElements.Where(w => w.Id == Id).ToList();
            return View(serviceElements);
        }

        [HttpPost]
        public ActionResult Edit(ServiceElement serviceElement)
        {
            ServiceElement theServiceElement = db.ServiceElements.FirstOrDefault(w => w.Id == serviceElement.Id);
            if(theServiceElement != null)
            {
                theServiceElement.Answer = serviceElement.Answer;
                theServiceElement.Question = serviceElement.Question;
                db.SaveChanges();
            }
            return RedirectToAction("index");
        }

        public ActionResult Detail(int Id)
        {
            List<ServiceElement> serviceElements = db.ServiceElements.Where(w => w.Id == Id).ToList();
            return View(serviceElements);
        }

        public ActionResult Delete(int Id)
        {
            ServiceElement serviceElement = db.ServiceElements.Find(Id);
            if(serviceElement == null)
            {
                return HttpNotFound();
            }
            db.ServiceElements.Remove(serviceElement);
            db.SaveChanges();
            return RedirectToAction("index");
        }
    }
}