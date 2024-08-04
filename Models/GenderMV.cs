using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Resturent.Models
{
    public class GenderMV
    {
        [Display(Name = "#Unique No")]
        public int GenderID { get; set; }

        [Display(Name = "Gender")]
        public string GenderTitle { get; set; }
    }
}