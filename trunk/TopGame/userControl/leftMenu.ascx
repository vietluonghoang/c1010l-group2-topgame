<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="leftMenu.ascx.cs" Inherits="TopGame.userControl.leftMenu" %>
<link rel="Stylesheet" href="../stylesheet/leftNav.css" type="text/css" />
<div class="wrapLeftMenu">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <a href="../Default.aspx">
                <div class="menu">
                    <asp:Label ID="Label1" runat="server" Text='Home'></asp:Label>
                </div>
            </a>
            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                <ItemTemplate>
                    <a href="viewListGame.aspx?catId=<%# Eval("id") %>">
                        <div class="menu">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("catName") %>'></asp:Label>
                        </div>
                    </a>
                </ItemTemplate>
                <SeparatorStyle BorderStyle="None" BorderWidth="0px" />
            </asp:DataList>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <a href="../adminForm/AdminManageGame.aspx">
                <div class="menu">
                    <asp:Label ID="Label2" runat="server" Text='Game'></asp:Label>
                </div>
            </a>
            <a href="../adminForm/AdminManageUsers.aspx">
                <div class="menu">
                    <asp:Label ID="Label3" runat="server" Text='User'></asp:Label>
                </div>
            </a>
            <a href="../adminForm/AdminManageComment.aspx">
                <div class="menu">
                    <asp:Label ID="Label4" runat="server" Text='Comment'></asp:Label>
                </div>
            </a>
        </asp:View>
    </asp:MultiView>
</div>
