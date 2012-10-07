<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Admin.Master" AutoEventWireup="true"
    CodeBehind="AdminEditGame.aspx.cs" Inherits="Assignment.AdminEditGame" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
   
   #editgame-wrap
   {
       width:700px;
       height:750px;
     //  border:1px solid #aa1111;
       margin:10px 0 10px 10px;
       }
       
       .editgame-image
       {
            width:400px;
       height:250px;
       //border:1px solid #aa1111;
       margin:10px 0 0 80px;
           }
       
       .editgame-grid
       {
       width:450px;
       height:60px;
        border-bottom:1px solid black;
        border-top:1px solid black;
           }
    
    #editgame-wrapgrid
    {
        margin:60px 0 0 10px;
        
        }
    
    
    .editgame-label
    {
        
        width:100px;
        height:20px;
      //  border:2px solid red;
      
        }
    
    .editgame-display
    {
        width:300px;
        height:25px;
        float:right;
     //   border:2px solid red;
        margin-top:-20px;
        }
    
     .editgame-displayarea
    {
        width:300px;
        float:right;
        margin-top:-24px;
        }
              
        .editgame-displaylab
    {
        width:300px;
        height:25px;
        float:right;
     //   border:2px solid red;
        margin-top:-24px;
        }
    
    .editgame-edit
    {
        
        margin-left:275px;
        margin-top:-15px;
    
        }
    
    .editgame-updatebut
    {
        margin-left:255px;
        margin-top:-15px;
        }
        
       .editgame-backbut
       {
           
           width:150px;
           height:30px;
           margin:20px 0 10px 100px;
           
           }
        
    
    a
    {
        text-decoration:none;
        }
  

    
    </style>
    <div id="editgame-wrap">
        <div class="editgame-image">
            <asp:Image ID="Image1" runat="server" Height="250px" Width="300px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Edit</asp:LinkButton>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Submit" />
        </div>
        <div id="editgame-wrapgrid">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                CssClass="editgame-grid" OnRowCommand="GridView1_RowCommand" GridLines="None">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="editgame-label">
                                <asp:Label ID="Label1" runat="server" Text="Game Name:"></asp:Label>
                            </div>
                            <div class="editgame-display">
                                <asp:Label ID="lbeditname" runat="server" Text='<%# Eval("gameName") %>'></asp:Label>
                                <asp:TextBox runat="server" ID="txteditname" Text='<%# Bind("gameName") %>' />
                                <div class="editgame-edit">
                                    <asp:LinkButton ID="editgamename" runat="server" CausesValidation="False" CommandName="editgamename"
                                        Text="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                                </div>
                                <div class="editgame-updatebut">
                                    <asp:LinkButton ID="updategamename" runat="server" CausesValidation="False" CommandName="updategamename"
                                        Text="Update" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" HeaderText="id" Visible="False" />
                </Columns>
            </asp:GridView>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                OnRowCommand="GridView2_RowCommand" CssClass="editgame-grid" GridLines="None">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="editgame-label">
                                <asp:Label ID="Label11" runat="server" Text="Category:"></asp:Label></div>
                            <div class="editgame-display">
                                <asp:Label ID="lbeditcategory" runat="server" Text='<%# Eval("categoryId") %>'></asp:Label>
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                </asp:DropDownList>
                                <div class="editgame-edit">
                                    <asp:LinkButton ID="editcategory" runat="server" CausesValidation="False" CommandName="editcategory"
                                        Text="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                                </div><>
                                <div class="editgame-updatebut">
                                    <asp:LinkButton ID="updatecategory" runat="server" CausesValidation="False" CommandName="updatecategory"
                                        Text="Update" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" HeaderText="id" Visible="False" />
                </Columns>
            </asp:GridView>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CssClass="editgame-grid"
                GridLines="None">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="editgame-label">
                                <asp:Label ID="Label12" runat="server" Text="Total Like:"></asp:Label></div>
                            <div class="editgame-displaylab">
                                <asp:Label ID="lbeditcategory" runat="server" Text='<%# Eval("totalLike") %>'></asp:Label>
                            </div>
                            <br />
                            <div class="editgame-label">
                                <asp:Label ID="Label2" runat="server" Text="Status:"></asp:Label></div>
                            <div class="editgame-displaylab">
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                            </div>
                            <br />
                            <div class="editgame-label">
                                <asp:Label ID="Label4" runat="server" Text="Up Time:"></asp:Label></div>
                            <div class="editgame-displaylab">
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("upTime") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                OnRowCommand="GridView4_RowCommand" CssClass="editgame-grid" GridLines="None">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="editgame-label">
                                <asp:Label ID="Label16" runat="server" Text="Trailer:"></asp:Label></div>
                            <div class="editgame-displayarea">
                                <asp:Label ID="lbedittrailer" runat="server" Text='<%# Eval("trailerUrl") %>'></asp:Label>
                                <asp:TextBox runat="server" ID="txtedittrailer" Text='<%# Bind("trailerUrl") %>'
                                    TextMode="MultiLine" Width="220px" />
                                <div class="editgame-edit">
                                    <asp:LinkButton ID="edittrailer" runat="server" CausesValidation="False" CommandName="edittrailer"
                                        Text="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                                </div>
                                <div class="editgame-updatebut">
                                    <asp:LinkButton ID="updatetrailer" runat="server" CausesValidation="False" CommandName="updatetrailer"
                                        Text="Update" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" HeaderText="id" Visible="False" />
                </Columns>
            </asp:GridView>
            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
                OnRowCommand="GridView5_RowCommand" CssClass="editgame-grid" GridLines="None">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="editgame-label">
                                <asp:Label ID="Label17" runat="server" Text="Description:"></asp:Label></div>
                            <div class="editgame-displayarea">
                                <asp:Label ID="lbeditdesc" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                                <asp:TextBox runat="server" ID="txteditdesc" Text='<%# Bind("description") %>' TextMode="MultiLine"
                                    Width="220px" />
                                <div class="editgame-edit">
                                    <asp:LinkButton ID="editdesc" runat="server" CausesValidation="False" CommandName="editdesc"
                                        Text="Edit" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                                </div>
                                <div class="editgame-updatebut">
                                    <asp:LinkButton ID="updatedesc" runat="server" CausesValidation="False" CommandName="updatedesc"
                                        Text="Update" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id" HeaderText="id" Visible="False" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="Button1" runat="server" Text="Game Management" OnClick="Button1_Click"
                CssClass="editgame-backbut" Font-Bold="True" ForeColor="White" BackColor="red" />
    </div> </div>
</asp:Content>
