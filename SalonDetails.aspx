<%@ Page Title="Stylio | Salon Details" Language="C#" AutoEventWireup="true" CodeBehind="SalonDetails.aspx.cs" Inherits="Stylio_Salon.SalonDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Salon Details</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
    <link rel="stylesheet" type="text/css" href="Styles/SalonDetails.css" />
</head>
<body>
    <form id="frmMain" runat="server">

        <!-- ===================== HEADER ===================== -->
        <asp:Panel ID="pnlHeader" runat="server" CssClass="header">

            <asp:Panel ID="pnlLogoArea" runat="server" CssClass="logo-area">
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images/DefaultScreen/logo.png"
                    AlternateText="Stylio Logo" CssClass="logo-img" />
               
            </asp:Panel>

            <asp:Panel ID="pnlNav" runat="server" CssClass="nav-links">
                <asp:LinkButton ID="lnkHome" runat="server" Text="Home" CssClass="nav-link"
                    OnClick="lnkHome_Click" />
                <asp:LinkButton ID="lnkServices" runat="server" Text="Services" CssClass="nav-link"
                    OnClick="lnkServices_Click" />
                <asp:LinkButton ID="lnkSalon" runat="server" Text="Salon" CssClass="nav-link nav-link-active"
                    OnClick="lnkSalon_Click" />
                <asp:LinkButton ID="lnkReviews" runat="server" Text="Reviews" CssClass="nav-link"
                    OnClick="lnkReviews_Click" />
                <asp:LinkButton ID="lnkAboutUs" runat="server" Text="About Us" CssClass="nav-link"
                    OnClick="lnkAboutUs_Click" />
            </asp:Panel>

        </asp:Panel>

        <!-- ===================== HERO IMAGE ===================== -->
        <asp:Panel ID="pnlHeroWrapper" runat="server" CssClass="salon-details-hero-wrapper">
            <asp:Image ID="imgSalonHero" runat="server" CssClass="salon-details-hero-image"
                AlternateText="Salon Interior" />
        </asp:Panel>

        <!-- ===================== SALON INFO BAR ===================== -->
        <asp:Panel ID="pnlSalonInfoBar" runat="server" CssClass="salon-info-bar">

            <asp:Panel ID="pnlSalonInfoLeft" runat="server" CssClass="salon-info-left">

                <asp:Panel ID="pnlSalonNameRow" runat="server" CssClass="salon-name-row">
                    <asp:Label ID="lblSalonName" runat="server" CssClass="salon-details-name" />
                    <asp:Panel ID="pnlSalonRating" runat="server" CssClass="salon-details-rating">
                        <asp:Label ID="lblRatingStar" runat="server" Text="&#9733;" CssClass="rating-star" />
                        <asp:Label ID="lblSalonRating" runat="server" CssClass="rating-value" />
                    </asp:Panel>
                </asp:Panel>

                <asp:Panel ID="pnlSalonLocationRow" runat="server" CssClass="salon-detail-row">
                    <asp:Label ID="lblLocationPin" runat="server" Text="&#128205;" CssClass="detail-icon" />
                    <asp:Label ID="lblSalonLocation" runat="server" CssClass="detail-text" />
                </asp:Panel>

                <asp:Panel ID="pnlSalonHoursRow" runat="server" CssClass="salon-detail-row">
                    <asp:Label ID="lblHoursPin" runat="server" Text="&#128205;" CssClass="detail-icon" />
                    <asp:Label ID="lblOpenStatus" runat="server" Text="Open" CssClass="hours-open" />
                    <asp:Label ID="lblOpenTime" runat="server" CssClass="detail-text" />
                    <asp:Label ID="lblHoursSeparator" runat="server" Text="&#8226;" CssClass="detail-text" />
                    <asp:Label ID="lblCloseLabel" runat="server" Text="Close" CssClass="detail-text" />
                    <asp:Label ID="lblCloseTime" runat="server" CssClass="detail-text" />
                </asp:Panel>

            </asp:Panel>

            <asp:Panel ID="pnlSalonInfoRight" runat="server" CssClass="salon-info-right">
                <asp:Button ID="btnBookAppointment" runat="server" Text="Book Appointment"
                    CssClass="btn-book-appointment" OnClick="btnBookAppointment_Click" />
            </asp:Panel>

        </asp:Panel>

        <!-- ===================== TABS ===================== -->
        <asp:Panel ID="pnlTabsSection" runat="server" CssClass="salon-tabs-section">

            <asp:Panel ID="pnlTabsRow" runat="server" CssClass="salon-tabs-row">
                <asp:LinkButton ID="lnkTabAbout" runat="server" Text="About" CssClass="salon-tab salon-tab-active"
                    OnClick="lnkTabAbout_Click" />
                <asp:LinkButton ID="lnkTabServices" runat="server" Text="Services" CssClass="salon-tab"
                    OnClick="lnkTabServices_Click" />
                <asp:LinkButton ID="lnkTabReviews" runat="server" Text="Reviews" CssClass="salon-tab"
                    OnClick="lnkTabReviews_Click" />
            </asp:Panel>

            <!-- ---------------- ABOUT TAB CONTENT ---------------- -->
            <asp:Panel ID="pnlAboutTab" runat="server" CssClass="salon-tab-content">

                <asp:Label ID="lblSalonDescription" runat="server" CssClass="salon-description" />

                <asp:Label ID="lblOpeningHoursTitle" runat="server" Text="Opening Hours" CssClass="salon-section-title" />

                <asp:Panel ID="pnlWeekdayHours" runat="server" CssClass="salon-hours-line">
                    <asp:Label ID="lblWeekdayHours" runat="server" />
                </asp:Panel>

                <asp:Panel ID="pnlWeekendHours" runat="server" CssClass="salon-hours-line">
                    <asp:Label ID="lblWeekendHours" runat="server" />
                </asp:Panel>

                <asp:Label ID="lblPopularServicesTitle" runat="server" Text="Popular Services" CssClass="salon-section-title" />
                <asp:Label ID="lblPopularServices" runat="server" CssClass="salon-popular-services" />

            </asp:Panel>

            <!-- ---------------- SERVICES TAB CONTENT ---------------- -->
            <asp:Panel ID="pnlServicesTab" runat="server" CssClass="salon-tab-content" Visible="false">
                <asp:Repeater ID="rptSalonServices" runat="server">
                    <ItemTemplate>
                        <asp:Panel runat="server" CssClass="salon-service-row">
                            <asp:Label runat="server" Text='<%# Eval("Name") %>' CssClass="salon-service-name" />
                        </asp:Panel>
                    </ItemTemplate>
                </asp:Repeater>
            </asp:Panel>

            <!-- ---------------- REVIEWS TAB CONTENT ---------------- -->
            <asp:Panel ID="pnlReviewsTab" runat="server" CssClass="salon-tab-content" Visible="false">
                <asp:Repeater ID="rptSalonReviews" runat="server">
                    <ItemTemplate>
                        <asp:Panel runat="server" CssClass="salon-review-row">
                            <asp:Label runat="server" Text='<%# Eval("Name") %>' CssClass="salon-review-name" />
                            <asp:Label runat="server" Text='<%# Eval("Comment") %>' CssClass="salon-review-comment" />
                        </asp:Panel>
                    </ItemTemplate>
                </asp:Repeater>
            </asp:Panel>

        </asp:Panel>

        <!-- ===================== FOOTER ===================== -->
        <asp:Panel ID="pnlFooter" runat="server" CssClass="footer">

            <asp:Panel ID="pnlFooterColumns" runat="server" CssClass="footer-columns">

                <asp:Panel ID="pnlFooterBrandCol" runat="server" CssClass="footer-brand-col">
                    <asp:Panel ID="pnlFooterLogoRow" runat="server" CssClass="footer-logo-row">
                        <asp:Image ID="imgFooterLogo" runat="server" ImageUrl="~/Images/SalonScreen/logo.png"
                            AlternateText="Stylio" CssClass="logo-img" />
                        <asp:Label ID="lblFooterBrand" runat="server" CssClass="footer-logo-text" Text="Stylio" />
                    </asp:Panel>
                    <asp:Label ID="lblFooterTagline" runat="server" CssClass="footer-tagline"
                        Text="Your Beauty is Our Passion. Book Appointments with Top Salon &amp; Professional." />
                </asp:Panel>

                <asp:Panel ID="pnlFooterQuickLinks" runat="server">
                    <asp:Label ID="lblQuickLinksTitle" runat="server" CssClass="footer-col-title" Text="Quick Links" />
                    <asp:LinkButton ID="lnkFooterHome" runat="server" Text="Home" CssClass="footer-link" OnClick="lnkHome_Click" />
                    <asp:LinkButton ID="lnkFooterServices" runat="server" Text="Services" CssClass="footer-link" OnClick="lnkServices_Click" />
                    <asp:LinkButton ID="lnkFooterSalons" runat="server" Text="Salons" CssClass="footer-link" OnClick="lnkSalon_Click" />
                    <asp:LinkButton ID="lnkFooterAboutUs" runat="server" Text="About us" CssClass="footer-link" OnClick="lnkAboutUs_Click" />
                </asp:Panel>

                <asp:Panel ID="pnlFooterCustomer" runat="server">
                    <asp:Label ID="lblCustomerTitle" runat="server" CssClass="footer-col-title" Text="Customer" />
                    <asp:LinkButton ID="lnkFooterMyBooking" runat="server" Text="My Booking" CssClass="footer-link" />
                    <asp:LinkButton ID="lnkFooterReviews" runat="server" Text="Reviews" CssClass="footer-link" OnClick="lnkReviews_Click" />
                    <asp:LinkButton ID="lnkFooterContact" runat="server" Text="Contact" CssClass="footer-link" />
                </asp:Panel>

                <asp:Panel ID="pnlFooterSupport" runat="server">
                    <asp:Label ID="lblSupportTitle" runat="server" CssClass="footer-col-title" Text="Support" />
                    <asp:LinkButton ID="lnkFooterHelpCenter" runat="server" Text="Help center" CssClass="footer-link" />
                    <asp:LinkButton ID="lnkFooterPrivacy" runat="server" Text="Privacy Policy" CssClass="footer-link" />
                    <asp:LinkButton ID="lnkFooterCancellation" runat="server" Text="Cancellation Policy" CssClass="footer-link" />
                </asp:Panel>

                <asp:Panel ID="pnlFooterSocial" runat="server">
                    <asp:Label ID="lblFollowUsTitle" runat="server" CssClass="footer-col-title" Text="Follow Us" />
                    <asp:Panel ID="pnlSocialRow" runat="server" CssClass="footer-social-row">
                        <asp:HyperLink ID="hlFacebook" runat="server" NavigateUrl="#" CssClass="footer-social-icon" Text="f" />
                        <asp:HyperLink ID="hlInstagram" runat="server" NavigateUrl="#" CssClass="footer-social-icon" Text="ig" />
                        <asp:HyperLink ID="hlTwitter" runat="server" NavigateUrl="#" CssClass="footer-social-icon" Text="x" />
                    </asp:Panel>
                </asp:Panel>

            </asp:Panel>

            <asp:Panel ID="pnlFooterBottom" runat="server" CssClass="footer-bottom">
                <asp:Label ID="lblCopyright" runat="server" Text="&#169; 2026 Stylio Salon. All Right Reserved." />
            </asp:Panel>

        </asp:Panel>

    </form>
</body>
</html>
