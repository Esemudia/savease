<%@ Page Title="" Language="C#" MasterPageFile="~/loginz.Master" AutoEventWireup="true" CodeBehind="vregistration.aspx.cs" Inherits="saveasze.vregistration" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
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
                    <div class="form-items">
                        <img src="images/logo/logo.png" /><br /><br />
                        <h3>We are helping millions of people save thier money.</h3>
                        <p>We have destroyed the banking constraint of distance, time and structure. You can now make deposits into distinctive bank accounts without the need to walk into a banking hall. Just Register, Buy n' Login...</p>
                        <div class="page-links">
                            <asp:LinkButton ID ="lnkVendor" runat="server">Register As Vendor</asp:LinkButton>
                        </div>
                       
                          <div runat="server" id="dvvendor" visible="true">
                               <asp:Label ID="lblDisplay" runat="server"></asp:Label>
                            <input class="form-control" type="text" id="txtfrstname" runat="server" onblur="if(this.value=='')this.value='First Name'" onfocus="if(this.value=='First Name')this.value='' "   placeholder="First name" required />
                            <input class="form-control" type="text" id="txtlstname" runat="server" onblur="if(this.value=='')this.value='Last Name'" onfocus="if(this.value=='LastName')this.value='' "  placeholder="Last name" required />
                            <input class="form-control" id="textphone" runat="server" onblur="if(this.value=='')this.value='Phone'" onfocus="if(this.value=='Txtphone')this.value='' "   placeholder="Phone" required />
                              <input class="form-control" id="txtcomname" type="text" runat="server" placeholder="Company Name" required="" />
                              <textarea class="form-control" runat="server" placeholder="Address" id="txtaddress" required=""></textarea>
                            <input class="form-control" type="email"  id="Email" runat="server" onblur="if(this.value=='')this.value='Email'" onfocus="if(this.value=='Email')this.value='' "  value="Email" required />
                           <input class="form-control" type="text"  id="txtuname" runat="server" onblur="if(this.value=='')this.value='User Name'" onfocus="if(this.value=='User Name')this.value='' "  placeholder="User name" required />
                         <input class="form-control" id="Password1" runat="server" onblur="if(this.value=='')this.value='xxxxxxxx'" onfocus="if(this.value=='Password')this.value='' " required="" type="password" placeholder="Password" />
                           <input class="form-control" id="Password2" runat="server" onblur="if(this.value=='')this.value='xxxxxxxx'" onfocus="if(this.value=='Confirm Password')this.value='' " required="" type="password" placeholder="Confirm password"  />
                          
                              <label runat="server">Identification type:</label> 
                              <asp:FileUpload ID="uplIDType" runat="server" ToolTip="Upload forms of identification... only pdf"/>

                              <label runat="server">Passport:</label>
                              <asp:FileUpload ID="uplpassport" runat="server"  ToolTip="Upload passport... only pdf"/>

                              <label runat="server">CAC Certificate:</label>
                              <asp:FileUpload ID="uplCAC" runat="server" ToolTip="Upload CAC Documents... only pdf" />
                              
                              <label runat="server">CAC Documents:</label>
                              <asp:FileUpload ID="uplcacothers" runat="server" ToolTip="Upload CAC accompanied documents... only pdf" />

                              <label runat="server">VAT REGISTRATION:</label>
                              <asp:FileUpload ID="uplvatreg" runat="server" ToolTip="Upload VAT document... only pdf" />

                              <label runat="server">TAX :</label>
                              <asp:FileUpload ID="uplTax" runat="server" ToolTip="Upload TAX documents... only pdf"  />

                      <%--  <table >
                            <tr>
                                <td> <telerik:RadCheckBox ID="chkTCv" runat="server" Text="" OnClick="chkTC2_CheckedChanged"></telerik:RadCheckBox></td>
                            <td><a href="doc/TC.pdf" target="_blank">Terms & Conditions</a></td>
                            </tr>
                           
                        </table>--%>
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
                        <div></div>
                </div>
            </div>
        </div>
    </div>
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
          </div>
</asp:Content>
