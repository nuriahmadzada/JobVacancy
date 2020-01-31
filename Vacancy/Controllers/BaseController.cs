﻿using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Vacancy.Controllers
{
    public class BaseController : Controller
    {
        public string CurrentLanguageCode { get; set; }

        protected override void Initialize(RequestContext requestContext)
        {
            if (requestContext.RouteData.Values["lang"] != null && requestContext.RouteData.Values["lang"] as string != "null")
            {
                CurrentLanguageCode = (string)requestContext.RouteData.Values["lang"];
                if (CurrentLanguageCode != null)
                {
                    try
                    {
                        Thread.CurrentThread.CurrentCulture = Thread.CurrentThread.CurrentUICulture = new CultureInfo(CurrentLanguageCode);
                        //NumberFormatInfo nfi = new NumberFormatInfo { CurrencySymbol = "£" };
                        //Thread.CurrentThread.CurrentUICulture.NumberFormat = Thread.CurrentThread.CurrentCulture.NumberFormat = nfi;
                    }
                    catch (Exception)
                    {
                        throw new NotSupportedException($"Invalid language code '{CurrentLanguageCode}'.");
                    }
                }
            }
            ViewBag.Lang = CurrentLanguageCode == "" ? CurrentLanguageCode = Thread.CurrentThread.CurrentCulture.Name : CurrentLanguageCode;
            base.Initialize(requestContext);
        }

    }
}