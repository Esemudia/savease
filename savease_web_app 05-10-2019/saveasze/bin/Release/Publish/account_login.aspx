<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze.Master" AutoEventWireup="true" CodeBehind="account_login.aspx.cs" Inherits="saveasze.account_login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="nav-justified">
      
        <tr>
            <td ><img src="images/resource/graph.jpg" />&nbsp;</td>
            <td><div id="login">
<h1><strong>Welcome.</strong> Please login.</h1>
<fieldset>
<p><input type="text" required value="Username" onBlur="if(this.value=='')this.value='Username'" onFocus="if(this.value=='Username')this.value='' "></p>
<p><input type="password" required value="Password" onBlur="if(this.value=='')this.value='Password'" onFocus="if(this.value=='Password')this.value='' "></p>
<p><a href="#">Forgot Password?</a></p>
<p><input type="submit" value="Login"></p>
</fieldset>

<p><span class="btn-round">or</span></p>
<p>
<a class="facebook-before"></a>
<button class="facebook">Register</button>
</p>
<p>
    &nbsp;</p>
</div></td>
        </tr>
    </table>
&nbsp;&nbsp;&nbsp; 
</asp:Content>
