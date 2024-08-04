using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Resturent.Models
{
    public class VisibleStatusMV
    {

        [Display(Name = "#Unique No")]
        public int VisibleStatusID { get; set; }
        [Display(Name = "Visible Status")]
        public string VisibleStatus { get; set; }
    }
}