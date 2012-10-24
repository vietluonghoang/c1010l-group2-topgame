<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="likeBtn.ascx.cs" Inherits="Assignment.userControl.likeBtn" %>
<link href="../stylesheet/likeButton.css" rel="stylesheet" type="text/css" />
<div id="wrapLikeButton">
<asp:ImageButton ID="ImageButtonLike" runat="server" OnClick="ImageButtonLike_Click"
    ImageUrl="~/icon/like.png" />
<asp:ImageButton ID="ImageButtonUnlike" runat="server" OnClick="ImageButtonUnlike_Click1"
    ImageUrl="~/icon/unlike.png" />
<asp:Label ID="lblLike" runat="server" Text="Label"></asp:Label>
</div>