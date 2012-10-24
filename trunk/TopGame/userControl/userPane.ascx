<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="userPane.ascx.cs" Inherits="Assignment.userControl.userPane" %>
<link rel="Stylesheet" href="/stylesheet/userPane.css" type="text/css" />
<link rel="Stylesheet" href="/stylesheet/loginControl.css" type="text/css" />
<script type="text/javascript">
    function showLogin() {
        document.getElementById("opacity").style.zIndex = "1";
        document.getElementById("opacity").style.opacity = "0.85";
        document.getElementById("wrapLogin").style.zIndex = "2";
        document.getElementById("wrapLogin").style.visibility = "visible";
    }
    function hideLogin() {

        document.getElementById("opacity").style.opacity = "0";
        document.getElementById("opacity").style.zIndex = "-1";
        document.getElementById("wrapLogin").style.visibility = "hidden";
        document.getElementById("wrapLogin").style.zIndex = "-2";
    }
</script>

<asp:UpdatePanel ID="UpdatePanelUser" EnableViewState="true" runat="server" 
    UpdateMode="Conditional">
    <ContentTemplate>
        <div id="wrapLogin" runat="server" clientidmode="Static">
            
            <div id="loginPane">
                <asp:UpdatePanel ID="UpdateLogin" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                <asp:Login ID="Login1" runat="server" onauthenticate="Login1_Authenticate1" CssClass="loginControl" UserNameLabelText="Email" PasswordLabelText="Password" RememberMeText="Remember me.">
                </asp:Login>
                </ContentTemplate>
                </asp:UpdatePanel>
                <a href="javascript:hideLogin()" id="closeBtn">
                <img alt="close" src="../icon/delete.png" />
            </a>
            </div>
        </div>
        <div id="opacity">
        </div>
        <div id="wrapUser">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <div id="name">
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div id="image">
                        <a href="../accountForm/EditProfile.aspx">
                            <asp:Image ID="Image1" runat="server" CssClass="avatar" Height="100px" Width="100px" /></a>
                        <div class="button">
                            <asp:LinkButton ID="lBtnLogout" runat="server" OnClick="lBtnLogout_Click">Log out</asp:LinkButton>
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div class="button">
                        <a href="javascript:showLogin()">login</a>
                    </div>
                    <div class="button">
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="/accountForm/register.aspx">Registration</asp:HyperLink>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
