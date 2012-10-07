<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage/User.Master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="TopGame.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
   #wrap
   {
    margin: 20px auto;

       } 


 #register-center{

 float :left;
  width:580px;
  height:345px;
 border-bottom:1px solid #aa1111;
 border-top:1px solid #aa1111;
 padding:5px;
 }
 
  .register-top-title
    {
        font-size: 22px;
        border: 2px solid #e4e4e4;
        padding-bottom: 10px;
        margin-bottom: 5px;
        padding-top: 10px;
        overflow: hidden;
        background-color: #ebebeb;
        
    }
    .register-form
    {
        padding: 5px;
        overflow: hidden;
    }
 
 input[type="text"],input[type="password"] { 		
    border: 1px solid #aa1111;
    margin: 4px 0 4px 0;
    font-size: 12px; 
    color: #555; 
	width: 180px;
	-webkit-box-shadow: 0px 0px 4px #aaa;
	-moz-box-shadow: 0px 0px 4px #aaa; 
	-webkit-transition: background 0.3s linear;
	-moz-border-radius: 5px;
        -webkit-border-radius: 5px;
}

input[type="text"]:hover,input[type="password"]:hover { 
    -moz-border-radius:5px;
	-webkit-border-radius:5px;

}
input[type="text"]:focus, input[type="password"]:focus { 
	
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
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

    
     <div id="register-center">
         <div class="register-top-title" align="center">
                            Registration</div>
             <div class="register-form">
         <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label> 
         <asp:TextBox ID="TextBox1" runat="server" style="margin-left: 100px" 
             Width="160px"></asp:TextBox>
         &nbsp;<asp:Label ID="Label7" runat="server" ForeColor="#990000" Font-Size="10px"></asp:Label>
         <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         

         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <br />
         <asp:Label ID="Label2" runat="server" Text="Username"></asp:Label>
         <asp:TextBox ID="TextBox2" runat="server" style="margin-left: 69px" 
             Width="160px"></asp:TextBox>
         &nbsp;<asp:Label ID="Label6" runat="server" Font-Size="10px" ForeColor="#990000"></asp:Label>
         <br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;
         <br />
         <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
         <asp:TextBox ID="TextBox3" runat="server" style="margin-left: 71px" 
             Width="160px" TextMode="Password"></asp:TextBox>
         <asp:Label ID="Label8" runat="server" Font-Size="10px" ForeColor="#990000"></asp:Label>
         <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
         <br />
         <asp:Label ID="Label4" runat="server" Text="Re-Type Password"></asp:Label>
         <asp:TextBox ID="TextBox4" runat="server" style="margin-left: 17px" 
             Width="160px"
             TextMode="Password"></asp:TextBox>
         &nbsp;<asp:Label ID="Label9" runat="server" Font-Size="10px" ForeColor="#990000"></asp:Label>
         <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
         <br />
         <asp:Label ID="Label5" runat="server" Text="Gender"></asp:Label>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="RadioButton1" runat="server" GroupName="gen" Text="Male" 
             Checked="True" />
         <asp:RadioButton ID="RadioButton2" runat="server" GroupName="gen"
             Text="Female" />
         <br />
         <br />
         <asp:Button ID="Button1" runat="server" Text="Submit" 
             OnClientClick="return validateControl();" onclick="Button1_Click" 
             style="margin-left: 98px" Width="90px" BackColor="#AA1111" 
             ForeColor="White" Height="30px" />
         <asp:Button ID="Button2" runat="server" Text="Reset" 
             style="margin-left: 42px" Width="81px" onclick="Button2_Click" 
             BackColor="#AA1111" ForeColor="White" Height="30px" />
         <br />
         <br />
         </div>
        </div>
      

    </div>
</asp:Content>
