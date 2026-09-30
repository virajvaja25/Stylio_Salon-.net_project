<%@ Page Title="Stylio | Book Appointment" Language="C#" AutoEventWireup="true" CodeBehind="BookAppointment.aspx.cs" Inherits="Stylio_Salon.BookAppointment" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Book Appointment</title>
    <link rel="stylesheet" type="text/css" href="Styles/Site.css" />
    <style>
        .booking-page-body {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 50px 20px 80px;
        }
        .booking-card {
            background-color: #FFFFFF;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 6px 24px rgba(0,0,0,0.07);
            width: 100%;
            max-width: 640px;
        }
        .booking-header {
            margin-bottom: 28px;
            text-align: center;
        }
        .booking-title {
            font-size: 32px;
            font-weight: bold;
            color: #241608;
            margin-bottom: 8px;
            display: block;
        }
        .booking-subtitle {
            font-size: 15px;
            color: #6b5847;
            display: block;
        }
        .booking-grid-2col {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }
        .success-box {
            background-color: #EBF7EE;
            border: 1px solid #3FA34D;
            border-radius: 10px;
            padding: 24px;
            text-align: center;
            margin-bottom: 24px;
        }
        .success-title {
            font-size: 22px;
            font-weight: bold;
            color: #267A32;
            margin-bottom: 8px;
            display: block;
        }
        .success-desc {
            font-size: 15px;
            color: #2E5C35;
            line-height: 1.5;
            display: block;
        }
        .btn-view-salons-link {
            display: inline-block;
            margin-top: 14px;
            background-color: #C9A063;
            color: #FFFFFF;
            padding: 10px 24px;
            border-radius: 8px;
            font-weight: bold;
        }
        @media (max-width: 600px) {
            .booking-grid-2col {
                grid-template-columns: 1fr;
            }
            .booking-card {
                padding: 26px 20px;
            }
        }
    </style>
