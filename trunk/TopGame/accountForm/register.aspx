<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/User.Master" AutoEventWireup="true"
    CodeFile="register.aspx.cs" Inherits="TopGame.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        #register-center
        {
            float: left;
            width: 610px;
            height: 345px;
            padding: 0px 5px 5px 5px;
            color: #86942A;
        }
        
        #register-center .register-top-title
        {
            font-size: 22px;
            border: 2px solid #86942A;
            padding-bottom: 10px;
            padding-top: 10px;
            overflow: hidden;
            background-color: #F3F4EC;
            color: #86942A;
            margin-bottom: 10px;
        }
        #register-center .register-form
        {
            padding: 5px;
            overflow: hidden;
        }
        
        #register-center input[type="text"], #register-center input[type="password"]
        {
            padding: 5px;
            margin: 4px 0 4px 0;
            font-size: 12px;
            color: #555;
            width: 280px;
            -webkit-box-shadow: 0px 0px 4px #aaa;
            -moz-box-shadow: 0px 0px 4px #aaa;
            -webkit-transition: background 0.3s linear;
            border: 1px solid #86942A;
        }
        
    </style>
    <script type="text/javascript" language="javascript">
        function validateControl() {

            //kiểm tra tính hợp lệ của email
            var Email = document.getElementById('<%= TextBox1.ClientID %>').value;
            var ch = /^[_A-Za-z0-9-]+(.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(.[A-Za-z0-9]+)*(.[A-Za-z]{2,})$/;
            var check = ch.test(Email);
            var element1 = document.getElementById('<%= Label7.ClientID %>');

            if (check == false) {
                element1.innerHTML = "Invalid Email";
                element1.style.color = "red";

                return false;
            } else {
                element1.innerHTML = "Valid";
                element1.style.color = "blue";

            }

            //kiểm tra tính hợp lệ của Username		
            var tendn = document.getElementById('<%= TextBox2.ClientID %>').value;
            var element4 = document.getElementById('<%= Label6.ClientID %>');

            if (tendn.length < 6) {
                element4.innerHTML = " must be >= 6 characters";
                element4.style.color = "red";

                return false;
            }
            else {
                element4.innerHTML = "Valid";
                element4.style.color = "blue";

            }

            //kiểm tra tính hợp lệ của Password		
            var pass = document.getElementById('<%= TextBox3.ClientID %>').value;
            var element2 = document.getElementById('<%= Label8.ClientID %>');
            var sh = /^[a-zA-Z0-9]{6,50}$/;
            var checkpass = sh.test(pass);
            if (pass.length < 6) {
                element2.innerHTML = "must be >= 6 characters";
                element2.style.color = "red";

                return false;
            }
            else if (checkpass == false) {
                element2.innerHTML = "Invalid Password";
                element2.style.color = "red";

                return false;
            }

            else {
                element2.innerHTML = "Valid";
                element2.style.color = "blue";

            }

            //kiểm tra tính hợp lệ của Re-Type Password		
            var nhaplaipass = document.getElementById('<%= TextBox4.ClientID %>').value;
            var element3 = document.getElementById('<%= Label9.ClientID %>');

            if (pass != nhaplaipass) {
                element3.innerHTML = "Re-type Password";
                element3.style.color = "red";

                return false;
            }

            else {
                element3.innerHTML = "Valid";
                element3.style.color = "blue";

            }
        }
    </script>
    <div id="wrap">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div id="register-center">
                    <div class="register-top-title" align="center">
                        Registration</div>
                    <div class="register-form">
                        <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" Style="margin-left: 100px" Width="200px"></asp:TextBox>
                        &nbsp;<asp:Label ID="Label7" runat="server" ForeColor="#990000" Font-Size="10px"></asp:Label>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Username"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" Style="margin-left: 69px" Width="200px"></asp:TextBox>
                        &nbsp;<asp:Label ID="Label6" runat="server" Font-Size="10px" ForeColor="#990000"></asp:Label>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server" Style="margin-left: 71px" Width="200px"
                            TextMode="Password"></asp:TextBox>
                        <asp:Label ID="Label8" runat="server" Font-Size="10px" ForeColor="#990000"></asp:Label>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="Re-Type Password"></asp:Label>
                        <asp:TextBox ID="TextBox4" runat="server" Style="margin-left: 17px" Width="200px"
                            TextMode="Password"></asp:TextBox>
                        &nbsp;<asp:Label ID="Label9" runat="server" Font-Size="10px" ForeColor="#990000"></asp:Label>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="Gender"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton
                            ID="RadioButton1" runat="server" GroupName="gen" Text="Male" Checked="True" />
                        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="gen" Text="Female" />
                        <br />
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Submit" OnClientClick="return validateControl();"
                            OnClick="Button1_Click" Style="margin-left: 98px" Width="90px" BackColor="#cccfbc"
                            ForeColor="#86942A" Height="30px" />
                        <asp:Button ID="Button2" runat="server" Text="Reset" Style="margin-left: 42px" Width="81px"
                            OnClick="Button2_Click" BackColor="#cccfbc" ForeColor="#86942A" Height="30px" />
                        <br />
                        <br />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
