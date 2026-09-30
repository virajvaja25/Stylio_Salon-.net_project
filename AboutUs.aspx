<%@ Page Title="Stylio | About Us" Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Stylio_Salon.AboutUs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - About Us</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
    <style>
        .about-banner {
            background-color: #E7D6BE;
            padding: 50px 60px;
            text-align: center;
        }
        .about-title {
            font-size: 38px;
            font-weight: bold;
            color: #241608;
            margin-bottom: 12px;
        }
        .about-subtitle {
            font-size: 18px;
            color: #5a4634;
            max-width: 680px;
            margin: 0 auto;
            line-height: 1.6;
        }
        .about-content-wrapper {
            max-width: 1200px;
            margin: 0 auto;
            padding: 60px 40px;
        }
        .story-section {
            display: flex;
            gap: 48px;
            align-items: center;
            margin-bottom: 60px;
            flex-wrap: wrap;
        }
        .story-text {
            flex: 1;
            min-width: 320px;
        }
        .story-heading {
            font-size: 28px;
            font-weight: bold;
            color: #241608;
            margin-bottom: 16px;
        }
        .story-paragraph {
            font-size: 16px;
            color: #554232;
            line-height: 1.8;
            margin-bottom: 16px;
        }
        .story-img-col {
            flex: 1;
            min-width: 320px;
        }
        .story-img {
            width: 100%;
            height: 340px;
            object-fit: cover;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.08);
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 24px;
            margin-bottom: 60px;
        }
        .stat-card {
            background-color: #FFFFFF;
            border-radius: 12px;
            padding: 30px 20px;
            text-align: center;
            box-shadow: 0 4px 16px rgba(0,0,0,0.05);
        }
        .stat-number {
            font-size: 36px;
            font-weight: bold;
            color: #C9A063;
            margin-bottom: 8px;
        }
        .stat-label {
            font-size: 16px;
            color: #5a4634;
        }
        .values-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 28px;
            margin-bottom: 60px;
        }
        .value-card {
            background-color: #FFFFFF;
            border-radius: 12px;
            padding: 28px 24px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.05);
        }
        .value-icon {
            font-size: 32px;
            margin-bottom: 14px;
        }
        .value-title {
            font-size: 20px;
            font-weight: bold;
            color: #241608;
            margin-bottom: 8px;
        }
        .value-desc {
            font-size: 15px;
            color: #6b5847;
            line-height: 1.6;
        }
        .partner-cta-card {
            background: linear-gradient(135deg, #3B2415, #241608);
            border-radius: 16px;
            padding: 44px 36px;
            color: #FFFFFF;
            text-align: center;
        }
        .partner-cta-title {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 12px;
            color: #F3E9DC;
        }
        .partner-cta-sub {
            font-size: 16px;
            color: #d9cbb8;
            max-width: 600px;
            margin: 0 auto 24px;
        }
        .btn-partner {
            background-color: #C9A063;
            color: #FFFFFF;
            padding: 12px 30px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
    </style>
</head>
<body>
    <form id="frmAboutUs" runat="server">

        <!-- ===================== HEADER ===================== -->
        <asp:Panel ID="pnlHeader" runat="server" CssClass="header">
            <asp:Panel ID="pnlLogoArea" runat="server" CssClass="logo-area">
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images/DefaultScreen/logo.png"
                    AlternateText="Stylio" CssClass="logo-img" />
                <asp:Label ID="lblBrandName" runat="server" CssClass="logo-text" />
            </asp:Panel>

            <asp:Panel ID="pnlNav" runat="server" CssClass="nav-links">
                <asp:LinkButton ID="lnkHome" runat="server" Text="Home" CssClass="nav-link" OnClick="lnkHome_Click" />
                <asp:LinkButton ID="lnkSalon" runat="server" Text="Salon" CssClass="nav-link" OnClick="lnkSalon_Click" />
                <asp:LinkButton ID="lnkServices" runat="server" Text="Services" CssClass="nav-link" OnClick="lnkServices_Click" />
                <asp:LinkButton ID="lnkReviews" runat="server" Text="Reviews" CssClass="nav-link" OnClick="lnkReviews_Click" />
                <asp:LinkButton ID="lnkAboutUs" runat="server" Text="About Us" CssClass="nav-link nav-link-active" OnClick="lnkAboutUs_Click" />
            </asp:Panel>

            <asp:Panel ID="pnlUserArea" runat="server" CssClass="guest-user-area">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-nav-login" OnClick="btnLogin_Click" />
                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-nav-register" OnClick="btnRegister_Click" />
            </asp:Panel>
        </asp:Panel>

        <!-- ===================== BANNER ===================== -->
        <asp:Panel ID="pnlBanner" runat="server" CssClass="about-banner">
            <asp:Label ID="lblAboutTitle" runat="server" CssClass="about-title" Text="About Stylio Salon" />
            <br />
            <asp:Label ID="lblAboutSubtitle" runat="server" CssClass="about-subtitle"
                Text="Empowering clients to discover, compare, and effortlessly book the finest salon and grooming experiences in their city." />
        </asp:Panel>

        <!-- ===================== MAIN CONTENT ===================== -->
        <div class="about-content-wrapper">

            <!-- Story Section -->
            <div class="story-section">
                <div class="story-text">
                    <div class="story-heading">Our Mission</div>
                    <p class="story-paragraph">
                        Stylio was built with a single goal: to simplify the salon booking journey for both clients and salon owners. No more waiting in long queues or calling back and forth to check stylist availability.
                    </p>
                    <p class="story-paragraph">
                        We connect you with certified grooming artists, verified hygiene standards, transparent pricing, and instant appointment confirmations across Rajkot, Surat, and expanding cities.
                    </p>
                </div>
                <div class="story-img-col">
                    <asp:Image ID="imgAboutHero" runat="server" ImageUrl="~/Images/DefaultScreen/hero-salon.png"
                        AlternateText="Salon Interior" CssClass="story-img" />
                </div>
            </div>

            <!-- Stats Grid -->
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-number">50+</div>
                    <div class="stat-label">Verified Salons</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">10,000+</div>
                    <div class="stat-label">Happy Clients</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">4.9 &#9733;</div>
                    <div class="stat-label">Average Rating</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">100%</div>
                    <div class="stat-label">Hygiene Assured</div>
                </div>
            </div>

            <!-- Core Values -->
            <div class="values-grid">
                <div class="value-card">
                    <div class="value-icon">&#10024;</div>
                    <div class="value-title">Verified Quality</div>
                    <div class="value-desc">Every partner salon passes our strict standards for sanitation, equipment, and professional staff.</div>
                </div>
                <div class="value-card">
                    <div class="value-icon">&#128176;</div>
                    <div class="value-title">Upfront Pricing</div>
                    <div class="value-desc">Zero hidden charges. What you see is what you pay when booking your appointment.</div>
                </div>
                <div class="value-card">
                    <div class="value-icon">&#9200;</div>
                    <div class="value-title">Zero Waiting Time</div>
                    <div class="value-desc">Book your guaranteed slot ahead of time and walk right into your styling chair.</div>
                </div>
            </div>

            <!-- Partner CTA -->
            <div class="partner-cta-card">
                <div class="partner-cta-title">Are You a Salon Owner?</div>
                <div class="partner-cta-sub">Join Stylio's growing network to receive more bookings, boost your online presence, and manage your appointments seamlessly.</div>
                <asp:Button ID="btnPartnerCTA" runat="server" Text="Explore Salons" CssClass="btn-partner" OnClick="btnPartnerCTA_Click" />
            </div>

        </div>

        <!-- ===================== FOOTER ===================== -->
        <asp:Panel ID="pnlFooter" runat="server" CssClass="footer">
            <asp:Panel ID="pnlFooterColumns" runat="server" CssClass="footer-columns">
                <asp:Panel ID="pnlFooterBrandCol" runat="server" CssClass="footer-brand-col">
                    <asp:Panel ID="pnlFooterLogoRow" runat="server" CssClass="footer-logo-row">
                        <asp:Image ID="imgFooterLogo" runat="server" ImageUrl="~/Images/DefaultScreen/logo.png"
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
                    <asp:LinkButton ID="lnkFooterLogin" runat="server" Text="Login" CssClass="footer-link" OnClick="btnLogin_Click" />
                    <asp:LinkButton ID="lnkFooterRegister" runat="server" Text="Register" CssClass="footer-link" OnClick="btnRegister_Click" />
                    <asp:LinkButton ID="lnkFooterReviews" runat="server" Text="Reviews" CssClass="footer-link" OnClick="lnkReviews_Click" />
                </asp:Panel>

                <asp:Panel ID="pnlFooterSupport" runat="server">
                    <asp:Label ID="lblSupportTitle" runat="server" CssClass="footer-col-title" Text="Support" />
                    <asp:Label runat="server" CssClass="footer-tagline" Text="Contact: contact@styliosalon.com" />
                </asp:Panel>
            </asp:Panel>

            <asp:Panel ID="pnlFooterBottom" runat="server" CssClass="footer-bottom">
                <asp:Label ID="lblCopyright" runat="server" Text="&#169; 2026 Stylio Salon. All Right Reserved." />
            </asp:Panel>
        </asp:Panel>

    </form>
</body>
</html>
