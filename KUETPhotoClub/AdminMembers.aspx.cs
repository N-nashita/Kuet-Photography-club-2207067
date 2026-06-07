using System;
using System.Web.UI.WebControls;
using KUETPhotoClub.Models;

namespace KUETPhotoClub
{
    public partial class AdminMembers : System.Web.UI.Page
    {
        protected global::System.Web.UI.WebControls.DropDownList ddlMembers;
        protected global::System.Web.UI.WebControls.TextBox txtRole;
        protected global::System.Web.UI.WebControls.Label lblMessage;
        protected global::System.Web.UI.WebControls.Repeater membersRepeater;

        private DatabaseHelper db = new DatabaseHelper();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadApprovedMembers();
                LoadCurrentMembers();
            }
        }

        private void LoadApprovedMembers()
        {
            // Load approved join requests into dropdown
            var approved = db.GetAllJoinRequests().FindAll(r => r.Status == "Approved");
            ddlMembers.Items.Clear();
            ddlMembers.Items.Add(new ListItem("-- Select Member --", "0"));
            foreach (var r in approved)
            {
                ddlMembers.Items.Add(new ListItem(r.FullName + " (" + r.Department + ")", r.Id.ToString()));
            }
        }

        private void LoadCurrentMembers()
        {
            membersRepeater.DataSource = db.GetAllMembers();
            membersRepeater.DataBind();
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            if (ddlMembers.SelectedValue == "0" || string.IsNullOrEmpty(txtRole.Text))
            {
                lblMessage.Text = "Please select a member and enter a role.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
                return;
            }

            try
            {
                // Get selected member details from JoinRequests
                int requestId = int.Parse(ddlMembers.SelectedValue);
                var requests = db.GetAllJoinRequests();
                var selected = requests.Find(r => r.Id == requestId);

                if (selected != null)
                {
                    // Add to Members table with assigned role
                    db.AddMember(new Member
                    {
                        Name = selected.FullName,
                        Role = txtRole.Text.Trim(),
                        PhotoPath = "Content/photos/members/default.jpg"
                    });

                    lblMessage.Text = selected.FullName + " assigned as " + txtRole.Text + " successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Visible = true;
                    txtRole.Text = "";
                    LoadCurrentMembers();
                    LoadApprovedMembers();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
            }
        }

        protected void EditRole_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int memberId = int.Parse(e.CommandArgument.ToString());
                // Find the TextBox in the repeater item
                RepeaterItem item = ((Button)sender).NamingContainer as RepeaterItem;
                TextBox txtEditRole = item.FindControl("txtEditRole") as TextBox;

                if (txtEditRole != null)
                {
                    db.UpdateMemberRole(memberId, txtEditRole.Text.Trim());
                    LoadCurrentMembers();
                    LoadApprovedMembers();
                }
            }
            catch (Exception ex)
            {
                // Log error
            }
        }
    }
}