</head>
<body>
    <form id="frmBook" runat="server">

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
                <asp:LinkButton ID="lnkAboutUs" runat="server" Text="About Us" CssClass="nav-link" OnClick="lnkAboutUs_Click" />
            </asp:Panel>

            <asp:Panel ID="pnlUserArea" runat="server" CssClass="guest-user-area">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-nav-login" OnClick="btnLogin_Click" />
                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-nav-register" OnClick="btnRegister_Click" />
            </asp:Panel>
        </asp:Panel>

        <!-- ===================== BOOKING BODY ===================== -->
        <div class="booking-page-body">
            <div class="booking-card">

                <div class="booking-header">
                    <asp:Label ID="lblBookingTitle" runat="server" CssClass="booking-title" Text="Book Appointment" />
                    <asp:Label ID="lblBookingSub" runat="server" CssClass="booking-subtitle"
                        Text="Select your favorite salon, service, and preferred time slot." />
                </div>

                <!-- Success Confirmation Panel -->
                <asp:Panel ID="pnlSuccess" runat="server" CssClass="success-box" Visible="false">
                    <span class="success-title">&#10004; Appointment Confirmed!</span>
                    <asp:Label ID="lblSuccessMessage" runat="server" CssClass="success-desc" />
                    <asp:HyperLink ID="hlBrowseMore" runat="server" NavigateUrl="Salon.aspx"
                        CssClass="btn-view-salons-link" Text="Browse More Salons" />
                </asp:Panel>

                <!-- Booking Form Panel -->
                <asp:Panel ID="pnlForm" runat="server">
                    <asp:ValidationSummary ID="valSummary" runat="server" CssClass="summary-error"
                        DisplayMode="BulletList" EnableClientScript="false" />

                    <!-- Salon Dropdown -->
                    <div class="form-group">
                        <asp:Label ID="lblSalonSelect" runat="server" AssociatedControlID="ddlSalon"
                            CssClass="form-label" Text="Choose Salon" />
                        <asp:DropDownList ID="ddlSalon" runat="server" CssClass="form-input">
                            <asp:ListItem Text="Select a Salon" Value="" />
                            <asp:ListItem Text="Stylio Men's Salon - Trikon Bag, Rajkot" Value="1" />
                            <asp:ListItem Text="The Mae Mane Salon - Bhaktinagar, Rajkot" Value="2" />
                            <asp:ListItem Text="The Hair Studio - Surat, Gujrat" Value="3" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvSalon" runat="server" ControlToValidate="ddlSalon"
                            CssClass="field-error" ErrorMessage="Please select a salon." Display="Dynamic" EnableClientScript="false" />
                    </div>

                    <!-- Service Dropdown -->
                    <div class="form-group">
                        <asp:Label ID="lblServiceSelect" runat="server" AssociatedControlID="ddlService"
                            CssClass="form-label" Text="Choose Service" />
                        <asp:DropDownList ID="ddlService" runat="server" CssClass="form-input">
                            <asp:ListItem Text="Select a Service" Value="" />
                            <asp:ListItem Text="Hair Cut &amp; Styling" Value="Hair Cut" />
                            <asp:ListItem Text="Beard Trim &amp; Shape" Value="Beard" />
                            <asp:ListItem Text="Hair Color &amp; Highlights" Value="Hair Color" />
                            <asp:ListItem Text="Deep Cleansing Facial" Value="Facial" />
                            <asp:ListItem Text="Intense Hair Spa" Value="Hair Spa" />
                            <asp:ListItem Text="Full Grooming Package" Value="Full Grooming" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvService" runat="server" ControlToValidate="ddlService"
                            CssClass="field-error" ErrorMessage="Please select a service." Display="Dynamic" EnableClientScript="false" />
                    </div>

                    <!-- Date & Time Row -->
                    <div class="booking-grid-2col">
                        <div class="form-group">
                            <asp:Label ID="lblDate" runat="server" AssociatedControlID="txtDate"
                                CssClass="form-label" Text="Appointment Date" />
                            <asp:TextBox ID="txtDate" runat="server" CssClass="form-input" TextMode="Date" />
                            <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate"
                                CssClass="field-error" ErrorMessage="Date is required." Display="Dynamic" EnableClientScript="false" />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblTimeSlot" runat="server" AssociatedControlID="ddlTimeSlot"
                                CssClass="form-label" Text="Time Slot" />
                            <asp:DropDownList ID="ddlTimeSlot" runat="server" CssClass="form-input">
                                <asp:ListItem Text="Select Slot" Value="" />
                                <asp:ListItem Text="09:00 AM - 10:00 AM" Value="09:00 AM" />
                                <asp:ListItem Text="10:30 AM - 11:30 AM" Value="10:30 AM" />
                                <asp:ListItem Text="12:00 PM - 01:00 PM" Value="12:00 PM" />
                                <asp:ListItem Text="02:30 PM - 03:30 PM" Value="02:30 PM" />
                                <asp:ListItem Text="04:00 PM - 05:00 PM" Value="04:00 PM" />
                                <asp:ListItem Text="06:00 PM - 07:00 PM" Value="06:00 PM" />
                                <asp:ListItem Text="07:30 PM - 08:30 PM" Value="07:30 PM" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvTimeSlot" runat="server" ControlToValidate="ddlTimeSlot"
                                CssClass="field-error" ErrorMessage="Please choose a time slot." Display="Dynamic" EnableClientScript="false" />
                        </div>
                    </div>

                    <!-- Customer Name & Phone -->
                    <div class="booking-grid-2col">
                        <div class="form-group">
                            <asp:Label ID="lblName" runat="server" AssociatedControlID="txtName"
                                CssClass="form-label" Text="Your Name" />
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-input" placeholder="Full Name" />
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                                CssClass="field-error" ErrorMessage="Name is required." Display="Dynamic" EnableClientScript="false" />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblPhone" runat="server" AssociatedControlID="txtPhone"
                                CssClass="form-label" Text="Mobile Number" />
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-input" TextMode="Phone"
                                placeholder="10-digit number" />
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"
                                CssClass="field-error" ErrorMessage="Phone number is required." Display="Dynamic" EnableClientScript="false" />
                        </div>
                    </div>

                    <!-- Notes -->
                    <div class="form-group">
                        <asp:Label ID="lblNotes" runat="server" AssociatedControlID="txtNotes"
                            CssClass="form-label" Text="Special Requests (Optional)" />
                        <asp:TextBox ID="txtNotes" runat="server" CssClass="form-input" TextMode="MultiLine"
                            Rows="3" placeholder="Any specific stylist preference or styling notes..." />
                    </div>

                    <asp:Button ID="btnSubmitBooking" runat="server" Text="Confirm Appointment"
                        CssClass="btn-primary-wide" OnClick="btnSubmitBooking_Click" />
                </asp:Panel>

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
                    <asp:Label runat="server" CssClass="footer-tagline" Text="Contact: support@styliosalon.com" />
                </asp:Panel>
            </asp:Panel>

            <asp:Panel ID="pnlFooterBottom" runat="server" CssClass="footer-bottom">
                <asp:Label ID="lblCopyright" runat="server" Text="&#169; 2026 Stylio Salon. All Right Reserved." />
            </asp:Panel>
        </asp:Panel>

    </form>
</body>
</html>
