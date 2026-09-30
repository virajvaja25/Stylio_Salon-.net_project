<%@ Page Title="Stylio | Forgot Password" Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Stylio_Salon.ForgotPassword" %>

<%@ Register TagPrefix="uc" TagName="Header" Src="~/SiteHeader.ascx" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
                    DisplayMode="BulletList" HeaderText="" EnableClientScript="false" />

                <asp:Panel ID="pnlEmailGroup" runat="server" CssClass="form-group">
                    <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail"
                        CssClass="form-label" Text="Email Address" />
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input"
                        TextMode="Email" placeholder="Enter Your Registered Email" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtEmail" CssClass="field-error"
                        ErrorMessage="Email is required." Display="Dynamic" EnableClientScript="false" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtEmail" CssClass="field-error"
                        ErrorMessage="Enter a valid email address." Display="Dynamic" EnableClientScript="false"
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" />
                </asp:Panel>

                <asp:Panel ID="pnlNewPasswordGroup" runat="server" CssClass="form-group">
                    <asp:Label ID="lblNewPassword" runat="server" AssociatedControlID="txtNewPassword"
                        CssClass="form-label" Text="New Password" />
                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-input"
                        TextMode="Password" placeholder="Enter New Password" />
                    <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server"
                        ControlToValidate="txtNewPassword" CssClass="field-error"
                        ErrorMessage="New password is required." Display="Dynamic" EnableClientScript="false" />
                </asp:Panel>

                <asp:Panel ID="pnlConfirmPasswordGroup" runat="server" CssClass="form-group">
                    <asp:Label ID="lblConfirmPassword" runat="server" AssociatedControlID="txtConfirmPassword"
                        CssClass="form-label" Text="Confirm Password" />
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-input"
                        TextMode="Password" placeholder="Confirm New Password" />
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server"
                        ControlToValidate="txtConfirmPassword" CssClass="field-error"
                        ErrorMessage="Please confirm your password." Display="Dynamic" EnableClientScript="false" />
                    <asp:CompareValidator ID="cvConfirmPassword" runat="server"
                        ControlToValidate="txtConfirmPassword" ControlToCompare="txtNewPassword"
                        CssClass="field-error" ErrorMessage="Passwords do not match."
                        Display="Dynamic" EnableClientScript="false" />
                </asp:Panel>

                <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password" CssClass="btn-primary-wide"
                    OnClick="btnResetPassword_Click" />

                <asp:Panel ID="pnlLoginRow" runat="server" CssClass="auth-footer-row">
                    <asp:Label ID="lblRememberPassword" runat="server" Text="Remember your password? " />
                    <asp:LinkButton ID="lnkBackToLogin" runat="server" Text="Login"
                        CssClass="link-accent" OnClick="lnkBackToLogin_Click" CausesValidation="false" />
                </asp:Panel>

            </asp:Panel>
        </asp:Panel>

    </form>
</body>
</html>
