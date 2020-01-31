//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Vacancy.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Job
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Job()
        {
            this.JobLangs = new HashSet<JobLang>();
        }
    
        public int Id { get; set; }
        public int CategoryId { get; set; }
        public int CompanyId { get; set; }
        public int JobTypeId { get; set; }
        public int ExperienceId { get; set; }
        public int Location { get; set; }
        public string Photo { get; set; }
        public Nullable<decimal> Salary { get; set; }
        public System.DateTime Deadline { get; set; }
        public System.DateTime PublishDate { get; set; }
        public int Code { get; set; }
        public bool Status { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual Company Company { get; set; }
        public virtual Experience Experience { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<JobLang> JobLangs { get; set; }
        public virtual JobType JobType { get; set; }
        public virtual Location Location1 { get; set; }
    }
}
