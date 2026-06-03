using KUETPhotoClub.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KUETPhotoClub.Controllers
{
    public class HomeController : Controller
    {
        private ClubDbContext db = new ClubDbContext();

        public ActionResult Index()
        {
            var members = db.Members.ToList();
            var photos = db.GalleryPhotos.ToList();
            ViewBag.Members = members;
            ViewBag.Photos = photos;
            return View();
        }
    }
}