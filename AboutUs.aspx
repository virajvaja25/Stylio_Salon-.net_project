<%@ Page Title="Stylio | About Us" Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Stylio_Salon.AboutUs" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - About Us</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
    <link rel="stylesheet" type="text/css" href="Styles/AboutUs.css" />
</head>
<body>
    <form id="frmAboutUs" runat="server">

        <!-- ===================== HEADER ===================== -->
        <asp:Panel ID="pnlHeader" runat="server" CssClass="header">

            <asp:Panel ID="pnlLogoArea" runat="server" CssClass="logo-area">
                <asp:Image ID="imgLogo" runat="server"
                    ImageUrl="~/Images/DefaultScreen/logo.png"
                    AlternateText="Stylio Logo" CssClass="logo-img" />
            </asp:Panel>

            <asp:Panel ID="pnlNav" runat="server" CssClass="nav-links">
                <asp:LinkButton ID="lnkHome"     runat="server" Text="Home"     CssClass="nav-link"            OnClick="lnkHome_Click" />
                <asp:LinkButton ID="lnkServices" runat="server" Text="Services" CssClass="nav-link"            OnClick="lnkServices_Click" />
                <asp:LinkButton ID="lnkSalon"    runat="server" Text="Salon"    CssClass="nav-link"            OnClick="lnkSalon_Click" />
                <asp:LinkButton ID="lnkReviews"  runat="server" Text="Reviews"  CssClass="nav-link"            OnClick="lnkReviews_Click" />
                <asp:LinkButton ID="lnkAboutUs"  runat="server" Text="About Us" CssClass="nav-link nav-link-active" OnClick="lnkAboutUs_Click" />
            </asp:Panel>

            <%-- Guest buttons (hidden when logged-in via code-behind) --%>
            <asp:Panel ID="pnlUserArea" runat="server" CssClass="guest-user-area">
                <asp:Button ID="btnLogin"    runat="server" Text="Login"    CssClass="btn-nav-login"    OnClick="btnLogin_Click" />
                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-nav-register" OnClick="btnRegister_Click" />
            </asp:Panel>

        </asp:Panel>

        <!-- ===================== ABOUT HERO (two-column) ===================== -->
        <asp:Panel ID="pnlAboutHero" runat="server" CssClass="about-hero-section">

            <!-- Left: text -->
            <asp:Panel ID="pnlAboutTextCol" runat="server" CssClass="about-text-col">
                <asp:Label ID="lblAboutTitle" runat="server"
                    CssClass="about-main-title" Text="About Stylio" />
                <asp:Label ID="lblAboutTagline" runat="server"
                    CssClass="about-tagline" Text="Your Style, Our Passion" />
                <asp:Panel ID="pnlDivider" runat="server" CssClass="about-divider" />
                <asp:Label ID="lblAboutDesc" runat="server" CssClass="about-desc"
                    Text="Stylio Men&#39;s Salon offers professional grooming services in a clean, stylish, and relaxing environment. We provide haircuts, beard styling, facials, and spa treatments to help you look smart and feel confident every day." />
            </asp:Panel>

            <!-- Right: salon image -->
            <asp:Panel ID="pnlAboutImgCol" runat="server" CssClass="about-img-col">
                <asp:Image ID="imgAboutSalon" runat="server"
                    ImageUrl="~/Images/DefaultScreen/hero-salon.png"
                    AlternateText="Stylio Salon Interior"
                    CssClass="about-salon-img" />
            </asp:Panel>

        </asp:Panel>

        <!-- ===================== WHY CHOOSE STYLIO ===================== -->
        <asp:Panel ID="pnlWhySection" runat="server" CssClass="why-section">

            <asp:Label ID="lblWhyTitle" runat="server"
                CssClass="why-title" Text="Why Choose Stylio ?" />

            <asp:Panel ID="pnlFeatureGrid" runat="server" CssClass="feature-grid">

                <!-- Card 1: Expert Stylists -->
                <asp:Panel ID="pnlCard1" runat="server" CssClass="feature-card">
                    <asp:Panel ID="pnlIcon1" runat="server" CssClass="feature-icon-circle">
                        <asp:Label ID="lblIcon1" runat="server" CssClass="feature-icon-text" Text="&#128100;" />
                    </asp:Panel>
                    <asp:Label ID="lblCard1Title" runat="server"
                        CssClass="feature-card-title" Text="Expert Stylists" />
                    <asp:Label ID="lblCard1Desc" runat="server"
                        CssClass="feature-card-desc" Text="Skilled Professionals for the best result." />
                </asp:Panel>

                <!-- Card 2: Hygienic Service -->
                <asp:Panel ID="pnlCard2" runat="server" CssClass="feature-card">
                    <asp:Panel ID="pnlIcon2" runat="server" CssClass="feature-icon-circle">
                        <asp:Label ID="lblIcon2" runat="server" CssClass="feature-icon-text" Text="&#128737;" />
                    </asp:Panel>
                    <asp:Label ID="lblCard2Title" runat="server"
                        CssClass="feature-card-title" Text="Hygienic Service" />
                    <asp:Label ID="lblCard2Desc" runat="server"
                        CssClass="feature-card-desc" Text="Clean and sanitized environment." />
                </asp:Panel>

                <!-- Card 3: Easy Booking -->
                <asp:Panel ID="pnlCard3" runat="server" CssClass="feature-card">
                    <asp:Panel ID="pnlIcon3" runat="server" CssClass="feature-icon-circle">
                        <asp:Label ID="lblIcon3" runat="server" CssClass="feature-icon-text" Text="&#128197;" />
                    </asp:Panel>
                    <asp:Label ID="lblCard3Title" runat="server"
                        CssClass="feature-card-title" Text="Easy Booking" />
                    <asp:Label ID="lblCard3Desc" runat="server"
                        CssClass="feature-card-desc" Text="Book your appointment quickly and easily." />
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
                            ImageUrl="~/Images/DefaultScreen/logo.png"
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
                    <asp:LinkButton ID="lnkFooterHome"    runat="server" Text="Home"     CssClass="footer-link" OnClick="lnkHome_Click" />
                    <asp:LinkButton ID="lnkFooterServices" runat="server" Text="Services" CssClass="footer-link" OnClick="lnkServices_Click" />
                    <asp:LinkButton ID="lnkFooterSalons"  runat="server" Text="Salons"   CssClass="footer-link" OnClick="lnkSalon_Click" />
                    <asp:LinkButton ID="lnkFooterAboutUs" runat="server" Text="About us" CssClass="footer-link" OnClick="lnkAboutUs_Click" />
                </asp:Panel>

                <!-- Customer -->
                <asp:Panel ID="pnlFooterCustomer" runat="server">
                    <asp:Label ID="lblCustomerTitle" runat="server"
                        CssClass="footer-col-title" Text="Customer" />
                    <asp:LinkButton ID="lnkFooterMyBooking" runat="server" Text="My Booking" CssClass="footer-link"            OnClick="btnLogin_Click" />
                    <asp:LinkButton ID="lnkFooterReviews"   runat="server" Text="Reviews"    CssClass="footer-link footer-link-bold" OnClick="lnkReviews_Click" />
                    <asp:LinkButton ID="lnkFooterContact"   runat="server" Text="Contact"    CssClass="footer-link"            OnClick="lnkAboutUs_Click" />
                </asp:Panel>

                <!-- Support -->
                <asp:Panel ID="pnlFooterSupport" runat="server">
                    <asp:Label ID="lblSupportTitle" runat="server"
                        CssClass="footer-col-title" Text="Support" />
                    <asp:LinkButton ID="lnkFooterHelp"         runat="server" Text="Help center"        CssClass="footer-link" />
                    <asp:LinkButton ID="lnkFooterPrivacy"      runat="server" Text="Privacy Policy"     CssClass="footer-link" />
                    <asp:LinkButton ID="lnkFooterCancellation" runat="server" Text="Cancellation Policy" CssClass="footer-link" />
                </asp:Panel>

                <!-- Follow Us -->
                <asp:Panel ID="pnlFooterSocial" runat="server">
                    <asp:Label ID="lblFollowUsTitle" runat="server"
                        CssClass="footer-col-title" Text="Follow Us" />
                    <asp:Panel ID="pnlSocialRow" runat="server" CssClass="footer-social-row">
                        <asp:HyperLink ID="hlFacebook"  runat="server" NavigateUrl="#" CssClass="footer-social-icon" Text="f" />
                        <asp:HyperLink ID="hlInstagram" runat="server" NavigateUrl="#" CssClass="footer-social-icon" Text="ig" />
                        <asp:HyperLink ID="hlTwitter"   runat="server" NavigateUrl="#" CssClass="footer-social-icon" Text="x" />
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
