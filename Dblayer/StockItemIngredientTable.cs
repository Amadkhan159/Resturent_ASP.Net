//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Dblayer
{
    using System;
    using System.Collections.Generic;
    
    public partial class StockItemIngredientTable
    {
        public int StockItemIngredientID { get; set; }
        public int StockItemID { get; set; }
        public string StockItemIngredientPhotoPath { get; set; }
        public string StockItemIngredientTitle { get; set; }
        public int CreatedBy_UserID { get; set; }
    
        public virtual StockItemTable StockItemTable { get; set; }
    }
}