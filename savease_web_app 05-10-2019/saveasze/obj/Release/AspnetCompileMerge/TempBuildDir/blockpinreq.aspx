<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter.Master" AutoEventWireup="true" CodeBehind="blockpinreq.aspx.cs" Inherits="saveasze.blockpinreq" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
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
               <%-- <div class="outer-box"><br><br>
                    <div class="section-title">
                        <h3>Block Pin </h3>
                    </div>
                    <div class="row">
                        <div class="col-md-10 col-sm-10 col-xs-14">
                            <div class="accordion-box accordion-style-two">
                                <!--Start single accordion box-->
                                <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                                    <div class="acc-btn">
                                        <p class="title">Vendors Last Transaction(Quick View)</p>
                                        <div class="toggle-icon">
                                            <span class="plus fa fa-arrow-circle-o-right"></span><span class="minus fa fa-arrow-circle-o-right"></span>
                                        </div>
                                    </div>
                                    <div class="acc-content">
                                        <div class="text">
                                        <!-- Start Vendors Grid-->
                                            
                            <div class="text">
                                Add New Vendor<telerik:RadGrid ID="RadGrid1" runat="server" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <MasterTableView AutoGenerateColumns="False" DataSourceID="dtsVendorGrid">
                                        <Columns>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <asp:SqlDataSource ID="dtsVendorGrid" runat="server" ConnectionString="<%$ ConnectionStrings:saveaseSqlLocal %>" SelectCommand="SELECT [registration_number], [vendors_name], [contact_phone], [contact_email], [location], [createdDate], [districtID] FROM [vendor]"></asp:SqlDataSource>
                                <p>
                                </p>
                            </div>
                            <ul class="benifit-list">
                                <li>View Detailed Transactions</li>
                            </ul>
                                        <!-- End Vendors Grid--></div>
                                    </div>
                                </div>
                                <!--Start single accordion box-->
                                <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                                    <div class="acc-btn active">
                                        <p class="title">Customers Last Transactions (Quick View)</p>
                                        <div class="toggle-icon">
                                            <i class="plus fa fa-arrow-circle-o-right"></i><i class="minus fa fa-arrow-circle-o-right"></i>
                                        </div>
                                    </div>
                                    <div class="acc-content collapsed">
                                        <div class="text"><p>
                                            Employers across all industry sectors to ensure that their internal sed HR systems processes align to their business requirements idea of denouncing pleasure and praising pain expound.
                                        </p></div>
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

                </div>--%>

                <div class="outer-box"><br><br>
                    <div class="auto-style1">
                        <h3>Block Pin </h3>
                    </div>
                    <div class="block">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <br />
                                   <table style="margin-left:20px;">
                <tr>
                                <td style=" color:#212435; font-size:13px; font-weight:bolder;">
                                   Click on the dropdown button to select<br />  how you want pin. Either by batch,<br /> by Serial Number, or<br /> by Card pin.
                                </td>
                            </tr>
            </table><br />
                        <table>
                            <tr runat="server" id="trDisplay" visible="false"><td colspan="4" style="text-align:left">
                                <asp:Label ID="lblDisplay" runat="server" Text=""></asp:Label>
                                </td></tr>
                            <tr>
                                <td>
  <telerik:RadDropDownList ID="Raddrp"  CssClass="ddl"  runat="server" SelectedText="By Batch" SelectedValue="Batch" OnSelectedIndexChanged="Raddrp_SelectedIndexChanged" AutoPostBack="True">
                            <Items>
                                <telerik:DropDownListItem  CssClass="drop" runat="server" Selected="True" Text="By Batch" Value="Batch" />
                                <telerik:DropDownListItem  CssClass="drop"  runat="server" Text="Serial Number" Value="Serials" />
                                <telerik:DropDownListItem  CssClass="drop" runat="server" Text="Card PIN" Value="PIN" />
                            </Items>
                        </telerik:RadDropDownList>
                                </td>
                               
                            </tr>
                       </table><br />
                                <table>
                                    <tr>
                                         <td style="text-align:right; font-family:Calibri;">
                                    &nbsp; <asp:Label ID="lblbatch" runat="server" Text="Batch Number"></asp:Label>
                                </td>
                                <td>
                                     &nbsp;<telerik:RadNumericTextBox ID="txtVal" runat="server">
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
                                 <telerik:RadImageButton ID="btnConfirmPIN" runat="server" Text="" Width="100px" Height="20px"  Image-Url="~/images/confirm.png" ToolTip="Search" OnClick="btnConfirmPIN_Click"></telerik:RadImageButton>
                                </td>
                                    </tr>
                                </table>
                       <asp:GridView ID="gvOrders" runat="server" CssClass="Grid" AutoGenerateColumns="false" OnRowDataBound = "OnRowDataBound" DataKeyNames = "pinID">
    <Columns>
        <asp:TemplateField>
            <HeaderTemplate>
                <asp:CheckBox ID = "chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="OnCheckedChanged" />
            </HeaderTemplate>
            <ItemTemplate>
                <asp:CheckBox runat="server" AutoPostBack="true" OnCheckedChanged="OnCheckedChanged" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="PIN ID" ItemStyle-Width = "150" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden">
            <ItemTemplate>
                <asp:Label ID="lblID" runat="server" Text='<%# Eval("pinID") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Card PIN" ItemStyle-Width = "150">
            <ItemTemplate>
                <asp:Label ID="lblCard_pin" runat="server" Text='<%# Eval("card_pin") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Serial No." ItemStyle-Width = "150">
            <ItemTemplate>
                <asp:Label ID = "lblCardSN" runat="server" Text='<%# Eval("cardpin_sn") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Batch No." ItemStyle-Width = "150">
            <ItemTemplate>
                <asp:Label ID = "lblBatchNo" runat="server" Text='<%# Eval("orderNumber") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Card Type." ItemStyle-Width = "90">
            <ItemTemplate>
                <asp:Label ID = "lblCardType" runat="server" Text='<%# Eval("cardType") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Order By" ItemStyle-Width = "150" Visible="false">
            <ItemTemplate>
                <asp:Label ID = "lblOrderBy" runat="server" Text='<%# Eval("orderBy") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Order Status" ItemStyle-Width = "150" Visible="false">
            <ItemTemplate>
                <asp:Label ID = "lblStatus" runat="server" Text='<%# Eval("orderStatus") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Order Date" ItemStyle-Width = "200">
            <ItemTemplate>
                <asp:Label ID = "lblOrderDate" runat="server" Text='<%# Eval("oderDate") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView><br />
                        
<asp:Button ID="btnUpdate" runat="server" Text="Block Pin" class="thm-btn" OnClick = "Update" Visible = "false"/>
                </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                  </div>
            </div>
        </div>
    </div>
</section>
</asp:Content>
