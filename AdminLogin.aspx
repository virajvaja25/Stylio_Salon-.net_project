<%@ Page Title="Stylio | Admin Login" Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Stylio_Salon.AdminLogin" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Admin Login</title>
    <link rel="stylesheet" type="text/css" href="Styles/Admin.css" />
</head>
<body>
    <form id="frmAdminLogin" runat="server">
        <asp:Panel ID="pnlAdminLoginPage" runat="server" CssClass="admin-login-page">
            
            <asp:Panel ID="pnlTopBar" runat="server" CssClass="admin-login-topbar">
                <asp:Panel ID="pnlLogoBox" runat="server" CssClass="admin-login-logo-box">
                    <asp:Image ID="imgAdminLogo" runat="server" ImageUrl="~/Images/admin_logo.png" AlternateText="Stylio Admin Panel" CssClass="admin-logo-img" />
                </asp:Panel>
            </asp:Panel>

            <asp:Panel ID="pnlCenterArea" runat="server" CssClass="admin-login-center-area">
                <asp:Panel ID="pnlLoginCard" runat="server" CssClass="admin-login-card">
                    
                    <asp:Label ID="lblLoginHeading" runat="server" CssClass="admin-login-title" Text="Login" />

                    <asp:Panel ID="pnlEmailGroup" runat="server" CssClass="admin-form-group">
                        <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" CssClass="admin-form-label" Text="Email Address" />
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="admin-form-input" TextMode="Email" placeholder="Enter Your Email" />
                    </asp:Panel>

                    <asp:Panel ID="pnlPasswordGroup" runat="server" CssClass="admin-form-group">
                        <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" CssClass="admin-form-label" Text="Password" />
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="admin-form-input" TextMode="Password" placeholder="Enter Your password" />
                    </asp:Panel>

                    <asp:Panel ID="pnlForgotRow" runat="server" CssClass="admin-forgot-pwd-row">
                        <asp:HyperLink ID="lnkForgotPassword" runat="server" CssClass="admin-forgot-pwd-link" Text="Forget password ?" NavigateUrl="#" />
                    </asp:Panel>

                    <asp:Button ID="btnLogin" runat="server" CssClass="btn-admin-login" Text="Login" OnClick="btnLogin_Click" />

                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="admin-login-error" Visible="false" />

                </asp:Panel>
            </asp:Panel>

        </asp:Panel>
    </form>
</body>
</html>
