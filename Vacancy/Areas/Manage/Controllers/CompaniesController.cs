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
    public class CompaniesController : Controller
    {
        VacancyEntities db = new VacancyEntities();

        public ActionResult Index()
        {
            List<Company> companies = new List<Company>();
            companies = db.Companies.ToList();
            return View(companies);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Company company, HttpPostedFileBase Photo)
        {
            if (Photo != null)
            {
                string filename = DateTime.Now.ToString("yyyyMMddHHmmss") + Photo.FileName.Replace(" ", "_");
                string path = System.IO.Path.Combine(Server.MapPath("~/Uploads"), filename);
                Photo.SaveAs(path);
                company.Photo = filename;

            }
            company.Status = true;
            db.Companies.Add(company);
         
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Edit(int Id)
        {
            Company company = db.Companies.Find(Id);
            if(company == null)
            {
                return HttpNotFound();
            }

            return View(company);
        }

        [HttpPost]
        public ActionResult Edit(Company company, HttpPostedFileBase Photo, string OldPhoto)
        {
            Company TheCompany = db.Companies.FirstOrDefault(f => f.Id == company.Id);
            if (TheCompany != null)
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
                    TheCompany.Photo = filename;
                }


                TheCompany.Name = company.Name;
                TheCompany.Address = company.Address;
                TheCompany.Email = company.Email;
                TheCompany.Website = company.Website;
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        public ActionResult Active(int id)
        {
            Company company = db.Companies.Find(id);

            if (company == null)
            {
                return HttpNotFound();
            }

            company.Status = true;
            db.SaveChanges();

            return RedirectToAction("index");
        }

        public ActionResult Deactive(int id)
        {
            Company company = db.Companies.Find(id);

            if (company == null)
            {
                return HttpNotFound();
            }

            company.Status = false;
            db.SaveChanges();

            return RedirectToAction("index");
        }
    }
}