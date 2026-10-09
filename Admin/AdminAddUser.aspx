<%@ Page Title="Stylio | Add User" Language="C#" AutoEventWireup="true" CodeBehind="AdminAddUser.aspx.cs" Inherits="Stylio_Salon.AdminAddUser" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Add User</title>
    <link rel="stylesheet" type="text/css" href="../Styles/Admin.css" />
</head>
<body>
    <form id="frmAdminAddUser" runat="server">
        <asp:Panel ID="pnlDashboardWrapper" runat="server" CssClass="admin-dashboard-container">
            
            <%-- Left Sidebar --%>
            <asp:Panel ID="pnlSidebar" runat="server" CssClass="admin-sidebar">
                
                <asp:Panel ID="pnlSidebarLogoBox" runat="server" CssClass="admin-sidebar-logo-box">
                    <asp:Image ID="imgSidebarLogo" runat="server" ImageUrl="~/Images/admin_logo.png" AlternateText="Stylio Admin Panel" CssClass="admin-logo-img" />
                </asp:Panel>

                <asp:Panel ID="pnlSidebarNav" runat="server" CssClass="admin-sidebar-nav">
                    
                    <asp:HyperLink ID="lnkNavDashboard" runat="server" NavigateUrl="~/Admin/AdminDashboard.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavDashboard" runat="server" ImageUrl="~/Images/admin_icons/dashboard.svg" CssClass="admin-nav-svg-icon" AlternateText="Dashboard" />
                        <asp:Label ID="lblTextDashboard" runat="server" CssClass="admin-nav-text" Text="Dashboard" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavUsers" runat="server" NavigateUrl="~/Admin/AdminAddUser.aspx" CssClass="admin-nav-item admin-nav-item-active">
                        <asp:Image ID="imgNavUsers" runat="server" ImageUrl="~/Images/admin_icons/users.svg" CssClass="admin-nav-svg-icon" AlternateText="Users" />
                        <asp:Label ID="lblTextUsers" runat="server" CssClass="admin-nav-text" Text="Users" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavSalons" runat="server" NavigateUrl="~/Admin/AdminSalons.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavSalons" runat="server" ImageUrl="~/Images/admin_icons/salons.svg" CssClass="admin-nav-svg-icon" AlternateText="Salons" />
                        <asp:Label ID="lblTextSalons" runat="server" CssClass="admin-nav-text" Text="Salons" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavBookings" runat="server" NavigateUrl="#" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavBookings" runat="server" ImageUrl="~/Images/admin_icons/bookings.svg" CssClass="admin-nav-svg-icon" AlternateText="Bookings" />
                        <asp:Label ID="lblTextBookings" runat="server" CssClass="admin-nav-text" Text="Bookings" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavServices" runat="server" NavigateUrl="~/Admin/AdminAddService.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavServices" runat="server" ImageUrl="~/Images/admin_icons/services.svg" CssClass="admin-nav-svg-icon" AlternateText="Services" />
                        <asp:Label ID="lblTextServices" runat="server" CssClass="admin-nav-text" Text="Services" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavReviews" runat="server" NavigateUrl="~/Admin/AdminReviews.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavReviews" runat="server" ImageUrl="~/Images/admin_icons/reviews.svg" CssClass="admin-nav-svg-icon" AlternateText="Reviews" />
                        <asp:Label ID="lblTextReviews" runat="server" CssClass="admin-nav-text" Text="Reviews" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavPayments" runat="server" NavigateUrl="~/Admin/AdminPayments.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavPayments" runat="server" ImageUrl="~/Images/admin_icons/payments.svg" CssClass="admin-nav-svg-icon" AlternateText="Payments" />
                        <asp:Label ID="lblTextPayments" runat="server" CssClass="admin-nav-text" Text="Payments" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavSettings" runat="server" NavigateUrl="#" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavSettings" runat="server" ImageUrl="~/Images/admin_icons/settings.svg" CssClass="admin-nav-svg-icon" AlternateText="Settings" />
                        <asp:Label ID="lblTextSettings" runat="server" CssClass="admin-nav-text" Text="Settings" />
                    </asp:HyperLink>

                </asp:Panel>

                <asp:Panel ID="pnlSidebarBottom" runat="server" CssClass="admin-sidebar-bottom">
                    <asp:LinkButton ID="btnNavLogout" runat="server" CssClass="admin-logout-btn" OnClick="btnNavLogout_Click">
                        <asp:Image ID="imgNavLogout" runat="server" ImageUrl="~/Images/admin_icons/logout.svg" CssClass="admin-nav-svg-icon" AlternateText="Logout" />
                        <asp:Label ID="lblTextLogout" runat="server" CssClass="admin-nav-text" Text="Logout" />
                    </asp:LinkButton>
                </asp:Panel>

            </asp:Panel>

            <%-- Main Area --%>
            <asp:Panel ID="pnlMainArea" runat="server" CssClass="admin-main-area">
                
                <%-- Topbar --%>
                <asp:Panel ID="pnlTopbar" runat="server" CssClass="admin-topbar">
                    
                    <asp:Panel ID="pnlSearchWrapper" runat="server" CssClass="admin-search-wrapper">
                        <asp:Panel ID="pnlSearchIcon" runat="server" CssClass="admin-search-icon">
                            <asp:Image ID="imgSearchIcon" runat="server" ImageUrl="~/Images/admin_icons/search.svg" CssClass="admin-search-svg-icon" AlternateText="Search" />
                        </asp:Panel>
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="admin-search-input" placeholder="Search Here..." />
                    </asp:Panel>

                    <asp:Panel ID="pnlProfileWidget" runat="server" CssClass="admin-profile-widget">
                        <asp:Panel ID="pnlAvatarCircle" runat="server" CssClass="admin-avatar-circle">
                            <asp:Image ID="imgAdminAvatar" runat="server" ImageUrl="~/Images/admin_icons/admin_avatar.svg" CssClass="admin-avatar-img" AlternateText="Admin Profile" />
                        </asp:Panel>
                        <asp:Panel ID="pnlProfileInfo" runat="server" CssClass="admin-profile-info">
                            <asp:Label ID="lblAdminRole" runat="server" CssClass="admin-profile-role" Text="Admin" />
                            <asp:Label ID="lblAdminName" runat="server" CssClass="admin-profile-name" Text="Viraj Vaja" />
                        </asp:Panel>
                    </asp:Panel>

                </asp:Panel>

                <%-- Content Area --%>
                <asp:Panel ID="pnlContentArea" runat="server" CssClass="admin-content-area">
                    
                    <asp:Panel ID="pnlTitleRow" runat="server" CssClass="admin-title-row">
                        <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/Admin/AdminDashboard.aspx" CssClass="admin-back-link" Text="&#8592;" ToolTip="Back to Dashboard" />
                        <asp:Label ID="lblPageTitle" runat="server" CssClass="admin-page-title" Text="Add User" />
                    </asp:Panel>

                    <asp:Panel ID="pnlFormContainer" runat="server" CssClass="admin-form-container">
                        
                        <%-- Left Card --%>
                        <asp:Panel ID="pnlLeftCard" runat="server" CssClass="admin-form-card">
                            
                            <asp:Panel ID="pnlFullNameGroup" runat="server" CssClass="admin-field-group">
                                <asp:Label ID="lblFullName" runat="server" AssociatedControlID="txtFullName" CssClass="admin-field-label" Text="Full Name" />
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="admin-input" placeholder="Enter Full Name" />
                            </asp:Panel>

                            <asp:Panel ID="pnlPhoneGroup" runat="server" CssClass="admin-field-group">
                                <asp:Label ID="lblPhoneNumber" runat="server" AssociatedControlID="txtPhoneNumber" CssClass="admin-field-label" Text="Phone Number" />
                                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="admin-input" placeholder="Enter Phone Number" />
                            </asp:Panel>

                            <asp:Panel ID="pnlConfirmPwdGroup" runat="server" CssClass="admin-field-group">
                                <asp:Label ID="lblConfirmPassword" runat="server" AssociatedControlID="txtConfirmPassword" CssClass="admin-field-label" Text="Confirm password" />
                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="admin-input" TextMode="Password" placeholder="Confirm Password" />
                            </asp:Panel>

                        </asp:Panel>

                        <%-- Right Card --%>
                        <asp:Panel ID="pnlRightCard" runat="server" CssClass="admin-form-card">
                            
                            <asp:Panel ID="pnlEmailGroup" runat="server" CssClass="admin-field-group">
                                <asp:Label ID="lblEmailAddress" runat="server" AssociatedControlID="txtEmailAddress" CssClass="admin-field-label" Text="Email Address" />
                                <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="admin-input" placeholder="Enter Email Address" />
                            </asp:Panel>

                            <asp:Panel ID="pnlPasswordGroup" runat="server" CssClass="admin-field-group">
                                <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" CssClass="admin-field-label" Text="Password" />
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="admin-input" TextMode="Password" placeholder="Enter Password" />
                            </asp:Panel>

                            <asp:Panel ID="pnlProfileImageGroup" runat="server" CssClass="admin-field-group">
                                <asp:Label ID="lblProfileImage" runat="server" CssClass="admin-field-label" Text="Profile Image" />
                                <asp:Panel ID="pnlUploadBox" runat="server" CssClass="admin-upload-container">
                                    <asp:Image ID="imgUploadIcon" runat="server" ImageUrl="~/Images/admin_icons/upload.svg" CssClass="admin-upload-icon" AlternateText="Upload Icon" />
                                    <asp:Label ID="lblUploadText" runat="server" CssClass="admin-upload-text" Text="Click To Upload" />
                                    <asp:FileUpload ID="fuProfileImage" runat="server" CssClass="admin-file-input" onchange="document.getElementById('<%= lblUploadText.ClientID %>').innerText = this.files[0] ? this.files[0].name : 'Click To Upload';" />
                                </asp:Panel>
                            </asp:Panel>

                            <asp:Panel ID="pnlStatusGroup" runat="server" CssClass="admin-field-group">
                                <asp:Label ID="lblStatus" runat="server" AssociatedControlID="ddlStatus" CssClass="admin-field-label" Text="Status" />
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="admin-select">
                                    <asp:ListItem Value="" Text="Select Status" Selected="True" />
                                    <asp:ListItem Value="Active" Text="Active" />
                                    <asp:ListItem Value="Inactive" Text="Inactive" />
                                </asp:DropDownList>
                            </asp:Panel>

                            <asp:Panel ID="pnlActions" runat="server" CssClass="admin-form-actions">
                                <asp:Button ID="btnCancel" runat="server" CssClass="btn-admin-cancel" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" />
                                <asp:Button ID="btnAddUser" runat="server" CssClass="btn-admin-submit" Text="Add User" OnClick="btnAddUser_Click" />
                            </asp:Panel>

                            <asp:Label ID="lblMessage" runat="server" Visible="false" />

                        </asp:Panel>

                    </asp:Panel>

                </asp:Panel>

            </asp:Panel>

        </asp:Panel>
    </form>
</body>
</html>
