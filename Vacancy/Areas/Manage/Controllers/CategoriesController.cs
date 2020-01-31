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
    public class CategoriesController : Controller
    {
        VacancyEntities db = new VacancyEntities();
        // GET: Manage/Categories
        public ActionResult Index()
        {
            List<CategoryLang> categoryLangs = db.CategoryLangs.Where(w => w.LangId == 1 && w.Status == true).ToList();
            return View(categoryLangs);
        }

        public ActionResult Create()
        {
            ViewBag.Langs = db.Languages.ToList();
            return View();
        }

        public ActionResult New(int[] LangId, string[] Name)
        {
            Category category = new Category();
            category.Status = true;
            db.Categories.Add(category);
            db.SaveChanges();
            for (int i = 0; i < LangId.Length; i++)
            {
                CategoryLang categoryLang = new CategoryLang();
                categoryLang.LangId = LangId[i];
                categoryLang.CategoryId = category.Id;
                categoryLang.Name = Name[i];
                categoryLang.Status = true;

                db.CategoryLangs.Add(categoryLang);

            }
            db.SaveChanges();


            return RedirectToAction("Index");
        }

        public ActionResult Edit(int CategoryId)
        {
            List<CategoryLang> categoryLangs = db.CategoryLangs.Where(w => w.CategoryId == CategoryId).ToList();
            return View(categoryLangs);
        }
       
        public ActionResult Update(int[] LangId, string[] Name , int CategoryId)
        {
         for(int i=0; i<LangId.Count();i++)
            {
                int TheLangId = LangId[i];
                CategoryLang OldCategory = db.CategoryLangs.FirstOrDefault(f => f.CategoryId == CategoryId && f.LangId == TheLangId);
                OldCategory.Name = Name[i];
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int CategoryId)
        {
            var list = db.CategoryLangs.Where(f => f.CategoryId == CategoryId).ToList();
            for(int i = 0; i < list.Count(); i++)
            {
                list[i].Status = false;
            }
            db.SaveChanges();
            return RedirectToAction("index");
        }
    }
}