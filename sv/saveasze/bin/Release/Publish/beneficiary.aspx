<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter.Master" AutoEventWireup="true" CodeBehind="beneficiary.aspx.cs" Inherits="saveasze.beneficiary" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <style>
         
         @media screen and (max-width: 600px) {
             aside{
                 display:none;
             }
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

    </style>

    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    <Scripts>
        <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
        </asp:ScriptReference>
        <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
        </asp:ScriptReference>
        <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
        </asp:ScriptReference>
    </Scripts>
</telerik:RadScriptManager>
<section class="service-single sec-padd">
    <div class="container">
        <div class="row">     
            <div class="col-md-3">
            
                <div class="service-sidebar">
                    <ul class="service-catergory">
                        <%leftNavigation(); %>
                    </ul>
                        
                    <br><br>
                    <div class="brochures"> 
                        <h4>Terms & Conditions</h4>
                        <p>Download our Terms & Condition.</p>

                        <ul class="brochures-lists">
                            <li>
                                <a href="doc/TnC.pdf" target="_blank"><span class="fa fa-file-pdf-o"></span></a>
                            </li>
                            <li>
                                <a href="#"><span class="fa fa-file-text-o"></span></a>
                            </li>
                        </ul>
                        <i class="icon icon-sheet"></i>
                    </div>
                    <br><br>
                    <div class="getin-tuch">
                        <h4>Enquiries & Support</h4>
                        <p>You can also send us an <a href="#">email</a>  and we’ll get in touch shortly, or call <b>- (+234) 080Savease.</b></p>
                        <div class="link">
                            <a href="contactus.aspx" class="default_link">LOCATE US<i class="fa fa-angle-right"></i></a>
                        </div>
                        <i class="icon icon-multimedia-1"></i>
                    </div>

                </div>
            </div>
            <div class="col-md-9">
                <div class="outer-box"><br><br>
                    <div class="row">
                        <div class="col-md-10 col-sm-10 col-xs-14">
                            <div class="accordion-box accordion-style-two">
                                <!--Start single accordion box-->
                               <aside style="max-width:45%; float:right;margin-left:-95px;"><img src="images/Photo5.png"  style="max-width:70%;"/></aside>

                                 <table style="margin-top:-44px;">
                <tr>
                                <td style=" color:#212435; font-size:13px; font-weight:bolder;">
                                    You can  add a beneficiary by <br /> using the saveaseid/account number of the savease costumer.<br /></td>
                            </tr>
                                     
            </table><br />
                                <div style="padding-left: 14px;">
                                  <asp:Label runat="server" ID="lblerr" style="padding-left: 14px;"></asp:Label>
                                </div>
                                <table style="padding-left: 14px;">
                                    <tr style="padding-left: 14px;"><td style="font-size:12px;">Select Bank:</td>
                                         <td class="text-left" style="font-size: 12px; padding-left:9px;">
                                                    <telerik:RadComboBox RenderMode="Lightweight" ID="cmdBank" runat="server" CssClass="ddl" AppendDataBoundItems="true">
                                                   <Items>
                                                   <telerik:RadComboBoxItem CssClass="drop" Text="Select Bank" />
                                                   <telerik:RadComboBoxItem CssClass="drop" Text="Savease" Value="SVE" />
                                                </Items> 
                                                </telerik:RadComboBox>
                                               
                                                </td>
                                    </tr>
                                </table>
                                <div style="height:5px;"></div>


                                <table>
                                    <tr>
 <td style="font-size:12px;">Account.No.:</td><td style="padding-left:7px;"><telerik:RadNumericTextBox ID="txtval1" runat="server" AutoCompleteType="Disabled"  autocomplete="off" Width="200px" AutoPostBack="false"  CssClass="ddl" BorderColor="#212435" BorderStyle="Solid" >
<NegativeStyle Resize="None"></NegativeStyle>

<NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>

<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
                                </telerik:RadNumericTextBox>
                                                </td>
                                                <td style="text-align:left">
                                                    <telerik:RadImageButton ID="radverify" runat="server" Text="" Image-Url="~/images/confirm.png" OnClick="radverify_Click"  Width="100px" Height="30px"></telerik:RadImageButton>
                                                </td>
                                    </tr>
                                    <tr>
<td style="font-size:12px;">Acct. Details:</td>
                                                  <td style="padding:7px;"><telerik:RadLabel runat="server" ID="lbldetails"></telerik:RadLabel></td>
                                           
                                    </tr>
                                </table>
                                        <table>
                                            <tr>
                                               
                                            </tr>
                                            <tr style="height:5px">
                                                <td></td>
                                            </tr>
                                              <tr>
                                                 </tr>
                                              <tr style="height:5px">
                                                <td></td>
                                            </tr>
                                            
                                                <tr>
                             
                                                                           
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button runat="server" CssClass="thm-btn" Text="Save Beneficiary" ID="btnSaveBeneficiary1" OnClick="btnSaveBeneficiary1_Click"/></td>
                            </tr>
                                        </table>
                                <!--Start single accordion box-->    
                            
                                          
                                            <br />

                                <!--Start single accordion box-->
                <div class="outer-box"><br>
                    <div class="row">
                        <div class="col-md-10 col-sm-10 col-xs-14">
                            <div class="accordion-box accordion-style-two">
                                <!--Start single accordion box-->
                                <!--Start single accordion box-->   

                                <!--Start single accordion box-->
                                <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                                    <div class="acc-btn active" >
                                        <p class="title">Beneficiary Log</p>
                                        <div class="toggle-icon">
                                            <i class="plus fa fa-arrow-circle-o-right"></i><i class="minus fa fa-arrow-circle-o-right"></i>
                                        </div>
                                    </div>
                                    <div class="acc-content">
                                        <div class="text">
                                              <telerik:RadGrid ID="RadGrid4" runat="server" AllowCustomPaging="True" AllowPaging="True" Skin="WebBlue" OnNeedDataSource="RadGrid4_NeedDataSource">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <ExportSettings ExportOnlyData="True" OpenInNewWindow="True">
                                                    <Excel Format="Xlsx" />
                                                </ExportSettings>
                                                <MasterTableView>
                                                </MasterTableView>
                                                <PagerStyle Position="TopAndBottom" />
                                            </telerik:RadGrid>
                                        </div>
                                    </div>
                                </div>
                                 </div> </div> </div>

                            </div>
                        </div>
                        <div class="col-md-5 col-sm-5 col-xs-12">
                             <div class="text">
                                </div>
                        </div>
                    </div>
                    <br/>

                </div>
            </div>
        </div>
    </div>
</section>
</asp:Content>
