<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="game.ascx.cs" Inherits="Assignment.userControl.game" %>
<%@ Register Src="listGame.ascx" TagName="listGame" TagPrefix="uc1" %>
<%@ Register src="likeBtn.ascx" tagname="likeBtn" tagprefix="uc2" %>
<%@ Register src="comment.ascx" tagname="comment" tagprefix="uc3" %>
<link rel="Stylesheet" href="/stylesheet/game.css" type="text/css" />

<div id="gameWrap">
    <div id="gameTl">
        <div id="gameTrailer" runat="server">
        </div>
    </div>
    <div id="title">
        <%if (Session["id"] != null)
          { %>
        <div id="likeBtn">

            <uc2:likeBtn ID="likeBtn1" runat="server" />

            </div>
        
        <%} %>
        
        <div id="txt">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
        
        <div id="des">
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        </div>
    </div>
    <div id="gameImage">
        <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow">
            <ItemTemplate>
                <div class="im">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imageFile") %>' Height="150px"
                        Width="179px" /></div>
            </ItemTemplate>
        </asp:DataList>
        
    </div>
    <%--
<div id="poster">
    <asp:Image ID="Image2" runat="server" Height="200px" Width="300px" />
</div>--%>
<uc3:comment ID="comment1" runat="server" />
</div>
