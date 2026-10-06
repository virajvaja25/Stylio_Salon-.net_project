<%@ Page Title="Stylio | Payment" Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Stylio_Salon.Payment" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Payment</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
    <link rel="stylesheet" type="text/css" href="Styles/Payment.css" />
</head>
<body>
    <form id="frmPayment" runat="server">

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

        <!-- ===================== PAYMENT PAGE CONTAINER ===================== -->
        <asp:Panel ID="pnlPaymentPage" runat="server" CssClass="payment-page-container">

            <!-- Title -->
            <asp:Label ID="lblPageTitle" runat="server" CssClass="payment-main-title" Text="Payment" />

            <!-- Content Two-Column Wrapper -->
            <asp:Panel ID="pnlContentWrapper" runat="server" CssClass="payment-content-wrapper">

                <!-- ========== LEFT: BOOKING SUMMARY CARD ========== -->
                <asp:Panel ID="pnlSummaryCard" runat="server" CssClass="booking-summary-card">

                    <asp:Label ID="lblSummaryTitle" runat="server" CssClass="summary-card-title" Text="Booking Summary" />
                    <asp:Panel ID="pnlSummaryDivider1" runat="server" CssClass="summary-card-divider" />

                    <asp:Label ID="lblSalonName" runat="server" CssClass="summary-salon-name" Text="Stylio Men&#39;s Salon" />
                    <asp:Label ID="lblBookingDateTime" runat="server" CssClass="summary-datetime-row" Text="15 May 2025 &bull; 10:00 AM" />

                    <asp:Panel ID="pnlItemsList" runat="server" CssClass="summary-items-list">

                        <asp:Repeater ID="rptSummaryItems" runat="server">
                            <ItemTemplate>
                                <asp:Panel ID="pnlItemRow" runat="server" CssClass="summary-item-row">
                                    <asp:Label ID="lblItemName" runat="server" CssClass="summary-item-label" Text='<%# Eval("Name") %>' />
                                    <asp:Label ID="lblItemPrice" runat="server" CssClass="summary-item-price" Text='<%# Eval("PriceDisplay") %>' />
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:Panel ID="pnlTaxRow" runat="server" CssClass="summary-item-row">
                            <asp:Label ID="lblTaxLabel" runat="server" CssClass="summary-item-label" Text="Tax (18%)" />
                            <asp:Label ID="lblTaxPrice" runat="server" CssClass="summary-item-price" Text="₹90" />
                        </asp:Panel>

                    </asp:Panel>

                    <asp:Panel ID="pnlTotalDivider" runat="server" CssClass="summary-total-divider" />

                    <asp:Panel ID="pnlTotalRow" runat="server" CssClass="summary-total-row">
                        <asp:Label ID="lblTotalLabel" runat="server" CssClass="summary-total-label" Text="Total" />
                        <asp:Label ID="lblTotalPrice" runat="server" CssClass="summary-total-price" Text="₹338" />
                    </asp:Panel>

                </asp:Panel>

                <!-- ========== RIGHT: SELECT PAYMENT METHOD ========== -->
                <asp:Panel ID="pnlPaymentMethodCol" runat="server" CssClass="payment-method-col">

                    <asp:Label ID="lblPaymentMethodTitle" runat="server" CssClass="payment-method-title" Text="Select Payment Method" />

                    <asp:Panel ID="pnlPaymentCard" runat="server" CssClass="payment-method-card">

                        <asp:Panel ID="pnlCashOptionBox" runat="server" CssClass="payment-option-box">

                            <asp:Panel ID="pnlOptionLeft" runat="server" CssClass="payment-option-left">
                                <asp:Label ID="lblWalletIcon" runat="server" CssClass="payment-option-icon" Text="&#128091;" />
                                <asp:Panel ID="pnlOptionTexts" runat="server" CssClass="payment-option-text-group">
                                    <asp:Label ID="lblOptionTitle" runat="server" CssClass="payment-option-name" Text="Cash Payment" />
                                    <asp:Label ID="lblOptionDesc" runat="server" CssClass="payment-option-desc" Text="Cash Payment at Salon" />
                                </asp:Panel>
                            </asp:Panel>

                            <asp:Panel ID="pnlOptionRadio" runat="server" CssClass="payment-radio-wrapper">
                                <asp:RadioButton ID="rbCashPayment" runat="server" GroupName="PaymentGroup" Checked="true" />
                            </asp:Panel>

                        </asp:Panel>

                    </asp:Panel>

                </asp:Panel>

            </asp:Panel>

            <!-- ========== ACTION BUTTON & NOTICE ========== -->
            <asp:Panel ID="pnlActionArea" runat="server" CssClass="payment-action-area">
                <asp:Button ID="btnPayNow" runat="server" Text="Pay Now ₹338" CssClass="btn-pay-now" OnClick="btnPayNow_Click" />
                <asp:Label ID="lblSecureNotice" runat="server" CssClass="secure-payment-notice" Text="100 % Secure Payment" />
            </asp:Panel>

            <!-- Success Confirmation Box -->
            <asp:Panel ID="pnlSuccessBox" runat="server" CssClass="payment-success-box" Visible="false">
                <asp:Label ID="lblSuccessTitle" runat="server" CssClass="payment-success-title" Text="Booking Confirmed!" />
                <asp:Label ID="lblSuccessDesc" runat="server" CssClass="payment-success-text" />
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
                    <asp:LinkButton ID="lnkFooterTerms" runat="server" Text="Terms &amp; Condition" CssClass="footer-link" />
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
