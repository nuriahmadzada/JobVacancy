using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Vacancy.Models;
using PagedList;
using PagedList.Mvc;

namespace Vacancy.Models
{
    public class ViewmodelHome
    {
        public List<JobLang> Jobs { get; set; }

        public List<Job> JobDeadlines { get; set; }

        public List<Location> Locations { get; set; }

        public List<CategoryLang> CategoryLangs { get; set; }

        public List<Company> Companies { get; set; }

        public List<Experience> Experiences { get; set; }

        public List<JobTypeLang> JobTypeLangs { get; set; }

    }
}