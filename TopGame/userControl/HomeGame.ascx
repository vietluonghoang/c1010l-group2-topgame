<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeGame.ascx.cs" Inherits="Assignment.userControl.HomeGame" %>
<link rel="Stylesheet" href="../stylesheet/homeGame.css" type="text/css" />
<div id="wrapHomeGame">
    <div id="name">
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </div>
    <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal">
        <ItemTemplate>
            <a href="viewGame.aspx?gameId=<%# Eval("id") %>">
                <div class="item">
                    <div class="image">
                        <asp:Image ID="Image1" runat="server" Height="80px" ImageUrl='<%# Eval("posterFile") %>'
                            Width="100px" /></div>
                    <div class="gameName">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("gameName") %>'></asp:Label>
                    </div>
                </div>
            </a>
        </ItemTemplate>
    </asp:DataList>
</div>
