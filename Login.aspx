<%@ Page Title="Stylio | Login" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Stylio_Salon.Login" %>

<%@ Register TagPrefix="uc" TagName="Header" Src="~/SiteHeader.ascx" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Login</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
</head>
<body>
    <form id="frmLogin" runat="server">

        <uc:Header ID="ctrlHeader" runat="server" />

        <asp:Panel ID="pnlAuthBody" runat="server" CssClass="auth-page-body">
            <asp:Panel ID="pnlAuthCard" runat="server" CssClass="auth-card">

                <asp:Label ID="lblTitle" runat="server" CssClass="auth-title" Text="Login" />

                <asp:ValidationSummary ID="valSummary" runat="server" CssClass="summary-error"
                    DisplayMode="BulletList" HeaderText="" EnableClientScript="false" />

                <asp:Panel ID="pnlEmailGroup" runat="server" CssClass="form-group">
                    <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail"
                        CssClass="form-label" Text="Email Address" />
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input"
                        TextMode="Email" placeholder="Enter Your Email" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtEmail" CssClass="field-error"
                        ErrorMessage="Email is required." Display="Dynamic" EnableClientScript="false" />
                </asp:Panel>

                <asp:Panel ID="pnlPasswordGroup" runat="server" CssClass="form-group">
                    <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword"
                        CssClass="form-label" Text="Password" />
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input"
                        TextMode="Password" placeholder="Enter Your password" />
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                        ControlToValidate="txtPassword" CssClass="field-error"
                        ErrorMessage="Password is required." Display="Dynamic" EnableClientScript="false" />
                </asp:Panel>

                <asp:Panel ID="pnlForgotRow" runat="server" CssClass="forgot-password-row">
                    <asp:LinkButton ID="lnkForgotPassword" runat="server" Text="Forget password ?"
                        CssClass="link-accent" OnClick="lnkForgotPassword_Click" />
                </asp:Panel>

                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-primary-wide"
                    OnClick="btnLogin_Click" />

                <asp:Panel ID="pnlRegisterRow" runat="server" CssClass="auth-footer-row">
                    <asp:Label ID="lblNoAccount" runat="server" Text="Don't have an account ? " />
                    <asp:LinkButton ID="lnkRegister" runat="server" Text="Register"
                        CssClass="link-accent" OnClick="lnkRegister_Click" />
                </asp:Panel>

            </asp:Panel>
        </asp:Panel>

    </form>
</body>
</html>
