<%@ Page Title="Stylio | Register" Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Stylio_Salon.Register" %>

<%@ Register TagPrefix="uc" TagName="Header" Src="~/SiteHeader.ascx" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Register</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
</head>
<body>
    <form id="frmRegister" runat="server">

        <uc:Header ID="ctrlHeader" runat="server" />

        <asp:Panel ID="pnlAuthBody" runat="server" CssClass="auth-page-body">
            <asp:Panel ID="pnlAuthCard" runat="server" CssClass="auth-card">

                <asp:Label ID="lblTitle" runat="server" CssClass="auth-title" Text="Register" />

                <asp:Panel ID="pnlFullNameGroup" runat="server" CssClass="form-group">
                    <asp:Label ID="lblFullName" runat="server" AssociatedControlID="txtFullName"
                        CssClass="form-label" Text="Full Name" />
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-input"
                        placeholder="Enter Your Full Name" />
                </asp:Panel>

                <asp:Panel ID="pnlEmailGroup" runat="server" CssClass="form-group">
                    <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail"
                        CssClass="form-label" Text="Email Address" />
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input"
                        TextMode="Email" placeholder="Enter Your Email" />
                </asp:Panel>

                <asp:Panel ID="pnlMobileGroup" runat="server" CssClass="form-group">
                    <asp:Label ID="lblMobile" runat="server" AssociatedControlID="txtMobile"
                        CssClass="form-label" Text="Mobile Number" />
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-input"
                        TextMode="Phone" placeholder="Enter Your Number" />
                </asp:Panel>

                <asp:Panel ID="pnlPasswordGroup" runat="server" CssClass="form-group">
                    <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword"
                        CssClass="form-label" Text="Password" />
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input"
                        TextMode="Password" placeholder="Enter Your Password" />
                </asp:Panel>

                <asp:Panel ID="pnlConfirmPasswordGroup" runat="server" CssClass="form-group">
                    <asp:Label ID="lblConfirmPassword" runat="server" AssociatedControlID="txtConfirmPassword"
                        CssClass="form-label" Text="Confirm Password" />
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-input"
                        TextMode="Password" placeholder="Confirm Your Password" />
                </asp:Panel>

                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-primary-wide"
                    OnClick="btnRegister_Click" />

                <asp:Panel ID="pnlLoginRow" runat="server" CssClass="auth-footer-row">
                    <asp:Label ID="lblHaveAccount" runat="server" Text="Already have an account ? " />
                    <asp:LinkButton ID="lnkLogin" runat="server" Text="Login"
                        CssClass="link-accent" OnClick="lnkLogin_Click" />
                </asp:Panel>

            </asp:Panel>
        </asp:Panel>

    </form>
</body>
</html>
