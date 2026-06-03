using KUETPhotoClub.Models;
using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

public class AdminController : Controller
{
    private ClubDbContext db = new ClubDbContext();

    // Admin Dashboard
    public ActionResult Index()
    {
        return View();
    }

    // ---- MEMBERS ----
    public ActionResult Members()
    {
        var members = db.Members.ToList();
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

            db.Members.Add(new Member
            {
                Name = name,
                Role = role,
                PhotoPath = "~/Content/photos/members/" + fileName
            });
            db.SaveChanges();
        }
        return RedirectToAction("Members");
    }

    [HttpPost]
    public ActionResult DeleteMember(int id)
    {
        var member = db.Members.Find(id);
        if (member != null)
        {
            db.Members.Remove(member);
            db.SaveChanges();
        }
        return RedirectToAction("Members");
    }

    // ---- GALLERY ----
    public ActionResult Gallery()
    {
        var photos = db.GalleryPhotos.ToList();
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

            db.GalleryPhotos.Add(new GalleryPhoto
            {
                Caption = caption,
                ImagePath = "~/Content/photos/gallery/" + fileName
            });
            db.SaveChanges();
        }
        return RedirectToAction("Gallery");
    }

    [HttpPost]
    public ActionResult DeletePhoto(int id)
    {
        var photo = db.GalleryPhotos.Find(id);
        if (photo != null)
        {
            db.GalleryPhotos.Remove(photo);
            db.SaveChanges();
        }
        return RedirectToAction("Gallery");
    }
}