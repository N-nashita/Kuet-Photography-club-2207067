using System;
using System.IO;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using KUETPhotoClub.Models;

namespace KUETPhotoClub
{
    public partial class JoinRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                Response.Clear();
                Response.ContentType = "application/json";
                try
                {
                    string json = new StreamReader(Request.InputStream, Encoding.UTF8).ReadToEnd();
                    var serializer = new JavaScriptSerializer();
                    var data = serializer.Deserialize<System.Collections.Generic.Dictionary<string, string>>(json);

                    DatabaseHelper.AddJoinRequest(
                        data["fullName"],
                        data["email"],
                        data["phone"],
                        data["department"],
                        data["reason"]
                    );

                    Response.Write("{\"success\": true}");
                }
                catch (Exception ex)
                {
                    Response.Write("{\"success\": false, \"message\": \"" + ex.Message.Replace("\"", "'") + "\"}");
                }
                Response.Flush();
                Response.End();
            }
        }
    }
}