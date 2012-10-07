<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="userPane.ascx.cs" Inherits="Assignment.userControl.userPane" %>
<link rel="Stylesheet" href="/stylesheet/userPane.css" type="text/css" />
<div id="wrapUser">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <div id="name">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </div>
            <div id="image">
                <a href="../accountForm/EditProfile.aspx">
                    <asp:Image ID="Image1" runat="server" CssClass="avatar" Height="100px" Width="100px" /></a>
                <div class="button">
                    <asp:LinkButton ID="lBtnLogout" runat="server" onclick="lBtnLogout_Click">Log out</asp:LinkButton>
                </div>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div class="button">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="../accountForm/login.aspx">Login</asp:HyperLink>
            </div>
            <div class="button">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="/accountForm/register.aspx">Registration</asp:HyperLink>
            </div>
        </asp:View>
    </asp:MultiView>
</div>
