using System.IO;
using System.Web;
using System.Web.Mvc;
using KUETPhotoClub.Models;

namespace KUETPhotoClub.Controllers
{
    public class AdminController : Controller
    {
        private DatabaseHelper db = new DatabaseHelper();

        public ActionResult Index()
        {
            return View();
        }

        // ---- MEMBERS ----
        public ActionResult Members()
        {
            var members = db.GetAllMembers();
            return View(members);
        }

        [HttpPost]
        public ActionResult AddMember(string name, string role, HttpPostedFileBase photo)
        {
            if (photo != null && photo.ContentLength > 0)
            {
                var fileName = Path.GetFileName(photo.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/photos/members/"), fileName);
                Directory.CreateDirectory(Server.MapPath("~/Content/photos/members/"));
                photo.SaveAs(path);

                db.AddMember(new Member
                {
                    Name = name,
                    Role = role,
                    PhotoPath = "~/Content/photos/members/" + fileName
                });
            }
            return RedirectToAction("Members");
        }

        [HttpPost]
        public ActionResult DeleteMember(int id)
        {
            db.DeleteMember(id);
            return RedirectToAction("Members");
        }

        // ---- GALLERY ----
        public ActionResult Gallery()
        {
            var photos = db.GetAllPhotos();
            return View(photos);
        }

        [HttpPost]
        public ActionResult AddPhoto(string caption, HttpPostedFileBase photo)
        {
            if (photo != null && photo.ContentLength > 0)
            {
                var fileName = Path.GetFileName(photo.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/photos/gallery/"), fileName);
                Directory.CreateDirectory(Server.MapPath("~/Content/photos/gallery/"));
                photo.SaveAs(path);

                db.AddPhoto(new GalleryPhoto
                {
                    Caption = caption,
                    ImagePath = "~/Content/photos/gallery/" + fileName
                });
            }
            return RedirectToAction("Gallery");
        }

        [HttpPost]
        public ActionResult DeletePhoto(int id)
        {
            db.DeletePhoto(id);
            return RedirectToAction("Gallery");
        }

        // ---- ACTIVITIES ----
        public ActionResult Activities()
        {
            var activities = db.GetAllActivities();
            return View(activities);
        }

        [HttpPost]
        public ActionResult AddActivity(string title, string description, HttpPostedFileBase photo)
        {
            if (photo != null && photo.ContentLength > 0)
            {
                var fileName = Path.GetFileName(photo.FileName);
                var path = Path.Combine(Server.MapPath("~/Content/photos/activities/"), fileName);
                Directory.CreateDirectory(Server.MapPath("~/Content/photos/activities/"));
                photo.SaveAs(path);

                db.AddActivity(new Activity
                {
                    Title = title,
                    Description = description,
                    PhotoPath = "~/Content/photos/activities/" + fileName
                });
            }
            return RedirectToAction("Activities");
        }

        [HttpPost]
        public ActionResult DeleteActivity(int id)
        {
            db.DeleteActivity(id);
            return RedirectToAction("Activities");
        }
    }
}