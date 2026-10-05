<%@ Page Title="Stylio | Book Appointment" Language="C#" AutoEventWireup="true" CodeBehind="BookAppointment.aspx.cs" Inherits="Stylio_Salon.BookAppointment" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Book Appointment</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
    <link rel="stylesheet" type="text/css" href="Styles/BookAppointment.css" />
</head>
<body>
    <form id="frmBook" runat="server">

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

        <!-- ===================== BOOKING MAIN CONTAINER ===================== -->
        <asp:Panel ID="pnlBookingMain" runat="server" CssClass="booking-main-container">

            <!-- Page Title -->
            <asp:Label ID="lblPageTitle" runat="server" CssClass="booking-page-title" Text="Book Appointment" />

            <!-- Stepper -->
            <asp:Panel ID="pnlStepper" runat="server" CssClass="booking-stepper">

                <asp:Panel ID="pnlStep1" runat="server" CssClass="step-item">
                    <asp:Label ID="lblStep1Num" runat="server" Text="1" CssClass="step-circle step-circle-active" />
                    <asp:Label ID="lblStep1Text" runat="server" Text="Services" CssClass="step-label step-label-active" />
                </asp:Panel>

                <asp:Panel ID="pnlStepLine1" runat="server" CssClass="step-line step-line-active" />

                <asp:Panel ID="pnlStep2" runat="server" CssClass="step-item">
                    <asp:Label ID="lblStep2Num" runat="server" Text="2" CssClass="step-circle" />
                    <asp:Label ID="lblStep2Text" runat="server" Text="Date &amp; Time" CssClass="step-label" />
                </asp:Panel>

                <asp:Panel ID="pnlStepLine2" runat="server" CssClass="step-line" />

                <asp:Panel ID="pnlStep3" runat="server" CssClass="step-item">
                    <asp:Label ID="lblStep3Num" runat="server" Text="3" CssClass="step-circle" />
                    <asp:Label ID="lblStep3Text" runat="server" Text="Payment" CssClass="step-label" />
                </asp:Panel>

            </asp:Panel>

            <!-- 3 Cards Container -->
            <asp:Panel ID="pnlCardsContainer" runat="server" CssClass="booking-cards-container">

                <!-- ========== CARD 1: CHOOSE SERVICES ========== -->
                <asp:Panel ID="pnlCardServices" runat="server" CssClass="booking-card">
                    <asp:Label ID="lblChooseServices" runat="server" CssClass="card-title" Text="Choose Services" />
                    <asp:Panel ID="pnlDivider1" runat="server" CssClass="card-divider" />

                    <asp:Panel ID="pnlServicesList" runat="server" CssClass="services-list">

                        <asp:Panel ID="pnlService1" runat="server" CssClass="service-item-row">
                            <asp:Panel ID="pnlServiceLeft1" runat="server" CssClass="service-item-left">
                                <asp:CheckBox ID="chkHairCut" runat="server" Text="Hair Cut" Checked="true" CssClass="service-checkbox" />
                            </asp:Panel>
                            <asp:Label ID="lblPriceHairCut" runat="server" Text="&#8377;149" CssClass="service-price" />
                        </asp:Panel>

                        <asp:Panel ID="pnlService2" runat="server" CssClass="service-item-row">
                            <asp:Panel ID="pnlServiceLeft2" runat="server" CssClass="service-item-left">
                                <asp:CheckBox ID="chkBeardTrim" runat="server" Text="Beard Trim" Checked="true" CssClass="service-checkbox" />
                            </asp:Panel>
                            <asp:Label ID="lblPriceBeardTrim" runat="server" Text="&#8377;99" CssClass="service-price" />
                        </asp:Panel>

                        <asp:Panel ID="pnlService3" runat="server" CssClass="service-item-row">
                            <asp:Panel ID="pnlServiceLeft3" runat="server" CssClass="service-item-left">
                                <asp:CheckBox ID="chkHairColor" runat="server" Text="Hair Color" CssClass="service-checkbox" />
                            </asp:Panel>
                            <asp:Label ID="lblPriceHairColor" runat="server" Text="&#8377;299" CssClass="service-price" />
                        </asp:Panel>

                        <asp:Panel ID="pnlService4" runat="server" CssClass="service-item-row">
                            <asp:Panel ID="pnlServiceLeft4" runat="server" CssClass="service-item-left">
                                <asp:CheckBox ID="chkFacial" runat="server" Text="Facial" CssClass="service-checkbox" />
                            </asp:Panel>
                            <asp:Label ID="lblPriceFacial" runat="server" Text="&#8377;135" CssClass="service-price" />
                        </asp:Panel>

                        <asp:Panel ID="pnlService5" runat="server" CssClass="service-item-row">
                            <asp:Panel ID="pnlServiceLeft5" runat="server" CssClass="service-item-left">
                                <asp:CheckBox ID="chkHairSpa" runat="server" Text="Hair Spa" CssClass="service-checkbox" />
                            </asp:Panel>
                            <asp:Label ID="lblPriceHairSpa" runat="server" Text="&#8377;399" CssClass="service-price" />
                        </asp:Panel>

                    </asp:Panel>
                </asp:Panel>

                <!-- ========== CARD 2: SELECT DATE ========== -->
                <asp:Panel ID="pnlCardDate" runat="server" CssClass="booking-card">
                    <asp:Label ID="lblSelectDate" runat="server" CssClass="card-title" Text="Select Date" />
                    <asp:Panel ID="pnlDivider2" runat="server" CssClass="card-divider" />

                    <!-- Calendar Header with Dropdowns and Navigation -->
                    <asp:Panel ID="pnlCalHeader" runat="server" CssClass="cal-header-row">
                        <asp:LinkButton ID="btnCalPrev" runat="server" Text="&lsaquo;" CssClass="cal-nav-btn" OnClick="btnCalPrev_Click" />
                        <asp:Panel ID="pnlCalDropdowns" runat="server" CssClass="cal-dropdown-group">
                            <asp:DropDownList ID="ddlCalMonth" runat="server" CssClass="cal-dropdown" AutoPostBack="true" OnSelectedIndexChanged="ddlCalMonth_SelectedIndexChanged">
                                <asp:ListItem Value="1" Text="Jan" />
                                <asp:ListItem Value="2" Text="Feb" />
                                <asp:ListItem Value="3" Text="Mar" />
                                <asp:ListItem Value="4" Text="Apr" />
                                <asp:ListItem Value="5" Text="May" />
                                <asp:ListItem Value="6" Text="Jun" />
                                <asp:ListItem Value="7" Text="Jul" />
                                <asp:ListItem Value="8" Text="Aug" />
                                <asp:ListItem Value="9" Text="Sep" Selected="True" />
                                <asp:ListItem Value="10" Text="Oct" />
                                <asp:ListItem Value="11" Text="Nov" />
                                <asp:ListItem Value="12" Text="Dec" />
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlCalYear" runat="server" CssClass="cal-dropdown" AutoPostBack="true" OnSelectedIndexChanged="ddlCalYear_SelectedIndexChanged">
                                <asp:ListItem Value="2024" Text="2024" />
                                <asp:ListItem Value="2025" Text="2025" Selected="True" />
                                <asp:ListItem Value="2026" Text="2026" />
                                <asp:ListItem Value="2027" Text="2027" />
                            </asp:DropDownList>
                        </asp:Panel>
                        <asp:LinkButton ID="btnCalNext" runat="server" Text="&rsaquo;" CssClass="cal-nav-btn" OnClick="btnCalNext_Click" />
                    </asp:Panel>

                    <!-- Calendar Grid -->
                    <asp:Calendar ID="calBooking" runat="server" CssClass="stylio-calendar"
                        ShowTitle="false"
                        ShowNextPrevMonth="false"
                        DayNameFormat="Short"
                        DayHeaderStyle-CssClass="cal-day-header"
                        DayStyle-CssClass="cal-day-cell"
                        SelectedDayStyle-CssClass="cal-selected-day"
                        OtherMonthDayStyle-CssClass="cal-other-month"
                        OnSelectionChanged="calBooking_SelectionChanged" />

                    <asp:Label ID="lblSelectedDateDisplay" runat="server" Visible="false" />
                </asp:Panel>

                <!-- ========== CARD 3: SELECT TIME ========== -->
                <asp:Panel ID="pnlCardTime" runat="server" CssClass="booking-card">
                    <asp:Label ID="lblSelectTime" runat="server" CssClass="card-title" Text="Select Time" />
                    <asp:Panel ID="pnlDivider3" runat="server" CssClass="card-divider" />

                    <!-- Morning -->
                    <asp:Panel ID="pnlMorningGroup" runat="server" CssClass="time-group-section">
                        <asp:Label ID="lblMorning" runat="server" CssClass="time-group-label" Text="Morning" />
                        <asp:Panel ID="pnlMorningSlots" runat="server" CssClass="time-slots-grid">
                            <asp:LinkButton ID="btnTime0900AM" runat="server" Text="09:00 AM" CssClass="time-slot-btn" OnClick="TimeSlot_Click" />
                            <asp:LinkButton ID="btnTime1000AM" runat="server" Text="10:00 AM" CssClass="time-slot-btn" OnClick="TimeSlot_Click" />
                            <asp:LinkButton ID="btnTime1100AM" runat="server" Text="11:00 AM" CssClass="time-slot-btn" OnClick="TimeSlot_Click" />
                            <asp:LinkButton ID="btnTime1200PM" runat="server" Text="12:00 PM" CssClass="time-slot-btn" OnClick="TimeSlot_Click" />
                        </asp:Panel>
                    </asp:Panel>

                    <!-- Afternoon -->
                    <asp:Panel ID="pnlAfternoonGroup" runat="server" CssClass="time-group-section">
                        <asp:Label ID="lblAfternoon" runat="server" CssClass="time-group-label" Text="Afternoon" />
                        <asp:Panel ID="pnlAfternoonSlots" runat="server" CssClass="time-slots-grid">
                            <asp:LinkButton ID="btnTime0100PM" runat="server" Text="01:00 PM" CssClass="time-slot-btn" OnClick="TimeSlot_Click" />
                            <asp:LinkButton ID="btnTime0200PM" runat="server" Text="02:00 PM" CssClass="time-slot-btn" OnClick="TimeSlot_Click" />
                            <asp:LinkButton ID="btnTime0300PM" runat="server" Text="03:00 PM" CssClass="time-slot-btn" OnClick="TimeSlot_Click" />
                            <asp:LinkButton ID="btnTime0400PM" runat="server" Text="04:00 PM" CssClass="time-slot-btn" OnClick="TimeSlot_Click" />
                        </asp:Panel>
                    </asp:Panel>

                    <!-- Evening -->
                    <asp:Panel ID="pnlEveningGroup" runat="server" CssClass="time-group-section">
                        <asp:Label ID="lblEvening" runat="server" CssClass="time-group-label" Text="Evening" />
                        <asp:Panel ID="pnlEveningSlots" runat="server" CssClass="time-slots-grid">
                            <asp:LinkButton ID="btnTime0500PM" runat="server" Text="05:00 PM" CssClass="time-slot-btn" OnClick="TimeSlot_Click" />
                            <asp:LinkButton ID="btnTime0600PM" runat="server" Text="06:00 PM" CssClass="time-slot-btn" OnClick="TimeSlot_Click" />
                            <asp:LinkButton ID="btnTime0700PM" runat="server" Text="07:00 PM" CssClass="time-slot-btn" OnClick="TimeSlot_Click" />
                            <asp:LinkButton ID="btnTime0800PM" runat="server" Text="08:00 PM" CssClass="time-slot-btn" OnClick="TimeSlot_Click" />
                        </asp:Panel>
                    </asp:Panel>

                    <asp:Label ID="lblSelectedTimeDisplay" runat="server" Visible="false" />
                </asp:Panel>

            </asp:Panel>

            <!-- Next Button -->
            <asp:Panel ID="pnlNextWrapper" runat="server" CssClass="next-btn-wrapper">
                <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn-booking-next" OnClick="btnNext_Click" />
            </asp:Panel>

            <!-- Feedback Message -->
            <asp:Panel ID="pnlBookingFeedback" runat="server" Visible="false" Style="margin-top:20px; text-align:center;">
                <asp:Label ID="lblFeedbackMessage" runat="server" Style="font-size:16px; color:#2E7D32; font-weight:600;" />
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
                    <asp:LinkButton ID="lnkFooterMyBooking" runat="server" Text="My Booking" CssClass="footer-link" OnClick="lnkFooterMyBooking_Click" />
                    <asp:LinkButton ID="lnkFooterReviews"   runat="server" Text="Reviews"    CssClass="footer-link" OnClick="lnkReviews_Click" />
                    <asp:LinkButton ID="lnkFooterContact"   runat="server" Text="Contact"    CssClass="footer-link" OnClick="lnkAboutUs_Click" />
                </asp:Panel>

                <!-- Support -->
                <asp:Panel ID="pnlFooterSupport" runat="server">
                    <asp:Label ID="lblSupportTitle" runat="server"
                        CssClass="footer-col-title" Text="Support" />
                    <asp:LinkButton ID="lnkFooterHelp"         runat="server" Text="Help center"        CssClass="footer-link" />
                    <asp:LinkButton ID="lnkFooterTerms"        runat="server" Text="Terms &amp; Condition" CssClass="footer-link" />
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
