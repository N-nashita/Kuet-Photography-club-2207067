<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminRequests.aspx.cs" Inherits="KUETPhotoClub.AdminRequests" EnableEventValidation="false" %>
<%@ Register Src="~/AdminNav.ascx" TagPrefix="uc" TagName="AdminNav" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Join Requests</title>
    <style>
        .requests-container {
            max-width: 900px;
            margin: 60px auto;
        }
        .request-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .request-table th {
            background-color: #7e6e53;
            color: white;
            padding: 12px;
            text-align: left;
            font-weight: 600;
        }
        .request-table td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        .request-table tr:hover {
            background-color: #f5f5f5;
        }
        .status-pending {
            display: inline-block;
            padding: 4px 8px;
            background-color: #fff3cd;
            color: #856404;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
        }
        .status-approved {
            display: inline-block;
            padding: 4px 8px;
            background-color: #d4edda;
            color: #155724;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
        }
        .status-rejected {
            display: inline-block;
            padding: 4px 8px;
            background-color: #f8d7da;
            color: #721c24;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
        }
        .action-buttons {
            display: flex;
            gap: 8px;
        }
        .btn-small {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 12px;
            font-weight: 600;
        }
        .btn-approve { background-color: #28a745; color: white; }
        .btn-reject { background-color: #dc3545; color: white; }
        .btn-delete { background-color: #6c757d; color: white; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="requests-container">
            <uc:AdminNav runat="server" ID="AdminNav1" />

            <div style="display:flex; justify-content:space-between; align-items:center;">
                <h2 style="font-size:2rem;">
                    <%= Request.QueryString["filter"] == "approved" ? "Approved Members" : "Join Requests" %>
                </h2>
                <a href="AdminIndex.aspx" style="padding:8px 12px; background:#7e6e53; color:white; 
                   border-radius:8px; text-decoration:none; font-weight:600;">
                    Back to Dashboard
                </a>
            </div>

            <asp:Repeater ID="requestsRepeater" runat="server">
                <HeaderTemplate>
                    <table class="request-table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Department</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server" Visible="true">
                        <tr>
                            <td><%# Eval("FullName") %></td>
                            <td><%# Eval("Email") %></td>
                            <td><%# Eval("Phone") %></td>
                            <td><%# Eval("Department") %></td>
                            <td><%# Convert.ToDateTime(Eval("RequestDate")).ToString("MMM dd, yyyy") %></td>
                            <td>
                                <span class="status-<%# Eval("Status").ToString().ToLower() %>">
                                    <%# Eval("Status") %>
                                </span>
                            </td>
                            <td>
                                <div class="action-buttons">
                                    <asp:Button ID="btnApprove" runat="server" CssClass="btn-small btn-approve" 
                                        Text="Approve" CommandName="Approve" CommandArgument='<%# Eval("Id") %>' 
                                        OnCommand="RequestCommand"
                                        Visible='<%# Eval("Status").ToString() == "Pending" %>' />
                                    <asp:Button ID="btnReject" runat="server" CssClass="btn-small btn-reject" 
                                        Text="Reject" CommandName="Reject" CommandArgument='<%# Eval("Id") %>' 
                                        OnCommand="RequestCommand"
                                        Visible='<%# Eval("Status").ToString() == "Pending" %>' />
                                    <asp:Button ID="btnDelete" runat="server" CssClass="btn-small btn-delete" 
                                        Text="Delete" CommandName="Delete" CommandArgument='<%# Eval("Id") %>' 
                                        OnCommand="RequestCommand" 
                                        OnClientClick="return confirm('Are you sure?');" />
                                </div>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                </ItemTemplate>
                <FooterTemplate>
                        </tbody>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>