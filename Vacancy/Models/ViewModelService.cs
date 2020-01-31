using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Vacancy.Models;

namespace Vacancy.Models
{
    public class ViewModelService
    {
        public List<ServiceElement> serviceElements { get; set; }

        public Service service { get; set; }

        public List<LinkElement> linkElements { get; set; }

        public Link link { get; set; }
    }
}