using Dblayer;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Resturent.Models
{
    public class CRU_TableReservationMV
    {

        ResturentDbEntities db = new ResturentDbEntities();
        public CRU_TableReservationMV() { }
        public CRU_TableReservationMV(int usertypeid, int userid, int id = 0)
        {
            GetReservationList(usertypeid, userid);
            if (userid > 0)
            {
                var user = db.UserTables.Find(userid);
                FullName = user.FirstName + " " + user.LastName;
                EmailAddress = user.EmailAddress;
                MobileNo = user.ContactNo;
            }
            ReservationDate = null;
            ReservationTime = null;
            var edit = db.TableReservationTables.Find(id);
            if (edit != null)
            {
                TableReservationID = edit.TableReservationID;
                FullName = edit.FullName;
                EmailAddress = edit.EmailAddress;
                MobileNo = edit.MobileNo;
                ReservationDate = edit.ReservationDateTime.Date;
                ReservationTime = edit.ReservationDateTime.ToString("hh:mm:ss tt");
                NoOfPersons = edit.NoOfPersons;
                ReservationStatusID = edit.ReservationStatusID;
                Description = edit.Description;
            }
            else
            {
                TableReservationID = 0;
                FullName = string.Empty;
                EmailAddress = string.Empty;
                MobileNo = string.Empty;
                ReservationDate = null;
                ReservationTime = string.Empty;
                NoOfPersons = null;
                ReservationStatusID = 0;
                Description = string.Empty;
            }
        }
        public int TableReservationID { get; set; }
        [DataType(DataType.Text)]
        public string FullName { get; set; }
        [DataType(DataType.EmailAddress)]
        public string EmailAddress { get; set; }
        public string MobileNo { get; set; }
        [DataType(DataType.Date)]
        public System.DateTime ReservationRequestDate { get; set; }
        public System.DateTime? ReservationDate { get; set; }
        public string ReservationTime { get; set; }
        public int? NoOfPersons { get; set; }
        public int ReservationStatusID { get; set; }
        public string Description { get; set; }

        public List<TableReservationMV> ReservationList { get; set; }
        public void GetReservationList(int usertypeid, int userid)
        {
            ReservationList = new List<TableReservationMV>();
            if (usertypeid == 4) // Customer
            {
                var list = db.TableReservationTables.Where(u => u.Reservation_UserID == userid).ToList();
                if (list.Count > 0)
                {
                    list.OrderByDescending(o => o.TableReservationID).ToList();
                }
                foreach (var item in list)
                {
                    var bookingusername = item.UserTable.UserName;

                    var processbyuser = item.ProcessBy_UserID > 0 ?
                        db.UserTables.Find(item.ProcessBy_UserID).UserName :
                        string.Empty;

                    var bookingstatus = item.ReservationStatusTable.ReservationStatus;
                    ReservationList.Add(new TableReservationMV
                    {
                        TableReservationID = item.TableReservationID,
                        BookingUserName = bookingusername,
                        FullName = item.FullName,
                        EmailAddress = item.EmailAddress,
                        MobileNo = item.MobileNo,
                        ReservationRequestDate = item.ReservationRequestDate,
                        ReservationDateTime = item.ReservationDateTime,
                        NoOfPersons = item.NoOfPersons,
                        ProcessBy_User = processbyuser,
                        ReservationStatus = bookingstatus,
                        Description = item.Description
                    });
                }
            }
            else if (usertypeid == 1 || usertypeid == 2 || usertypeid == 3)
            {
                var list = db.TableReservationTables.ToList();
                if (list.Count > 0)
                {
                    list.OrderByDescending(o => o.TableReservationID).ToList();
                }
                foreach (var item in list)
                {
                    var bookingusername = item.UserTable.UserName;

                    var processbyuser = item.ProcessBy_UserID > 0 ?
                        db.UserTables.Find(item.ProcessBy_UserID).UserName :
                        string.Empty;

                    var bookingstatus = item.ReservationStatusTable.ReservationStatus;
                    ReservationList.Add(new TableReservationMV
                    {
                        TableReservationID = item.TableReservationID,
                        BookingUserName = bookingusername,
                        FullName = item.FullName,
                        EmailAddress = item.EmailAddress,
                        MobileNo = item.MobileNo,
                        ReservationRequestDate = item.ReservationRequestDate,
                        ReservationDateTime = item.ReservationDateTime,
                        NoOfPersons = item.NoOfPersons,
                        ProcessBy_User = processbyuser,
                        ReservationStatus = bookingstatus,
                        Description = item.Description
                    });
                }
            }
        }


    }
}