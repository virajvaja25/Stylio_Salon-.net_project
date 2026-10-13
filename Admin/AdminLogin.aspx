<%@ Page Title="Stylio | Admin Login" Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Stylio_Salon.AdminLogin" %>

<%@ Register TagPrefix="uc" TagName="Header" Src="~/SiteHeader.ascx" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Admin Login</title>
    <link rel="stylesheet" type="text/css" href="../Styles/Site.css" />
</head>
<body>
    <form id="frmAdminLogin" runat="server" defaultbutton="btnLogin">

        <uc:Header ID="ctrlHeader" runat="server" />

        <asp:Panel ID="pnlAuthBody" runat="server" CssClass="auth-page-body">
            <asp:Panel ID="pnlAuthCard" runat="server" CssClass="auth-card">

                <asp:Label ID="lblLoginHeading" runat="server" CssClass="auth-title" Text="Admin Login" />

                <asp:Label ID="lblErrorMessage" runat="server" CssClass="summary-error" Visible="false" />

                <asp:Panel ID="pnlEmailGroup" runat="server" CssClass="form-group">
                    <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail"
                        CssClass="form-label" Text="Email Address" />
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input"
                        TextMode="Email" placeholder="Enter Your Email" />
                </asp:Panel>

                <asp:Panel ID="pnlPasswordGroup" runat="server" CssClass="form-group">
                    <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword"
                        CssClass="form-label" Text="Password" />
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input"
                        TextMode="Password" placeholder="Enter Your password" />
                </asp:Panel>

                <asp:Panel ID="pnlForgotRow" runat="server" CssClass="forgot-password-row">
                    <asp:HyperLink ID="lnkForgotPassword" runat="server" CssClass="link-accent"
                        Text="Forget password ?" NavigateUrl="#" />
                </asp:Panel>

                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-primary-wide"
                    OnClick="btnLogin_Click" />

            </asp:Panel>
        </asp:Panel>

    </form>
</body>
</html>