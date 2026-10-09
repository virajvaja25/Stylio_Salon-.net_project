<%@ Page Title="Stylio | Admin Salons" Language="C#" AutoEventWireup="true" CodeBehind="AdminSalons.aspx.cs" Inherits="Stylio_Salon.AdminSalons" ResponseEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stylio - Salons</title>
    <link rel="stylesheet" type="text/css" href="../Styles/Admin.css" />
    <script type="text/javascript">
        function toggleSalonMenu(menuId, event) {
            if (event) {
                event.stopPropagation();
                if (event.preventDefault) event.preventDefault();
            }
            var menus = document.querySelectorAll('.admin-salon-dropdown-menu');
            for (var i = 0; i < menus.length; i++) {
                if (menus[i].id !== menuId) {
                    menus[i].style.display = 'none';
                }
            }
            var targetMenu = document.getElementById(menuId);
            if (targetMenu) {
                targetMenu.style.display = (targetMenu.style.display === 'block') ? 'none' : 'block';
            }
        }
        document.addEventListener('click', function (e) {
            if (!e.target.closest('.admin-more-menu-container')) {
                var menus = document.querySelectorAll('.admin-salon-dropdown-menu');
                for (var i = 0; i < menus.length; i++) {
                    menus[i].style.display = 'none';
                }
            }
        });
    </script>
