<%@ Page Title="Stylio | My Booking" Language="C#" AutoEventWireup="true" CodeBehind="MyBooking.aspx.cs" Inherits="Stylio_Salon.MyBooking" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - My Booking</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
    <link rel="stylesheet" type="text/css" href="Styles/MyBooking.css" />
</head>
<body>
    <form id="frmMyBooking" runat="server">

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
                <asp:LinkButton ID="lnkReviews" runat="server" Text="Reviews" CssClass="nav-link" OnClick="lnkReviews_Click" />
                <asp:LinkButton ID="lnkAboutUs" runat="server" Text="About Us" CssClass="nav-link" OnClick="lnkAboutUs_Click" />
            </asp:Panel>

        </asp:Panel>

        <!-- ===================== MAIN CONTAINER ===================== -->
        <asp:Panel ID="pnlBookingPage" runat="server" CssClass="booking-page-container">

            <!-- Title -->
            <asp:Label ID="lblPageTitle" runat="server" CssClass="booking-main-title" Text="My Booking" />

            <!-- Tabs: Upcoming / Past -->
            <asp:Panel ID="pnlTabsBar" runat="server" CssClass="booking-tabs-bar">
                <asp:LinkButton ID="btnTabUpcoming" runat="server" Text="Upcoming"
                    CssClass="booking-tab-btn booking-tab-active" OnClick="btnTabUpcoming_Click" />
                <asp:LinkButton ID="btnTabPast" runat="server" Text="Past"
                    CssClass="booking-tab-btn booking-tab-inactive" OnClick="btnTabPast_Click" />
            </asp:Panel>

            <!-- Status message (e.g. on cancellation) -->
            <asp:Label ID="lblStatusMessage" runat="server" Visible="false" Style="margin-bottom:16px; color:#C0392B; font-weight:600;" />

            <!-- ================= UPCOMING TAB CONTENT ================= -->
            <asp:Panel ID="pnlUpcomingContent" runat="server" CssClass="bookings-list-container">

                <!-- Newly Confirmed Booking Card (Dynamic from Payment) -->
                <asp:Panel ID="pnlConfirmedCard" runat="server" CssClass="mybooking-card" Visible="false" Style="border: 2px solid #5B2C6F;">
                    <asp:Image ID="imgConfirmed" runat="server"
                        ImageUrl="~/Images/new_booking.jpg"
                        AlternateText="Booked Service" CssClass="mybooking-card-img" />

                    <asp:Panel ID="pnlConfirmedBody" runat="server" CssClass="mybooking-card-content">
                        <asp:Panel ID="pnlConfirmedHeader" runat="server" CssClass="mybooking-card-header">
                            <asp:Label ID="lblConfirmedTitle" runat="server" CssClass="mybooking-service-title" Text="Hair Cut" />
                            <asp:Label ID="lblConfirmedBadge" runat="server" CssClass="badge-upcoming" Text="Confirmed" Style="background-color:#27AE60; color:#fff;" />
                        </asp:Panel>

                        <asp:Label ID="lblConfirmedStylist" runat="server" CssClass="mybooking-detail-line" Text="Senior Stylist" />
                        <asp:Label ID="lblConfirmedSalon" runat="server" CssClass="mybooking-detail-line" Text="Stylio Salon" />
                        <asp:Label ID="lblConfirmedDateTime" runat="server" CssClass="mybooking-datetime-line" Text="25-May-2026 | 04:30 PM" />
                        <asp:Label ID="lblConfirmedTotal" runat="server" CssClass="mybooking-detail-line" Style="color:#5B2C6F; font-weight:700; margin-top:4px;" Text="Total Paid: ₹338" />

                        <asp:Panel ID="pnlConfirmedAction" runat="server" CssClass="mybooking-action-row">
                            <asp:LinkButton ID="btnCancelConfirmed" runat="server" Text="Cancel Booking"
                                CssClass="btn-cancel-booking" OnClick="btnCancelBooking_Click" CommandArgument="confirmed" />
                        </asp:Panel>
                    </asp:Panel>
                </asp:Panel>

                <!-- Upcoming Card 1 -->
                <asp:Panel ID="pnlUpCard1" runat="server" CssClass="mybooking-card">
                    <asp:Image ID="imgUp1" runat="server"
                        ImageUrl="~/Images/haircut_booking.jpg"
                        AlternateText="Hair Cut" CssClass="mybooking-card-img" />

                    <asp:Panel ID="pnlUpBody1" runat="server" CssClass="mybooking-card-content">
                        <asp:Panel ID="pnlUpHeader1" runat="server" CssClass="mybooking-card-header">
                            <asp:Label ID="lblUpTitle1" runat="server" CssClass="mybooking-service-title" Text="Hair Cut" />
                            <asp:Label ID="lblUpBadge1" runat="server" CssClass="badge-upcoming" Text="Upcoming" />
                        </asp:Panel>

                        <asp:Label ID="lblUpStylist1" runat="server" CssClass="mybooking-detail-line" Text="Rohit(Senior Stylist)" />
                        <asp:Label ID="lblUpSalon1" runat="server" CssClass="mybooking-detail-line" Text="Stylio Salon" />
                        <asp:Label ID="lblUpDateTime1" runat="server" CssClass="mybooking-datetime-line" Text="25-May-2026 | 04:30 PM" />

                        <asp:Panel ID="pnlUpAction1" runat="server" CssClass="mybooking-action-row">
                            <asp:LinkButton ID="btnCancel1" runat="server" Text="Cancel Booking"
                                CssClass="btn-cancel-booking" OnClick="btnCancelBooking_Click" CommandArgument="1" />
                        </asp:Panel>
                    </asp:Panel>
                </asp:Panel>

                <!-- Upcoming Card 2 -->
                <asp:Panel ID="pnlUpCard2" runat="server" CssClass="mybooking-card">
                    <asp:Image ID="imgUp2" runat="server"
                        ImageUrl="~/Images/beard_booking.jpg"
                        AlternateText="Beard Styling" CssClass="mybooking-card-img" />

                    <asp:Panel ID="pnlUpBody2" runat="server" CssClass="mybooking-card-content">
                        <asp:Panel ID="pnlUpHeader2" runat="server" CssClass="mybooking-card-header">
                            <asp:Label ID="lblUpTitle2" runat="server" CssClass="mybooking-service-title" Text="Beard Styling" />
                            <asp:Label ID="lblUpBadge2" runat="server" CssClass="badge-upcoming" Text="Upcoming" />
                        </asp:Panel>

                        <asp:Label ID="lblUpStylist2" runat="server" CssClass="mybooking-detail-line" Text="Aman(Beard Expert)" />
                        <asp:Label ID="lblUpSalon2" runat="server" CssClass="mybooking-detail-line" Text="Stylio Salon" />
                        <asp:Label ID="lblUpDateTime2" runat="server" CssClass="mybooking-datetime-line" Text="28-May-2026 | 11:30 PM" />

                        <asp:Panel ID="pnlUpAction2" runat="server" CssClass="mybooking-action-row">
                            <asp:LinkButton ID="btnCancel2" runat="server" Text="Cancel Booking"
                                CssClass="btn-cancel-booking" OnClick="btnCancelBooking_Click" CommandArgument="2" />
                        </asp:Panel>
                    </asp:Panel>
                </asp:Panel>

            </asp:Panel>

            <!-- ================= PAST TAB CONTENT ================= -->
            <asp:Panel ID="pnlPastContent" runat="server" CssClass="bookings-list-container" Visible="false">

                <!-- Past Card 1 -->
                <asp:Panel ID="pnlPastCard1" runat="server" CssClass="mybooking-card">
                    <asp:Image ID="imgPast1" runat="server"
                        ImageUrl="~/Images/haircut_booking.jpg"
                        AlternateText="Hair Cut" CssClass="mybooking-card-img" />

                    <asp:Panel ID="pnlPastBody1" runat="server" CssClass="mybooking-card-content">
                        <asp:Panel ID="pnlPastHeader1" runat="server" CssClass="mybooking-card-header">
                            <asp:Label ID="lblPastTitle1" runat="server" CssClass="mybooking-service-title" Text="Hair Cut" />
                            <asp:Label ID="lblPastBadge1" runat="server" CssClass="badge-completed" Text="Completed" />
                        </asp:Panel>

                        <asp:Label ID="lblPastStylist1" runat="server" CssClass="mybooking-detail-line" Text="Rohit(Senior Stylist)" />
                        <asp:Label ID="lblPastSalon1" runat="server" CssClass="mybooking-detail-line" Text="Stylio Salon" />
                        <asp:Label ID="lblPastDateTime1" runat="server" CssClass="mybooking-datetime-line" Text="25-May-2026 | 04:30 PM" />
                    </asp:Panel>
                </asp:Panel>

                <!-- Past Card 2 -->
                <asp:Panel ID="pnlPastCard2" runat="server" CssClass="mybooking-card">
                    <asp:Image ID="imgPast2" runat="server"
                        ImageUrl="~/Images/beard_booking.jpg"
                        AlternateText="Beard Styling" CssClass="mybooking-card-img" />

                    <asp:Panel ID="pnlPastBody2" runat="server" CssClass="mybooking-card-content">
                        <asp:Panel ID="pnlPastHeader2" runat="server" CssClass="mybooking-card-header">
                            <asp:Label ID="lblPastTitle2" runat="server" CssClass="mybooking-service-title" Text="Beard Styling" />
                            <asp:Label ID="lblPastBadge2" runat="server" CssClass="badge-completed" Text="Completed" />
                        </asp:Panel>

                        <asp:Label ID="lblPastStylist2" runat="server" CssClass="mybooking-detail-line" Text="Aman(Beard Expert)" />
                        <asp:Label ID="lblPastSalon2" runat="server" CssClass="mybooking-detail-line" Text="Stylio Salon" />
                        <asp:Label ID="lblPastDateTime2" runat="server" CssClass="mybooking-datetime-line" Text="28-May-2026 | 11:30 PM" />
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
                    <asp:LinkButton ID="lnkFooterMyBooking" runat="server" Text="My Booking" CssClass="footer-link" OnClick="lnkFooterMyBooking_Click" />
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
