using System;
using KUETPhotoClub.Models;
namespace KUETPhotoClub
{
    public partial class AdminRequests : System.Web.UI.Page
    {
        protected global::System.Web.UI.WebControls.Repeater requestsRepeater;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRequests();
            }
        }

        private void LoadRequests()
        {
            try
            {
                DatabaseHelper dbHelper = new DatabaseHelper();
                var requests = dbHelper.GetAllJoinRequests();
                requestsRepeater.DataSource = requests;
                requestsRepeater.DataBind();
            }
            catch (Exception ex)
            {
                // Log error or display message
                System.Diagnostics.Debug.WriteLine("Error loading requests: " + ex.Message);
            }
        }

        public void RequestCommand(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            try
            {
                int requestId = int.Parse(e.CommandArgument.ToString());
                DatabaseHelper dbHelper = new DatabaseHelper();

                switch (e.CommandName)
                {
                    case "Approve":
                        dbHelper.UpdateJoinRequestStatus(requestId, "Approved");
                        break;
                    case "Reject":
                        dbHelper.UpdateJoinRequestStatus(requestId, "Rejected");
                        break;
                    case "Delete":
                        dbHelper.DeleteJoinRequest(requestId);
                        break;
                }

                LoadRequests();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error processing request command: " + ex.Message);
            }
        }
    }
}
