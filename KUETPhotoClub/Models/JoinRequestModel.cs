using System;

namespace KUETPhotoClub.Models
{
    public class JoinRequestModel
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Department { get; set; }
        public string Reason { get; set; }
        public DateTime RequestDate { get; set; }
        public string Status { get; set; }
    }
}
