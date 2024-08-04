using Dblayer;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Resturent.Models
{
    public class DashboardMV
    {

        ResturentDbEntities db = new ResturentDbEntities();
        public DashboardMV()
        {
            ProfileMV = new User_ProfileMV();
        }
        public DashboardMV(int? id)
        {
            ProfileMV = new User_ProfileMV();
            var user = db.UserTables.Find(id);
            ProfileMV.UserID = user.UserID;
            ProfileMV.UserType = user.UserTypeTable.UserType;
            ProfileMV.UserName = user.UserName;
            ProfileMV.Password = user.Password;
            ProfileMV.FirstName = user.FirstName;
            ProfileMV.LastName = user.LastName;
            ProfileMV.FullName = string.Format("{0} {1}", user.FirstName, user.LastName);
            ProfileMV.ContactNo = user.ContactNo;
            ProfileMV.GenderTitle = user.GenderTable.GenderTitle;
            ProfileMV.EmailAddress = user.EmailAddress;
            ProfileMV.RegisterationDate = user.RegistrationDate;
            var userpersonaladdress = db.UserAddressTables.Where(u => u.UserID == user.UserID).FirstOrDefault();

            ProfileMV.FullAddress = userpersonaladdress != null ? userpersonaladdress.FullAddress : string.Empty;
            ProfileMV.UserStatus = user.UserStatusTable.UserStatus;
            ProfileMV.UserStatusID = user.UserStatusID;
            ProfileMV.UserStatusChangeDate = user.UserStatusChangeDate;
            if (user.UserDetailTable != null)
            {
                ProfileMV.UserDetailProvideDate = user.UserDetailTable.UserDetailProviderDate;
                ProfileMV.PhotoPath = user.UserDetailTable.PhotoPath;
                ProfileMV.ID_Number = user.UserDetailTable.ID_Number;
                ProfileMV.EducationLevel = user.UserDetailTable.EducationLevel;
                ProfileMV.EducationLastDegreePhotoPath = user.UserDetailTable.EducationLastDegreeScanPhotoPath;
                ProfileMV.ExperenceLastPhotoPath = user.UserDetailTable.LastExperienceScanPhotoPath;
            }
        }
        public virtual User_ProfileMV ProfileMV { get; set; }

        [DataType(DataType.Password)]
        public string OldPassword { get; set; }

        [DataType(DataType.Password)]
        public string NewPassword { get; set; }

        [DataType(DataType.Password)]
        public string ConfirmPassword { get; set; }

    }
}