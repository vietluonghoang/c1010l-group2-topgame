<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/User.Master" AutoEventWireup="true" CodeBehind="viewListGame.aspx.cs" Inherits="TopGame.viewListGame" %>

<%@ Register src="userControl/listGame.ascx" tagname="listGame" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <uc1:listGame ID="listGame1" runat="server" />
    
</asp:Content>
