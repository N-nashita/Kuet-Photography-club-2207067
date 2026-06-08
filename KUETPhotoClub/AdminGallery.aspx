<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminGallery.aspx.cs" Inherits="KUETPhotoClub.AdminGallery" %>
<%@ Register Src="~/AdminNav.ascx" TagPrefix="uc" TagName="AdminNav" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Gallery</title>
    <link rel="stylesheet" href="~/Content/site.css" />
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div style="max-width:800px; margin:60px auto;">
            <h2>Manage Gallery</h2>
            <a href="AdminIndex.aspx" style="padding:8px 12px; background:#7e6e53; color:white; 
               border-radius:8px; text-decoration:none; font-weight:600;">
                Back to Dashboard
            </a>
            <hr />

            <h3>Add New Photo</h3>
            <div>
                <asp:TextBox ID="txtCaption" runat="server" placeholder="Caption" style="padding:8px; margin:6px; width:200px;"></asp:TextBox>
                <asp:FileUpload ID="fuPhoto" runat="server" accept="image/*" required="true" style="margin:6px;" />
                <asp:Button ID="btnAddPhoto" runat="server" Text="Add Photo" OnClick="btnAddPhoto_Click" style="padding:8px 20px; background:#7e6e53; color:white; border:none; border-radius:6px; cursor:pointer;" />
            </div>

            <hr />
            <h3>Current Photos</h3>
            <div class="gallery-grid">
                <asp:Repeater ID="photosRepeater" runat="server">
                    <ItemTemplate>
                        <div style="text-align:center;  margin:10px;">
                            <img src='<%# Eval("ImagePath").ToString().Replace("~/", "") %>' style="width:200px; height:200px; object-fit:cover; border-radius:8px;" />
                            <p><%# Eval("Caption") %></p>
                            <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("Id") %>' OnCommand="DeletePhoto_Command"
                                style="background:red; color:white; border:none; padding:4px 12px; border-radius:4px; display:inline-block; cursor:pointer;">Delete</asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</body>
</html>
