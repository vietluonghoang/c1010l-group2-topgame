<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AdminManageComment.aspx.cs" Inherits="Assignment.AdminManageComment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style type="text/css">
.cm-labelmanage
{
    margin: 20px;
}
</style>

<div class="cm-labelmanage">
    <asp:Label ID="Label2" runat="server" Text="Comment Management" 
        Font-Size="Medium"></asp:Label>
        </div>


    <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" 
            DataKeyNames="id"
            AllowPaging="True"
            CssClass="cm-grid" 
            onpageindexchanging="GridView1_PageIndexChanging" 
            onrowcommand="GridView1_RowCommand" CellPadding="4" Width="100%" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" 
        BorderWidth="1px" AllowSorting="True" ForeColor="Black" 
        GridLines="Horizontal" PageSize="15">

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
