using System;
using System.IO;
using System.Web.UI.WebControls;
using KUETPhotoClub.Models;

namespace KUETPhotoClub
{
    public partial class AdminActivities : System.Web.UI.Page
    {
        private DatabaseHelper db = new DatabaseHelper();
        protected Repeater activitiesRepeater;
        protected TextBox txtTitle;
        protected TextBox txtDescription;
        protected FileUpload fuActivityPhoto;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadActivities();
            }
        }

        private void LoadActivities()
        {
            var activities = db.GetAllActivities();
            if (activitiesRepeater != null)
            {
                activitiesRepeater.DataSource = activities;
                activitiesRepeater.DataBind();
            }
        }

        protected void btnAddActivity_Click(object sender, EventArgs e)
        {
            if (fuActivityPhoto != null && fuActivityPhoto.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fuActivityPhoto.FileName);
                    string folderPath = Server.MapPath("~/Content/photos/activities/");

                    if (!Directory.Exists(folderPath))
                        Directory.CreateDirectory(folderPath);

                    string filePath = Path.Combine(folderPath, fileName);
                    fuActivityPhoto.SaveAs(filePath);

                    var activity = new Activity
                    {
                        Title = txtTitle?.Text ?? "",
                        Description = txtDescription?.Text ?? "",
                        PhotoPath = "~/Content/photos/activities/" + fileName
                    };

                    db.AddActivity(activity);

                    if (txtTitle != null) txtTitle.Text = "";
                    if (txtDescription != null) txtDescription.Text = "";
                    LoadActivities();
                }
                catch (Exception ex)
                {
                    // Log error
                }
            }
        }

        protected void DeleteActivity_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            int activityId = Convert.ToInt32(e.CommandArgument);
            db.DeleteActivity(activityId);
            LoadActivities();
        }
    }
}
