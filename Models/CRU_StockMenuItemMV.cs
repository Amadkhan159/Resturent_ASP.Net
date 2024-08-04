using Dblayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Resturent.Models
{
    public class CRU_StockMenuItemMV
    {

        ResturentDbEntities db = new ResturentDbEntities();
        public CRU_StockMenuItemMV()
        {
            GetMenuCategories();
        }
        public CRU_StockMenuItemMV(int? id)
        {
            GetMenuCategories();
            var edit = db.StockMenuItemTables.Find(id);
            if (edit != null)
            {
                StockMenuItemID = edit.StockMenuItemID;
                StockMenuCategoryID = edit.StockMenuCategoryID;
                StockItemID = edit.StockItemID;
                VisibleStatusID = edit.VisibleStatusID;
            }
            else
            {
                StockMenuItemID = 0;
                StockMenuCategoryID = 0;
                StockItemID = 0;
                VisibleStatusID = 0;
            }
        }
        public int StockMenuItemID { get; set; }
        public int StockMenuCategoryID { get; set; }
        public int StockItemID { get; set; }
        public int VisibleStatusID { get; set; }
        public virtual List<MenuCategoryMV> Categories { get; set; }
        public void GetMenuCategories()
        {
            Categories = new List<MenuCategoryMV>();
            foreach (var item in db.StockMenuCategoryTables.ToList())
            {
                Categories.Add(new MenuCategoryMV(item.StockMenuCategoryID)
                {
                    MenuCategory = item.StockMenuCategory
                });
            }
        }
    }
}