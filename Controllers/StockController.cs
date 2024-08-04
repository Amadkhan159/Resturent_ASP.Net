using Dblayer;
using Resturent.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Resturent.Controllers
{
    public class StockController : Controller
    {

        ResturentDbEntities db = new ResturentDbEntities();
        // GET: Stock
        public ActionResult StockItemCategory(int? id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Index", "Home");
            }

            var stockcategories = new CRU_StockItemCategoryMV(id);
            ViewBag.VisibleStatusID = new SelectList(db.VisibleStatusTables.ToList(), "VisibleStatusID", "VisibleStatus", stockcategories.VisibleStatusID);
            return View(stockcategories);
        }

        [HttpPost]
        public ActionResult StockItemCategory(CRU_StockItemCategoryMV stockcategory)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Index", "Home");
            }

            int userid = 0;
            int.TryParse(Convert.ToString(Session["UserID"]), out userid);

            stockcategory.CreatedBy_UserID = userid;

            if (ModelState.IsValid)
            {
                if (stockcategory.StockItemCategoryID == 0)
                {
                    var checkexist= db.StockItemCategoryTables.Where(s=> s.StockItemCategory.Trim().ToUpper()== stockcategory.StockItemCategory.Trim().ToUpper()).FirstOrDefault();

                    if (checkexist == null) {
                        var newcategory = new StockItemCategoryTable();
                        newcategory.StockItemCategory= stockcategory.StockItemCategory;
                        newcategory.VisibleStatusID= stockcategory.VisibleStatusID;
                        newcategory.CreatedBy_UserID= userid;
                        db.StockItemCategoryTables.Add(newcategory);

                        db.SaveChanges();

                        return RedirectToAction("StockItemCategory" , new { id=0});
                    }
                    else
                    {
                        ModelState.AddModelError("StockItemCategory", "Already Registerd");

                    }

                    
                }

                else
                {
                    var checkexist = db.StockItemCategoryTables.Where(s => s.StockItemCategory.Trim().ToUpper() == stockcategory.StockItemCategory.Trim().ToUpper() && s.StockItemCategoryID != stockcategory.StockItemCategoryID  ).FirstOrDefault();

                    if (checkexist == null)
                    {
                        var editcategory = db.StockItemCategoryTables.Find(stockcategory.StockItemCategoryID);
                        editcategory.StockItemCategory = stockcategory.StockItemCategory;
                        editcategory.VisibleStatusID = stockcategory.VisibleStatusID;
                        editcategory.CreatedBy_UserID = userid;
                        db.Entry(editcategory).State=System.Data.Entity.EntityState.Modified;

                        db.SaveChanges();

                        return RedirectToAction("StockItemCategory", new { id = 0 });
                    }
                    else
                    {
                        ModelState.AddModelError("StockItemCategory", "Already Registerd");

                    }
                }

            }

            ViewBag.VisibleStatusID = new SelectList(db.VisibleStatusTables.ToList(), "VisibleStatusID", "VisibleStatus", stockcategory.VisibleStatusID);


            return View(stockcategory);
        }




        public ActionResult StockItem(int? id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Index", "Home");
            }

            var stockitem = new CRU_StockItemMV(id);
            ViewBag.StockItemCategoryID = new SelectList(db.StockItemCategoryTables.ToList(), "StockItemCategoryID", "StockItemCategory", stockitem.StockItemCategoryID);

            ViewBag.VisibleStatusID = new SelectList(db.VisibleStatusTables.ToList(), "VisibleStatusID", "VisibleStatus", stockitem.VisibleStatusID);

           
            return View(stockitem);
        }

        [HttpPost]
        public ActionResult StockItem(CRU_StockItemMV cru_StockItemMV)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Index", "Home");
            }

            int userid = 0;
            int.TryParse(Convert.ToString(Session["UserID"]), out userid);

            cru_StockItemMV.CreatedBy_UserID = userid;

            if (ModelState.IsValid) {

                if (cru_StockItemMV.StockItemID == 0)
                {
                    var checkexist = db.StockItemTables.Where(
                        s => s.StockItemTitle.Trim().ToUpper() == cru_StockItemMV.StockItemTitle.Trim().ToUpper()
                        && s.StockItemCategoryID == cru_StockItemMV.StockItemCategoryID).FirstOrDefault();

                    if (checkexist == null) {
                        var newitem = new StockItemTable();

                        
                   newitem.StockItemCategoryID = cru_StockItemMV.StockItemCategoryID;
                   newitem.ItemPhotoPath = cru_StockItemMV.ItemPhotoPath;
                   newitem.StockItemTitle = cru_StockItemMV.StockItemTitle;
                   newitem.ItemSize = cru_StockItemMV.ItemSize;
                   newitem.UnitPrice = cru_StockItemMV.UnitPrice;
                   newitem.VisibleStatusID = cru_StockItemMV.VisibleStatusID;
                   newitem.CreatedBy_UserID = cru_StockItemMV.CreatedBy_UserID;

                    db.StockItemTables.Add(newitem);
                    db.SaveChanges();

                        if (cru_StockItemMV.PhotoPath != null)
                        {
                            var folder = "~/Content/StockItemPhoto";
                            var photoname = string.Format("{0}.jpg", newitem.StockItemID);
                            var response = HelperClass.FileUpload.UploadPhoto(cru_StockItemMV.PhotoPath, folder, photoname);
                            if (response)
                            {
                                var photo = string.Format("{0}/{1}", folder, photoname);
                                newitem.ItemPhotoPath= photo;


                                
                                db.Entry(newitem).State = System.Data.Entity.EntityState.Modified;
                                db.SaveChanges();
                            }
                        }
                        return RedirectToAction("StockItem", new { id = 0 });


                    }

                    else
                    {
                        ModelState.AddModelError("StockItemTitle", "Already Exist");
                    }
                }
                else {

                    // updation portion


                    var checkexist = db.StockItemTables.Where(
                        s => s.StockItemTitle.Trim().ToUpper() == cru_StockItemMV.StockItemTitle.Trim().ToUpper()
                        && s.StockItemCategoryID == cru_StockItemMV.StockItemCategoryID
                        && s.StockItemID!= cru_StockItemMV.StockItemID).FirstOrDefault();

                    if (checkexist == null)
                    {
                        var edititem = db.StockItemTables.Find(cru_StockItemMV.StockItemID);



                       edititem.StockItemCategoryID = cru_StockItemMV.StockItemCategoryID;
                       edititem.ItemPhotoPath = cru_StockItemMV.ItemPhotoPath;
                       edititem.StockItemTitle = cru_StockItemMV.StockItemTitle;
                       edititem.ItemSize = cru_StockItemMV.ItemSize;
                       edititem.UnitPrice = cru_StockItemMV.UnitPrice;
                       edititem.VisibleStatusID = cru_StockItemMV.VisibleStatusID;

                        db.Entry(edititem).State=System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();

                        if (cru_StockItemMV.PhotoPath != null)
                        {
                            var folder = "~/Content/StockItemPhoto";
                            var photoname = string.Format("{0}.jpg", edititem.StockItemID);
                            var response = HelperClass.FileUpload.UploadPhoto(cru_StockItemMV.PhotoPath, folder, photoname);
                            if (response)
                            {
                                var photo = string.Format("{0}/{1}", folder, photoname);
                                edititem.ItemPhotoPath = photo;



                                db.Entry(edititem).State = System.Data.Entity.EntityState.Modified;
                                db.SaveChanges();
                            }
                        }
                        return RedirectToAction("StockItem", new { id = 0 });


                    }

                    else
                    {
                        ModelState.AddModelError("StockItemTitle", "Already Exist");
                    }




                }
            
            }

            ViewBag.StockItemCategoryID = new SelectList(db.StockItemCategoryTables.ToList(), "StockItemCategoryID", "StockItemCategory", cru_StockItemMV.StockItemCategoryID);

            ViewBag.VisibleStatusID = new SelectList(db.VisibleStatusTables.ToList(), "VisibleStatusID", "VisibleStatus", cru_StockItemMV.VisibleStatusID);


            return View(cru_StockItemMV);
        }



        public ActionResult StockMenu(int? id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Index", "Home");
            }
            var stockmenuitem = new CRU_StockMenuItemMV(id);
            ViewBag.StockMenuCategoryID = new SelectList(db.StockMenuCategoryTables.ToList(), "StockMenuCategoryID", "StockMenuCategory", stockmenuitem.StockMenuCategoryID);
            ViewBag.StockItemID = new SelectList(db.StockItemTables.ToList(), "StockItemID", "StockItemTitle", stockmenuitem.StockItemID);
            ViewBag.VisibleStatusID = new SelectList(db.VisibleStatusTables.ToList(), "VisibleStatusID", "VisibleStatus", stockmenuitem.VisibleStatusID);
            return View(stockmenuitem);
        }

        [HttpPost]
        public ActionResult StockMenu(CRU_StockMenuItemMV cru_StockMenuItemMV)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Index", "Home");
            }
            int userid = 0;
            int.TryParse(Convert.ToString(Session["UserID"]), out userid);
            if (ModelState.IsValid)
            {
                if (cru_StockMenuItemMV.StockMenuItemID == 0)
                {
                    var checkexist = db.StockMenuItemTables.Where(
                        s => s.StockMenuCategoryID == cru_StockMenuItemMV.StockMenuCategoryID
                        && s.StockItemID == cru_StockMenuItemMV.StockItemID).FirstOrDefault();
                    if (checkexist == null)
                    {
                        var newitem = new StockMenuItemTable();
                        newitem.StockMenuCategoryID = cru_StockMenuItemMV.StockMenuCategoryID;
                        newitem.StockItemID = cru_StockMenuItemMV.StockItemID;
                        newitem.VisibleStatusID = cru_StockMenuItemMV.VisibleStatusID;
                        newitem.CreatedBy_UserID = userid;
                        db.StockMenuItemTables.Add(newitem);
                        db.SaveChanges();
                        return RedirectToAction("StockMenu", new { id = 0 });
                    }
                    else
                    {
                        ModelState.AddModelError("StockItemID", "Already Exist!");
                    }
                }
                else
                {
                    var checkexist = db.StockMenuItemTables.Where(
                        s => s.StockMenuCategoryID == cru_StockMenuItemMV.StockMenuCategoryID
                        && s.StockItemID == cru_StockMenuItemMV.StockItemID
                        && s.StockMenuItemID != cru_StockMenuItemMV.StockMenuItemID).FirstOrDefault();
                    if (checkexist == null)
                    {
                        var edititem = db.StockMenuItemTables.Find(cru_StockMenuItemMV.StockMenuItemID);
                        edititem.StockMenuCategoryID = cru_StockMenuItemMV.StockMenuCategoryID;
                        edititem.StockItemID = cru_StockMenuItemMV.StockItemID;
                        edititem.VisibleStatusID = cru_StockMenuItemMV.VisibleStatusID;
                        edititem.CreatedBy_UserID = userid;
                        db.Entry(edititem).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                        return RedirectToAction("StockMenu", new { id = 0 });
                    }
                    else
                    {
                        ModelState.AddModelError("StockItemID", "Already Exist!");
                    }
                }
            }
            ViewBag.StockMenuCategoryID = new SelectList(db.StockMenuCategoryTables.ToList(), "StockMenuCategoryID", "StockMenuCategory", cru_StockMenuItemMV.StockMenuCategoryID);
            ViewBag.StockItemID = new SelectList(db.StockItemTables.ToList(), "StockItemID", "StockItemTitle", cru_StockMenuItemMV.StockItemID);
            ViewBag.VisibleStatusID = new SelectList(db.VisibleStatusTables.ToList(), "VisibleStatusID", "VisibleStatus", cru_StockMenuItemMV.VisibleStatusID);
            return View(cru_StockMenuItemMV);
        }




    }
}