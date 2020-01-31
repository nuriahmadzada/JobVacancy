using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Vacancy.Areas.Helpers;
using Vacancy.Models;

namespace Vacancy.Areas.Manage.Controllers
{
    [AuthLogin]
    public class MessagesController : Controller
    {
        VacancyEntities db = new VacancyEntities();
        public ActionResult Index()
        {
            List<Message> messages = new List<Message>();
            messages = db.Messages.ToList();
            return View(messages);
        }

        public ActionResult Details(int Id)
        {
            Message message = db.Messages.Find(Id);
            if (message == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            return View(message);
        }

        public ActionResult Delete(int Id)
        {
            Message message = db.Messages.Find(Id);
            if (message == null)
            {
                return HttpNotFound();
            }

            db.Messages.Remove(message);
            db.SaveChanges();
            return RedirectToAction("index");
        }
    }
}