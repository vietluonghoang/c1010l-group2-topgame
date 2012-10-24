<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Admin.Master" AutoEventWireup="true" CodeBehind="AdminManageGame.aspx.cs" Inherits="Assignment.AdminManageGame" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">

 .gm-icon
{
    background-color: Black;
    width: 120px;
    height: 130px;
    float: left;
    box-shadow: 2px 2px 2px #000000;
}

 .gm-name
{
    padding-top: 5px;
    height:25px;
    color: White;
    text-align: center;
}

.gm-totalLike
{
    padding-top: 8px;
    width: 150px;
    height: 22px;
    margin:0 0 10px 0px;
    
   
}

.gm-status
{
    padding-top: 8px;
    width: 150px;
    height: 22px;
    margin:0 0 10px 0px;
   
    }

    .gm-cat
{
    padding-top: 8px;
    width: 150px;
    height: 22px;
    margin:0 0 10px 0px;
    padding:5px 0 0 2px;
    
    }

   .mg-labelmanage
   {
       margin:10px 0px 0px 0px;
       }

        #mg-butadd
    {
        margin-left: 10px;
        margin-bottom: 20px;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
    }

    .gm-editiname
    {
        margin-left: 10px;
        
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
    #managegame-wrap
    {
        margin-top: 0px;
    }
   
   
</style>
    <div id="managegame-wrap">
    
     <div class="mg-labelmanage">
    <asp:Label ID="Label2" runat="server" Text="Game Management" 
        Font-Size="Medium"></asp:Label>
        </div>   


    <br />
     <div id="mg-butadd">
                            <asp:Button ID="button2" runat="server" Text="Add New Game"
                                Font-Size="14px" Font-Bold="True" 
                                BorderColor="White" onclick="button2_Click"
                               />
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                                 Text="Search"  Width="70px" Height="35px"
                                Font-Size="14px" Font-Bold="True" 
                                BorderColor="White"/>
     </div>


    <asp:GridView ID="GridView1" runat="server"
    AutoGenerateColumns="False"
    DataKeyNames="id"
    onpageindexchanging="GridView1_PageIndexChanging" 
    ShowFooter="True"
    onrowcommand="GridView1_RowCommand"
    AllowPaging="True"
     PageSize="5" BackColor="White" 
         BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            Width="100%" ForeColor="Black" GridLines="Horizontal"
    
    >
    <Columns>
    <asp:TemplateField>
    
    <ItemTemplate>
   <a href="AdminEditGame.aspx?gameId=<%# Eval("id") %>" >
    <div class="gm-icon">
                    <div class="gm-name">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("gameName") %>'></asp:Label>
                    </div>
                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("posterFile") %>'
                        Width="120px" />
                </div>
    </a>
    </ItemTemplate>
   
    </asp:TemplateField>

     <asp:TemplateField>
     
     <ItemTemplate>
     
     <div class="gm-totalLike">
                        Like: <asp:Label ID="Label3" runat="server" Text='<%# Eval("totalLike") %>'></asp:Label>
                    </div>
         
         <div class="gm-status">
                        Status: <asp:Label ID="lbSt" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                    </div>

                    <div class="gm-cat">
                        Category: <asp:Label ID="lbCategory" runat="server" Text='<%#Eval("categoryId") %>'></asp:Label>
                    </div>
     </ItemTemplate>
    
     </asp:TemplateField>

    
      <asp:TemplateField>
      
      <ItemTemplate>

      <asp:LinkButton  ID="lbtActive" runat="server" CausesValidation="False" CommandName="Active"
                        Text="Active" CommandArgument = '<%# DataBinder.Eval(Container, "RowIndex") %>'>
                    </asp:LinkButton>
         
          <asp:LinkButton ID="LbtDeactive" runat="server" CausesValidation="False" CommandName="Deactive"
                        Text="Deactive" CommandArgument = '<%# DataBinder.Eval(Container, "RowIndex") %>' >
                    </asp:LinkButton>
      
      </ItemTemplate>
     
      </asp:TemplateField>


      <asp:TemplateField>
      
      <ItemTemplate>
      
      
      <asp:LinkButton  ID="lbtImage" runat="server" CausesValidation="False" CommandName="ImageManage" CssClass="gm-editiname"
                        Text="Image Management" CommandArgument = '<%# DataBinder.Eval(Container, "RowIndex") %>'>
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


    </div>
</asp:Content>
