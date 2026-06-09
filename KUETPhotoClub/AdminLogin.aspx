<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="KUETPhotoClub.AdminLogin" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Admin Login</title>
    <link rel="stylesheet" href="Content/site.css" />
    <style>
        .login-page {
            min-height: 100vh;
            background: #f7f5f2;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-box {
            background: white;
            border-radius: 16px;
            padding: 40px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.1);
            text-align: center;
        }
        .login-box h2 {
            font-family: "Caveat", cursive;
            font-size: 2.5rem;
            color: #7e6e53;
            margin-bottom: 24px;
        }
        .form-group {
            margin-bottom: 16px;
            text-align: left;
        }
        .form-group label {
            display: block;
            margin-bottom: 6px;
            color: #4d4637;
            font-weight: 500;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #d0c9bf;
            border-radius: 8px;
            font-size: 1rem;
            box-sizing: border-box;
        }
        .btn-login {
            width: 100%;
            padding: 12px;
            background: #7e6e53;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            margin-top: 8px;
        }
        .btn-login:hover { background: #a89c7d; }
        .error-msg { color: red; margin-top: 10px; display: block; }
        .signup-link { margin-top: 16px; font-size: 0.95rem; color: #666; }
        .signup-link a { color: #7e6e53; font-weight: 600; text-decoration: none; }
        .signup-link a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-page">
            <div class="login-box">
                <h2>Admin Login</h2>
                <div class="form-group">
                    <label>Username</label>
                    <asp:TextBox ID="txtUsername" runat="server" placeholder="Enter username" />
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter password" />
                </div>
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />
                <asp:Label ID="lblError" runat="server" CssClass="error-msg" Visible="false" />
                <p class="signup-link">
                    Don't have an account? <a href="AdminSignup.aspx">Sign Up</a>
                </p>
            </div>
        </div>
    </form>
</body>
</html> 