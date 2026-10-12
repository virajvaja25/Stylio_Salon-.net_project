<%@ Page Title="Stylio | Admin Settings" Language="C#" AutoEventWireup="true" CodeBehind="AdminSettings.aspx.cs" Inherits="Stylio_Salon.AdminSettings" ResponseEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Settings</title>
    <link rel="stylesheet" type="text/css" href="../Styles/Admin.css" />
</head>
<body>
    <form id="frmAdminSettings" runat="server">
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

                    <asp:HyperLink ID="lnkNavUsers" runat="server" NavigateUrl="~/Admin/AdminUsers.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavUsers" runat="server" ImageUrl="~/Images/admin_icons/users.svg" CssClass="admin-nav-svg-icon" AlternateText="Users" />
                        <asp:Label ID="lblTextUsers" runat="server" CssClass="admin-nav-text" Text="Users" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavSalons" runat="server" NavigateUrl="~/Admin/AdminSalons.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavSalons" runat="server" ImageUrl="~/Images/admin_icons/salons.svg" CssClass="admin-nav-svg-icon" AlternateText="Salons" />
                        <asp:Label ID="lblTextSalons" runat="server" CssClass="admin-nav-text" Text="Salons" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavBookings" runat="server" NavigateUrl="~/Admin/AdminBookings.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavBookings" runat="server" ImageUrl="~/Images/admin_icons/bookings.svg" CssClass="admin-nav-svg-icon" AlternateText="Bookings" />
                        <asp:Label ID="lblTextBookings" runat="server" CssClass="admin-nav-text" Text="Bookings" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavServices" runat="server" NavigateUrl="~/Admin/AdminServices.aspx" CssClass="admin-nav-item">
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

                    <asp:HyperLink ID="lnkNavSettings" runat="server" NavigateUrl="~/Admin/AdminSettings.aspx" CssClass="admin-nav-item admin-nav-item-active">
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
                
                <%-- Top Bar --%>
                <asp:Panel ID="pnlTopBar" runat="server" CssClass="admin-topbar">
                    
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
                    
                    <%-- Header with Back Arrow and Title --%>
                    <asp:Panel ID="pnlSettingsHeaderBox" runat="server" CssClass="admin-settings-header-box">
                        <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/Admin/AdminDashboard.aspx" CssClass="admin-settings-back-btn" Text="←" ToolTip="Back to Dashboard" />
                        <asp:Label ID="lblPageTitle" runat="server" CssClass="admin-page-title" Text="Settings" />
                    </asp:Panel>

                    <%-- Alert Banner --%>
                    <asp:Panel ID="pnlAlertBanner" runat="server" CssClass="admin-banner-alert admin-banner-alert-success" Visible="false">
                        <asp:Label ID="lblAlertMessage" runat="server" Text="Settings updated successfully!" />
                        <asp:LinkButton ID="btnCloseAlert" runat="server" Text="✕" OnClick="btnCloseAlert_Click" style="color: inherit; text-decoration: none; font-weight: bold; cursor: pointer;" />
                    </asp:Panel>

                    <%-- Tabs: Profile & Change password --%>
                    <asp:Panel ID="pnlSettingsTabsRow" runat="server" CssClass="admin-settings-tabs-row">
                        <asp:LinkButton ID="btnTabProfile" runat="server" CssClass="admin-settings-tab admin-settings-tab-active" Text="Profile" OnClick="btnTabProfile_Click" />
                        <asp:LinkButton ID="btnTabChangePassword" runat="server" CssClass="admin-settings-tab" Text="Change password" OnClick="btnTabChangePassword_Click" />
                    </asp:Panel>

                    <%-- Profile View Card --%>
                    <asp:Panel ID="pnlProfileView" runat="server" CssClass="admin-settings-card">
                        <asp:Panel ID="pnlProfileLayout" runat="server" CssClass="admin-settings-profile-layout">
                            
                            <%-- Profile Image Section --%>
                            <asp:Panel ID="pnlAvatarBox" runat="server" CssClass="admin-settings-avatar-box">
                                <asp:Label ID="lblAvatarLabel" runat="server" CssClass="admin-settings-avatar-label" Text="Profile Image" />
                                <asp:Panel ID="pnlAvatarCircleWrapper" runat="server" CssClass="admin-settings-avatar-circle-wrapper">
                                    <asp:Image ID="imgProfileAvatar" runat="server" ImageUrl="~/Images/admin_icons/admin_avatar.svg" CssClass="admin-settings-avatar-img" AlternateText="Profile Image" />
                                </asp:Panel>
                            </asp:Panel>

                            <%-- Profile Form Fields --%>
                            <asp:Panel ID="pnlFormFields" runat="server" CssClass="admin-settings-form-fields">
                                
                                <asp:Panel ID="pnlGroupFullName" runat="server" CssClass="admin-settings-form-group">
                                    <asp:Label ID="lblFullName" runat="server" CssClass="admin-settings-field-label" Text="Full Name" />
                                    <asp:TextBox ID="txtFullName" runat="server" CssClass="admin-settings-input" Text="Viraj Vaja" />
                                </asp:Panel>

                                <asp:Panel ID="pnlGroupEmail" runat="server" CssClass="admin-settings-form-group">
                                    <asp:Label ID="lblEmailAddress" runat="server" CssClass="admin-settings-field-label" Text="Email Address" />
                                    <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="admin-settings-input" Text="Admin@gmail.com" />
                                </asp:Panel>

                                <asp:Panel ID="pnlGroupMobile" runat="server" CssClass="admin-settings-form-group">
                                    <asp:Label ID="lblMobileNumber" runat="server" CssClass="admin-settings-field-label" Text="Mobile Number" />
                                    <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="admin-settings-input" Text="+91 12345 67890" />
                                </asp:Panel>

                                <asp:Panel ID="pnlGroupRole" runat="server" CssClass="admin-settings-form-group">
                                    <asp:Label ID="lblRole" runat="server" CssClass="admin-settings-field-label" Text="Role" />
                                    <asp:TextBox ID="txtRole" runat="server" CssClass="admin-settings-input" Text="Admin" ReadOnly="true" />
                                </asp:Panel>

                                <asp:Panel ID="pnlActions" runat="server" CssClass="admin-settings-actions">
                                    <asp:Button ID="btnSaveProfile" runat="server" CssClass="btn-admin-save-settings" Text="Save" OnClick="btnSaveProfile_Click" />
                                </asp:Panel>

                            </asp:Panel>

                        </asp:Panel>
                    </asp:Panel>

                    <%-- Change Password View Card --%>
                    <asp:Panel ID="pnlPasswordView" runat="server" CssClass="admin-settings-card" Visible="false">
                        <asp:Panel ID="pnlPasswordForm" runat="server" CssClass="admin-settings-form-fields" style="max-width: 440px;">
                            
                            <asp:Panel ID="pnlGroupOldPass" runat="server" CssClass="admin-settings-form-group">
                                <asp:Label ID="lblOldPassword" runat="server" CssClass="admin-settings-field-label" Text="Current Password" />
                                <asp:TextBox ID="txtOldPassword" runat="server" CssClass="admin-settings-input" TextMode="Password" placeholder="Enter current password" />
                            </asp:Panel>

                            <asp:Panel ID="pnlGroupNewPass" runat="server" CssClass="admin-settings-form-group">
                                <asp:Label ID="lblNewPassword" runat="server" CssClass="admin-settings-field-label" Text="New Password" />
                                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="admin-settings-input" TextMode="Password" placeholder="Enter new password" />
                            </asp:Panel>

                            <asp:Panel ID="pnlGroupConfirmPass" runat="server" CssClass="admin-settings-form-group">
                                <asp:Label ID="lblConfirmPassword" runat="server" CssClass="admin-settings-field-label" Text="Confirm New Password" />
                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="admin-settings-input" TextMode="Password" placeholder="Re-enter new password" />
                            </asp:Panel>

                            <asp:Panel ID="pnlPassActions" runat="server" CssClass="admin-settings-actions" style="margin-top: 10px;">
                                <asp:Button ID="btnSavePassword" runat="server" CssClass="btn-admin-save-settings" Text="Update Password" OnClick="btnSavePassword_Click" />
                            </asp:Panel>

                        </asp:Panel>
                    </asp:Panel>

                </asp:Panel>

            </asp:Panel>

        </asp:Panel>
    </form>
</body>
</html>
