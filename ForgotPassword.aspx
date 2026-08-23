<%@ Page Title="Stylio | Forgot Password" Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Stylio_Salon.ForgotPassword" %>

<%@ Register TagPrefix="uc" TagName="Header" Src="~/SiteHeader.ascx" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Stylio - Forgot Password</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
</head>
<body>
    <form id="frmForgotPassword" runat="server">

        <uc:Header ID="ctrlHeader" runat="server" />

        <asp:Panel ID="pnlAuthBody" runat="server" CssClass="auth-page-body">
            <asp:Panel ID="pnlAuthCard" runat="server" CssClass="auth-card">

                <asp:Label ID="lblTitle" runat="server" CssClass="auth-title" Text="Forgot Password" />

                <asp:ValidationSummary ID="valSummary" runat="server" CssClass="summary-error"
                    DisplayMode="BulletList" HeaderText="" />

                <asp:Panel ID="pnlNewPasswordGroup" runat="server" CssClass="form-group">
                    <asp:Label ID="lblNewPassword" runat="server" AssociatedControlID="txtEmail"
                        CssClass="form-label" Text="New Password" />
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input"
                        TextMode="Email" placeholder="Enter Your Email" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtEmail" CssClass="field-error"
                        ErrorMessage="Email is required." Display="Dynamic" />
                </asp:Panel>

                <asp:Panel ID="pnlConfirmPasswordGroup" runat="server" CssClass="form-group">
                    <asp:Label ID="lblConfirmPassword" runat="server" AssociatedControlID="txtPassword"
                        CssClass="form-label" Text="Confirm Password" />
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input"
                        TextMode="Password" placeholder="Enter Your password" />
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                        ControlToValidate="txtPassword" CssClass="field-error"
                        ErrorMessage="Password is required." Display="Dynamic" />
                </asp:Panel>

                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-primary-wide"
                    OnClick="btnLogin_Click" />

            </asp:Panel>
        </asp:Panel>

    </form>
</body>
</html>
