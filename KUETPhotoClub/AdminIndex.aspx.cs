using System;

namespace KUETPhotoClub
{
    public partial class AdminIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"] == null || !(bool)Session["IsAdmin"])
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }
        }
    }
}