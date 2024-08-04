using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Resturent.Models
{
    public class TableReservationMV
    {
        public int TableReservationID { get; set; }
        public string BookingUserName { get; set; }
        public string FullName { get; set; }
        public string EmailAddress { get; set; }
        public string MobileNo { get; set; }
        public System.DateTime ReservationRequestDate { get; set; }
        public System.DateTime ReservationDateTime { get; set; }
        public int NoOfPersons { get; set; }
        public string ProcessBy_User { get; set; }
        public string ReservationStatus { get; set; }
        public string Description { get; set; }
    }
}