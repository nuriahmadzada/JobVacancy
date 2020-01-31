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
    public class SubscribersController : Controller
    {
        VacancyEntities db = new VacancyEntities();

        public ActionResult Index()
        {
            List<Subscriber> subscribers = new List<Subscriber>();
            subscribers = db.Subscribers.ToList();
            return View(subscribers);
        }

        public ActionResult Delete(int Id)
        {
            Subscriber subscriber = db.Subscribers.Find(Id);
            if (subscriber == null)
            {
                return HttpNotFound();
            }

            db.Subscribers.Remove(subscriber);
            db.SaveChanges();
            return RedirectToAction("index");
        }
    }
}