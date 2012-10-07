<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Admin.Master" AutoEventWireup="true"
    CodeBehind="AdminManageUsers.aspx.cs" Inherits="Assignment.AdminManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .um-labelmanage
        {
            margin: 10px 0 0 300px;
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
        <asp:Label ID="Label2" runat="server" Text="User Management" Font-Size="X-Large"
            ForeColor="white"></asp:Label>
    </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label3" runat="server" Text="Email" ForeColor="White"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" Style="margin-left: 14px" Width="165px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Style="margin-left: 19px" Text="Search" Width="70px"
        Height="30px" Font-Size="14px" Font-Bold="True" BackColor="Red" ForeColor="White"
        BorderColor="White" OnClick="Button1_Click" />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
        CssClass="um-grid" AllowPaging="True" EnableModelValidation="True" OnRowCommand="GridView1_RowCommand"
        OnPageIndexChanging="GridView1_PageIndexChanging" Width="100%" BackColor="White"
        BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
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
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
    </asp:GridView>
    <br />
</asp:Content>
