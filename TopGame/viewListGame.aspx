<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/User.Master" AutoEventWireup="true"
    CodeBehind="viewListGame.aspx.cs" Inherits="TopGame.viewListGame" %>

<%@ Register Src="userControl/listGame.ascx" TagName="listGame" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" EnableViewState="true" UpdateMode="Conditional" ViewStateMode="Enabled">
        <ContentTemplate>
            <uc1:listGame ID="listGame1" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
