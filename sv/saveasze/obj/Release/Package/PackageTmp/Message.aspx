<%@ Page Title="" Language="C#" MasterPageFile="~/loginz.Master" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="saveasze.Message" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <style>
      .foot-img{
          margin-top:40px;
           margin-right:auto;
           height:160px;
           max-width:100%;
      }
      .store {
         
      }
      .app {
         
      }
      .google{
         
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
              width:400px;
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
                        <div class="foot-img">
                       <%dispMessage(); %></div>
                        <img src="images/logo/logo.png" />
                        <h3>We are helping millions of people save thier money.</h3>
                        <p>We have destroyed the banking constraint of distance, time and structure. You can now make deposits into distinctive bank accounts without the need to walk into a banking hall. Just Register, Buy n' Login...</p>
                        <div class="page-links" style="display:none;">
                            
                            

                        </div>
                       

                       
                        <div></div>
                        <div></div>
                </div>
                    </ContentTemplate>
                    </asp:UpdatePanel>
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
             
              <br />
          </div>
     <div>
                            
</asp:Content>
