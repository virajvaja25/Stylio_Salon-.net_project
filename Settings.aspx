<%@ Page Title="Stylio | Settings" Language="C#" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="Stylio_Salon.Settings" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Settings</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
</head>
<body>
    <form id="frmSettings" runat="server">

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
                        CssClass="dropdown-item" OnClick="lnkMyProfile_Click" />
                    <asp:LinkButton ID="lnkMenuSetting" runat="server" Text="Setting"
                        CssClass="dropdown-item nav-link-active" OnClick="lnkSetting_Click" />
                </asp:Panel>
            </asp:Panel>

        </asp:Panel>

        <!-- ===================== PAGE BODY ===================== -->
        <asp:Panel ID="pnlPageBody" runat="server" CssClass="auth-page-body">
            <asp:Panel ID="pnlSettingsCard" runat="server" CssClass="auth-card">

                <asp:Label ID="lblPageTitle" runat="server" CssClass="auth-title" Text="Settings" />

                <!-- Success Message -->
                <asp:Panel ID="pnlSuccess" runat="server" Visible="false">
                    <asp:Label ID="lblSuccess" runat="server" CssClass="summary-error"
                        Style="color:#2e7d32;"
                        Text="Settings saved successfully!" />
                </asp:Panel>

                <!-- Change Password -->
                <asp:Panel ID="pnlCurrentPassword" runat="server" CssClass="form-group">
                    <asp:Label ID="lblCurrentPassword" runat="server" CssClass="form-label"
                        AssociatedControlID="txtCurrentPassword" Text="Current Password" />
                    <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-input"
                        TextMode="Password" placeholder="Enter current password" />
                </asp:Panel>

                <asp:Panel ID="pnlNewPassword" runat="server" CssClass="form-group">
                    <asp:Label ID="lblNewPassword" runat="server" CssClass="form-label"
                        AssociatedControlID="txtNewPassword" Text="New Password" />
                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-input"
                        TextMode="Password" placeholder="Enter new password" />
                    <asp:RegularExpressionValidator ID="revNewPassword" runat="server"
                        ControlToValidate="txtNewPassword"
                        ValidationExpression=".{6,}"
                        ErrorMessage="Password must be at least 6 characters."
                        CssClass="field-error" Display="Dynamic" />
                </asp:Panel>

                <asp:Panel ID="pnlConfirmPassword" runat="server" CssClass="form-group">
                    <asp:Label ID="lblConfirmPassword" runat="server" CssClass="form-label"
                        AssociatedControlID="txtConfirmPassword" Text="Confirm New Password" />
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-input"
                        TextMode="Password" placeholder="Re-enter new password" />
                    <asp:CompareValidator ID="cvConfirmPassword" runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ControlToCompare="txtNewPassword"
                        ErrorMessage="Passwords do not match."
                        CssClass="field-error" Display="Dynamic" />
                </asp:Panel>

                <!-- Notification Preference -->
                <asp:Panel ID="pnlNotifications" runat="server" CssClass="form-group">
                    <asp:Label ID="lblNotifications" runat="server" CssClass="form-label"
                        Text="Email Notifications" />
                    <asp:CheckBox ID="chkEmailNotifications" runat="server"
                        Text="  Receive booking confirmations &amp; reminders by email"
                        Checked="true" />
                </asp:Panel>

                <!-- Save Button -->
                <asp:Button ID="btnSaveSettings" runat="server" Text="Save Settings"
                    CssClass="btn-primary-wide" OnClick="btnSaveSettings_Click" />

                <!-- Logout -->
                <asp:Panel ID="pnlLogoutRow" runat="server" CssClass="auth-footer-row"
                    Style="margin-top:20px;">
                    <asp:LinkButton ID="lnkLogout" runat="server"
                        Text="Logout" CssClass="link-accent"
                        OnClick="lnkLogout_Click" />
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
