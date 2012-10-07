
function validateControl() {
    //kiểm tra tính hợp lệ của gameName		
    var tendn = document.getElementById('<%= TextBox1.ClientID %>').value;
    var element4 = document.getElementById('<%= Label21.ClientID %>');
    if (tendn.length < 1) {
        element4.innerHTML = "Username must be entered";
        element4.style.color = "white";
        return false;
    }
    else {
        element4.innerHTML = "Valid";
        element4.style.color = "blue";
    }

    //kiểm tra tính hợp lệ của Description		
    var tendn = document.getElementById('<%= TextBox2.ClientID %>').value;
    var element4 = document.getElementById('<%= Label22.ClientID %>');

    if (tendn.length < 1) {
        element4.innerHTML = "Description must be entered";
        element4.style.color = "white";
        return false;
    }
    else 
    {
        element4.innerHTML = "Valid";
        element4.style.color = "blue";
    }

    //kiểm tra tính hợp lệ của Trailer	
    var tendn = document.getElementById('<%= TextBox3.ClientID %>').value;
    var element4 = document.getElementById('<%= Label23.ClientID %>');
    if (tendn.length < 1) {
        element4.innerHTML = "Trailer must be entered";
        element4.style.color = "white";

        return false;
    }
    else {
        element4.innerHTML = "Valid";
        element4.style.color = "blue";
    }
}
