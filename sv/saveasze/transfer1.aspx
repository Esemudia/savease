<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze.Master" AutoEventWireup="true" CodeBehind="transfer1.aspx.cs" Inherits="saveasze.transfer1" %>
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
                    <div class="section-title">
                        <h3>Transfer to Beneficiary </h3>
                    </div>
                    <div class="row">
                        <div class="col-md-10 col-sm-10 col-xs-14">
                            <div class="accordion-box accordion-style-two">
                                <!--Start single accordion box-->
                                <table>
                                    <tr>
                                                <td style="text-align:right"><asp:Label ID="Label1" runat="server" Width="100px"></asp:Label></td>
                                         <td style="text-align:right">
                                                    Beneficiary Account Type:</td>
                                        <td style="text-align:left"> 
                                                    <telerik:RadDropDownList ID="cmdAcctType" runat="server" SelectedText="Savease Account" SelectedValue="1" AutoPostBack="True" OnSelectedIndexChanged="cmdAcctType_SelectedIndexChanged">
                                                        <Items>
                                                            <telerik:DropDownListItem runat="server" Selected="True" Text="Savease Account" Value="1" />
                                                            <telerik:DropDownListItem runat="server" Text="Other Banks" Value="2" />
                                                        </Items>
                                                    </telerik:RadDropDownList>
                                                </td>
                                    </tr>
                                </table>
                                <table runat="server" id="tblSavease">
                                    
                                    <tr>
                                                <td style="text-align:right">&nbsp;</td>
                                                <td style="text-align:right">
                                                    Beneficiary Account:</td>
                                                <td style="text-align:left">
                                                    <telerik:RadNumericTextBox ID="txtBenAccount" runat="server" ></telerik:RadNumericTextBox>
                                                    <telerik:RadDropDownList ID="cmdBeneficiary" runat="server" Visible="false">
                                                    </telerik:RadDropDownList>
                                                </td><td>
                                                  &nbsp;  <telerik:RadButton ID="btnConfirm" runat="server" Text="Comfirm Account Number"></telerik:RadButton>
                                                </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:right"><telerik:RadLabel ID="lblSaveaseBenID" runat="server" Text=""></telerik:RadLabel></td>
                                        <td style="text-align:right" colspan="2"><telerik:RadLabel ID="lblSaveaseBen" runat="server" Text=""></telerik:RadLabel></td>
                                    </tr>
                                    <tr>
                                                <td style="text-align:right">&nbsp;</td>
                                                <td style="text-align:right">
                                                    Transaction Amount:</td>
                                                <td style="text-align:left">
                                                    <telerik:RadNumericTextBox ID="saveaseTransAmount" runat="server" >
<NegativeStyle Resize="None"></NegativeStyle>

<NumberFormat ZeroPattern="N" NumericPlaceHolder="N"></NumberFormat>

<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
                                                    </telerik:RadNumericTextBox>
                                                </td>
                                    </tr>
                                     <tr>
                                                <td style="text-align:right">&nbsp;</td>
                                                <td style="text-align:right">
                                                    Account Number</td>
                                                <td style="text-align:left"> 
                                                    <telerik:RadTextBox ID="txtSaveaseID" runat="server" Width="300px"></telerik:RadTextBox>
                                                </td>
                                                <td style="text-align:left">
                                                    &nbsp;</td>

                                            </tr>
                                </table>
                                <table>
                                           
                                </table>
                                        <table runat="server" id="tblTransfer" visible="false">
                                            <tr>
                                                <td style="text-align:right">&nbsp;</td>
                                                <td style="text-align:right">
                                                    Beneficiary:</td>
                                                <td style="text-align:right"> 
                                                    <telerik:RadDropDownList ID="rcvAcct" runat="server">
                                                    </telerik:RadDropDownList>
                                                </td>
                                                <td style="text-align:left">
                                                    &nbsp;</td>

                                            </tr>
                                            <tr><td></td>
                                                <td style="text-align:right"><asp:Label ID="lblBlank" runat="server" Width="100px"></asp:Label></td>
                                                <td style="text-align:right">
                                                    Account Name:
                                                </td>
                                                <td style="text-align:right"> 
                                                    <asp:Label ID="lblAcctName" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td style="text-align:left">
                                                    <telerik:RadImageButton ID="btnSaveBeneficiary" runat="server" Text="" Image-Url="~/images/shop/create.png" OnClick="btnSaveBeneficiary_Click" Width="100px" Height="30px"></telerik:RadImageButton>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="text-align:right">&nbsp;</td>
                                                <td style="text-align:right">
                                                    &nbsp;</td>
                                                <td style="text-align:right"> 
                                                    &nbsp;</td>
                                                <td style="text-align:left">
                                                    &nbsp;</td>

                                            </tr>
                                        </table>
                                <!--Start single accordion box-->
                                <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                                    <div class="acc-btn active">
                                        <p class="title">Savease Beneficiary (Quick View)</p>
                                        <div class="toggle-icon">
                                            <i class="plus fa fa-arrow-circle-o-right"></i><i class="minus fa fa-arrow-circle-o-right"></i>
                                        </div>
                                    </div>
                                    <div class="acc-content collapsed">
                                        <div class="text">
 <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1"
AllowPaging="True" Width="100%" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowMultiRowSelection="True" Skin="Outlook" Font-Size="10px" PageSize="7" >
        <AlternatingItemStyle BackColor="#EBEEEA" Wrap="False" />
        <GroupHeaderItemStyle Font-Size="Smaller" />
                 <MasterTableView>
                     <ItemStyle CssClass="Row50" /> 
                     <AlternatingItemStyle CssClass="Row50" /> 
            <Columns>
            </Columns>
            <PagerStyle AlwaysVisible="True" />
        </MasterTableView>
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

        <ExportSettings ExportOnlyData="True">
        </ExportSettings>
        <ClientSettings>
            <Selecting AllowRowSelect="true"></Selecting>
        </ClientSettings>
        <PagerStyle AlwaysVisible="True" />

<FilterMenu RenderMode="Lightweight"></FilterMenu>

<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
    </telerik:RadGrid>

                                        </div>
                                    </div>
                                </div>

                                <!--Start single accordion box-->
                                <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                                    <div class="acc-btn">
                                        <p class="title">Leading of Way</p>
                                        <div class="toggle-icon">
                                            <i class="plus fa fa-arrow-circle-o-right"></i><i class="minus fa fa-arrow-circle-o-right"></i>
                                        </div>
                                    </div>
                                    <div class="acc-content">
                                        <div class="text"><p>
                                            Employers across all industry sectors to ensure that their internal sed HR systems processes align to their business requirements idea of denouncing pleasure and praising pain expound.
                                        </p></div>
                                    </div>
                                </div>


                            </div>
                        </div>
                        <div class="col-md-5 col-sm-5 col-xs-12">
                             <div class="text">
                                <p>Denouncing pleasure and praising pain was born and I will give you a complete account of the system no one rejects, dislikes, or avoids pleasure itself.</p><br>
                                <p>Expound the actually teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.</p>
                            </div>
                        </div>
                    </div>
                    <br>

                </div>
            </div>
        </div>
    </div>
</section>
</asp:Content>
