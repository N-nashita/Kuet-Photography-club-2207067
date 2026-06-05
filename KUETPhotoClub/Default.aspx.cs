using System;
using System.Web.UI.WebControls;
using KUETPhotoClub.Models;

namespace KUETPhotoClub
{
    public partial class Default : System.Web.UI.Page
    {
        private DatabaseHelper db = new DatabaseHelper();
        protected Repeater membersRepeater;
        protected Repeater photosRepeater;
        protected Repeater activitiesRepeater;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPageData();
            }
        }

        private void LoadPageData()
        {
            var members = db.GetAllMembers();
            var photos = db.GetAllPhotos();
            var activities = db.GetAllActivities();

            if (membersRepeater != null)
            {
                membersRepeater.DataSource = members;
                membersRepeater.DataBind();
            }

            if (photosRepeater != null)
            {
                photosRepeater.DataSource = photos;
                photosRepeater.DataBind();
            }

            if (activitiesRepeater != null)
            {
                activitiesRepeater.DataSource = activities;
                activitiesRepeater.DataBind();
            }
        }
    }
}
