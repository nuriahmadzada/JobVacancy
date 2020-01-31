using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using Vacancy.Models;

namespace Vacancy.Controllers
{
    public class ContactUsController : BaseController
    {
        VacancyEntities db = new VacancyEntities();
        public ActionResult Index()
        {
            string CurrentLang = CurrentLanguageCode.ToString().ToUpper();
            ViewBag.Lang = CurrentLang;
            Contact contact = db.Contacts.FirstOrDefault();
            return View(contact);
        }

        [HttpPost]
        public ActionResult Message(Message message)
        {
            
                db.Messages.Add(message);
                db.SaveChanges();

            return RedirectToAction("index");
        }


        [HttpPost]
        public ActionResult SendEmail(Email mail, Subscriber subscriber)
        {
                var message = new MailMessage();
                message.To.Add(new MailAddress("nuri.akhmadzade@gmail.com"));  // replace with valid value 
                message.From = new MailAddress("polypackaze@gmail.com");  // replace with valid value
                message.Subject = mail.Subject;
                message.IsBodyHtml = true;

                using (var smtp = new SmtpClient())
                {
                    var credential = new NetworkCredential
                    {
                        UserName = "polypackaze@gmail.com",  // replace with valid value
                        Password = "pEBhxpN5nt"  // replace with valid value
                    };
                    smtp.Credentials = credential;
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    return RedirectToAction("Index");
                }
        }
    }
}