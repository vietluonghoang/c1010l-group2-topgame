<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Admin.Master" AutoEventWireup="true"
    CodeBehind="AdminEditGame.aspx.cs" Inherits="Assignment.AdminEditGame" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        #wrapDes
        {
            width: 400px;
        }
        #editgame-wrap .content
        {
            margin: 20px;
            min-width: 500px;
            border: 1px solid black;
            padding: 10px;
        }
        #editgame-wrap .contentItem
        {
            margin: 10px 10px 10px 0px;
        }
    </style>
    <div id="editgame-wrap">
        <div class="content">
            <asp:Image ID="Image1" runat="server" Height="250px" Width="300px" />
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Edit</asp:LinkButton>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Submit" />
        </div>
        <div id="editgame-wrapgrid">
        <div class="content">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                CssClass="editgame-grid" OnRowCommand="GridView1_RowCommand" GridLines="None">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            
                                <asp:Label ID="Label1" runat="server" Text="Game Name:"></asp:Label>
                                <asp:Label ID="lbeditname" runat="server" Text='<%# Eval("gameName") %>'></asp:Label>
                                <asp:TextBox runat="server" ID="txteditname" Text='<%# Bind("gameName") %>' />
                                <asp:LinkButton ID="editgamename" runat="server" CausesValidation="False" CommandName="editgamename"
                                    Text="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                                <asp:LinkButton ID="updategamename" runat="server" CausesValidation="False" CommandName="updategamename"
                                    Text="Update" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                            
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" HeaderText="id" Visible="False" />
                </Columns>
            </asp:GridView>
            </div>
            <div class="content">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                OnRowCommand="GridView2_RowCommand" CssClass="editgame-grid" GridLines="None">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text="Category:"></asp:Label>
                            <asp:Label ID="lbeditcategory" runat="server" Text='<%# Eval("categoryId") %>'></asp:Label>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                            </asp:DropDownList>
                            <asp:LinkButton ID="editcategory" runat="server" CausesValidation="False" CommandName="editcategory"
                                Text="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                            <asp:LinkButton ID="updatecategory" runat="server" CausesValidation="False" CommandName="updatecategory"
                                Text="Update" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" HeaderText="id" Visible="False" />
                </Columns>
            </asp:GridView>
            </div>
            <div class="content">

            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CssClass="editgame-grid"
                GridLines="None">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
            <div class="contentItem">
                            <asp:Label ID="Label12" runat="server" Text="Total Like:"></asp:Label>
                            <asp:Label ID="lbeditcategory" runat="server" Text='<%# Eval("totalLike") %>'></asp:Label>
                            </div>
            <div class="contentItem">
                            <asp:Label ID="Label2" runat="server" Text="Status:"></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                            </div>
            <div class="contentItem">
                            <asp:Label ID="Label4" runat="server" Text="Up Time:"></asp:Label>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("upTime") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>
            <div class="content">
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                OnRowCommand="GridView4_RowCommand" CssClass="editgame-grid" GridLines="None">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="Label16" runat="server" Text="Trailer:"></asp:Label>
                            <asp:Label ID="lbedittrailer" runat="server" Text='<%# Eval("trailerUrl") %>'></asp:Label>
                            <asp:TextBox runat="server" ID="txtedittrailer" Text='<%# Bind("trailerUrl") %>'
                                TextMode="MultiLine" Width="220px" />
                            <asp:LinkButton ID="edittrailer" runat="server" CausesValidation="False" CommandName="edittrailer"
                                Text="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                            <asp:LinkButton ID="updatetrailer" runat="server" CausesValidation="False" CommandName="updatetrailer"
                                Text="Update" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" HeaderText="id" Visible="False" />
                </Columns>
            </asp:GridView>
            </div>
            <div class="content">
            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                OnRowCommand="GridView5_RowCommand" CssClass="editgame-grid" GridLines="None">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div id="wrapDes">
                                <asp:Label ID="Label17" runat="server" Text="Description:"></asp:Label>
                                <asp:Label ID="lbeditdesc" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                            </div>
                            <asp:TextBox runat="server" ID="txteditdesc" Text='<%# Bind("description") %>' TextMode="MultiLine"
                                Width="220px" />
                            <asp:LinkButton ID="editdesc" runat="server" CausesValidation="False" CommandName="editdesc"
                                Text="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                            <asp:LinkButton ID="updatedesc" runat="server" CausesValidation="False" CommandName="updatedesc"
                                Text="Update" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" HeaderText="id" Visible="False" />
                </Columns>
            </asp:GridView>
            </div>
            <asp:Button ID="Button1" runat="server" Text="Game Management" OnClick="Button1_Click"
                CssClass="editgame-backbut" />
        </div>
    </div>
</asp:Content>
