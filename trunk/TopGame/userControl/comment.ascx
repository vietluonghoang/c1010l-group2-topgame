<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="comment.ascx.cs" Inherits="Assignment.userControl.comment" %>
<link href="../stylesheet/comment.css" rel="stylesheet" type="text/css" />
<div id="wrapCm">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        AllowPaging="True" onpageindexchanging="GridView1_PageIndexChanging">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <div class="comment">
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("userName") %>'></asp:LinkButton>: 
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("detail") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <%if (Session["id"] != null)
      { %>
    <div id="txt">
        <asp:TextBox ID="TextBox1" runat="server" Rows="2" TextMode="MultiLine" Width="300px"></asp:TextBox>
    </div>
    <div id="btn">
        <asp:Button ID="Button1" runat="server" Text="Post" Height="34px" Width="51px" OnClick="Button1_Click" />
    </div>
    <%} %>
</div>
