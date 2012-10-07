<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AdminManageComment.aspx.cs" Inherits="Assignment.AdminManageComment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style type="text/css">

</style>

<div class="cm-labelmanage">
    <asp:Label ID="Label2" runat="server" Text="Comment Management" 
        Font-Size="X-Large" ForeColor="white"></asp:Label>
        </div>


    <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" 
            DataKeyNames="id"
            AllowPaging="True"
            CssClass="cm-grid"
            EnableModelValidation="True" 
            onpageindexchanging="GridView1_PageIndexChanging" 
            onrowcommand="GridView1_RowCommand" CellPadding="4" Width="100%" 
            BackColor="White" BorderColor="#CC9966" BorderStyle="None" 
        BorderWidth="1px" AllowSorting="True">

    <Columns>
    
    <asp:TemplateField HeaderText="Game">
    
    <ItemTemplate>
    
    <asp:Label ID="Label1" runat="server" Text='<%# Eval("gameId") %>'></asp:Label>

    </ItemTemplate>

    </asp:TemplateField>

    <asp:TemplateField HeaderText="User">
    
    <ItemTemplate>
    
    <asp:Label ID="Label2" runat="server" Text='<%# Eval("userId") %>'></asp:Label>

    </ItemTemplate>

    </asp:TemplateField>

    <asp:TemplateField HeaderText="Post Time">
    
    <ItemTemplate>
    
    <asp:Label ID="Label3" runat="server" Text='<%# Eval("postTime") %>'></asp:Label>

    </ItemTemplate>

    </asp:TemplateField>

    <asp:TemplateField HeaderText="Comment">
    
    <ItemTemplate>
    
    <asp:Label ID="Label4" runat="server" Text='<%# Eval("detail") %>'></asp:Label>

    </ItemTemplate>

    </asp:TemplateField>

    <asp:TemplateField HeaderText="Status">
    
    <ItemTemplate>
    
    <asp:Label ID="Label5" runat="server" Text='<%# Eval("status") %>'></asp:Label>
     <asp:LinkButton  ID="lbtActive" runat="server" CausesValidation="False" CommandName="Active"
                        Text="Active" CommandArgument = '<%# DataBinder.Eval(Container, "RowIndex") %>'>
                    </asp:LinkButton>
         
          <asp:LinkButton ID="lbtDeactive" runat="server" CausesValidation="False" CommandName="Deactive"
                        Text="Deactive" CommandArgument = '<%# DataBinder.Eval(Container, "RowIndex") %>' >
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
