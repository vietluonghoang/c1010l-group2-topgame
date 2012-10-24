<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="topGamePane.ascx.cs" Inherits="TopGame.userControl.topGamePane" %>
<link rel="Stylesheet" href="../stylesheet/gameBar.css" type="text/css" />
<div id="gameBarItems">
    <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal">
        <ItemTemplate>
            <a href="../viewGame.aspx?gameId=<%# Eval("id") %>" >
                <div class="gameBarItem">
                    <asp:Image ID="Image1" runat="server" Height="77px" ImageUrl='<%# Eval("posterFile") %>'
                        Width="100px" onprerender="Image1_PreRender" />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("gameName") %>'></asp:Label>
                </div>
            </a>
        </ItemTemplate>
    </asp:DataList>
</div>
