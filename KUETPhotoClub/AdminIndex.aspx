<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminIndex.aspx.cs" Inherits="KUETPhotoClub.AdminIndex" %>
<%@ Register Src="~/AdminNav.ascx" TagPrefix="uc" TagName="AdminNav" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="Content/site.css" />
    <style>
        .dashboard-container {
            max-width: 900px;
            margin: 60px auto;
            padding: 0 20px;
            text-align: center;
        }
        h2 {
            font-family: "Caveat", cursive;
            font-size: 2.5rem;
            color: #7e6e53;
            margin-bottom: 40px;
        }
        .btn-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .dash-btn {
            display: block;
            padding: 24px 16px;
            background: #7e6e53;
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 600;
            transition: background 0.2s;
        }
        .dash-btn:hover {
            background: #a89c7d;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <uc:AdminNav runat="server" ID="AdminNav1" />
            <h2>Admin Dashboard</h2>
            <div class="btn-grid">
                <a href="AdminMembers.aspx" class="dash-btn">Manage Members</a>
                <a href="AdminGallery.aspx" class="dash-btn">Manage Gallery</a>
                <a href="AdminActivities.aspx" class="dash-btn">Manage Activities</a>
                <a href="AdminRequests.aspx" class="dash-btn">Join Requests</a>
                <a href="AdminRequests.aspx?filter=approved" class="dash-btn">Members</a>
                <a href="Default.aspx" class="dash-btn" style="background:#4d4637;">&larr; Back to Website</a>
            </div>
        </div>
    </form>
</body>
</html>