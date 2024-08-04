﻿using Dblayer;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Resturent.Models
{
    public class CRU_StockItemMV
    {
        ResturentDbEntities db = new ResturentDbEntities();

       
        public CRU_StockItemMV()
        {
            GetCategory();
        }
        public CRU_StockItemMV(int? id)
        {
            GetCategory();

            var edit = db.StockItemTables.Find(id);
            if (edit != null)
            {
                StockItemID = edit.StockItemID;
                StockItemCategoryID = edit.StockItemCategoryID;
                ItemPhotoPath = edit.ItemPhotoPath;
                StockItemTitle = edit.StockItemTitle;
                ItemSize = edit.ItemSize;
                UnitPrice = edit.UnitPrice;
                VisibleStatusID = edit.VisibleStatusID;
                
            }
            else
            {
                StockItemID = 0;
                StockItemCategoryID = 0;
                ItemPhotoPath = string.Empty;
                StockItemTitle = string.Empty;
                ItemSize = string.Empty;
                UnitPrice = 0;
                
                VisibleStatusID = 0;
                //OrderTypeID = 0;
            }

        }
        public int StockItemID { get; set; }
        [Required(ErrorMessage = "Required*")]
        public int StockItemCategoryID { get; set; }

        public string ItemPhotoPath { get; set; }
        [Required(ErrorMessage = "Required*")]
        public string StockItemTitle { get; set; }
        [Required(ErrorMessage = "Required*")]
        public string ItemSize { get; set; }
        [Required(ErrorMessage = "Required*")]
        public double UnitPrice { get; set; }
      
        public int VisibleStatusID { get; set; }
        public int CreatedBy_UserID { get; set; }
        [Required(ErrorMessage = "Required*")]
        

        [NotMapped]
        [Display(Name = "Item Photo")]
        public HttpPostedFileBase PhotoPath { get; set; }

        public virtual List<StockCategoryMV> Categories { get; set; }

        public void GetCategory()
        {
            Categories = new List<StockCategoryMV>();
            foreach (var item in db.StockItemCategoryTables.ToList())
            {
                Categories.Add(new StockCategoryMV(item.StockItemCategoryID)
                {
                    StockCategory = item.StockItemCategory
                });
            }
        }
    }
}