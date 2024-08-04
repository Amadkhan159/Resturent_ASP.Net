using Dblayer;
using Resturent.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Resturent.Controllers
{
    public class TableReservationController : Controller
    {

        ResturentDbEntities Db = new ResturentDbEntities();
        // GET: TableReservation


        public ActionResult BookingTables(int id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Index", "Home");
            }
            int userid = 0;
            int usertypeid = 0;
            int.TryParse(Convert.ToString(Session["UserID"]), out userid);
            int.TryParse(Convert.ToString(Session["UserTypeID"]), out usertypeid);
            var list = new CRU_TableReservationMV(usertypeid, userid, id);
            ViewBag.ReservationStatusID = new SelectList(Db.ReservationStatusTables.ToList(), "ReservationStatusID", "ReservationStatus", "0");
            return View(list);
        }

        [HttpPost]
        public ActionResult BookingTables(CRU_TableReservationMV cRU_TableReservationMV)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Index", "Home");
            }
            int userid = 0;
            int.TryParse(Convert.ToString(Session["UserID"]), out userid);
            if (ModelState.IsValid)
            {
                var date = Convert.ToDateTime(cRU_TableReservationMV.ReservationDate).Date.ToString("yyyy/MM/dd");
                var time = cRU_TableReservationMV.ReservationTime;
                var reservationdatetime = Convert.ToDateTime(date + " " + time);
                var reservation = Db.TableReservationTables.Find(cRU_TableReservationMV.TableReservationID);
                reservation.ProcessBy_UserID = userid;
                reservation.ReservationStatusID = cRU_TableReservationMV.ReservationStatusID;
                reservation.Description = cRU_TableReservationMV.Description;
                Db.Entry(reservation).State = System.Data.Entity.EntityState.Modified;
                Db.SaveChanges();
                return RedirectToAction("BookingTables", new { id = 0 });
            }
            return View(cRU_TableReservationMV);
        }


        public ActionResult CancelBooking(int bookingtableid)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Index", "Home");
            }
            int userid = 0;
            int.TryParse(Convert.ToString(Session["UserID"]), out userid);
            if (ModelState.IsValid)
            {
                var reservation = Db.TableReservationTables.Find(bookingtableid);
                reservation.Description = "Canceled By User";
                reservation.ReservationStatusID = 4;
                reservation.ProcessBy_UserID = userid;
                Db.Entry(reservation).State = System.Data.Entity.EntityState.Modified;
                Db.SaveChanges();
                return RedirectToAction("BookingTables", new { id = 0 });
            }
            return View();
        }



        [HttpPost]
        public ActionResult BookTable(CRU_TableReservationMV cRU_TableReservationMV)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Index", "Home");
            }
            int userid = 0;
            int.TryParse(Convert.ToString(Session["UserID"]), out userid);
            if (ModelState.IsValid)
            {
                var date = Convert.ToDateTime(cRU_TableReservationMV.ReservationDate).Date.ToString("yyyy/MM/dd");
                var time = cRU_TableReservationMV.ReservationTime;
                var reservationdatetime = Convert.ToDateTime(date + " " + time);
                var reservation = new TableReservationTable();
                reservation.Reservation_UserID = userid;
                reservation.FullName = cRU_TableReservationMV.FullName;
                reservation.EmailAddress = cRU_TableReservationMV.EmailAddress;
                reservation.MobileNo = cRU_TableReservationMV.MobileNo;
                reservation.ReservationRequestDate = DateTime.Now;
                reservation.ReservationDateTime = reservationdatetime;
                reservation.NoOfPersons = (int)cRU_TableReservationMV.NoOfPersons;
                reservation.ProcessBy_UserID = 3;
                reservation.ReservationStatusID = 1;
                reservation.Description = string.Empty;
                Db.TableReservationTables.Add(reservation);
                Db.SaveChanges();
                return RedirectToAction("Index", "Home");
            }
            return View(cRU_TableReservationMV);
        }
    }
}
    
