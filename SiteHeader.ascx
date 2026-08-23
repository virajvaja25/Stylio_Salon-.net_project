<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SiteHeader.ascx.cs" Inherits="Stylio_Salon.SiteHeader" %>

<asp:Panel ID="pnlHeader" runat="server" CssClass="header header-simple">

    <asp:Panel ID="pnlLogoArea" runat="server" CssClass="logo-area">
        <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images/logo.png"
            AlternateText="Stylio Logo" CssClass="logo-img" />
        <asp:Label ID="lblBrandName" runat="server" Text="Stylio" CssClass="logo-text" />
    </asp:Panel>

    <asp:Panel ID="pnlNav" runat="server" CssClass="nav-links-wide">
        <asp:LinkButton ID="lnkHome" runat="server" Text="Home" CssClass="nav-link"
            OnClick="lnkHome_Click" />
        <asp:LinkButton ID="lnkServices" runat="server" Text="Services" CssClass="nav-link"
            OnClick="lnkServices_Click" />
        <asp:LinkButton ID="lnkSalon" runat="server" Text="Salon" CssClass="nav-link"
            OnClick="lnkSalon_Click" />
        <asp:LinkButton ID="lnkReviews" runat="server" Text="Reviews" CssClass="nav-link"
            OnClick="lnkReviews_Click" />
        <asp:LinkButton ID="lnkAboutUs" runat="server" Text="About Us" CssClass="nav-link"
            OnClick="lnkAboutUs_Click" />
        <asp:LinkButton ID="lnkContent" runat="server" Text="Content" CssClass="nav-link"
            OnClick="lnkContent_Click" />
    </asp:Panel>

</asp:Panel>
