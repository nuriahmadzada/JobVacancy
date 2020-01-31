using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Vacancy.Models;
using Vacancy.Areas.Manage.Models;
using System.Net.Mail;
using System.Net;
using Vacancy.Areas.Helpers;

namespace Vacancy.Areas.Manage.Controllers
{
    [AuthLogin]
    public class VacanciesController : Controller
    {
        VacancyEntities db = new VacancyEntities();
        public ActionResult Index()
        {
            List<JobLang> jobLangs = db.JobLangs.Where(w => w.Status == true && w.LangId == 1).ToList();
            return View(jobLangs);
        }

        [HttpGet]
        public ActionResult Create()
        {
            ViewModelVacancyCreate list = new ViewModelVacancyCreate();
            list.Locations = db.Locations.Where(s => s.Status == true).ToList();
            list.JobTypeLangs = db.JobTypeLangs.Where(s => s.Status == true && s.LangId == 1).ToList();
            list.Experiences = db.Experiences.Where(s => s.Status == true).ToList();
            list.CategoryLangs = db.CategoryLangs.Where(s => s.Status == true && s.LangId == 1).ToList();
            list.Companies = db.Companies.Where(s => s.Status == true).ToList();
            ViewBag.Langs = db.Languages.ToList();
            return View(list);
        }
        [HttpPost]
        public ActionResult Create(int[] LangId, Job job, string[] Title, string[] Description, HttpPostedFileBase Photo)
        {
            if (Photo != null)
            {
                string filename = DateTime.Now.ToString("yyyyMMddHHmmss") + Photo.FileName.Replace(" ", "_");
                string path = System.IO.Path.Combine(Server.MapPath("~/Uploads"), filename);
                Photo.SaveAs(path);
                job.Photo = filename;

            }
            job.PublishDate = DateTime.Now;
            job.Code = 1;
            job.Status = true;
            db.Jobs.Add(job);
            db.SaveChanges();
            for (int i = 0; i < LangId.Count(); i++)
            {
                JobLang newJobLang = new JobLang();
                newJobLang.LangId = LangId[i];
                newJobLang.Status = true;
                newJobLang.Title = Title[i];
                newJobLang.Description = Description[i];
                newJobLang.JobId = job.Id;
                db.JobLangs.Add(newJobLang);

            }
            db.SaveChanges();
            List<string> subsribers = db.Subscribers.Select(s => s.Email).ToList();
            foreach (string s in subsribers)
            {
                SendEmail(s, "polypackaze@gmail.com", "Yeni Vakansiya", "TEST");
            }
            return RedirectToAction("Index");
        }

        public void SendEmail(string To, string From, string Subject, string Body, string Host = "smtp.gmail.com", string Password = "polypack12345", int Port = 587)
        {
            try
            {
                SmtpClient client = new SmtpClient
                {
                    Port = Convert.ToInt32(Port),
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Host = Host,
                    EnableSsl = true,
                    Credentials = new NetworkCredential(From, Password)
                };

                MailMessage message = new MailMessage
                {
                    From = new MailAddress(From),
                    Subject = Subject,
                    Body = Body
                };

                string[] receivers = To.Split(',');

                foreach (var receiver in receivers)
                    message.To.Add(receiver);

                client.Send(message);
            }
            catch { }
        }



        [HttpGet]
        public ActionResult Edit(int JobId)
        {
            ViewModelVacancyCreate list = new ViewModelVacancyCreate();
            list.Locations = db.Locations.Where(s => s.Status == true).ToList();
            list.JobTypeLangs = db.JobTypeLangs.Where(s => s.Status == true && s.LangId == 1).ToList();
            list.Experiences = db.Experiences.Where(s => s.Status == true).ToList();
            list.CategoryLangs = db.CategoryLangs.Where(s => s.Status == true && s.LangId == 1).ToList();
            list.Companies = db.Companies.Where(s => s.Status == true).ToList();
            list.JobLangs = db.JobLangs.Where(w => w.JobId == JobId).ToList();
            list.Job = db.Jobs.Where(w => w.Id == JobId).FirstOrDefault();
            return View(list);
        }

        [HttpPost]
        public ActionResult Edit(int JobId, int[] LangId, Job job, string[] Title, string[] Description, HttpPostedFileBase Photo, string OldPicture)
        {
            Job TheJob = db.Jobs.FirstOrDefault(f => f.Id == JobId);
            if (TheJob != null)
            {
                if (Photo != null)
                {
                    string filePath = Server.MapPath("~/Uploads/" + OldPicture);
                    if (System.IO.File.Exists(filePath))
                    {
                        System.IO.File.Delete(filePath);
                    }

                    string filename = DateTime.Now.ToString("yyyyMMddHHmmss") + Photo.FileName.Replace(" ", "_");
                    string path = System.IO.Path.Combine(Server.MapPath("~/Uploads"), filename);
                    Photo.SaveAs(path);
                    TheJob.Photo = filename;
                }
                TheJob.PublishDate = DateTime.Now;
                TheJob.Code = 1;
                TheJob.Location = job.Location;
                TheJob.JobTypeId = job.JobTypeId;
                TheJob.CategoryId = job.CategoryId;
                TheJob.CompanyId = job.CompanyId;
                TheJob.JobTypeId = job.JobTypeId;
                TheJob.Salary = job.Salary;
                TheJob.ExperienceId = job.ExperienceId;
                TheJob.Deadline = job.Deadline;
                TheJob.Status = true;
                db.SaveChanges();
            }


            for (int i = 0; i < LangId.Count(); i++)
            {
                int TheLangId = LangId[i];
                JobLang OldJob = db.JobLangs.FirstOrDefault(s => s.LangId == TheLangId);
                OldJob.Title = Title[i];
                OldJob.Description = Description[i];
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        public ActionResult Details(int JobId)
        {
            List<JobLang> jobLangs = db.JobLangs.Where(w => w.Status == true && w.JobId == JobId).ToList();
            return View(jobLangs);
        }

        public ActionResult Delete(int JobId)
        {
            var myList = db.JobLangs.Where(w => w.Status == true && w.JobId == JobId).ToList();
            for (int i = 0; i < myList.Count(); i++)
            {
                myList[i].Status = false;
            }
            db.SaveChanges();
            return RedirectToAction("index");
        }
    }
}