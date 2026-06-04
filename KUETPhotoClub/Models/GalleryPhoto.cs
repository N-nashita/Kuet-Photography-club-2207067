using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KUETPhotoClub.Models
{
    public class GalleryPhoto
    {
        public int Id { get; set; }
        public string ImagePath { get; set; }
        public string Caption { get; set; } = string.Empty;
    }
}