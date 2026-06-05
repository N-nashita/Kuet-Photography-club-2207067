<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminActivities.aspx.cs" Inherits="KUETPhotoClub.AdminActivities" %>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Activities</title>
    <link rel="stylesheet" href="~/Content/site.css" />
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div style="max-width:800px; margin:60px auto;">
            <h2>Manage Activities</h2>
            <a href="AdminIndex.aspx">← Back to Dashboard</a>
            <hr />

            <h3>Add New Activity</h3>
            <div>
                <asp:TextBox ID="txtTitle" runat="server" placeholder="Activity Title" required="true" style="padding:8px; margin:6px; width:200px;"></asp:TextBox>
                <asp:TextBox ID="txtDescription" runat="server" placeholder="Description" required="true" style="padding:8px; margin:6px; width:300px;"></asp:TextBox>
                <asp:FileUpload ID="fuActivityPhoto" runat="server" accept="image/*" required="true" style="margin:6px;" />
                <asp:Button ID="btnAddActivity" runat="server" Text="Add Activity" OnClick="btnAddActivity_Click" style="padding:8px 20px; background:#7e6e53; color:white; border:none; border-radius:6px; cursor:pointer;" />
            </div>

            <hr />
            <h3>Current Activities</h3>
            <div class="gallery-grid">
                <asp:Repeater ID="activitiesRepeater" runat="server">
                    <ItemTemplate>
                        <div style="text-align:center;">
                            <img src="<%# Eval("PhotoPath") %>" style="width:200px; height:200px; object-fit:cover; border-radius:8px;" />
                            <h4><%# Eval("Title") %></h4>
                            <p><%# Eval("Description") %></p>
                            <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("Id") %>' OnCommand="DeleteActivity_Command"
                                style="background:red; color:white; border:none; padding:4px 12px; border-radius:4px; display:inline-block; cursor:pointer;">Delete</asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</body>
</html>
