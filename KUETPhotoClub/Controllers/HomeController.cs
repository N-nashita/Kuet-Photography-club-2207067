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
        private DatabaseHelper db = new DatabaseHelper();

        public ActionResult Index()
        {
            ViewBag.Members = db.GetAllMembers();
            ViewBag.Photos = db.GetAllPhotos();
            ViewBag.Activities = db.GetAllActivities();
            return View();
        }
    }
}