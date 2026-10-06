<%@ Page Title="Stylio | Settings" Language="C#" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="Stylio_Salon.Settings" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Settings</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
    <link rel="stylesheet" type="text/css" href="Styles/Account.css" />
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
                <asp:LinkButton ID="lnkHome" runat="server" Text="Home" CssClass="nav-link" OnClick="lnkHome_Click" />
                <asp:LinkButton ID="lnkServices" runat="server" Text="Services" CssClass="nav-link" OnClick="lnkServices_Click" />
                <asp:LinkButton ID="lnkSalon" runat="server" Text="Salon" CssClass="nav-link" OnClick="lnkSalon_Click" />
            </asp:Panel>

        </asp:Panel>

        <!-- ===================== PAGE CONTAINER ===================== -->
        <asp:Panel ID="pnlAccountPage" runat="server" CssClass="account-page-container">

            <!-- Title -->
            <asp:Label ID="lblPageTitle" runat="server" CssClass="account-main-title" Text="Settings" />

            <asp:Panel ID="pnlContentWrapper" runat="server" CssClass="account-content-wrapper">

                <!-- ========== LEFT: SIDEBAR MENU CARD ========== -->
                <asp:Panel ID="pnlSidebar" runat="server" CssClass="account-sidebar-card">

                    <!-- My Profile -->
                    <asp:LinkButton ID="lnkSideProfile" runat="server" CssClass="sidebar-nav-item" OnClick="lnkSideProfile_Click">
                        <asp:Label ID="lblIconProfile" runat="server" CssClass="sidebar-item-icon" Text="&#128100;" />
                        <asp:Label ID="lblTextProfile" runat="server" CssClass="sidebar-item-text" Text="My Profile" />
                    </asp:LinkButton>

                    <!-- My Booking -->
                    <asp:LinkButton ID="lnkSideBooking" runat="server" CssClass="sidebar-nav-item" OnClick="lnkSideBooking_Click">
                        <asp:Label ID="lblIconBooking" runat="server" CssClass="sidebar-item-icon" Text="&#128197;" />
                        <asp:Label ID="lblTextBooking" runat="server" CssClass="sidebar-item-text" Text="My Booking" />
                    </asp:LinkButton>

                    <!-- Settings (Active) -->
                    <asp:LinkButton ID="lnkSideSettings" runat="server" CssClass="sidebar-nav-item sidebar-nav-active" OnClick="lnkSideSettings_Click">
                        <asp:Label ID="lblIconSettings" runat="server" CssClass="sidebar-item-icon" Text="&#9881;" />
                        <asp:Label ID="lblTextSettings" runat="server" CssClass="sidebar-item-text" Text="Settings" />
                    </asp:LinkButton>

                    <!-- Payment History -->
                    <asp:LinkButton ID="lnkSidePayment" runat="server" CssClass="sidebar-nav-item" OnClick="lnkSidePayment_Click">
                        <asp:Label ID="lblIconPayment" runat="server" CssClass="sidebar-item-icon" Text="&#128179;" />
                        <asp:Label ID="lblTextPayment" runat="server" CssClass="sidebar-item-text" Text="Payment History" />
                    </asp:LinkButton>

                    <!-- Logout -->
                    <asp:LinkButton ID="lnkSideLogout" runat="server" CssClass="sidebar-nav-item" OnClick="lnkSideLogout_Click">
                        <asp:Label ID="lblIconLogout" runat="server" CssClass="sidebar-item-icon" Text="&#10148;" />
                        <asp:Label ID="lblTextLogout" runat="server" CssClass="sidebar-item-text" Text="Logout" />
                    </asp:LinkButton>

                </asp:Panel>

                <!-- ========== RIGHT: MAIN SETTINGS CARD ========== -->
                <asp:Panel ID="pnlSettingsCard" runat="server" CssClass="settings-main-card">

                    <asp:Label ID="lblSettingsCardTitle" runat="server" CssClass="settings-card-title" Text="Settings" />

                    <!-- Status / Feedback Message -->
                    <asp:Label ID="lblStatusMessage" runat="server" Visible="false" Style="margin-bottom:14px; font-size:14px; font-weight:600;" />

                    <!-- Options List -->
                    <asp:Panel ID="pnlOptionsList" runat="server" CssClass="settings-options-list">

                        <!-- Change Password Option -->
                        <asp:LinkButton ID="lnkOptionChangePassword" runat="server" CssClass="settings-option-item" OnClick="lnkOptionChangePassword_Click">
                            <asp:Panel ID="pnlPwdLeft" runat="server" CssClass="settings-option-left">
                                <asp:Label ID="lblLockIcon" runat="server" CssClass="settings-option-icon" Text="&#128274;" />
                                <asp:Label ID="lblChangePasswordText" runat="server" CssClass="settings-option-name" Text="Change Password" />
                            </asp:Panel>
                            <asp:Label ID="lblChevron1" runat="server" CssClass="settings-option-chevron" Text="&rsaquo;" />
                        </asp:LinkButton>

                        <asp:Panel ID="pnlDivider1" runat="server" CssClass="settings-option-divider" />

                    </asp:Panel>

                    <!-- Change Password Sub-panel (hidden by default) -->
                    <asp:Panel ID="pnlChangePasswordSub" runat="server" CssClass="settings-subpanel" Visible="false">

                        <asp:Panel ID="pnlCurrentPwdGroup" runat="server" CssClass="settings-form-group">
                            <asp:Label ID="lblCurrentPwd" runat="server" CssClass="settings-form-label" Text="Current Password" />
                            <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="settings-form-input" TextMode="Password" placeholder="Enter current password" />
                        </asp:Panel>

                        <asp:Panel ID="pnlNewPwdGroup" runat="server" CssClass="settings-form-group">
                            <asp:Label ID="lblNewPwd" runat="server" CssClass="settings-form-label" Text="New Password" />
                            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="settings-form-input" TextMode="Password" placeholder="Enter new password (min. 6 chars)" />
                        </asp:Panel>

                        <asp:Panel ID="pnlConfirmPwdGroup" runat="server" CssClass="settings-form-group">
                            <asp:Label ID="lblConfirmPwd" runat="server" CssClass="settings-form-label" Text="Confirm New Password" />
                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="settings-form-input" TextMode="Password" placeholder="Confirm new password" />
                        </asp:Panel>

                        <asp:Button ID="btnSavePassword" runat="server" Text="Save Password" CssClass="btn-settings-save" OnClick="btnSavePassword_Click" />

                    </asp:Panel>

                </asp:Panel>

            </asp:Panel>

        </asp:Panel>

        <!-- ===================== FOOTER ===================== -->
        <asp:Panel ID="pnlFooter" runat="server" CssClass="footer">

            <asp:Panel ID="pnlFooterColumns" runat="server" CssClass="footer-columns">

                <!-- Brand -->
                <asp:Panel ID="pnlFooterBrandCol" runat="server" CssClass="footer-brand-col">
                    <asp:Panel ID="pnlFooterLogoRow" runat="server" CssClass="footer-logo-row">
                        <asp:Image ID="imgFooterLogo" runat="server" ImageUrl="~/Images/DefaultScreen/logo.png"
                            AlternateText="Stylio Logo" CssClass="logo-img" />
                        <asp:Label ID="lblFooterBrand" runat="server" CssClass="footer-logo-text" Text="Stylio" />
                    </asp:Panel>
                    <asp:Label ID="lblFooterTagline" runat="server" CssClass="footer-tagline"
                        Text="Your Beauty is Our Passion. Book Appointments with Top Salon &amp; Professional." />
                </asp:Panel>

                <!-- Quick Links -->
                <asp:Panel ID="pnlFooterQuickLinks" runat="server">
                    <asp:Label ID="lblQuickLinksTitle" runat="server"
                        CssClass="footer-col-title" Text="Quick Links" />
                    <asp:LinkButton ID="lnkFooterHome" runat="server" Text="Home" CssClass="footer-link" OnClick="lnkHome_Click" />
                    <asp:LinkButton ID="lnkFooterServices" runat="server" Text="Services" CssClass="footer-link" OnClick="lnkServices_Click" />
                    <asp:LinkButton ID="lnkFooterSalons" runat="server" Text="Salons" CssClass="footer-link" OnClick="lnkSalon_Click" />
                    <asp:LinkButton ID="lnkFooterAboutUs" runat="server" Text="About us" CssClass="footer-link" OnClick="lnkAboutUs_Click" />
                </asp:Panel>

                <!-- Customer -->
                <asp:Panel ID="pnlFooterCustomer" runat="server">
                    <asp:Label ID="lblCustomerTitle" runat="server"
                        CssClass="footer-col-title" Text="Customer" />
                    <asp:LinkButton ID="lnkFooterMyBooking" runat="server" Text="My Booking" CssClass="footer-link" OnClick="lnkSideBooking_Click" />
                    <asp:LinkButton ID="lnkFooterReviews" runat="server" Text="Reviews" CssClass="footer-link" OnClick="lnkReviews_Click" />
                    <asp:LinkButton ID="lnkFooterContact" runat="server" Text="Contact" CssClass="footer-link" OnClick="lnkAboutUs_Click" />
                </asp:Panel>

                <!-- Support (Terms & Condition removed as requested) -->
                <asp:Panel ID="pnlFooterSupport" runat="server">
                    <asp:Label ID="lblSupportTitle" runat="server"
                        CssClass="footer-col-title" Text="Support" />
                    <asp:LinkButton ID="lnkFooterHelp" runat="server" Text="Help center" CssClass="footer-link" />
                    <asp:LinkButton ID="lnkFooterPrivacy" runat="server" Text="Privacy Policy" CssClass="footer-link" />
                    <asp:LinkButton ID="lnkFooterCancellation" runat="server" Text="Cancellation Policy" CssClass="footer-link" />
                </asp:Panel>

                <!-- Follow Us -->
                <asp:Panel ID="pnlFooterSocial" runat="server">
                    <asp:Label ID="lblFollowUsTitle" runat="server"
                        CssClass="footer-col-title" Text="Follow Us" />
                    <asp:Panel ID="pnlSocialRow" runat="server" CssClass="footer-social-row">
                        <asp:HyperLink ID="hlFacebook" runat="server" NavigateUrl="#" CssClass="footer-social-icon" Text="f" />
                        <asp:HyperLink ID="hlInstagram" runat="server" NavigateUrl="#" CssClass="footer-social-icon" Text="ig" />
                        <asp:HyperLink ID="hlTwitter" runat="server" NavigateUrl="#" CssClass="footer-social-icon" Text="x" />
                    </asp:Panel>
                </asp:Panel>

            </asp:Panel>

            <asp:Panel ID="pnlFooterBottom" runat="server" CssClass="footer-bottom">
                <asp:Label ID="lblCopyright" runat="server"
                    Text="&copy; 2026 Stylio. All rights reserved." />
            </asp:Panel>

        </asp:Panel>

    </form>
</body>
</html>
