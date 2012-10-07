<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Admin.Master" AutoEventWireup="true"
    CodeBehind="AdminManageImages.aspx.cs" Inherits="Assignment.AdminManageImages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .im-labelmanage
        {
            margin: 10px 0 0 300px;
        }
        
        .im-data
        {
            margin: 20px 5px 0 5px;
        }
        
        .im-image
        {
            margin: 10px 0 10px 0;
        }
        
        .im-backbut
        {
            width: 150px;
            height: 30px;
            margin: 50px 0 10px 350px;
        }
        
        .im-grid
        {
            margin: 50px 0 5px 50px;
        }
    </style>
    <div class="im-labelmanage">
        <asp:Label ID="Label2" runat="server" Text="Game Images Management" Font-Size="X-Large"
            ForeColor="white"></asp:Label>
    </div>
    <asp:LinkButton ID="lbtnInsertComponent" runat="server" ValidationGroup="insert"
        CausesValidation="True" Text="Add Image" OnClick="lbtnInsertComponent_Click">
    </asp:LinkButton>
    <asp:FileUpload ID="FileUpload2" runat="server" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True"
        CssClass="im-grid" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing"
        OnRowCommand="GridView1_RowCommand" BorderColor="#CC9966" 
        ShowHeader="False" AllowPaging="True"
        PageSize="4" OnPageIndexChanging="GridView1_PageIndexChanging" 
        BackColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="False" CommandName="Edit"
                        Text="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'>
                    </asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="lbtnUpdate" runat="server" ValidationGroup="update" CausesValidation="True"
                        CommandName="UpdateComponent" Text="Update" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                    <asp:LinkButton ID="DeleteComponent" runat="server" ValidationGroup="update" CausesValidation="True"
                        CommandName="DeleteComponent" Text="Delete" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                    <asp:LinkButton ID="lbtnCancelComponent" runat="server" ValidationGroup="update"
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                </EditItemTemplate>
                <ItemStyle Wrap="False" Width="50px"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" CssClass="im-image" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "imageFile") %>'
                        Width="150px" Height="100px" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Image ID="Image1" runat="server" CssClass="im-image" ImageUrl='<%#DataBinder.Eval(Container.DataItem, "imageFile") %>'
                        Width="150px" Height="100px" />
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
    </asp:GridView>
    <asp:Button ID="Button1" runat="server" Text="Game Management" OnClick="Button1_Click"
        CssClass="im-backbut" Font-Bold="True" ForeColor="White" BackColor="red" />
</asp:Content>
