using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KUETPhotoClub.Models
{
    public class Member
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Role { get; set; }
        public string PhotoPath { get; set; }
    }
}