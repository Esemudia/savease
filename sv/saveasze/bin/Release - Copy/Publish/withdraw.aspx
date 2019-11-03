<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter.Master" AutoEventWireup="true" CodeBehind="withdraw.aspx.cs" Inherits="saveasze.withdraw" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
            <table>
                            <tr>
                                <td>&nbsp;</td><td style="vertical-align:right"><asp:Label ID="lblBalh" runat="server" Text="" Visible="false"></asp:Label></td><td style="vertical-align:left"><asp:Label ID="lblBal" runat="server" Text=""></asp:Label></td>
                                
                            </tr>
                
                            <tr style="display:none">
                                <td>&nbsp;</td><td style="text-align:right"><asp:Label ID="Label1" runat="server" Text="Account Type:" Font-Size="12px" Width="90px" ></asp:Label></td>
                                <td style="vertical-align:left">
                                    <telerik:RadDropDownList ID="cmdAcctType" runat="server" SelectedText="Savease Account" SelectedValue="1" AutoPostBack="True" OnSelectedIndexChanged="cmdAcctType_SelectedIndexChanged">
                                                        <Items>
                                                            <telerik:DropDownListItem runat="server" Selected="True" Text="Savease Account" Value="1" />
                                                            <telerik:DropDownListItem runat="server" Text="Other Banks" Value="2" />
                                                            <telerik:DropDownListItem runat="server" Text="Saved Beneficiary" Value="3" />
                                                        </Items>
                                                    </telerik:RadDropDownList>
                                </td>
                                
                            </tr>
            </table>
                        <table runat="server" id="tblSaveaseAccounts">
                            <tr style="display:none">
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Voucher PIN:</td>
                                <td class="text-left"><telerik:RadNumericTextBox ID="txtPIN" runat="server" Width="200px" AutoPostBack="True" OnTextChanged="txtPIN_TextChanged">
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
                                    <telerik:RadButton ID="btnConfirmPIN" runat="server" OnClick="btnConfirmPIN_Click" Text="Confirm PIN">
                                    </telerik:RadButton>
                                   
                                    </td>
                            </tr>
                            <tr>
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Account Number:</td><td class="text-left"><telerik:RadNumericTextBox ID="txtAccount" runat="server" Width="200px" AutoPostBack="True" OnTextChanged="txtAccount_TextChanged">
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
                                <td>    <telerik:RadButton ID="btnConfirmAccount" runat="server" OnClick="btnConfirmAccount_Click" Text="Confirm Account">
                                    </telerik:RadButton></td>
                            </tr>
                            <tr>
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Account Name:</td><td colspan="2" class="text-left"><telerik:RadLabel runat="server" Text="" ID="lblAcctName" Width="100%" Font-Size="12px"></telerik:RadLabel><telerik:RadLabel runat="server" Text="" ID="txtAcctBal" Width="0" Font-Size="12px" Visible="false"></telerik:RadLabel></td>
                              
                            </tr>
                            <tr>
                                <td style="vertical-align:middle; font-size: 12px;" class="text-right">Amount:</td><td class="text-left"><telerik:RadNumericTextBox ID="txtAmount" runat="server" Width="200px"></telerik:RadNumericTextBox>
                                    </td>
                                <td>&nbsp;</td>
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
                                <td style="vertical-align:middle">&nbsp;</td><td><asp:Button ID="btnDepozit" runat="server" Text="Withdraw Fund"  class="thm-btn" OnClick="btnMakeDepozit_Click"/>
                                    
                                                                             </td>
                                <td>&nbsp;</td>
                            </tr>
            </table>
            <div class="col-md-9">
                <div class="outer-box"><br><br>
                    <div class="section-title">
                        <h3>Transaction Logs </h3>
                    </div>
                    <div class="row">
                        <div class="col-md-10 col-sm-10 col-xs-14">
                            <div class="accordion-box accordion-style-two">
                                <!--Start single accordion box-->
                                <!--Start single accordion box-->   

                                <!--Start single accordion box-->
                                <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                                    <div class="acc-btn active" >
                                        <p class="title">Transaction Log</p>
                                        <div class="toggle-icon">
                                            <i class="plus fa fa-arrow-circle-o-right"></i><i class="minus fa fa-arrow-circle-o-right"></i>
                                        </div>
                                    </div>
                                    <div class="acc-content">
                                         
                                            <telerik:RadGrid ID="RadGrid3" runat="server" CellSpacing="-1" DataSourceID="dtsTransHistory" GridLines="Both" AllowCustomPaging="True" AllowPaging="True" AllowSorting="True" ShowFooter="True" Skin="WebBlue">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                                <MasterTableView AutoGenerateColumns="False" DataSourceID="dtsTransHistory" Width="100%">
                                                    <Columns>
                                                        <telerik:GridBoundColumn DataField="SN" FilterControlAltText="Filter SN column" HeaderText="SN" SortExpression="SN" UniqueName="SN">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="cardpin" FilterControlAltText="Filter cardpin column" HeaderText="Voucher PIN" SortExpression="cardpin" UniqueName="cardpin">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="cardsn" FilterControlAltText="Filter cardsn column" HeaderText="Vourcher S/N" SortExpression="cardsn" UniqueName="cardsn">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="amount" FilterControlAltText="Filter amount column" HeaderText="Amount" SortExpression="amount" UniqueName="amount" DataType="System.Double">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="acctNo" FilterControlAltText="Filter acctNo column" HeaderText="Beneficiary Account No" SortExpression="acctNo" UniqueName="acctNo">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="acctName" FilterControlAltText="Filter acctName column" HeaderText="Beneficiary Account Name" SortExpression="acctName" UniqueName="acctName">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="bankName" FilterControlAltText="Filter bankName column" HeaderText="Beneficiary Bank Name" SortExpression="bankName" UniqueName="bankName">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn DataField="transactionDate" DataType="System.DateTime" FilterControlAltText="Filter transactionDate column" HeaderText="Transaction Date" SortExpression="transactionDate" UniqueName="transactionDate">
                                                        </telerik:GridBoundColumn>
                                                    </Columns>
                                                </MasterTableView>
                                            </telerik:RadGrid>
                                            <asp:SqlDataSource ID="dtsTransHistory" runat="server" ConnectionString="<%$ ConnectionStrings:saveaseSqlLocal %>" SelectCommand="SELECT ROW_NUMBER() over (ORDER BY depID desc) as SN,[cardpin], [cardsn], [amount], [acctNo], [acctName], [bankName], [transactionDate] FROM [Bankdeposit] WHERE ([depositor] = @depositor) ORDER BY [depID] DESC">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="depositor" SessionField="txtUsr" Type="String" />
                                                </SelectParameters>
                                 </asp:SqlDataSource>
                                        
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