</head>
<body>
    <form id="frmAdminSalons" runat="server">
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

                    <asp:HyperLink ID="lnkNavUsers" runat="server" NavigateUrl="~/Admin/AdminAddUser.aspx" CssClass="admin-nav-item">
                        <asp:Image ID="imgNavUsers" runat="server" ImageUrl="~/Images/admin_icons/users.svg" CssClass="admin-nav-svg-icon" AlternateText="Users" />
                        <asp:Label ID="lblTextUsers" runat="server" CssClass="admin-nav-text" Text="Users" />
                    </asp:HyperLink>

                    <asp:HyperLink ID="lnkNavSalons" runat="server" NavigateUrl="~/Admin/AdminSalons.aspx" CssClass="admin-nav-item admin-nav-item-active">
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
                    
                    <%-- Alert Notification Banner --%>
                    <asp:Panel ID="pnlAlertBanner" runat="server" CssClass="admin-banner-alert admin-banner-alert-success" Visible="false">
                        <asp:Label ID="lblAlertMessage" runat="server" />
                        <asp:LinkButton ID="btnCloseAlert" runat="server" Text="✕" OnClick="btnCloseAlert_Click" style="color: inherit; text-decoration: none; font-weight: bold; cursor: pointer;" />
                    </asp:Panel>

                    <%-- Header Row with +Add Salon --%>
                    <asp:Panel ID="pnlHeaderRow" runat="server" CssClass="admin-header-row">
                        <asp:Label ID="lblPageTitle" runat="server" CssClass="admin-page-title" Text="Salons" />
                        <asp:HyperLink ID="btnAddSalonTop" runat="server" NavigateUrl="~/Admin/AdminAddSalon.aspx" CssClass="btn-admin-add-salon" Text="+Add Salon" />
                    </asp:Panel>

                    <%-- Search Salon Input --%>
                    <asp:Panel ID="pnlSalonsSearchBox" runat="server" CssClass="admin-section-search-wrapper">
                        <asp:Image ID="imgSearchSalonsIcon" runat="server" ImageUrl="~/Images/admin_icons/search.svg" CssClass="admin-section-search-icon" AlternateText="Search" />
                        <asp:TextBox ID="txtSearchSalons" runat="server" CssClass="admin-section-search-input" placeholder="Search Salon..." AutoPostBack="true" OnTextChanged="txtSearchSalons_TextChanged" />
                    </asp:Panel>

                    <%-- Salons List Card --%>
                    <asp:Panel ID="pnlSalonsOuterCard" runat="server" CssClass="admin-salons-outer-card">
                        
                        <%-- Salon 1: Stylio Men's Salon --%>
                        <asp:Panel ID="pnlSalonItem1" runat="server" CssClass="admin-salon-card-item">
                            <asp:Panel ID="pnlSalonLeft1" runat="server" CssClass="admin-salon-left-info">
                                <asp:Image ID="imgSalon1" runat="server" ImageUrl="~/Images/salon_stylio.png" CssClass="admin-salon-thumbnail" AlternateText="Stylio Men's Salon" />
                                <asp:Panel ID="pnlSalonDetails1" runat="server" CssClass="admin-salon-details">
                                    <asp:Label ID="lblSalonTitle1" runat="server" CssClass="admin-salon-title" Text="Stylio Men's Salon" />
                                    <asp:Panel ID="pnlSalonLoc1" runat="server" CssClass="admin-salon-meta-item">
                                        <asp:Image ID="imgPin1" runat="server" ImageUrl="~/Images/admin_icons/pin.svg" CssClass="admin-salon-meta-icon" AlternateText="📍" />
                                        <asp:Label ID="lblSalonAddress1" runat="server" Text="Trikon Bag, Rajkot" />
                                    </asp:Panel>
                                    <asp:Panel ID="pnlSalonServ1" runat="server" CssClass="admin-salon-meta-item">
                                        <asp:Image ID="imgHair1" runat="server" ImageUrl="~/Images/admin_icons/hair_service.svg" CssClass="admin-salon-meta-icon" AlternateText="✂" />
                                        <asp:Label ID="lblSalonServices1" runat="server" Text="Hair Cut, Beard, Facial" />
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                            <asp:Panel ID="pnlSalonRight1" runat="server" CssClass="admin-salon-right-actions">
                                <asp:Panel ID="pnlRatingBox1" runat="server" CssClass="admin-salon-rating-box">
                                    <asp:Image ID="imgStar1" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Label ID="lblRating1" runat="server" CssClass="admin-salon-rating-num" Text="4.9" />
                                </asp:Panel>
                                <asp:Panel ID="pnlMoreWrapper1" runat="server" CssClass="admin-more-menu-container">
                                    <asp:LinkButton ID="btnMore1" runat="server" CssClass="admin-more-dots-btn" OnClientClick="toggleSalonMenu('pnlMenu1', event); return false;">
                                        <asp:Image ID="imgMore1" runat="server" ImageUrl="~/Images/admin_icons/more_dots.svg" AlternateText="···" />
                                    </asp:LinkButton>
                                    <asp:Panel ID="pnlMenu1" runat="server" ClientIDMode="Static" CssClass="admin-salon-dropdown-menu" style="display: none;">
                                        <asp:LinkButton ID="btnDetails1" runat="server" CssClass="admin-dropdown-action" OnClick="btnDetails1_Click">
                                            <asp:Label ID="lblDetText1" runat="server" Text="Details" />
                                        </asp:LinkButton>
                                        <asp:HyperLink ID="btnAdd1" runat="server" CssClass="admin-dropdown-action" NavigateUrl="~/Admin/AdminAddSalon.aspx">
                                            <asp:Label ID="lblAddText1" runat="server" Text="Add Salon" />
                                        </asp:HyperLink>
                                        <asp:LinkButton ID="btnRemove1" runat="server" CssClass="admin-dropdown-action admin-action-remove" OnClick="btnRemove1_Click" OnClientClick="return confirm('Are you sure you want to remove Stylio Men\'s Salon?');">
                                            <asp:Label ID="lblRemText1" runat="server" Text="Remove" />
                                        </asp:LinkButton>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>

                        <%-- Salon 2: The Mae Mane Salon --%>
                        <asp:Panel ID="pnlSalonItem2" runat="server" CssClass="admin-salon-card-item">
                            <asp:Panel ID="pnlSalonLeft2" runat="server" CssClass="admin-salon-left-info">
                                <asp:Image ID="imgSalon2" runat="server" ImageUrl="~/Images/salon_maemane.png" CssClass="admin-salon-thumbnail" AlternateText="The Mae Mane Salon" />
                                <asp:Panel ID="pnlSalonDetails2" runat="server" CssClass="admin-salon-details">
                                    <asp:Label ID="lblSalonTitle2" runat="server" CssClass="admin-salon-title" Text="The Mae Mane Salon" />
                                    <asp:Panel ID="pnlSalonLoc2" runat="server" CssClass="admin-salon-meta-item">
                                        <asp:Image ID="imgPin2" runat="server" ImageUrl="~/Images/admin_icons/pin.svg" CssClass="admin-salon-meta-icon" AlternateText="📍" />
                                        <asp:Label ID="lblSalonAddress2" runat="server" Text="Bhaktinagar Circle, Rajkot" />
                                    </asp:Panel>
                                    <asp:Panel ID="pnlSalonServ2" runat="server" CssClass="admin-salon-meta-item">
                                        <asp:Image ID="imgHair2" runat="server" ImageUrl="~/Images/admin_icons/hair_service.svg" CssClass="admin-salon-meta-icon" AlternateText="✂" />
                                        <asp:Label ID="lblSalonServices2" runat="server" Text="Hair Cut, Beard, Hair Color" />
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                            <asp:Panel ID="pnlSalonRight2" runat="server" CssClass="admin-salon-right-actions">
                                <asp:Panel ID="pnlRatingBox2" runat="server" CssClass="admin-salon-rating-box">
                                    <asp:Image ID="imgStar2" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Label ID="lblRating2" runat="server" CssClass="admin-salon-rating-num" Text="4.8" />
                                </asp:Panel>
                                <asp:Panel ID="pnlMoreWrapper2" runat="server" CssClass="admin-more-menu-container">
                                    <asp:LinkButton ID="btnMore2" runat="server" CssClass="admin-more-dots-btn" OnClientClick="toggleSalonMenu('pnlMenu2', event); return false;">
                                        <asp:Image ID="imgMore2" runat="server" ImageUrl="~/Images/admin_icons/more_dots.svg" AlternateText="···" />
                                    </asp:LinkButton>
                                    <asp:Panel ID="pnlMenu2" runat="server" ClientIDMode="Static" CssClass="admin-salon-dropdown-menu" style="display: none;">
                                        <asp:LinkButton ID="btnDetails2" runat="server" CssClass="admin-dropdown-action" OnClick="btnDetails2_Click">
                                            <asp:Label ID="lblDetText2" runat="server" Text="Details" />
                                        </asp:LinkButton>
                                        <asp:HyperLink ID="btnAdd2" runat="server" CssClass="admin-dropdown-action" NavigateUrl="~/Admin/AdminAddSalon.aspx">
                                            <asp:Label ID="lblAddText2" runat="server" Text="Add Salon" />
                                        </asp:HyperLink>
                                        <asp:LinkButton ID="btnRemove2" runat="server" CssClass="admin-dropdown-action admin-action-remove" OnClick="btnRemove2_Click" OnClientClick="return confirm('Are you sure you want to remove The Mae Mane Salon?');">
                                            <asp:Label ID="lblRemText2" runat="server" Text="Remove" />
                                        </asp:LinkButton>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>

                        <%-- Salon 3: The Hair Studio --%>
                        <asp:Panel ID="pnlSalonItem3" runat="server" CssClass="admin-salon-card-item">
                            <asp:Panel ID="pnlSalonLeft3" runat="server" CssClass="admin-salon-left-info">
                                <asp:Image ID="imgSalon3" runat="server" ImageUrl="~/Images/salon_hairstudio.png" CssClass="admin-salon-thumbnail" AlternateText="The Hair Studio" />
                                <asp:Panel ID="pnlSalonDetails3" runat="server" CssClass="admin-salon-details">
                                    <asp:Label ID="lblSalonTitle3" runat="server" CssClass="admin-salon-title" Text="The Hair Studio" />
                                    <asp:Panel ID="pnlSalonLoc3" runat="server" CssClass="admin-salon-meta-item">
                                        <asp:Image ID="imgPin3" runat="server" ImageUrl="~/Images/admin_icons/pin.svg" CssClass="admin-salon-meta-icon" AlternateText="📍" />
                                        <asp:Label ID="lblSalonAddress3" runat="server" Text="Surat, Gujrat" />
                                    </asp:Panel>
                                    <asp:Panel ID="pnlSalonServ3" runat="server" CssClass="admin-salon-meta-item">
                                        <asp:Image ID="imgHair3" runat="server" ImageUrl="~/Images/admin_icons/hair_service.svg" CssClass="admin-salon-meta-icon" AlternateText="✂" />
                                        <asp:Label ID="lblSalonServices3" runat="server" Text="Hair Cut, Beard, Hair Spa" />
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                            <asp:Panel ID="pnlSalonRight3" runat="server" CssClass="admin-salon-right-actions">
                                <asp:Panel ID="pnlRatingBox3" runat="server" CssClass="admin-salon-rating-box">
                                    <asp:Image ID="imgStar3" runat="server" ImageUrl="~/Images/admin_icons/star.svg" CssClass="admin-review-star-img" AlternateText="★" />
                                    <asp:Label ID="lblRating3" runat="server" CssClass="admin-salon-rating-num" Text="4.7" />
                                </asp:Panel>
                                <asp:Panel ID="pnlMoreWrapper3" runat="server" CssClass="admin-more-menu-container">
                                    <asp:LinkButton ID="btnMore3" runat="server" CssClass="admin-more-dots-btn" OnClientClick="toggleSalonMenu('pnlMenu3', event); return false;">
                                        <asp:Image ID="imgMore3" runat="server" ImageUrl="~/Images/admin_icons/more_dots.svg" AlternateText="···" />
                                    </asp:LinkButton>
                                    <asp:Panel ID="pnlMenu3" runat="server" ClientIDMode="Static" CssClass="admin-salon-dropdown-menu" style="display: none;">
                                        <asp:LinkButton ID="btnDetails3" runat="server" CssClass="admin-dropdown-action" OnClick="btnDetails3_Click">
                                            <asp:Label ID="lblDetText3" runat="server" Text="Details" />
                                        </asp:LinkButton>
                                        <asp:HyperLink ID="btnAdd3" runat="server" CssClass="admin-dropdown-action" NavigateUrl="~/Admin/AdminAddSalon.aspx">
                                            <asp:Label ID="lblAddText3" runat="server" Text="Add Salon" />
                                        </asp:HyperLink>
                                        <asp:LinkButton ID="btnRemove3" runat="server" CssClass="admin-dropdown-action admin-action-remove" OnClick="btnRemove3_Click" OnClientClick="return confirm('Are you sure you want to remove The Hair Studio?');">
                                            <asp:Label ID="lblRemText3" runat="server" Text="Remove" />
                                        </asp:LinkButton>
                                    </asp:Panel>
                                </asp:Panel>
                            </asp:Panel>
                        </asp:Panel>

                        <%-- Pagination Bar --%>
                        <asp:Panel ID="pnlSalonsPagination" runat="server" CssClass="admin-pagination-row">
                            <asp:Label ID="lblSalonsPaginationInfo" runat="server" CssClass="admin-pagination-info" Text="Showing 1 to 3 of Salons" />
                            <asp:Panel ID="pnlSalonsPageControls" runat="server" CssClass="admin-pagination-controls">
                                <asp:LinkButton ID="btnPrevPage" runat="server" CssClass="admin-page-btn" Text="&lt;" ToolTip="Previous" />
                                <asp:LinkButton ID="btnPage1" runat="server" CssClass="admin-page-btn admin-page-btn-active" Text="1" />
                                <asp:LinkButton ID="btnPage2" runat="server" CssClass="admin-page-btn" Text="2" />
                                <asp:Label ID="lblEllipsis" runat="server" CssClass="admin-page-ellipsis" Text="..." />
                                <asp:LinkButton ID="btnPage120" runat="server" CssClass="admin-page-btn" Text="120" />
                                <asp:LinkButton ID="btnNextPage" runat="server" CssClass="admin-page-btn" Text="&gt;" ToolTip="Next" />
                            </asp:Panel>
                        </asp:Panel>

                    </asp:Panel>

                </asp:Panel>

            </asp:Panel>

            <%-- Salon Details Popup Modal (Pure ASP Controls) --%>
            <asp:Panel ID="pnlSalonDetailsModal" runat="server" CssClass="admin-modal-overlay" Visible="false">
                <asp:Panel ID="pnlModalCard" runat="server" CssClass="admin-modal-card">
                    <asp:Panel ID="pnlModalHeader" runat="server" CssClass="admin-modal-header">
                        <asp:Label ID="lblModalTitle" runat="server" CssClass="admin-modal-title" Text="Salon Details" />
                        <asp:LinkButton ID="btnCloseX" runat="server" Text="✕" OnClick="btnCloseDetails_Click" style="font-size: 18px; font-weight: bold; color: #555; text-decoration: none; cursor: pointer;" />
                    </asp:Panel>
                    <asp:Panel ID="pnlModalBody" runat="server" CssClass="admin-modal-body">
                        <asp:Image ID="imgModalSalonPhoto" runat="server" CssClass="admin-modal-image" />
                        <asp:Panel ID="pnlRowName" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyName" runat="server" CssClass="admin-detail-key" Text="Salon Name:" />
                            <asp:Label ID="lblValName" runat="server" CssClass="admin-detail-val" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRowOwner" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyOwner" runat="server" CssClass="admin-detail-key" Text="Owner Name:" />
                            <asp:Label ID="lblValOwner" runat="server" CssClass="admin-detail-val" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRowAddress" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyAddress" runat="server" CssClass="admin-detail-key" Text="Address:" />
                            <asp:Label ID="lblValAddress" runat="server" CssClass="admin-detail-val" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRowServices" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyServices" runat="server" CssClass="admin-detail-key" Text="Services:" />
                            <asp:Label ID="lblValServices" runat="server" CssClass="admin-detail-val" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRowRating" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyRating" runat="server" CssClass="admin-detail-key" Text="Rating:" />
                            <asp:Label ID="lblValRating" runat="server" CssClass="admin-detail-val" />
                        </asp:Panel>
                        <asp:Panel ID="pnlRowStatus" runat="server" CssClass="admin-detail-row">
                            <asp:Label ID="lblKeyStatus" runat="server" CssClass="admin-detail-key" Text="Status:" />
                            <asp:Label ID="lblValStatus" runat="server" CssClass="admin-detail-val" Text="Active" />
                        </asp:Panel>
                    </asp:Panel>
                    <asp:Panel ID="pnlModalFooter" runat="server" CssClass="admin-modal-footer">
                        <asp:Button ID="btnCloseModal" runat="server" CssClass="btn-admin-submit" Text="Close" OnClick="btnCloseDetails_Click" />
                    </asp:Panel>
                </asp:Panel>
            </asp:Panel>

        </asp:Panel>
    </form>
</body>
</html>
