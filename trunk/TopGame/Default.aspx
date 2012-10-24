<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/User.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Assignment.Default" %>

<%@ Register Src="userControl/HomeGame.ascx" TagName="HomeGame" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="videoDiv" runat="server">
    </div>
</asp:Content>
