using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Vacancy.Models;

namespace Vacancy.Areas.Manage.Models
{
    public class ViewModelVacancyEdit
    {
        public List<JobLang> jobLangs { get; set; }

        public Job job { get; set; }
    }
}