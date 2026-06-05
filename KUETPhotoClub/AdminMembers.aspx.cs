using System;
using System.IO;
using System.Web.UI.WebControls;
using KUETPhotoClub.Models;

namespace KUETPhotoClub
{
    public partial class AdminMembers : System.Web.UI.Page
    {
        private DatabaseHelper db = new DatabaseHelper();
        protected Repeater membersRepeater;
        protected TextBox txtMemberName;
        protected TextBox txtMemberRole;
        protected FileUpload fuMemberPhoto;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMembers();
            }
        }

        private void LoadMembers()
        {
            var members = db.GetAllMembers();
            if (membersRepeater != null)
            {
                membersRepeater.DataSource = members;
                membersRepeater.DataBind();
            }
        }

        protected void btnAddMember_Click(object sender, EventArgs e)
        {
            if (fuMemberPhoto != null && fuMemberPhoto.HasFile)
            {
                try
                {
                    string fileName = Path.GetFileName(fuMemberPhoto.FileName);
                    string folderPath = Server.MapPath("~/Content/photos/members/");

                    if (!Directory.Exists(folderPath))
                        Directory.CreateDirectory(folderPath);

                    string filePath = Path.Combine(folderPath, fileName);
                    fuMemberPhoto.SaveAs(filePath);

                    var member = new Member
                    {
                        Name = txtMemberName?.Text ?? "",
                        Role = txtMemberRole?.Text ?? "",
                        PhotoPath = "~/Content/photos/members/" + fileName
                    };

                    db.AddMember(member);

                    if (txtMemberName != null) txtMemberName.Text = "";
                    if (txtMemberRole != null) txtMemberRole.Text = "";
                    LoadMembers();
                }
                catch (Exception ex)
                {
                    // Log error
                }
            }
        }

        protected void DeleteMember_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            int memberId = Convert.ToInt32(e.CommandArgument);
            db.DeleteMember(memberId);
            LoadMembers();
        }
    }
}
