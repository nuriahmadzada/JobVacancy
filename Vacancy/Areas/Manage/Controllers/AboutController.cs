using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Vacancy.Models;
using System.Data.Entity;
using Vacancy.Areas.Helpers;

namespace Vacancy.Areas.Manage.Controllers
{
    [AuthLogin]
    public class AboutController : Controller
    {
        VacancyEntities db = new VacancyEntities();

        // GET: Manage/About
        public ActionResult Index()
        {
            List<About> abouts = new List<About>();
            abouts = db.Abouts.ToList();
            return View(abouts);
        }


        public ActionResult Edit(int id)
        {
            About about = db.Abouts.FirstOrDefault(f => f.Id == id);
            if(about!= null)
            {
                return View(about);
            }
            return RedirectToAction("Index");
        }

        public ActionResult Update(About about, HttpPostedFileBase Photo, string OldPhoto)
        {
            About TheAbout = db.Abouts.FirstOrDefault(f => f.Id == about.Id);
            if (TheAbout != null)
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
                    TheAbout.Photo = filename;
                }


                TheAbout.Title = about.Title;
                TheAbout.Description = about.Description;
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
    }
}