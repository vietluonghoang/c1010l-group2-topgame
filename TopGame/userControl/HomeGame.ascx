<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeGame.ascx.cs" Inherits="Assignment.userControl.HomeGame" %>
<link rel="Stylesheet" href="../stylesheet/homeGame.css" type="text/css" />
<div id="wrapHomeGame">
    <div id="name">
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </div>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
    </asp:GridView>
    
</div>
