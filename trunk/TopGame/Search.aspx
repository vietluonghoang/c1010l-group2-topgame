<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/User.Master" AutoEventWireup="true"
    CodeBehind="Search.aspx.cs" Inherits="TopGame.Search" %>

<%@ Register Src="userControl/listGame.ascx" TagName="listGame" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
    <ContentTemplate>
        <asp:TextBox ID="txtSearch" runat="server" Width="172px">
        </asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" 
            onclick="btnSearch_Click" />
        <br />
        <uc1:listGame ID="listGame1" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
