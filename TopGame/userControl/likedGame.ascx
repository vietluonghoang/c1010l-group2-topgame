<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="likedGame.ascx.cs" Inherits="TopGame.userControl.likedGame" %>
<link rel="Stylesheet" href="../stylesheet/rightNav.css" type="text/css" />
<div id="wrapLikedGame">
    <asp:Label ID="Label2" runat="server" Text="Do you play ?" ForeColor="White"></asp:Label>
    <asp:DataList ID="DataList1" runat="server">
        <ItemTemplate>
            <a href="viewGame.aspx?gameId=<%# Eval("id") %>">
                <div class="game">
                    <div class="image">
                        <asp:Image ID="Image1" runat="server" Height="80px" Width="100px" ImageUrl='<%# Eval("posterFile") %>' />
                    </div>
                    <div class="name">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("gameName") %>'></asp:Label>
                    </div>
                </div>
            </a>
            <div class="like">
                <asp:Image ID="Image3" runat="server" ImageUrl="/icon/ttLike.png"/>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("totalLike") %>'></asp:Label>
            </div>
            <div class="like">
                <asp:Image ID="Image2" runat="server"  ImageUrl="/icon/comment.png"/>:
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("cm") %>'></asp:Label>
            </div>
        </ItemTemplate>
    </asp:DataList>
</div>
