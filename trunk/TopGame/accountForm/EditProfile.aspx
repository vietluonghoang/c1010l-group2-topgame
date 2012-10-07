﻿<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/User.Master" AutoEventWireup="true"
    CodeBehind="EditProfile.aspx.cs" Inherits="Assignment.EditProfile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
    #wrapProfile
    {
        border: 1px solid #aa1111;
    
    }
    .ep-image
    {}
    </style>
    <div id="wrapProfile">
    <asp:GridView ID="gvEditAva" runat="server" AutoGenerateColumns="False" EnableModelValidation="True"
        GridLines="None" OnRowCancelingEdit="gvEditAva_RowCancelingEdit" OnRowEditing="gvEditAva_RowEditing"
        ShowHeader="False" Width="100%" OnRowUpdating="gvEditAva_RowUpdating" 
        CellPadding="4" ForeColor="#333333">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("avaFile") %>' Height="250px"
                        Width="250px" CssClass="ep-image" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("avaFile") %>' Height="250px"
                        Width="250px" CssClass="ep-image" />
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="ep-fu" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                <div class="editBtn">
                    <asp:LinkButton ID="lbtEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="ep-editava"></asp:LinkButton>
                    <div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="lbtUpdate" runat="server" CommandName="Update" Text="Update"></asp:LinkButton>
                    <asp:LinkButton ID="lbtCancel" runat="server" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    </asp:GridView>
    <%if (Convert.ToInt32(Session["role"].ToString()) < 3)
      { %>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True"
        GridLines="None" CssClass="ep-grid1" OnRowCancelingEdit="GridView1_RowCancelingEdit"
        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
        CellPadding="4" ForeColor="#333333" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("email") %>' CssClass="ep-disla"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("email") %>' CssClass="ep-disla"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label3" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lbtEdit" runat="server" CommandName="Edit" Text="Edit" CssClass="ep-edit"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="lbtUpdate" runat="server" CommandName="Update" Text="Update"></asp:LinkButton>
                    <asp:LinkButton ID="lbtCancel" runat="server" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    </asp:GridView>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" EnableModelValidation="True"
        GridLines="None" CssClass="ep-grid1" OnRowCancelingEdit="GridView2_RowCancelingEdit"
        OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating" 
        CellPadding="4" ForeColor="#333333" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="Label21" runat="server" Text="UserName"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label21" runat="server" Text="UserName"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("userName") %>' CssClass="ep-dislauser"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("userName") %>' CssClass="ep-dislauser"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label31" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lbtEditUN" runat="server" CommandName="Edit" Text="Edit" CssClass="ep-edituser"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="lbtUpdateUN" runat="server" CommandName="Update" Text="Update"></asp:LinkButton>
                    <asp:LinkButton ID="lbtCancelUN" runat="server" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    </asp:GridView>
    <%} %>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" EnableModelValidation="True"
        GridLines="None" CssClass="ep-grid1" OnRowCancelingEdit="GridView3_RowCancelingEdit"
        OnRowEditing="GridView3_RowEditing" OnRowUpdating="GridView3_RowUpdating" 
        CellPadding="4" ForeColor="#333333" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text="****************" CssClass="ep-dislauser"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text="New Password">
                    </asp:Label><asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Style="margin-left: 63px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="Re-type New Password">
                    </asp:Label><asp:TextBox ID="TextBox3" runat="server" TextMode="Password" Style="margin-left: 11px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label8" runat="server" Visible="False" ForeColor="Red"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lbtEditPW" runat="server" CommandName="Edit" Text="Edit" CssClass="ep-editpass"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="lbtUpdatePW" runat="server" CommandName="Update" Text="Update"></asp:LinkButton>
                    <asp:LinkButton ID="lbtCancelPW" runat="server" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    </asp:GridView>
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" EnableModelValidation="True"
        GridLines="None" CssClass="ep-grid1" OnRowCancelingEdit="GridView4_RowCancelingEdit"
        OnRowEditing="GridView4_RowEditing" OnRowUpdating="GridView4_RowUpdating" 
        CellPadding="4" ForeColor="#333333" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="Label41" runat="server" Text="Gender"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label41" runat="server" Text="Gender"></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="lbGen" runat="server" Text='<%# Eval("gender") %>' CssClass="ep-dislagen"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:RadioButton ID="rdMale" runat="server" Text="Male" GroupName="gender" />
                    <asp:RadioButton ID="rdFemale" runat="server" Text="Female" GroupName="gender" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lbtEditGD" runat="server" CommandName="Edit" Text="Edit" CssClass="ep-editgen"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="lbtUpdateGD" runat="server" CommandName="Update" Text="Update"></asp:LinkButton>
                    <asp:LinkButton ID="lbtCancelGD" runat="server" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    </asp:GridView>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    
</asp:Content>

