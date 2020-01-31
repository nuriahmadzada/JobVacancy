using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Vacancy.Areas.Helpers;
using Vacancy.Models;

namespace Vacancy.Areas.Manage.Controllers
{
    [AuthLogin]
    public class PartnersController : Controller
    {
        VacancyEntities db = new VacancyEntities();

        public ActionResult Index()
        {
            List<Partner> partners = new List<Partner>();
            partners = db.Partners.ToList();
            return View(partners);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Partner partner, HttpPostedFileBase Photo)
        {
            if (Photo != null)
            {
                string filename = DateTime.Now.ToString("yyyyMMddHHmmss") + Photo.FileName.Replace(" ", "_");
                string path = System.IO.Path.Combine(Server.MapPath("~/Uploads"), filename);
                Photo.SaveAs(path);
                partner.Photo = filename;

            }
            
            db.Partners.Add(partner);
            partner.Status = true;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Edit(int id)
        {
            Partner partner = db.Partners.FirstOrDefault(f => f.Id == id);
            if (partner != null)
            {
                return View(partner);
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult Edit(Partner partner, HttpPostedFileBase Photo, string OldPhoto)
        {
            if (Photo != null)
            {
                string filePath = Server.MapPath("~/Uploads/" + OldPhoto);
                if (System.IO.File.Exists(filePath))
                {
                    System.IO.File.Delete(filePath);
                }

                string filename = DateTime.Now.ToString("yyyyMMddHHmmss") + Photo.FileName.Replace(" ", "_");
                string path = System.IO.Path.Combine(Server.MapPath("~/Uploads"), filename);
                Photo.SaveAs(path);
                partner.Photo = filename;
                db.Entry(partner).State = EntityState.Modified;
                db.SaveChanges();
            }
            else
            {
                db.Partners.Attach(partner);
                db.Entry(partner).State = EntityState.Modified;
                db.Entry(partner).Property(p => p.Photo).IsModified = false;
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        public ActionResult Active(int id)
        {
            Partner partner = db.Partners.Find(id);

            if (partner == null)
            {
                return HttpNotFound();
            }

            partner.Status = true;
            db.SaveChanges();

            return RedirectToAction("index");
        }

        public ActionResult Deactive(int id)
        {
            Partner partner = db.Partners.Find(id);

            if (partner == null)
            {
                return HttpNotFound();
            }

            partner.Status = false;
            db.SaveChanges();

            return RedirectToAction("index");
        }
    }
}