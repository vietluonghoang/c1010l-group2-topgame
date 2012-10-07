<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="comment.ascx.cs" Inherits="Assignment.userControl.comment" %>
<link href="../stylesheet/comment.css" rel="stylesheet" type="text/css" />
<div id="wrapCm">
    <asp:DataList ID="DataList1" runat="server" >
        <ItemTemplate>
            <div class="user">
                <div class="name">
                    
                </div>
                <asp:Image ID="Image1" runat="server" Height="50px" 
                    ImageUrl='<%# Eval("avaFile") %>' Width="50px" />
            </div>
            <div class="comment">
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("userName") %>'></asp:Label>:&nbsp; 
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("detail") %>'></asp:Label>
            </div>
        </ItemTemplate>
    </asp:DataList>
    
    <%if (Session["id"] != null)
      { %>
    <div id="txt">
        <asp:TextBox ID="TextBox1" runat="server" Rows="2" TextMode="MultiLine" Width="300px"></asp:TextBox>
    </div>
    <div id="btn">
        <asp:Button ID="Button1" runat="server" Text="Post" Height="34px" Width="51px" 
            onclick="Button1_Click" />
    </div>
    <%} %>
</div>
