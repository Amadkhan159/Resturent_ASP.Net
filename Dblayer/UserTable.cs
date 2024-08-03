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
    
    public partial class UserTable
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public UserTable()
        {
            this.TableReservationTables = new HashSet<TableReservationTable>();
            this.TableReservationTables1 = new HashSet<TableReservationTable>();
            this.UserAddressTables = new HashSet<UserAddressTable>();
        }
    
        public int UserID { get; set; }
        public int UserTypeID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ContactNo { get; set; }
        public string EmailAddress { get; set; }
        public System.DateTime RegistrationDate { get; set; }
        public int UserStatusID { get; set; }
        public System.DateTime UserStatusChangeDate { get; set; }
        public int GenderID { get; set; }
    
        public virtual GenderTable GenderTable { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TableReservationTable> TableReservationTables { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TableReservationTable> TableReservationTables1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserAddressTable> UserAddressTables { get; set; }
        public virtual UserDetailTable UserDetailTable { get; set; }
        public virtual UserStatusTable UserStatusTable { get; set; }
        public virtual UserTypeTable UserTypeTable { get; set; }
    }
}
