using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Vacancy.Models;

namespace Vacancy.Models
{
    public class ViewModelJobDetail
    {
        public JobLang Vacancy { get; set; }

        public List<JobLang> Vacancies { get; set; }
    }
}