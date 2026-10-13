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

                <asp:Label ID="lblNoUpcoming" runat="server" CssClass="mybooking-detail-line"
                    Text="No upcoming bookings found." Visible="false" />

                <asp:Repeater ID="rptUpcoming" runat="server" OnItemCommand="rptUpcoming_ItemCommand">
                    <ItemTemplate>
                        <asp:Panel ID="pnlUpCard" runat="server" CssClass="mybooking-card">
                            <asp:Image ID="imgUp" runat="server"
                                ImageUrl='<%# GetImage(Eval("SalonImage")) %>'
                                AlternateText='<%# Eval("Services") %>' CssClass="mybooking-card-img" />

                            <asp:Panel ID="pnlUpBody" runat="server" CssClass="mybooking-card-content">
                                <asp:Panel ID="pnlUpHeader" runat="server" CssClass="mybooking-card-header">
                                    <asp:Label ID="lblUpTitle" runat="server" CssClass="mybooking-service-title" Text='<%# Eval("Services") %>' />
                                    <asp:Label ID="lblUpBadge" runat="server" CssClass="badge-upcoming" Text="Upcoming" />
                                </asp:Panel>

                                <asp:Label ID="lblUpSalon" runat="server" CssClass="mybooking-detail-line" Text='<%# Eval("SalonName") %>' />
                                <asp:Label ID="lblUpDateTime" runat="server" CssClass="mybooking-datetime-line" Text='<%# FormatDateTime(Eval("BookingDate"), Eval("BookingTime")) %>' />
                                <asp:Label ID="lblUpTotal" runat="server" CssClass="mybooking-detail-line" Style="color:#5B2C6F; font-weight:700; margin-top:4px;" Text='<%# "Total Paid: ₹" + Eval("TotalAmount") %>' />

                                <asp:Panel ID="pnlUpAction" runat="server" CssClass="mybooking-action-row">
                                    <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel Booking"
                                        CssClass="btn-cancel-booking" CommandName="cancel" CommandArgument='<%# Eval("BookingId") %>' />
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:Repeater>

            </asp:Panel>

            <!-- ================= PAST TAB CONTENT ================= -->
            <asp:Panel ID="pnlPastContent" runat="server" CssClass="bookings-list-container" Visible="false">

                <asp:Label ID="lblNoPast" runat="server" CssClass="mybooking-detail-line"
                    Text="No past bookings found." Visible="false" />

                <asp:Repeater ID="rptPast" runat="server">
                    <ItemTemplate>
                        <asp:Panel ID="pnlPastCard" runat="server" CssClass="mybooking-card">
                            <asp:Image ID="imgPast" runat="server"
                                ImageUrl='<%# GetImage(Eval("SalonImage")) %>'
                                AlternateText='<%# Eval("Services") %>' CssClass="mybooking-card-img" />

                            <asp:Panel ID="pnlPastBody" runat="server" CssClass="mybooking-card-content">
                                <asp:Panel ID="pnlPastHeader" runat="server" CssClass="mybooking-card-header">
                                    <asp:Label ID="lblPastTitle" runat="server" CssClass="mybooking-service-title" Text='<%# Eval("Services") %>' />
                                    <asp:Label ID="lblPastBadge" runat="server" CssClass="badge-completed" Text="Completed" />
                                </asp:Panel>

                                <asp:Label ID="lblPastSalon" runat="server" CssClass="mybooking-detail-line" Text='<%# Eval("SalonName") %>' />
                                <asp:Label ID="lblPastDateTime" runat="server" CssClass="mybooking-datetime-line" Text='<%# FormatDateTime(Eval("BookingDate"), Eval("BookingTime")) %>' />
                                <asp:Label ID="lblPastTotal" runat="server" CssClass="mybooking-detail-line" Style="color:#5B2C6F; font-weight:700; margin-top:4px;" Text='<%# "Total Paid: ₹" + Eval("TotalAmount") %>' />
                            </asp:Panel>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:Repeater>

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
