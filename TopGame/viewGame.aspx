<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/User.Master" AutoEventWireup="true" CodeBehind="viewGame.aspx.cs" Inherits="Assignment.viewGame" %>
<%@ Register src="userControl/game.ascx" tagname="game" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:game ID="game1" runat="server" />
</asp:Content>
