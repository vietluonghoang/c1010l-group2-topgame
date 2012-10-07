<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/Admin.Master" AutoEventWireup="true"
    CodeBehind="AddGame.aspx.cs" Inherits="Assignment.AddGame" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../stylesheet/admin/AddGame.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../script/adminAddGame.js" type="text/javascript" defer></script>
    <div id="addgame-wrap">
        <div class="ag-labeladd">
            <asp:Label ID="Label2" runat="server" Text="Add New Game" Font-Size="X-Large" ForeColor="#aa1111"></asp:Label>
        </div>
        <div id="ag-wrapinput">
            <asp:Label ID="Label1" runat="server" Text="Game Name:"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Style="margin-left: 45px"></asp:TextBox>
            <asp:Label ID="Label21" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label20" runat="server" Text="Category:"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" Style="margin-left: 62px">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Description:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" Style="margin-left: 125px" TextMode="MultiLine"
                CssClass="ag-area"></asp:TextBox>
            <asp:Label ID="Label22" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Trailer:"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox3" runat="server" Style="margin-left: 124px" TextMode="MultiLine"
                CssClass="ag-area"></asp:TextBox>
            <asp:Label ID="Label23" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Poster:"></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" Style="margin-left: 297px" />
            <asp:Image ID="Image2" runat="server" Style="margin-left: 123px" Height="150px" Width="200px"
                CssClass="ag-image" />
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Style="margin-left: 127px" Text="Submit"
                OnClick="Button1_Click" OnClientClick="return validateControl();" CssClass="ag-submit"
                Font-Bold="True" ForeColor="White" />
            <asp:Button ID="Button2" runat="server" Style="margin: -10px 0 0 111px;" Text="Game Management"
                Width="150px" Height="30px" Font-Size="14px" Font-Bold="True" BackColor="Red"
                ForeColor="White" BorderColor="White" OnClick="Button2_Click" />
        </div>
    </div>
</asp:Content>
