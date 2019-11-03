<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter.Master" AutoEventWireup="true" CodeBehind="deposit.aspx.cs" Inherits="saveasze.deposit" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .content-wrapper {
            position: relative;
            background-image: url(assets/images/dashboard-bg.png);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: right bottom;
        }
        
        .content-wrapper .blue-button {
            position: absolute;
            top: 90%;
            margin-top: 15px;
        }
        
        .modal-content .orange-bg {
            color: white;
        }
        
        #statusContent {
            display: none;
        }
        
        @media (max-width: 767px) {
            .content-wrapper .blue-button {
                position: absolute;
                top: 93%;
                margin-top: 15px;
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
           
           <aside style="max-width:35%; float:right;margin-left:-95px;">  <img src="images/Photo4.png"  style="max-width:70%;"/></aside>
            <br />
            <table style="padding-left:4px; margin-top:-24px;">
                <tr>
                       <td>&nbsp;</td>         <td style=" padding-left:14px;color:#212435; font-size:13px; font-weight:bolder;">
                             To make a deposit transaction, Kindly click on the dropdown tab or button to<br /> select the appropriate account type. 
                                 You could select a savease account or other<br /> banks if your recipient account is not a savease account type.<br /> If your 
                                 recipient exist under the other bank option. <br />Kindly select the appropriate bank as available in the dropdown tab.<br /> Insert the
                                 account number of the recipient and click the verify <br />button to verify the account number provided.  <br />The account name associated 
                                 with the accountwill automatically be generated <br />if correct,  proceed to insert the purchased voucher, and type in the narration<br />
                                 for your deposit. Proceed to Make deposit, then select as shown on the<br /> screen. A transaction alert is generated and account credited 
                                 as appropriate.<br />  You could also select saved Beneficiary option,<br />
                                 if you had saved a beneficiary for a quick deposit process.     
                           </td>
                            </tr>
            </table><br /><br />
            <table>
                 <tr>
                                <td>&nbsp;</td><td style="vertical-align:left;padding-left:14px;"><asp:Label  ID="lblBalh" runat="server" Text="" Visible="false"></asp:Label></td><td style="vertical-align:left"><asp:Label ID="lblBal" runat="server" Text=""></asp:Label></td>
                                <asp:Label  ID="lblSVID_h" runat="server" Text="" Visible="false"></asp:Label>
                            </tr>
            </table>


            <table>
                           
                            <tr>
                                <td>&nbsp;</td><td>&nbsp;</td>
                            </tr>
                            
                            <tr>
                                <td>&nbsp;</td><td style="text-align:right"><asp:Label ID="Label1" runat="server" Text="Account Type:"  Font-Size="12px" Width="90px" ></asp:Label>&nbsp;</td>
                                <td style="vertical-align:left; padding-left:6px">
                                    <telerik:RadDropDownList ID="cmdAcctType"  CssClass="ddl" runat="server" SelectedText="Savease Account" SelectedValue="1" AutoPostBack="True" OnSelectedIndexChanged="cmdAcctType_SelectedIndexChanged" Width="200px">
                                                        <Items>
                                                            <telerik:DropDownListItem CssClass="drop" runat="server" Selected="True" Value="-1" Text="Select Account Type"  />
                                                            <telerik:DropDownListItem CssClass="drop" runat="server" Text="Self" Value="4" />
                                                            <telerik:DropDownListItem CssClass="drop" runat="server" Text="Savease Account" Value="1" />
                                                            <telerik:DropDownListItem CssClass="drop" runat="server" Text="Other Banks" Value="2" />
                                                            <telerik:DropDownListItem CssClass="drop" runat="server" Text="Saved Beneficiary" Value="3" />
                                                        </Items>
                                                    </telerik:RadDropDownList>

                                </td>
                                
                            </tr>
            </table>
            <div style="height:5px"></div>
            
                        <table runat="server" id="tblSaveaseAccounts" visible="false">
                            <tr>
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Voucher PIN:</td>
                                <td class="text-left" style="vertical-align:left; padding-left:9px">&nbsp;<telerik:RadNumericTextBox ID="txtPIN"  autocomplete="off" runat="server" Width="200px" AutoPostBack="True" OnTextChanged="txtPIN_TextChanged" CssClass="ddl" BorderColor="#212435" BorderStyle="Solid" >
<NegativeStyle Resize="None"></NegativeStyle>

<NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>

<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
                                </telerik:RadNumericTextBox></td>
                            
                                <td style="margin-left:50px;"> 
                                    <telerik:RadImageButton ID="btnConfirmPIN" runat="server" Text="" Width="100px" Height="20px" OnClick="btnConfirmPIN_Click" Image-Url="~/images/confirm.png" ToolTip="Confirm PIN"></telerik:RadImageButton>
                                   
                                    </td>
                            </tr>
                            <tr style="height:5px"><td></td></tr>
                            <tr runat="server" id="trAccountNo"> 
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Account Number:</td><td class="text-left" style="vertical-align:left; padding-left:9px">
                                    &nbsp;<telerik:RadNumericTextBox ID="txtAccount" autocomplete="off" runat="server" Width="200px" AutoPostBack="True" OnTextChanged="txtAccount_TextChanged" CssClass="ddl" BorderColor="#212435" BorderStyle="Solid" >
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
                                <td>
                                    <telerik:RadImageButton ID="btnConfirmAccount" runat="server" Text="" Width="100px" Height="20px" OnClick="btnConfirmAccount_Click" Image-Url="~/images/confirm.png" ToolTip="Confirm Account"></telerik:RadImageButton>
                                </td>
                            </tr>
                           
                            <tr style="height:5px"><td></td></tr>
                            <tr runat="server" id="trAccountName">
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Account Name:</td><td colspan="2"  style="vertical-align:left; padding-left:9px" class="text-left">
                                   <telerik:RadLabel runat="server" Text="" ID="lblAcctName" Width="100%" Font-Size="12px"></telerik:RadLabel></td>
                            </tr>
                            <tr style="height:5px"><td></td></tr>
                            <tr>
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Amount:</td><td class="text-left" style="vertical-align:left; padding-left:12px">
                                    <telerik:RadNumericTextBox ID="txtAmount" runat="server" Width="200px" Enabled="false" CssClass="ddl" BorderColor="#212435" BorderStyle="Outset" ></telerik:RadNumericTextBox>
                                    </td>
                                <td>&nbsp;</td>
                            </tr>
                           <tr style="height:5px"><td></td></tr>
                            <tr>
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Naration:</td>
                                <td  style="vertical-align:left; padding-left:12px">
                                    <telerik:RadTextBox ID="txtTransSumm"  BorderStyle="Outset" BorderColor="#212435" CssClass="textarea" runat="server" Font-Size="14px"  Width="200px" Height="23px" Font-Names="courier new"></telerik:RadTextBox>
                                    
                                </td>
                            </tr>
                             <tr style="height:5px"><td></td></tr>
                            <tr>
                                <td style="vertical-align:middle">&nbsp;</td><td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                          <tr style="height:5px"><td></td></tr>
                <tr>
                    <td style="text-align:center" colspan="3" class=" col-xs-14" runat="server" visible="false" id="tdMessage">
                        <p class="title"><asp:Label ID="lblMessage" runat="server" Text="dasdasdasdsa" Width="100%"></asp:Label></p>
                    </td>
                </tr>
                        </table>
            <table runat="server" id="tblOtherAccounts" visible="false">
                            <tr>
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Voucher PIN:</td>
                                <td class="text-left" style="vertical-align:left; padding-left:9px">&nbsp;<telerik:RadNumericTextBox ID="txtPIN2" autocomplete="off" runat="server" Width="200px" AutoPostBack="True" OnTextChanged="txtPIN2_TextChanged"
                                    CssClass="ddl" BorderColor="#212435" BorderStyle="Solid" >
<NegativeStyle Resize="None"></NegativeStyle>

<NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>

<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
                                </telerik:RadNumericTextBox></td>
                                <td> 
                                       <telerik:RadImageButton ID="btnConfirmPIN2" runat="server" Text="" Width="100px" Height="20px" OnClick="btnConfirmPIN2_Click" Image-Url="~/images/confirm.png" ToolTip="Confirm PIN"></telerik:RadImageButton>
                                 
                                   
                                    </td>
                            </tr>
                        <tr style="height:5px"><td></td></tr>
                            <tr>
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Bank:</td>
                                <td class="text-left" style="font-size: 12px; padding-left:9px;">
                                    &nbsp;<telerik:RadDropDownList  CssClass="ddl" ID="cmdBank" runat="server" Width="200px">
                                    </telerik:RadDropDownList>
                                </td>
                                <td> 
                                    &nbsp;</td>
                            </tr>
                <tr style="height:5px"><td></td></tr>
                            <tr>
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Account Number:</td><td class="text-left" style="vertical-align:left; padding-left:9px">
                                    &nbsp;<telerik:RadNumericTextBox ID="txtAccount2" autocomplete="off" runat="server" Width="200px" CssClass="ddl" BorderColor="#212435" BorderStyle="Solid" >
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
                                <td>    <telerik:RadButton ID="btnConfirmAccount2" runat="server" Text="Confirm Account" Visible="False">
                                    </telerik:RadButton></td>
                            </tr>
                <tr style="height:5px"><td></td></tr>
                            <tr>
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Account Name:</td><td colspan="2" class="text-left"  style="vertical-align:left; padding-left:9px"><telerik:RadLabel runat="server" ID="lblAcctName2" Width="100%" style="font-size: 12px" Font-Size="12px"></telerik:RadLabel></td>
                              
                            </tr>
                 
                            <tr>
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Amount:</td><td class="text-left"  style="vertical-align:left; padding-left:9px">&nbsp;<telerik:RadNumericTextBox ID="txtAmount2" runat="server" Width="200px" Enabled="false" CssClass="ddl" BorderColor="#212435" BorderStyle="Solid" ></telerik:RadNumericTextBox>
                                    </td>
                                <td>&nbsp;</td>
                            </tr><tr style="height:5px"><td></td></tr>
                            <tr runat="server" visible="false">
                                <td style="vertical-align:middle">&nbsp;</td><td class="text-left" style="font-size: 12px">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                           <tr>
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Naration:</td>
                                <td style="vertical-align:left; padding-left:12px">
                                    <telerik:RadTextBox ID="txtnara"  BorderStyle="Outset" BorderColor="#212435" CssClass="textarea" runat="server" Font-Size="14px"  Width="200px" Height="23px" Font-Names="courier new"></telerik:RadTextBox>
                                    
                                </td>
                            </tr>     
                 <tr style="height:10px"><td></td></tr>
                <tr>
                    <td style="text-align:center" colspan="3" class=" col-xs-14" runat="server" visible="false" id="td1">
                        <p class="title"><asp:Label ID="Label2" runat="server" Text="" Width="100%"></asp:Label></p>
                    </td>
                </tr>
            </table>
            <asp:Label runat="server" ID="ldlmes2"></asp:Label>
            <table runat="server" id="tblSavedBen" visible="false">
                            <tr>
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Voucher PIN:</td>
                                <td class="text-left">
                                   &nbsp;<telerik:RadNumericTextBox ID="txtPIN3"  autocomplete="off" runat="server" Width="200px" AutoPostBack="True" OnTextChanged="txtPIN3_TextChanged" CssClass="ddl" BorderColor="#212435" BorderStyle="Solid" >
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
                                <td> 
                                    &nbsp;</td>
                            </tr>
                 <tr style="height:5px"><td></td></tr>
                            <tr>
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Saved Beneficiary:</td>
                                <td class="text-left" style="font-size: 12px">
                                    &nbsp;<telerik:RadDropDownList ID="cmdSavedBen"  CssClass="ddl" runat="server" OnSelectedIndexChanged="cmdSavedBen_SelectedIndexChanged" Width="200px" AutoPostBack="true" >
                                    </telerik:RadDropDownList>
                                </td>
                                <td> 
                                    &nbsp;</td>
                            </tr>
                <tr style="height:5px"><td></td></tr>
                            <tr>
                                
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Amount:</td><td class="text-left">
                                    &nbsp;<telerik:RadNumericTextBox ID="txtAmount3" autocomplete="off" runat="server" Width="200px" Enabled="false" CssClass="ddl" BorderColor="#212435" BorderStyle="Solid" ></telerik:RadNumericTextBox>
                                    </td>
                                <td>&nbsp;</td>
                            </tr>
                <tr style="height:5px"><td></td></tr>
                            <tr>
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Account Details:&nbsp;</td>
                              <td class="text-left" colspan="4" >
                                  <telerik:RadLabel runat="server" ID="savedBenDetails" Width="100%" Font-Size="12px" style="vertical-align:middle; margin-left:6px;">&nbsp;&nbsp;&nbsp;</telerik:RadLabel>
                                    </td>
                            </tr>
                 <tr style="height:5px"><td></td></tr>
                            <tr runat="server" visible="false">
                                <td style="vertical-align:middle">&nbsp;</td><td class="text-left" style="font-size: 12px"></td>
                                <td></td>
                            </tr>
                 <tr style="height:5px"><td></td></tr>
                <tr runat="server" visible="false">
                   
                    <td style="text-align:center" colspan="3" class=" col-xs-14" runat="server" visible="false" id="td3">
                       <p class="title"><asp:Label ID="Label3" runat="server" Text="" Width="100%"></asp:Label></p>
                        <%--<asp:HiddenField ID="hidAccount3" runat="server" /> <asp:HiddenField ID="hidAcctName" runat="server" /><asp:HiddenField ID="hidBankName" runat="server" />--%>
                       <asp:Label runat="server" ID="hidAccount3"></asp:Label><asp:Label runat="server" ID="hidAcctName"></asp:Label><asp:label runat="server" ID="hidBankName"></asp:label>
                      <asp:label runat="server" ID="HideBenUNAme"></asp:label>
                        <asp:label runat="server" ID="HideBenBal"></asp:label>
                    </td>
                </tr>
                <tr>
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Naration:</td>
                                <td style="vertical-align:left; padding-left:6px">
                                    <telerik:RadTextBox ID="txtbox"  BorderStyle="Outset" BorderColor="#212435" CssClass="textarea" runat="server" Font-Size="14px"  Width="200px" Height="24px" Font-Names="courier new"></telerik:RadTextBox>
                                    
                                </td>
                            </tr>                 
                 <tr style="height:10px"><td></td></tr>
                <tr>
                    <td></td><td>
 <asp:Label runat="server" ID="lblmes11" ></asp:Label>
                             </td>
                </tr>
            </table>
           
            <table runat="server"  id="tblbtn" visible="false">
                            <tr>
                                <td style="vertical-align:middle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Discard Deposit"  class="thm-btn" OnClick="btnDiscardt_Click" Visible="false"/>&nbsp;&nbsp;<asp:Button ID="btnDepozit" runat="server" Text="Make Deposit" OnClientClick="return CheckDouble();" class="thm-btn" OnClick="btnMakeDepozit_Click"/>
                                   
                                                                             </td>
                                <td>&nbsp;</td>
                            </tr>
            </table>
        <div class="col-md-9">
                <div class="outer-box"><br>
                    <div class="row">
                        <div class="col-md-10 col-sm-10 col-xs-14">
                            <div class="accordion-box accordion-style-two">
                                <!--Start single accordion box-->
                                <!--Start single accordion box-->   

                                <!--Start single accordion box-->
                                <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                                    <div class="acc-btn active" >
                                        <p class="title">Click to view your Deposit Log</p>
                                        <div class="toggle-icon">
                                            <i class="plus fa fa-arrow-circle-o-right"></i><i class="minus fa fa-arrow-circle-o-right"></i>
                                        </div>
                                    </div>
                                    <div class="acc-content">
   <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" runat="server" CssClass="RadGrid_ModernBrowsers"
        AllowPaging="True" PageSize="10" AllowSorting="True" font-family="Arial,Helvetica,sans-serif" Font-Size="12px" Skin="WebBlue"
        OnNeedDataSource="gridBatch_NeedDataSource">
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
</section>
</asp:Content>
