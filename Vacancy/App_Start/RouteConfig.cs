﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Vacancy
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

         

            routes.MapRoute(
            name: "Language",
            url: "{lang}/{controller}/{action}/{id}",
            defaults: new { controller = "Default", action = "Index", id = UrlParameter.Optional  },
            constraints: new { lang = @"az|en|ru" }

        );

            routes.MapRoute(
             name: "Default",
             url: "{controller}/{action}/{id}",
             defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional, lang = "az" },
             namespaces: new[] { "Vacancy.Controllers" }
         );
        }
    }
}
