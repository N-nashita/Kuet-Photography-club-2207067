using System;
using System.Collections.Generic;
using KUETPhotoClub.Models;

namespace KUETPhotoClub
{
    public partial class Committee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMembers();
            }
        }

        private void LoadMembers()
        {
            DatabaseHelper db = new DatabaseHelper();
            var allMembers = db.GetAllMembers();

            presidentRepeater.DataSource = allMembers.FindAll(m => m.Role.ToLower().Contains("president") && !m.Role.ToLower().Contains("vice"));
            presidentRepeater.DataBind();

            vpRepeater.DataSource = allMembers.FindAll(m => m.Role.ToLower().Contains("vice"));
            vpRepeater.DataBind();

            gsRepeater.DataSource = allMembers.FindAll(m => m.Role.ToLower().Contains("secretary"));
            gsRepeater.DataBind();

            treasurerRepeater.DataSource = allMembers.FindAll(m => m.Role.ToLower().Contains("treasurer"));
            treasurerRepeater.DataBind();

            membersRepeater.DataSource = allMembers.FindAll(m => m.Role.ToLower() == "member");
            membersRepeater.DataBind();
        }
    }
}