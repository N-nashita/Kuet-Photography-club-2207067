<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Committee.aspx.cs" Inherits="KUETPhotoClub.Committee" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Executive Committee - KUET Photography Club</title>
    <link rel="stylesheet" href="Content/site.css" />
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
    <style>
        .committee-page {
            background: #f7f5f2;
            min-height: 100vh;
            padding-top: 80px;
        }
        .committee-header {
            text-align: center;
            padding: 40px 20px;
            background: linear-gradient(rgba(129,117,98,0.45), rgba(120,101,70,0.35)),
                        url('Content/photos/cover_pic.jpeg');
            background-size: cover;
            background-position: center;
            color: white;
        }
        .committee-header h1 {
            font-family: "Caveat", cursive;
            font-size: 3rem;
            margin-bottom: 10px;
        }
        .committee-header p {
            font-size: 1.1rem;
        }
        .committee-body {
            max-width: 1100px;
            margin: 40px auto;
            padding: 0 20px;
        }
        .role-section {
            margin-bottom: 50px;
        }
        .role-title {
            font-family: "Caveat", cursive;
            font-size: 2rem;
            color: #7e6e53;
            border-bottom: 2px solid #7e6e53;
            padding-bottom: 8px;
            margin-bottom: 24px;
        }
        .members-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 24px;
        }
        .member-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
            transition: transform 0.2s;
        }
        .member-card:hover {
            transform: translateY(-4px);
        }
        .member-card img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #7e6e53;
            margin-bottom: 12px;
        }
        .member-card .name {
            font-weight: 600;
            color: #4d4637;
            font-size: 1rem;
        }
        .member-card .role {
            color: #7e6e53;
            font-size: 0.9rem;
            margin-top: 4px;
        }
        .back-btn {
            display: inline-block;
            margin: 20px;
            padding: 10px 24px;
            background: #7e6e53;
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
        }
        .back-btn:hover {
            background: #a89c7d;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Nav -->
        <header class="nav-bar">
            <div class="header">
                <img class="pp" src="Content/photos/KUET-Logo.png" alt="KUET Logo" />
                <span class="headerText">Khulna University of Engineering and Technology</span>
            </div>
            <nav class="nav">
                <ul class="nav-links">
                    <li><a href="Default.aspx">Home</a></li>
                    <li><a href="Default.aspx#about">About</a></li>
                    <li><a href="Default.aspx#photo-gallery">Gallery</a></li>
                    <li><a href="">Members</a></li>
                    <li><a href="Default.aspx#contact">Contact</a></li>
                    <li><a href="Default.aspx#log-in">LogIn</a></li>
                </ul>
            </nav>
        </header>

        <div class="committee-page">
            <div class="committee-header">
                <h1>Executive Committee</h1>
                <p>The passionate team behind KUET Photographic Society</p>
            </div>

            <div class="committee-body">
                <a href="Default.aspx" class="back-btn">← Back to Home</a>

                <!-- President -->
                <div class="role-section">
                    <h3 class="role-title">President</h3>
                    <div class="members-grid">
                        <asp:Repeater ID="presidentRepeater" runat="server">
                            <ItemTemplate>
                                <div class="member-card">
                                    <img src='<%# Eval("PhotoPath").ToString().Replace("~/", "") %>' />                                    <div class="name"><%# Eval("Name") %></div>
                                    <div class="role"><%# Eval("Role") %></div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <!-- Vice President -->
                <div class="role-section">
                    <h3 class="role-title">Vice President</h3>
                    <div class="members-grid">
                        <asp:Repeater ID="vpRepeater" runat="server">
                            <ItemTemplate>
                                <div class="member-card">
                                    <img src='<%# Eval("PhotoPath").ToString().Replace("~/", "") %>' />
                                    <div class="name"><%# Eval("Name") %></div>
                                    <div class="role"><%# Eval("Role") %></div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <!-- General Secretary -->
                <div class="role-section">
                    <h3 class="role-title">General Secretary</h3>
                    <div class="members-grid">
                        <asp:Repeater ID="gsRepeater" runat="server">
                            <ItemTemplate>
                                <div class="member-card">
                                    <img src='<%# Eval("PhotoPath").ToString().Replace("~/", "") %>' />
                                    <div class="name"><%# Eval("Name") %></div>
                                    <div class="role"><%# Eval("Role") %></div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <!-- Treasurer -->
                <div class="role-section">
                    <h3 class="role-title">Treasurer</h3>
                    <div class="members-grid">
                        <asp:Repeater ID="treasurerRepeater" runat="server">
                            <ItemTemplate>
                                <div class="member-card">
                                    <img src='<%# Eval("PhotoPath").ToString().Replace("~/", "") %>' />
                                    <div class="name"><%# Eval("Name") %></div>
                                    <div class="role"><%# Eval("Role") %></div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <!-- Members -->
                <div class="role-section">
                    <h3 class="role-title">Members</h3>
                    <div class="members-grid">
                        <asp:Repeater ID="membersRepeater" runat="server">
                            <ItemTemplate>
                                <div class="member-card">
                                    <img src='<%# Eval("PhotoPath").ToString().Replace("~/", "") %>' />
                                    <div class="name"><%# Eval("Name") %></div>
                                    <div class="role"><%# Eval("Role") %></div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>