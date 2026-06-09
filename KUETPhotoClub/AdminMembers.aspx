<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminMembers.aspx.cs" Inherits="KUETPhotoClub.AdminMembers" %>
<%@ Register Src="~/AdminNav.ascx" TagPrefix="uc" TagName="AdminNav" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Assign Roles</title>
    <style>
        .members-container { max-width:1000px; padding:0 20px; }
        .form-box { background:white; border-radius:12px; padding:24px; box-shadow:0 2px 12px rgba(0,0,0,0.08); margin-bottom:30px; }
        .form-box h3 { margin-bottom:16px; }
        .form-row { display:flex; gap:12px; flex-wrap:wrap; align-items:center; }
        .form-row select, .form-row input { padding:10px; border:1px solid #d0c9bf; border-radius:8px; font-size:1rem; }
        .form-row select { width:250px; }
        .form-row input { width:200px; }
        .btn-primary { padding:10px 24px; background:#7e6e53; color:white; border:none; border-radius:8px; cursor:pointer; font-size:1rem; font-weight:600; }
        .members-table { width:100%; border-collapse:collapse; background:white; border-radius:12px; overflow:hidden; box-shadow:0 2px 12px rgba(0,0,0,0.08); }
        .members-table th { background:#7e6e53; color:white; padding:12px; text-align:left; }
        .members-table td { padding:12px; border-bottom:1px solid #eee; }
        .members-table tr:hover { background:#f9f7f4; }
        .btn-edit { padding:6px 14px; background:#7e6e53; color:white; border:none; border-radius:6px; cursor:pointer; }
        .edit-input { padding:6px; border:1px solid #d0c9bf; border-radius:6px; width:160px; }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="members-container">
            <uc:AdminNav runat="server" ID="AdminNav1" />

            <h2 style="margin-bottom:10px;">Assign Roles</h2>
            <a href="AdminIndex.aspx" style="padding:8px 12px; background:#7e6e53; color:white; 
               border-radius:8px; text-decoration:none; font-weight:600;">
                Back to Dashboard
            </a>
            <hr />

            <!-- Assign Role Form -->
            <div class="form-box" style="margin-top:24px;">
                <h3>Assign Role to Approved Member</h3>
                <div class="form-row">
                    <asp:DropDownList ID="ddlMembers" runat="server" style="padding:10px; border:1px solid #d0c9bf; border-radius:8px; font-size:1rem; width:250px;">
                    </asp:DropDownList>
                    <asp:TextBox ID="txtRole" runat="server" placeholder="Role (e.g. President)" style="padding:10px; border:1px solid #d0c9bf; border-radius:8px; font-size:1rem; width:200px;"></asp:TextBox>
                    <asp:Button ID="btnAssign" runat="server" Text="Assign Role" CssClass="btn-primary" OnClick="btnAssign_Click" />
                </div>
                <asp:Label ID="lblMessage" runat="server" Visible="false" style="margin-top:10px; display:block;" />
            </div>

            <!-- Current Members Table -->
            <div class="form-box">
                <h3>Current Members & Roles</h3>
                <table class="members-table">
                    <thead>
                        <tr>
                            <th>Photo</th>
                            <th>Name</th>
                            <th>Current Role</th>
                            <th>Edit Role</th>
                            <th>Update Photo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="membersRepeater" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <img src='<%# Eval("PhotoPath").ToString().Replace("~/","") %>' 
                                             style="width:50px; height:50px; border-radius:50%; object-fit:cover; border:2px solid #7e6e53;" />
                                    </td>
                                    <td><%# Eval("Name") %></td>
                                    <td><%# Eval("Role") %></td>
                                    <td>
                                        <asp:TextBox ID="txtEditRole" runat="server" Text='<%# Eval("Role") %>' CssClass="edit-input"></asp:TextBox>
                                        <asp:Button ID="btnEdit" runat="server" Text="Save" CssClass="btn-edit"
                                            CommandName="Edit" CommandArgument='<%# Eval("Id") %>'
                                            OnCommand="EditRole_Command" />
                                    </td>
                                    <td>
                                        <asp:FileUpload ID="fuPhoto" runat="server" accept="image/*" />
                                        <asp:Button ID="btnUpdatePhoto" runat="server" Text="Upload" CssClass="btn-edit"
                                            CommandName="UpdatePhoto" CommandArgument='<%# Eval("Id") %>'
                                            OnCommand="UpdatePhoto_Command" />
                                    </td>
                                </tr>
                            </ItemTemplate> 
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</body>
</html>