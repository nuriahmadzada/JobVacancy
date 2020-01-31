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
    public class ContactController : Controller
    {
        VacancyEntities db = new VacancyEntities();

        public ActionResult Index()
        {
            Contact contact = db.Contacts.FirstOrDefault();
            return View(contact);
        }

        public ActionResult Edit(int id)
        {
            Contact contact = db.Contacts.Find(id);
            if(contact == null)
            {
                return HttpNotFound();
            }
            return View(contact);
        }

        [HttpPost]
        public ActionResult Edit(Contact contact)
        {
            if (ModelState.IsValid)
            {
                db.Entry(contact).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("index");
            }
            return View(contact);
        }
        
    }
}