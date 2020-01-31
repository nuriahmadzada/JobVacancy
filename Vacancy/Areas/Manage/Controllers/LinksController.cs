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
    public class LinksController : Controller
    {
        VacancyEntities db = new VacancyEntities();

        public ActionResult Index()
        {
            List<LinkElement> linkElements = db.LinkElements.ToList();
            return View(linkElements);
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
                LinkElement newLinkElement = new LinkElement();
                newLinkElement.LangId = LangId[i];
                newLinkElement.Question = Question[i];
                newLinkElement.Answer = Answer[i];
                db.LinkElements.Add(newLinkElement);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int Id)
        {
            List<LinkElement> linkElements = db.LinkElements.Where(w => w.Id == Id).ToList();
            return View(linkElements);
        }

        [HttpPost]
        public ActionResult Edit(LinkElement linkElement)
        {
            LinkElement thelinkElement = db.LinkElements.FirstOrDefault(w => w.Id == linkElement.Id);
            if (thelinkElement != null)
            {
                thelinkElement.Answer = linkElement.Answer;
                thelinkElement.Question = linkElement.Question;
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
            LinkElement linkElement = db.LinkElements.Find(Id);
            if (linkElement == null)
            {
                return HttpNotFound();
            }
            db.LinkElements.Remove(linkElement);
            db.SaveChanges();
            return RedirectToAction("index");
        }
    }
}