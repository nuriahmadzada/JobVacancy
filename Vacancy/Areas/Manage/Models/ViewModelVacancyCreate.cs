using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Vacancy.Models;

namespace Vacancy.Areas.Manage.Models
{
    public class ViewModelVacancyCreate
    {
        public List<Location> Locations { get; set; }

        public List<JobTypeLang> JobTypeLangs { get; set; }

        public List<Experience> Experiences { get; set; }

        public List<CategoryLang> CategoryLangs { get; set; }

        public List<Company> Companies { get; set; }

        public List<JobLang> JobLangs { get; set; }

        public Job Job { get; set; }
    }
}