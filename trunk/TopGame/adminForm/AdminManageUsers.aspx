<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Admin.Master" AutoEventWireup="true"
    CodeBehind="AdminManageUsers.aspx.cs" Inherits="Assignment.AdminManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .um-labelmanage
        {
            margin: 10px;
        }
        
        input[type="text"]
        {
            padding: 4px;
            margin: 4px 0 4px 0;
            background: #fff;
            font-size: 12px;
            color: #555;
            border: 1px solid #ddd;
            width: 180px;
            -webkit-box-shadow: 0px 0px 4px #aaa;
            -moz-box-shadow: 0px 0px 4px #aaa;
            -webkit-transition: background 0.3s linear;
        }
    </style>
    <div class="um-labelmanage">
        <asp:Label ID="Label2" runat="server" Text="User Management" Font-Size="Large"></asp:Label>
    </div><asp:Label ID="Label3" runat="server" Text="Email" ForeColor="White"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Search" Width="70px"
        Height="30px" Font-Size="14px" Font-Bold="True" 
        BorderColor="White" OnClick="Button1_Click" />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
        CssClass="um-grid" AllowPaging="True" OnRowCommand="GridView1_RowCommand"
        OnPageIndexChanging="GridView1_PageIndexChanging" Width="100%" BackColor="White"
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UserName">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("userName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Role">
                <ItemTemplate>
                    <asp:Label ID="lbRole" runat="server" Text='<%# Eval("role") %>'></asp:Label>
                    <asp:LinkButton ID="lbtMember" runat="server" CausesValidation="False" CommandName="Member"
                        Text="Member" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LbtModerator" runat="server" CausesValidation="False" CommandName="Moderator"
                        Text="Moderator" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label ID="lbStatus" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                    <asp:LinkButton ID="lbtActive" runat="server" CausesValidation="False" CommandName="Active"
                        Text="Active" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'>
                    </asp:LinkButton>
                    <asp:LinkButton ID="LbtDeactive" runat="server" CausesValidation="False" CommandName="Deactive"
                        Text="Deactive" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="id" HeaderText="id" Visible="False" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <br />
</asp:Content>
