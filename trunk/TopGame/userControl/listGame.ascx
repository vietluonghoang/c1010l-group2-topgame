<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="listGame.ascx.cs" Inherits="TopGame.userControl.listGame" %>
<%@ Register Src="likeBtn.ascx" TagName="likeBtn" TagPrefix="uc1" %>
<link rel="Stylesheet" href="../stylesheet/listGame.css" type="text/css" />
<div id="gameList">
    <asp:DataList ID="DataList1" runat="server">
        <ItemTemplate>
            <div class="gameListItem">
                <a href="viewGame.aspx?gameId=<%# Eval("id") %>">
                    <div class="icon">
                        <div class="name">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("gameName") %>'></asp:Label>
                        </div>
                        <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("posterFile") %>'
                            Width="120px" />
                    </div>
                </a>
                <div class="totalLike">
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("totalLike") %>'></asp:Label>
                </div>
                <div class="desc">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
</div>
