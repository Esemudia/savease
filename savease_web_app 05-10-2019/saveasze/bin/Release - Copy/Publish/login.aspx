<%@ Page Title="" Language="C#" MasterPageFile="~/loginz.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="saveasze.login" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <style>
      .foot-img{
           margin-left:60px;
           margin-right:auto;
           
      }
      .store {
          padding-top:8px;
      }
      .app {
          padding-top:8px;
      }
      .google{
         padding-top:8px;
      }
        .drop{
            background-color:#131d33;
            color:#fa9928;
            width:100%;
        }
         .ddl
        {
            border:2px solid #fa9928;
            border-radius:5px;
            padding:3px;
            color:#fa9928;
            -webkit-appearance: none; 
            /*background-color:#131d33;*/
            background-position:88px;
            background-repeat:no-repeat;
            text-indent: 0.01px;/*In Firefox*/
            text-overflow: '';/*In Firefox*/
             
        }
         .btn11{
             background:#fa9928;
         }

         .auto-style1 {
             position: relative;
             padding-bottom: 10px;
             margin-bottom: 0px;
             left: 4px;
             top: 3px;
         }

         .Grid {background-color: #fff; margin: 5px 0 10px 0; border: solid 2px #fa9928; border-collapse:collapse; font-family:Calibri; color: #474747;}
.Grid td {
      padding: 2px; 
      border: solid 2px #fa9928; }
.Grid th  {
      padding : 4px 2px; 
      color: #fff; 
      background: #131d33;
      border-left: solid 2px #fa9928; 
      font-size: 0.9em; }
 /*@media only screen and (min-width: 320px) {
          .foot-img {
              margin-left:auto;
              margin-right:auto;
              
          }
      }*/
      @media only screen and (max-width: 300px) {
          .foot-img {
              margin-left:auto;
              margin-right:auto;
              max-width:100%;
          }
          .blank{
              display:none
          }
          .store {
          margin-left:0px!important;
      }
      .app {
          margin-left:0px!important;
      }
      .google{
          margin-left:0px!important;
      }
      }
      
    </style>
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
          <div class="form-body">
        <div class="website-logo">
            <a href="index.html">
                <div class="logo" style="background-image:url(img2.png)">
                </div>
            </a>
        </div>
        <div class="row">
            <div class="img-holder">
                <div class="bg"></div>
            </div>
            <div class="form-holder">
                <div class="form-content">
                    <asp:UpdatePanel ID="updatepnl" runat="server">
                    <ContentTemplate>
                    <div class="form-items">
                        <img src="images/logo/logo.png" /><br /><br />
                        <h3>We are helping millions of people save thier money.</h3>
                        <p>We have destroyed the banking constraint of distance, time and structure. You can now make deposits into distinctive bank accounts without the need to walk into a banking hall. Just Register, Buy n' Login...</p>
                        <div class="page-links">
                            <a href="login.aspx" class="active">Login</a>
                            <a href="#" runat="server" id="lnkRegister2" onserverclick="lnkRegister2_ServerClick">Register</a>
                            <asp:Label runat="server" ID="lblregMessage"></asp:Label>
                            <table style="display:none"><tr><td>
                            <asp:LinkButton ID="lnkLogin" runat="server" OnClick="lnkLogin_Click" >Login</asp:LinkButton>
                            <asp:LinkButton ID="lnkRegister" runat="server" OnClick="lnkRegister_Click" >Register</asp:LinkButton>
                            <asp:LinkButton ID ="lnkVendor" runat="server" OnClick="lnkVendor_Click" Visible="false">Register As Vendor</asp:LinkButton>
                           </td> </tr></table>

                        </div>
                       <div runat="server" id="dvlogin">
                        <%--<div class="alert alert-warning alert-dismissible fade show with-icon" role="alert" style="display:none;">
                            Please fill the following form with your information<button type="button" class="close" data-dismiss="alert" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                        </div>--%>
                       <!--<form>-->
                           
                         <div runat="server" id="dvLoginMessage" visible="false">
                             <asp:Label id="lblLoginMessage" runat="server"></asp:Label>
                            </div>
                            <input class="form-control" type="text"  required="" value="" autocomplete="off" placeholder="Login ID" onBlur="if(this.value=='')this.value=''" onFocus="if(this.value=='')this.value='' " runat="server" id="txtUserName"/>
                            <input class="form-control" type="password" placeholder="Password" autocomplete="off"  required="" value="Password" onBlur="if(this.value=='')this.value='Password'" onFocus="if(this.value=='Password')this.value='' "  runat="server" id="txtPassword1"/>
                            <div class="form-button">
                                <asp:Button ID="btnLogin" runat="server" Text="Login"  class="ibtn" Width="100" OnClick="btnLogin_Click" />
                                <asp:LinkButton ID="lnkForget" runat="server" OnClick="lnkForget_Click" >Forget password?</asp:LinkButton>
                            </div>
                           <br /><br />
                        <!--</form>-->
                         
                       </div>
                        <div runat="server" id="dvregister" visible="false">
                              <div>
                           </div>
                            <input class="form-control" type="text" id="txtFName" runat="server" onblur="if(this.value=='')this.value='First Name'" onfocus="if(this.value=='First Name')this.value='' "   placeholder="First name" required />
                            <input class="form-control" type="text" id="txtLName" runat="server" onblur="if(this.value=='')this.value='Last Name'" onfocus="if(this.value=='LastName')this.value='' "  placeholder="Last name" required />
                            <input class="form-control" id="Txtphone" runat="server" onblur="if(this.value=='')this.value='Phone'" onfocus="if(this.value=='Txtphone')this.value='' "   Placeholder="Phone" required />
                            <input class="form-control" id="TxtBVN2" runat="server" onblur="if(this.value=='')this.value='BVN'" onfocus="if(this.value=='txtBVN2')this.value='' "   Placeholder="BVN" required />
                            <input class="form-control" type="email"  id="txtEmail" runat="server" onblur="if(this.value=='')this.value='Email'" onfocus="if(this.value=='Email')this.value='' "  value="Email" required />
                           <input class="form-control" type="text"  id="txtUserNameR" runat="server" onblur="if(this.value=='')this.value='User Name'" onfocus="if(this.value=='User Name')this.value='' "  placeholder="User name" required />
                         <input class="form-control" id="txtPassword" runat="server" onblur="if(this.value=='')this.value='xxxxxxxx'" onfocus="if(this.value=='Password')this.value='' " required="" type="password" placeholder="Password" />
                           <input class="form-control" id="compassword" runat="server" onblur="if(this.value=='')this.value='xxxxxxxx'" onfocus="if(this.value=='Confirm Password')this.value='' " required="" type="password" placeholder="Confirm password"  />
                        <table >
                            <tr>
                                <td> <telerik:RadCheckBox ID="chkTC2" runat="server" Text="" OnClick="chkTC2_CheckedChanged"></telerik:RadCheckBox></td>
                            <td><a href="doc/TC.pdf" target="_blank">Terms & Conditions</a></td>
                            </tr>
                           
                        </table>
                            <div>
                          
                            <div class="form-button">
                                 <asp:Button ID="btnRegister" runat="server" Text="Register"  class="ibtn" Width="100" OnClick="btnRegister_Click"/>
                            </div>
                            <div>
                                <p runat="server" id="tbMessage" visible="false"><p style="text-align:center"> <asp:Label runat="server" ID="lblMessage" Text=""></asp:Label></p></p>
                            </div>
                        </div>
                        

                         <div runat="server" id="msgDisplay" visible="false">
                             <asp:Label id="lblDisplay" runat="server"></asp:Label>
                            </div>
                    </div>
                        <div runat="server" id="forgetPWD" visible="false" style="margin-top:75px;">
                        <div class="alert alert-warning alert-dismissible fade show with-icon" role="alert">
                           To reset your password, enter the USERID you use to sign in to savease<button type="button" class="close" data-dismiss="alert" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                       <!--<form>-->
                            <input class="form-control" type="text"  required="" value="Login ID" onBlur="if(this.value=='')this.value='Login ID'" onFocus="if(this.value=='Login ID')this.value='' " runat="server" id="resetID"/>
                            <div class="form-button">
                                <asp:Button ID="btnForgot" runat="server" Text="Request Password Reset"  class="ibtn" Width="250" OnClick="btnForgot_Click" />
                            </div>
                        <!--</form>-->

                       </div>
                          <div runat="server" id="dvvendor" visible="false">
                              <div>
                                  <asp:Label runat="server" ID="lblvenMessage" Visible="false"></asp:Label>
                              </div>
                            <input class="form-control" type="text" id="txtfrstname" runat="server" onblur="if(this.value=='')this.value='First Name'" onfocus="if(this.value=='First Name')this.value='' "   placeholder="First name" required />
                            <input class="form-control" type="text" id="txtlstname" runat="server" onblur="if(this.value=='')this.value='Last Name'" onfocus="if(this.value=='LastName')this.value='' "  placeholder="Last name" required />
                             <input class="form-control" type="email"  id="Email" runat="server" onblur="if(this.value=='')this.value='Email'" onfocus="if(this.value=='Email')this.value='' "  value="Email" required />
                              <input class="form-control" id="textphone" runat="server" onblur="if(this.value=='')this.value='Phone'" onfocus="if(this.value=='Txtphone')this.value='' "   placeholder="Phone" required />
                             
                           <input class="form-control" type="text"  id="txtuname" runat="server" onblur="if(this.value=='')this.value='User Name'" onfocus="if(this.value=='User Name')this.value='' "  placeholder="User name" required />
                         <input class="form-control" id="Password1" runat="server" onblur="if(this.value=='')this.value='xxxxxxxx'" onfocus="if(this.value=='Password')this.value='' " required="" type="password" placeholder="Password" />
                           <input class="form-control" id="Password2" runat="server" onblur="if(this.value=='')this.value='xxxxxxxx'" onfocus="if(this.value=='Confirm Password')this.value='' " required="" type="password" placeholder="Confirm password"  />
                             <telerik:RadDropDownList ID="Raddrp"  CssClass="ddl"  runat="server" SelectedText="Select Business Type" SelectedValue=""  AutoPostBack="True">
                            <Items>
                                <telerik:DropDownListItem  CssClass="drop" runat="server" Selected="True" Text="Select Business Type" />
                                <telerik:DropDownListItem  CssClass="drop"  runat="server" Text="Individual not Registered" Value="Individual not Registered" />
                                <telerik:DropDownListItem  CssClass="drop" runat="server" Text="Sole Proprietorship" Value="Sole Proprietorship" />
                                <telerik:DropDownListItem  CssClass="drop" runat="server" Text="Partnership" Value="Partnership" />
                                <telerik:DropDownListItem  CssClass="drop" runat="server" Text="Limited Partnership/Company" Value="Limited Partnership/Company" />
                            </Items>
                        </telerik:RadDropDownList><br />
                              <input class="form-control" id="txtcomname" type="text" runat="server" placeholder="Company Name" required="" />
                              <textarea class="form-control" runat="server" placeholder="Address" id="txtaddress" required=""></textarea>
                           
                           
                               <input class="form-control" type="text"  id="txtcacregnumber" runat="server" onblur="if(this.value=='')this.value='CAC Registration Number'" onfocus="if(this.value=='CAC Registration Number')this.value='' "  placeholder="CAC Registration Number" required />
                               <input class="form-control" type="text"  id="txtbvn" runat="server" onblur="if(this.value=='')this.value='BVN Number'" onfocus="if(this.value=='BVN Number')this.value='' "  placeholder="BVN Number" required />
                        <table >
                            <tr>
                                <td> <telerik:RadCheckBox ID="chkTCv" runat="server" Text="" OnClick="chkTC2_CheckedChanged"></telerik:RadCheckBox></td>
                            <td><a href="doc/TC.pdf" target="_blank">Terms & Conditions</a></td>
                            </tr>
                           
                        </table>
                            <div>
                          
                            <div class="form-button">
                                 <asp:Button ID="btnvend" runat="server" Text="Register"  class="ibtn" Width="100" OnClick="btnvend_Click"/>
                            </div>
                            <div>
                                <p runat="server" id="P1" visible="false"><p style="text-align:center"> <asp:Label runat="server" ID="Label1" Text=""></asp:Label></p></p>
                            </div>
                        </div>
                        

                         <div runat="server" id="Div2" visible="false">
                             <asp:Label id="Label2" runat="server"></asp:Label>
                            </div>
                    </div>

                       
                        <div></div>
                        <div></div>
                </div>
                    </ContentTemplate>
                    </asp:UpdatePanel>
            </div>
        </div>
    </div> <br />
<script src="jslogin/jquery.min.js"></script>
<script src="jslogin/popper.min.js"></script>
<script src="jslogin/bootstrap.min.js"></script>
<script src="jslogin/main.js"></script>
            <%-- <script>
                  $(".toggle-password").click(function () {
                      $(this).toggleClass("fa-eye fa-eye-slash");
                      var input = $($(this).attr("toggle"));
                      if (input.attr("type") == "password") {
                          input.attr("type") == "text";
                      } else {
                          input.attr("type", "text");
                      }
                  });
              </script>--%>
              <div class="foot-img">
                  
                 <img src="imageslogin/saveaseText.png" />
                 <img class="blank" src="imageslogin/back11.png" />
                 <img class="google" src="imageslogin/google_play1.png" />
             <img class="blank" src="imageslogin/back11.png" />
                            <img class="app" src="imageslogin/applestore1.png" />
                  <img class="blank" src="imageslogin/back11.png" />
                            <img class="store" src="imageslogin/windowsstore1.png" />
                        </div><br />
             
          </div>
     <div>
                            
</asp:Content>
