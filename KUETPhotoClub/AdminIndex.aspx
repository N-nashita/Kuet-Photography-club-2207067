<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminIndex.aspx.cs" Inherits="KUETPhotoClub.AdminIndex" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="~/Content/site.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="max-width:600px; margin:60px auto; text-align:center;">
            <h1>Admin Dashboard</h1>
            <br />
            <a href="AdminActivities.aspx"
               style="display:block; padding:16px; background:#7e6e53; color:white;
              margin-bottom:16px; border-radius:8px; text-decoration:none;">
                Manage Activities
            </a>
            <a href="AdminMembers.aspx"
               style="display:block; padding:16px; background:#7e6e53; color:white;
                      margin-bottom:16px; border-radius:8px; text-decoration:none;">
                Manage Members
            </a>
            <a href="AdminGallery.aspx"
               style="display:block; padding:16px; background:#7e6e53; color:white;
                      margin-bottom:16px; border-radius:8px; text-decoration:none;">
                Manage Gallery
            </a>
        </div>
    </form>
</body>
</html>
