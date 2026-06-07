<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminMembers.aspx.cs" Inherits="KUETPhotoClub.AdminMembers" %>
<%@ Register Src="~/AdminNav.ascx" TagPrefix="uc" TagName="AdminNav" %>

<!DOCTYPE html>
<html>
<head>
    <title>Members</title>
    <link rel="stylesheet" href="~/Content/site.css" />
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div style="max-width:1000px; margin:60px auto;">
            <uc:AdminNav runat="server" ID="AdminNav1" />

            <div style="margin-top:30px;">
                <h2>Members</h2>
                <a href="AdminIndex.aspx">← Back to Dashboard</a>
                <hr />

                <h3>Add New Member</h3>
                <div>
                    <asp:TextBox ID="txtMemberName" runat="server" placeholder="Member Name" required="true" style="padding:8px; margin:6px; width:200px;"></asp:TextBox>
                    <asp:TextBox ID="txtMemberRole" runat="server" placeholder="Role (e.g. President)" required="true" style="padding:8px; margin:6px; width:200px;"></asp:TextBox>
                    <asp:FileUpload ID="fuMemberPhoto" runat="server" accept="image/*" required="true" style="margin:6px;" />
                    <asp:Button ID="btnAddMember" runat="server" Text="Add Member" OnClick="btnAddMember_Click" style="padding:8px 20px; background:#7e6e53; color:white; border:none; border-radius:6px; cursor:pointer;" />
                </div>

                <hr />
                <h3>Current Members</h3>
                <div class="gallery-grid">
                    <asp:Repeater ID="membersRepeater" runat="server">
                        <ItemTemplate>
                            <div class="committee-member">
                                <img src="<%# Eval("PhotoPath") %>" class="gallery-img" style="width:150px; height:150px; object-fit:cover;" />
                                <span class="member-role"><%# Eval("Role") %></span>
                                <span class="member-name"><%# Eval("Name") %></span>
                                <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("Id") %>' OnCommand="DeleteMember_Command" 
                                    style="background:red; color:white; border:none; padding:4px 12px; border-radius:4px; margin-top:6px; display:inline-block; cursor:pointer;">Delete</asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
