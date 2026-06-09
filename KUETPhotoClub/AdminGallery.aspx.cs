using System;
using System.IO;
using System.Web.UI.WebControls;
using KUETPhotoClub.Models;

namespace KUETPhotoClub
{
    public partial class AdminGallery : System.Web.UI.Page
    {
        private DatabaseHelper db = new DatabaseHelper();
        protected Repeater photosRepeater;
        protected TextBox txtCaption;
        protected FileUpload fuPhoto;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"] == null || !(bool)Session["IsAdmin"])
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }
            if (!IsPostBack)
            {
                LoadPhotos();
            }
        }

        private void LoadPhotos()
        {
            var photos = db.GetAllPhotos();
            if (photosRepeater != null)
            {
                photosRepeater.DataSource = photos;
                photosRepeater.DataBind();
            }
        }

        protected void btnAddPhoto_Click(object sender, EventArgs e)
        {
            if (fuPhoto != null && fuPhoto.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fuPhoto.FileName);
                    string folderPath = Server.MapPath("~/Content/photos/gallery/");

                    if (!Directory.Exists(folderPath))
                        Directory.CreateDirectory(folderPath);

                    string filePath = Path.Combine(folderPath, fileName);
                    fuPhoto.SaveAs(filePath);

                    var photo = new GalleryPhoto
                    {
                        Caption = txtCaption?.Text ?? "",
                        ImagePath = "~/Content/photos/gallery/" + fileName
                    };

                    db.AddPhoto(photo);

                    if (txtCaption != null) txtCaption.Text = "";
                    LoadPhotos();
                }
                catch (Exception ex)
                {
                    // Log error
                }
            }
        }

        protected void DeletePhoto_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            int photoId = Convert.ToInt32(e.CommandArgument);
            db.DeletePhoto(photoId);
            LoadPhotos();
        }
    }
}
