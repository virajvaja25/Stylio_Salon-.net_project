<%@ Page Title="Stylio | Services" Language="C#" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="Stylio_Salon.Services" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Services</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
    <style>
        .services-header-banner {
            background-color: #E7D6BE;
            padding: 48px 60px;
            text-align: center;
        }
        .services-title {
            font-size: 38px;
            font-weight: bold;
            color: #241608;
            margin-bottom: 12px;
        }
        .services-subtitle {
            font-size: 18px;
            color: #5a4634;
            max-width: 650px;
            margin: 0 auto;
        }
        .services-grid-wrapper {
            padding: 50px 60px 80px;
            max-width: 1280px;
            margin: 0 auto;
        }
        .catalog-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 28px;
        }
        .catalog-card {
            background-color: #FFFFFF;
            border-radius: 14px;
            padding: 28px 24px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.06);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .catalog-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
        }
        .catalog-icon-wrapper {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 72px;
            height: 72px;
            background-color: #F8F2EA;
            border-radius: 50%;
            margin-bottom: 20px;
        }
        .catalog-icon {
            width: 42px;
            height: 42px;
            object-fit: contain;
        }
        .catalog-name {
            font-size: 22px;
            font-weight: bold;
            color: #241608;
            margin-bottom: 8px;
        }
        .catalog-desc {
            font-size: 15px;
            color: #6b5847;
            line-height: 1.5;
            margin-bottom: 16px;
            flex: 1;
        }
        .catalog-meta-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top: 1px solid #f0e6d8;
            padding-top: 14px;
            margin-bottom: 16px;
            font-size: 14px;
            color: #7a6652;
        }
        .catalog-price {
            font-weight: bold;
            color: #C9A063;
            font-size: 17px;
        }
        .btn-book-service {
            background-color: #C9A063;
            color: #FFFFFF;
            text-align: center;
            border: none;
            padding: 12px 0;
            border-radius: 8px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            font-family: inherit;
        }
        .btn-book-service:hover {
            background-color: #b3894f;
        }
    </style>
</head>
<body>
    <form id="frmServices" runat="server">

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
                <asp:LinkButton ID="lnkServices" runat="server" Text="Services" CssClass="nav-link nav-link-active" OnClick="lnkServices_Click" />
                <asp:LinkButton ID="lnkReviews" runat="server" Text="Reviews" CssClass="nav-link" OnClick="lnkReviews_Click" />
                <asp:LinkButton ID="lnkAboutUs" runat="server" Text="About Us" CssClass="nav-link" OnClick="lnkAboutUs_Click" />
            </asp:Panel>

            <asp:Panel ID="pnlUserArea" runat="server" CssClass="guest-user-area">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-nav-login" OnClick="btnLogin_Click" />
                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-nav-register" OnClick="btnRegister_Click" />
            </asp:Panel>
        </asp:Panel>

        <!-- ===================== BANNER ===================== -->
        <asp:Panel ID="pnlBanner" runat="server" CssClass="services-header-banner">
            <asp:Label ID="lblTitle" runat="server" CssClass="services-title" Text="Salon Services" />
            <br />
            <asp:Label ID="lblSubtitle" runat="server" CssClass="services-subtitle"
                Text="Explore top-rated grooming, styling, and wellness treatments from verified partner salons." />
        </asp:Panel>

        <!-- ===================== SERVICES GRID ===================== -->
        <asp:Panel ID="pnlGridWrapper" runat="server" CssClass="services-grid-wrapper">
            <div class="catalog-grid">
                <asp:Repeater ID="rptCatalog" runat="server" OnItemCommand="rptCatalog_ItemCommand">
                    <ItemTemplate>
                        <div class="catalog-card">
                            <div>
                                <div class="catalog-icon-wrapper">
                                    <asp:Image ID="imgIcon" runat="server" ImageUrl='<%# Eval("IconUrl") %>'
                                        AlternateText='<%# Eval("Name") %>' CssClass="catalog-icon" />
                                </div>
                                <div class="catalog-name"><%# Eval("Name") %></div>
                                <div class="catalog-desc"><%# Eval("Description") %></div>
                            </div>
                            <div>
                                <div class="catalog-meta-row">
                                    <span>Duration: <%# Eval("Duration") %></span>
                                    <span class="catalog-price"><%# Eval("PriceRange") %></span>
                                </div>
                                <asp:Button ID="btnBook" runat="server" Text="Book Appointment"
                                    CssClass="btn-book-service" CommandName="BookService"
                                    CommandArgument='<%# Eval("Name") %>' />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </asp:Panel>

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
                    <asp:Label runat="server" CssClass="footer-tagline" Text="Need help? Contact support@styliosalon.com" />
                </asp:Panel>
            </asp:Panel>

            <asp:Panel ID="pnlFooterBottom" runat="server" CssClass="footer-bottom">
                <asp:Label ID="lblCopyright" runat="server" Text="&#169; 2026 Stylio Salon. All Right Reserved." />
            </asp:Panel>
        </asp:Panel>

    </form>
</body>
</html>
