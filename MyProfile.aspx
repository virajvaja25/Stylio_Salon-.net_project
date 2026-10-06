<%@ Page Title="Stylio | Profile" Language="C#" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="Stylio_Salon.MyProfile" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Profile</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
    <link rel="stylesheet" type="text/css" href="Styles/Account.css" />
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
                <asp:LinkButton ID="lnkHome" runat="server" Text="Home" CssClass="nav-link" OnClick="lnkHome_Click" />
                <asp:LinkButton ID="lnkServices" runat="server" Text="Services" CssClass="nav-link" OnClick="lnkServices_Click" />
                <asp:LinkButton ID="lnkSalon" runat="server" Text="Salon" CssClass="nav-link" OnClick="lnkSalon_Click" />
            </asp:Panel>

        </asp:Panel>

        <!-- ===================== PAGE CONTAINER ===================== -->
        <asp:Panel ID="pnlAccountPage" runat="server" CssClass="account-page-container">

            <!-- Title -->
            <asp:Label ID="lblPageTitle" runat="server" CssClass="account-main-title" Text="Profile" />

            <asp:Panel ID="pnlContentWrapper" runat="server" CssClass="account-content-wrapper">

                <!-- ========== LEFT: SIDEBAR MENU CARD ========== -->
                <asp:Panel ID="pnlSidebar" runat="server" CssClass="account-sidebar-card">

                    <!-- My Profile (Active) -->
                    <asp:LinkButton ID="lnkSideProfile" runat="server" CssClass="sidebar-nav-item sidebar-nav-active" OnClick="lnkSideProfile_Click">
                        <asp:Label ID="lblIconProfile" runat="server" CssClass="sidebar-item-icon" Text="&#128100;" />
                        <asp:Label ID="lblTextProfile" runat="server" CssClass="sidebar-item-text" Text="My Profile" />
                    </asp:LinkButton>

                    <!-- My Booking -->
                    <asp:LinkButton ID="lnkSideBooking" runat="server" CssClass="sidebar-nav-item" OnClick="lnkSideBooking_Click">
                        <asp:Label ID="lblIconBooking" runat="server" CssClass="sidebar-item-icon" Text="&#128197;" />
                        <asp:Label ID="lblTextBooking" runat="server" CssClass="sidebar-item-text" Text="My Booking" />
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

                <!-- ========== RIGHT: MAIN PROFILE CARD ========== -->
                <asp:Panel ID="pnlProfileCard" runat="server" CssClass="profile-main-card">

                    <!-- Avatar -->
                    <asp:Panel ID="pnlAvatarWrapper" runat="server" CssClass="profile-avatar-wrapper">
                        <asp:Panel ID="pnlAvatarCircle" runat="server" CssClass="profile-avatar-circle">
                            <asp:Label ID="lblAvatarIcon" runat="server" Text="&#128100;" />
                        </asp:Panel>
                    </asp:Panel>

                    <!-- User Name -->
                    <asp:Label ID="lblProfileName" runat="server" CssClass="profile-user-name" Text="Khush Patel" />

                    <!-- User Contact Details -->
                    <asp:Panel ID="pnlProfileInfoGroup" runat="server" CssClass="profile-info-group">

                        <!-- Email -->
                        <asp:Panel ID="pnlEmailRow" runat="server" CssClass="profile-info-row">
                            <asp:Label ID="lblEmailIcon" runat="server" CssClass="profile-info-icon" Text="&#9993;" />
                            <asp:Label ID="lblProfileEmail" runat="server" CssClass="profile-info-text" Text="Khushdobariya2682007@gmail.com" />
                        </asp:Panel>

                        <!-- Phone -->
                        <asp:Panel ID="pnlPhoneRow" runat="server" CssClass="profile-info-row">
                            <asp:Label ID="lblPhoneIcon" runat="server" CssClass="profile-info-icon" Text="&#128222;" />
                            <asp:Label ID="lblProfilePhone" runat="server" CssClass="profile-info-text" Text="+91 8160689908" />
                        </asp:Panel>

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
                        <asp:Image ID="imgFooterLogo" runat="server"
                            ImageUrl="~/Images/DefaultScreen/footer.png"
                            AlternateText="Stylio" CssClass="logo-img" />
                        <asp:Label ID="lblFooterBrand" runat="server"
                            CssClass="footer-logo-text" Text="Stylio" />
                    </asp:Panel>
                    <asp:Label ID="lblFooterTagline" runat="server" CssClass="footer-tagline"
                        Text="Your Beauty is Our Passion Book Appointments with Top Salon &amp; Professional." />
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

                <!-- Support -->
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
                    Text="&#169; 2026 Stylio Salon. All Right Reserved." />
            </asp:Panel>

        </asp:Panel>

    </form>
</body>
</html>
