<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter.Master" AutoEventWireup="true" CodeBehind="transfer.aspx.cs" Inherits="saveasze.transfer" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        .drop{
            background-color:#131d33;
            color:#fa9928;
            width:100%;
        }
        .textarea{
            border:thick #212435 solid;
            font-family:Calibri;
            font-size:14px;
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

         @media screen and (max-width: 600px) {
             aside{
                 display:none;
             }
         }
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
      <script type="text/javascript">
   var submit = 0;
   function CheckDouble() {
     if (++submit > 1) {
     alert('Trransaction in progress. Please wait.');
     return false;
   }
 }
 </script>
<section class="service-single sec-padd">
    <div class="container">
        <div class="row">     
            <div class="col-md-3">
            
                <div class="service-sidebar">
                    <ul class="service-catergory">
                        <%leftNavigation(); %>
                    </ul>
                        
                    <br>
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
            <asp:HiddenField runat="server" ID="hidEmailBeneficiary" />
            <asp:HiddenField runat="server" ID="hidEmailSender" />
            <aside style="max-width:35%; float:right;margin-left:-95px;">  <img src="images/Photo3.png"  style="max-width:60%;"/></aside>
          <table>
                <tr>
                                <td style=" padding-left:14px; color:#212435; font-size:13px; font-weight:bolder;">
                                To do a Transfer Transaction, Click on the dropdown<br /> tab or button to select the appropriate account type.<br />
                                You could select a saveaseaccount or other bank if <br /> the recipient account is not a savease account type,<br />
                                If your recipient exist under the other bank option.<br /> Select the appropriate bank as available in the drop down tab.  </td>
                            </tr>
            </table><br /><br />
            <table>
                            <tr>
                                <td style="padding-left: 14px; vertical-align:left"><asp:Label ID="lblBalh" runat="server" Text="" Visible="false"></asp:Label></td><td style="vertical-align:left"><asp:Label ID="lblBal" runat="server" Text=""></asp:Label></td>
                                
                            </tr>
            </table><br />
            
            <table id="tbltranstype" runat="server" visible="true">
                
                
                            <tr style="padding-left: 14px;">
                                <td style="padding-left: 14px;">&nbsp;</td><td style="text-align:left"><asp:Label ID="Label1" runat="server" Text="Account Type:" Font-Size="12px" Width="90px" ></asp:Label></td>
                                <td style="vertical-align:left; padding-left:7px;">
                                    <telerik:RadDropDownList ID="cmdAcctType" runat="server" CssClass="ddl" SelectedText="Select Bank "  AutoPostBack="True" OnSelectedIndexChanged="cmdAcctType_SelectedIndexChanged">
                                                        <Items>
                                                            <telerik:DropDownListItem runat="server" Selected="True"  CssClass="drop" Text="Select Bank"/>
                                                            <telerik:DropDownListItem runat="server" CssClass="drop" Text="Savease Account" Value="1" />
                                                            <telerik:DropDownListItem runat="server" CssClass="drop"  Text="Other Banks" Value="2" />
                                                        </Items>
                                                    </telerik:RadDropDownList>
                                </td>
                                
                            </tr>
            </table>
            <div style="height:5px;"></div>
            
                        <table runat="server" id="tblSaveaseAccounts"  visible="false">
                               <tr runat="server" visible="false" id="trother"> 
                <td style=" padding-left:14px;"><asp:Label ID="Bnkname" runat="server" Text="Bank Name:" Font-Size="12px" Width="90px" ></asp:Label></td>
               <td>&nbsp;</td> <td style="vertical-align:left">
                    <telerik:RadDropDownList ID="RadBnks" runat="server" SelectedText="Savease Account" CssClass="ddl" SelectedValue="1" AutoPostBack="True" OnSelectedIndexChanged="cmdAcctType_SelectedIndexChanged">
                                        <Items>
                                          
                                        </Items>
                                    </telerik:RadDropDownList>
                </td>
                
            </tr>
                         
                            <tr style="height:5px;"><td></td></tr>
                            <tr>
                                <td style=" padding-left: 14px;vertical-align:middle; font-size: 12px;" class="text-right">Acct. Number:&nbsp;</td><td>&nbsp;</td><td class="text-left"><telerik:RadNumericTextBox ID="txtAccount" runat="server" AutoCompleteType="Disabled"  autocomplete="off" Width="200px" AutoPostBack="false" OnTextChanged="txtAccount_TextChanged"  CssClass="ddl" BorderColor="#212435" BorderStyle="Solid" >
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
                                    &nbsp;</td>
                                <td>

                                       <telerik:RadImageButton ID="btnConfirmAccount" runat="server" Text="" Width="100px" Height="20px" OnClick="btnConfirmAccount_Click" Image-Url="~/images/confirm.png" ToolTip="Confirm Account"></telerik:RadImageButton>

                                </td>
                            </tr>
                            <tr style="height:5px;"><td></td></tr>
                            <tr>
                                <td style=" padding-left: 14px;vertical-align:middle; font-size: 12px;"  class="text-right">Account Name:</td><td colspan="2" class="text-left" style="padding-left:9px;">
                                    <telerik:RadLabel runat="server" Text="" ID="lblAcctName" Width="100%" Font-Size="13px" ></telerik:RadLabel>
                                    <telerik:RadLabel runat="server" Text="" ID="txtAcctBal" Width="0" Font-Size="12px" Visible="false"></telerik:RadLabel></td>
                              
                            </tr><tr style="height:5px;"><td></td></tr>
                            <tr>
                                <td style=" padding-left: 14px;vertical-align:middle; font-size: 12px; height: 17px;" class="text-right">Amount:&nbsp;</td><td>&nbsp;&nbsp;&nbsp;</td>
                                <td class="text-left" style="height: 17px"><telerik:RadNumericTextBox ID="txtAmount" runat="server" Width="195px" CssClass="ddl"  autocomplete="off" BorderColor="#212435" BorderStyle="Solid" >
<NegativeStyle Resize="None"></NegativeStyle>

<NumberFormat ZeroPattern="n" DecimalDigits="2" GroupSeparator=""></NumberFormat>

<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
                                    </telerik:RadNumericTextBox>
                                    </td>
                                <td style="height: 17px"></td>
                            </tr>
                            <tr>
                                <td style="vertical-align:middle">&nbsp;</td><td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                <tr>
                    <td style="text-align:center" colspan="3" class=" col-xs-14" runat="server" visible="false" id="tdMessage">
                        <p class="title"><asp:Label ID="lblMessage" runat="server" Text="dasdasdasdsa" Width="100%"></asp:Label></p>
                    </td>
                </tr>
                        </table>
            <table id="tblConfirmTransfer" runat="server" visible="false">
                <tr>
                    <td style="text-align:left;vertical-align:middle">
                        Transaction Summary:
                    </td>
                </tr>
                <tr>
                    <td style="text-align:left;vertical-align:top">
                        <telerik:RadTextBox ID="txtTransSumm"  BorderStyle="Solid" BorderColor="#fa9928" CssClass="textarea" runat="server" Font-Size="14px" TextMode="MultiLine" Width="400px" Height="100px" Font-Names="courier new"></telerik:RadTextBox>
                    </td>
                </tr>
            </table>
            <br />
            <table runat="server" id="tblSavedBen" visible="false">
                            <tr>
                    <td style="text-align:center" class=" col-xs-14" runat="server" visible="false" id="td3">
                        <p class="title"><asp:Label ID="Label3" runat="server" Text="dasdasdasdsa" Width="100%"></asp:Label></p>
                        <asp:HiddenField ID="hidAccount3" runat="server" /> <asp:HiddenField ID="hidAcctName" runat="server" /><asp:HiddenField ID="hidBankName" runat="server" />
                    </td>
                </tr>
            </table> 
            <table> 
                            <tr>
                                <td style="vertical-align:middle">&nbsp;</td><td>
                                    <asp:Button ID="btnCancel" runat="server" Text="Discard Deposit"  class="thm-btn" OnClick="btnDiscardt_Click" Visible="false"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnDepozit" runat="server" Text="Transfer Fund"  OnClientClick="return CheckDouble();" class="thm-btn" OnClick="btnMakeDepozit_Click" Visible="false"/>
                                     </td>
                                <td>&nbsp;</td>
                            </tr>
            </table>
            <div class="col-md-9">
                <div class="outer-box">
                    <div class="section-title">
                        <h3><asp:HiddenField runat="server" ID="hideBenBal" Value="0" /><asp:HiddenField runat="server" ID="hideSEID" Value="" /> </h3>
                    </div>
                    <div class="row">
                        <div class="col-md-10 col-sm-10 col-xs-14">
                            <div class="accordion-box accordion-style-two">
                                <!--Start single accordion box-->
                                <!--Start single accordion box-->   

                                <!--Start single accordion box-->
                                <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                                    <div class="acc-btn active" >
                                        <p class="title">Click here to view transfer Log</p>
                                        <div class="toggle-icon">
                                            <i class="plus fa fa-arrow-circle-o-right"></i><i class="minus fa fa-arrow-circle-o-right"></i>
                                        </div>
                                    </div>
                                    <div class="acc-content">
                                        <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" runat="server" Skin="WebBlue" CssClass="RadGrid_ModernBrowsers"
        AllowPaging="True" PageSize="5" Font-Size="12px" AllowSorting="True"  OnNeedDataSource="gridBatch_NeedDataSource">
       <PagerStyle  Mode="Slider" Position="TopAndBottom" PageSizeControlType="RadComboBox" ></PagerStyle>
        <MasterTableView Width="100%">
            <Columns>
           
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
                                    </div>
                                </div>


                            </div>
                        </div>
                        <div class="col-md-5 col-sm-5 col-xs-12">
                        </div>
                    </div>
                    <br>
                
                  
                </div>
            </div>

            </div>
        </div>
    </div>
</section>
</asp:Content>
