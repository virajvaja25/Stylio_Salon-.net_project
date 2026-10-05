<%@ Page Title="Stylio | My Profile" Language="C#" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="Stylio_Salon.MyProfile" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - My Profile</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
</head>
<body>
    <form id="frmMyProfile" runat="server">

        <!-- ===================== HEADER ===================== -->
        <asp:Panel ID="pnlHeader" runat="server" CssClass="header">

            <asp:Panel ID="pnlLogoArea" runat="server" CssClass="logo-area">
                <asp:Image ID="imgLogo" runat="server"
                    ImageUrl="~/Images/DefaultScreen/logo.png"
                    AlternateText="Stylio Logo" CssClass="logo-img" />
            </asp:Panel>

            <asp:Panel ID="pnlNav" runat="server" CssClass="nav-links">
                <asp:LinkButton ID="lnkHome" runat="server" Text="Home"
                    CssClass="nav-link" OnClick="lnkHome_Click" />
                <asp:LinkButton ID="lnkServices" runat="server" Text="Services"
                    CssClass="nav-link" OnClick="lnkServices_Click" />
                <asp:LinkButton ID="lnkSalon" runat="server" Text="Salon"
                    CssClass="nav-link" OnClick="lnkSalon_Click" />
            </asp:Panel>

            <asp:Panel ID="pnlUserArea" runat="server" CssClass="user-area" Style="position:relative;">
                <asp:Image ID="imgUserAvatar" runat="server"
                    ImageUrl="~/Images/DefaultScreen/Group.png"
                    AlternateText="User" CssClass="user-avatar" />
                <asp:LinkButton ID="lnkUserToggle" runat="server" CssClass="user-name"
                    OnClick="lnkUserToggle_Click">
                    <asp:Label ID="lblUserName" runat="server" Text="Khush Dobariya" />
                </asp:LinkButton>

                <asp:Panel ID="pnlUserDropdown" runat="server" CssClass="user-dropdown" Visible="false">
                    <asp:LinkButton ID="lnkMenuReviews" runat="server" Text="Reviews"
                        CssClass="dropdown-item" OnClick="lnkReviews_Click" />
                    <asp:LinkButton ID="lnkMenuAboutUs" runat="server" Text="About Us"
                        CssClass="dropdown-item" OnClick="lnkAboutUs_Click" />
                    <asp:LinkButton ID="lnkMenuMyProfile" runat="server" Text="My Profile"
                        CssClass="dropdown-item nav-link-active" OnClick="lnkMyProfile_Click" />
                    <asp:LinkButton ID="lnkMenuSetting" runat="server" Text="Setting"
                        CssClass="dropdown-item" OnClick="lnkSetting_Click" />
                </asp:Panel>
            </asp:Panel>

        </asp:Panel>

        <!-- ===================== PAGE BODY ===================== -->
        <asp:Panel ID="pnlPageBody" runat="server" CssClass="auth-page-body">
            <asp:Panel ID="pnlProfileCard" runat="server" CssClass="auth-card">

                <asp:Label ID="lblPageTitle" runat="server" CssClass="auth-title" Text="My Profile" />

                <!-- Success message -->
                <asp:Panel ID="pnlSuccess" runat="server" Visible="false">
                    <asp:Label ID="lblSuccess" runat="server" CssClass="summary-error"
                        Style="color:#2e7d32;"
                        Text="Profile updated successfully!" />
                </asp:Panel>

                <!-- Full Name -->
                <asp:Panel ID="pnlFullName" runat="server" CssClass="form-group">
                    <asp:Label ID="lblFullName" runat="server" CssClass="form-label"
                        AssociatedControlID="txtFullName" Text="Full Name" />
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-input"
                        placeholder="Enter your full name" />
                    <asp:RequiredFieldValidator ID="rfvFullName" runat="server"
                        ControlToValidate="txtFullName"
                        ErrorMessage="Full name is required."
                        CssClass="field-error" Display="Dynamic" />
                </asp:Panel>

                <!-- Email -->
                <asp:Panel ID="pnlEmail" runat="server" CssClass="form-group">
                    <asp:Label ID="lblEmail" runat="server" CssClass="form-label"
                        AssociatedControlID="txtEmail" Text="Email Address" />
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input"
                        TextMode="Email" placeholder="Enter your email" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email is required."
                        CssClass="field-error" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                        ErrorMessage="Enter a valid email address."
                        CssClass="field-error" Display="Dynamic" />
                </asp:Panel>

                <!-- Mobile -->
                <asp:Panel ID="pnlMobile" runat="server" CssClass="form-group">
                    <asp:Label ID="lblMobile" runat="server" CssClass="form-label"
                        AssociatedControlID="txtMobile" Text="Mobile Number" />
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-input"
                        TextMode="Phone" placeholder="Enter your mobile number" />
                </asp:Panel>

                <!-- Save Button -->
                <asp:Button ID="btnSaveProfile" runat="server" Text="Save Changes"
                    CssClass="btn-primary-wide" OnClick="btnSaveProfile_Click" />

                <!-- Back to Home -->
                <asp:Panel ID="pnlBackRow" runat="server" CssClass="auth-footer-row">
                    <asp:LinkButton ID="lnkBackHome" runat="server" Text="&larr; Back to Home"
                        CssClass="link-accent" OnClick="lnkHome_Click" />
                </asp:Panel>

            </asp:Panel>
        </asp:Panel>

        <!-- ===================== FOOTER ===================== -->
        <asp:Panel ID="pnlFooter" runat="server" CssClass="footer">
            <asp:Panel ID="pnlFooterBottom" runat="server" CssClass="footer-bottom">
                <asp:Label ID="lblCopyright" runat="server"
                    Text="&#169; 2026 Stylio Salon. All Right Reserved." />
            </asp:Panel>
        </asp:Panel>

    </form>
</body>
</html>
