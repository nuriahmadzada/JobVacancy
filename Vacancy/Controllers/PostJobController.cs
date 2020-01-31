using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Vacancy.Controllers
{
    public class PostJobController : BaseController
    {
        // GET: PostJob
        public ActionResult Index()
        {
            return View();
        }
    }
}