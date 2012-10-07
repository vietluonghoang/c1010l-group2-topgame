<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/User.Master" AutoEventWireup="true"
    CodeBehind="login.aspx.cs" Inherits="TopGame.loginForm" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
    #wrap
    {
    }
    #login-center
    {
        float: left;
        width: 600px;
        
    }
    .login-form1
    {
        padding: 5px;
        margin: 10px 5px 0px 0px;
        overflow: hidden;
        border-bottom: 1px solid #aa1111;
        border-top: 1px solid #aa1111;
        height: 360px;
    }
    .login-top-title
    {
        font-size: 22px;
        padding-bottom: 10px;
        margin-bottom: 5px;
        padding-top: 10px;
        overflow: hidden;
        background-color: #ebebeb;
    }
    .login-form
    {
        padding: 5px;
        overflow: hidden;
        border: 2px solid #e4e4e4;
    }
    .login-ngoaile
    {
        padding: 5px 0px 5px 0px;
        overflow: hidden;
    }
    .login-ngoaile1
    {
        padding: 5px 0px 5px 100px;
        overflow: hidden;
        color: #F00;
    }
    .login-title
    {
        float: left;
        width: 100px;
        padding-right: 5px;
        text-align: right;
        line-height: 22px;
        padding-top: 7px;
    }
    .login-field
    {
        overflow: hidden;
        padding: 5px 0 0 30px;
    }
    .login-right
    {
        font-size: 12px;
        float: left;
    }
    .login-input
    {
        font-size: 12px;
        border: 1px solid #c2c2c2;
        color: #ebebeb;
        width: 246px;
        padding: 1px;
    }
    .login-field-action
    {
        float: left;
        padding: 5px 0px 0px 110px;
        text-align: right;
        line-height: 22px;
        overflow: hidden;
        margin-left: 25px;
        
    }
    .login-remember-me
    {
        font-size: 11px;
        padding: 5px 0px 5px 40px;
        overflow: hidden;
    }
    .login-remember
    {
        font-size: 11px;
        top: 2px;
    }
    .login-remem
    {
        font-size: 14px;
        margin-left: 90px;
    }
    #login-regis
    {
        font-size: 14px;
        margin-top: 10px;
        width: inherit;
        height: 90px;
       
    }
    #login-question
    {
        margin-left: 50px;
    }
    
    #login-button
    {
        margin-left: 50px;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        
    }
    
    
    input[type="text"], input[type="password"]
    {
        padding: 4px;
        margin: 4px 0 4px 0;
        background: #fff;
        font-size: 12px;
        color: #555;
        border: 1px solid #aa1111;
        width: 180px;
        -webkit-box-shadow: 0px 0px 4px #aaa;
        -moz-box-shadow: 0px 0px 4px #aaa;
        -webkit-transition: background 0.3s linear;
    }
    
    input[type="text"]:hover, input[type="password"]:hover
    {
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
    }
    
    input[type="text"]:focus, input[type="password"]:focus
    {
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
    }
</style>
<script type="text/javascript">

    function checkControl() {

        //kiểm tra tính hợp lệ của email
        var Email = document.getElementById('<%= email.ClientID %>').value;
        var ch = /^[_A-Za-z0-9-]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$/;
        var check = ch.test(Email);
        var eleme = document.getElementById('<%= Label4.ClientID %>');
        if (check == false) {
            eleme.innerHTML = "Invalid Email";
            eleme.style.color = "red";

            return false;
        }
        else {
            eleme.innerHTML = "Email is valid";
            eleme.style.color = "blue";

        }


        //kiểm tra tính hợp lệ của Password		
        var pass = document.getElementById('<%# password.ClientID %>').value;
        var element2 = document.getElementById('<%# Label5.ClientID %>');
        var sh = /^[a-zA-Z0-9]{6,50}$/;
        var checkpass = sh.test(pass);
        if (pass.length < 6) {
            element2.innerHTML = "Password must be entered >6 characters";
            element2.style.color = "red";

            return false;
        }
        else if (checkpass == false) {
            element2.innerHTML = "Invalid Password";
            element2.style.color = "red";

            return false;
        }

        else {
            element2.innerHTML = "Password is valid";
            element2.style.color = "blue";

        }


    }
 
</script>
            <div id="wrap">         
                <div id="login-center">
                    <div class="login-form1">
                        <div class="login-top-title" align="center">
                            Login</div>
                        <!--kết thúc .login-top-title-->
                        <div class="login-form">
                            <div class="login-field">
                                <asp:Label ID="Label1" class="login-title" runat="server" Text="Email:"></asp:Label>
                                <div class="login-right">
                                    <asp:TextBox ID="email" class="login-input" runat="server"></asp:TextBox>
                                </div>
                                <!--kết thúc .login-right-->
                                <br/>
                                &nbsp;&nbsp;
                                <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
                            </div>
                            <!--kết thúc .login-field-->
                            <div class="login-field">
                                <asp:Label ID="Label2" class="login-title" runat="server" Text="Password:"></asp:Label>
                                <div class="login-right">
                                    <asp:TextBox ID="password" class="login-input" runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                                
                                <!--kết thúc .login-right-->
                                <br/>
                                &nbsp;&nbsp;
                                <asp:Label ID="Label5" runat="server" ForeColor="Red"></asp:Label>
                            </div>
                            <!--kết thúc .login-field-->
                            <div class="login-remember-me">
                                <asp:CheckBox ID="CheckBox1" class="login-remem" runat="server" Text="Remember Information" />
                            </div>
                            <!--kết thúc .login-remember-me-->
                            <div class="login-field-action">
                                <asp:Button ID="Button1" runat="server" Text="Submit" BackColor="#AA1111" OnClientClick="return checkControl();"
                                    ForeColor="White" Height="30px" Width="90px" BorderStyle="None" OnClick="Button1_Click" />
                            </div>
                            <!--kết thúc .login-field-action-->
                        </div>
                        <!--kết thúc .login-form-->
                        <div id="login-regis">
                        <div id="login-question">
                            <asp:Label ID="loginlabel3" runat="server" Text="Don't you have an account?"
                                Font-Size="15px"></asp:Label>
                                </div>
                            
                            <div id="login-button">
                            <br/>
                            <asp:Button ID="loginbutton2" runat="server" Text="Registration" Width="100px" Height="35px"
                                Font-Size="14px" Font-Bold="True" ForeColor="#AA1111" BorderColor="White"
                                OnClick="Button2_Click" />
                                </div>
                        </div>
                    </div>
                    <!--kết thúc .login-form1-->
                </div>       
            </div>
</asp:Content>
