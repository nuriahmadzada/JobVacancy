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
    
    public partial class Link
    {
        public int Id { get; set; }
        public int LangId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public bool Status { get; set; }
    
        public virtual Language Language { get; set; }
    }
}
