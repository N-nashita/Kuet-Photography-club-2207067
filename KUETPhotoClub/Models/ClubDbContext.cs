using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace KUETPhotoClub.Models
{
    public class ClubDbContext : DbContext
    {
        public ClubDbContext() : base("DefaultConnection") { }
        public DbSet<Member> Members { get; set; }
        public DbSet<GalleryPhoto> GalleryPhotos { get; set; }
    }
}