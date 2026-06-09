using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KUETPhotoClub
{
    public partial class AdminSignup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"] != null && (bool)Session["IsAdmin"])
            {
                Response.Redirect("AdminIndex.aspx");
            }
        }
        protected void btnSignup_Click(object sender, EventArgs e)
        {
            DatabaseHelper db = new DatabaseHelper();

            // Check if admin already exists
            if (db.AdminExists())
            {
                lblMessage.Text = "An admin account already exists. Only one admin is allowed.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
                return;
            }

            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Username and password are required.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
                return;
            }

            if (password != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
                return;
            }

            db.AddAdmin(username, password);
            lblMessage.Text = "Account created successfully! Redirecting to login...";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Visible = true;

            // Redirect after 2 seconds
            Response.AddHeader("Refresh", "2;url=AdminLogin.aspx");
        }
    }
}