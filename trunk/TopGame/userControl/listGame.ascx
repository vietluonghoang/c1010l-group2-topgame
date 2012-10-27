<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="listGame.ascx.cs" Inherits="TopGame.userControl.listGame" %>
<%@ Register Src="likeBtn.ascx" TagName="likeBtn" TagPrefix="uc1" %>
<link rel="Stylesheet" href="../stylesheet/listGame.css" type="text/css" />
<div id="gameList">
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        onrowdatabound="GridView1_RowDataBound">
        <Columns>
            <asp:TemplateField>
            <ItemTemplate>
            <div class="gameListItem">
                <a href="viewGame.aspx?gameId=<%# Eval("id") %>">
                    <div class="icon">
                        <div class="name">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("gameName") %>'></asp:Label>
                        </div>
                        <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("posterFile") %>'
                            Width="120px" />
                    </div>
                </a>
                <div class="totalLike">
                    <uc1:likeBtn ID="likeBtn1" GameId='<%# Eval("id") %>' runat="server" />
                </div>
                <div class="desc">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("description") %>' ></asp:Label>
                </div>
            </div>
            </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
        <div id="error">
            <asp:Label ID="Label3" runat="server" ForeColor="#993300" 
                Text="Resource cannot be found !"></asp:Label>
        </div>
        </EmptyDataTemplate>
    </asp:GridView>
</div>
