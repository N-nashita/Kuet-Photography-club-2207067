<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminIndex.aspx.cs" Inherits="KUETPhotoClub.AdminIndex" %>
<%@ Register Src="~/AdminNav.ascx" TagPrefix="uc" TagName="AdminNav" %>

<!DOCTYPE html>
<html>
<head>
    <title>KUET Photography Club</title>
    <link rel="stylesheet" href="~/Content/site.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="max-width:900px; margin:60px auto;">
            <uc:AdminNav runat="server" ID="AdminNav1" />

            <div style="margin-top:40px; text-align:center;">
                <h1>Admin Dashboard</h1>
                <p>Select a section from the navigation bar.</p>
            </div>
        </div>
    </form>
</body>
</html>
