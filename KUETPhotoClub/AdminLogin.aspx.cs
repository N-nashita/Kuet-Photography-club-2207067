using System;

namespace KUETPhotoClub
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"] != null && (bool)Session["IsAdmin"])
            {
                Response.Redirect("AdminIndex.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            DatabaseHelper db = new DatabaseHelper();
            if (db.ValidateAdmin(username, password))
            {
                Session["IsAdmin"] = true;
                Session["AdminName"] = username;
                Response.Redirect("AdminIndex.aspx");
            }
            else
            {
                lblError.Text = "Invalid username or password.";
                lblError.Visible = true;
            }
        }
    }
}