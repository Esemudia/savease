<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter.Master" AutoEventWireup="true" CodeBehind="pin2.aspx.cs" Inherits="saveasze.pin2" %>
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
    
     <style>
       #example {
    text-align: center;
}
 
#example .demo-container {
    display: inline-block;
    text-align: left;
    padding: 50px 40px 35px 40px;
}
 
.demo-container .RadTabStrip {
    margin-left: 8px;
}
 
.demo-container .RadTabStrip .rtsLevel1 {
    border: none;
}
 
.demo-container .RadTabStrip .tab {
    background-color: #728ba1;
    width: 90px;
    height: 40px;
    border-right: 1px solid #FFF;
    text-align: center;
    vertical-align: middle;
}
 
.demo-container .RadTabStrip .tab.overviewTab {
    border-top-left-radius: 5px;
}
 
.demo-container .RadTabStrip .tab.priceTab {
    background-color: #6991a3;
    border-top-right-radius: 5px;
}
 
.demo-container .RadTabStrip .tab.selectedTab {
    background-color: #4c6393;
}
 
.demo-container .RadTabStrip .tab.hoveredTab {
    background-color: #81a3b2;
}
 
.demo-container .RadTabStrip .tab.hoveredTab.selectedTab {
    background-color: #4c6393;
}
 
.demo-container .RadTabStrip .tab .rtsLink {
    border: none;
    padding: 12px 0 0 0;
}
 
.demo-container .RadTabStrip .tab .rtsTxt {
    color: white;
    font-family: 'Segoe UI';
    font-size: 11px;
}
 
    .demo-container .RadTabStrip .tab .rtsTxt:before {
        display: block;
        height: 22px;
        width: 22px;
       /* border-radius: 15px;*/
        background-color: #FFF;
        color: #4c6393;
        font-family: TelerikWebUI;
        font-size: 13px;
        text-align: center;
        margin: 0 auto 1px auto;
        padding: 4px;
    }
 
.demo-container .RadTabStrip .tab.overviewTab .rtsTxt:before {
    content: "\e0f9";
}
 
.demo-container .RadTabStrip .tab.attractionsTab .rtsTxt:before {
    content: "\e07c";
}
 
.demo-container .RadTabStrip .tab.locationTab .rtsTxt:before {
    content: "\e125";
}
 
.demo-container .RadTabStrip .tab.calendarTab .rtsTxt:before {
    content: "\e089";
}
 
.demo-container .RadTabStrip .tab.priceTab .rtsTxt:before {
    content: "$";
    font-family: Arial;
    font-size: 14px;
    font-weight: 600;
    padding-top: 4px;
    height: 18px;
    width: 18px;
    padding: 1px;
}
.RadGrid
{
   /*border-radius: 10px;*/
   overflow: hidden;
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
         .labelstyle{
             color:green;
             font-weight:Bolder;
         }
         .lblstyle{
             color:blue;
             font-weight:Bolder;
         }
          .labelstyle3{
             color:purple;
             font-weight:Bolder;
         }
         .lblstyle2{
             color:	#ff6d6d;
             font-weight:Bolder;
         }

    
   </style>
       <style>
         .auto-style1 {
             position: relative;
             padding-bottom: 10px;
             margin-bottom: 0px;
             left: 4px;
             top: 3px;
         }

         .Grid {background-color: #fff; margin: 5px 0 10px 0; border: solid 0px #5A7892; border-collapse:collapse; font-family:Calibri; color: #474747;}
.Grid td {
      padding: 2px; 
      border: solid 0px #5A7892; 
      column-rule-color:#DAE2E8;
}
.Grid th  {
      padding : 4px 2px; 
      color: #fff; 
      background: #5A7892;
      border-left: solid 1px gray; 
      font-size: 0.9em; }
    </style>
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
            
          <%--  <table id="tbl1" >
                            <tr>
                                <td style="vertical-align:middle">&nbsp;</td><td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
            </table>--%>
            <div class="col-md-9"> 
                <div class="outer-box">
                    <div class="row">
                        <div class="col-md-5 col-sm-5 col-xs-12">
              <div>
                <p style="font-size:13px; color:black; font-weight:bolder;"> Below are two radio button labelled Voucher Table and Block Voucher. When you select the voucher table button, it presents a tabular repesentation
                  of your vouchers and its history, providing all information from status, usedby, date and time, e.t.c. You can filter the reports by selecting a search criteria as indicated on the page. The block
                    voucher button present an elevated section where vouchers can be blocked, whenever there is a case of misplacement or theft. You can block vouchers by their serial number, voucher pin or batch code. Once blocked,
                    the vouchers  will be rebatched and the rebatched vouchers will be sent to your inbox and voucher table.
                   </p>
              </div>
                  
                     
           
                             
                            <asp:Label runat="server" ID="lblmes"></asp:Label><br />
                            
                                  <table>
                                      
                                      <tr><td colspan="3" style="text-align:left; font-size: 12px;">
                                          <telerik:RadRadioButtonList ID="RadRadioButtonList1" Runat="server" Layout="Flow"  Direction="Horizontal" SelectedIndex="0" SelectedValue="pv"  CssClass="content" OnSelectedIndexChanged="RadRadioButtonList1_SelectedIndexChanged">
                                              <Items>
                                                  <telerik:ButtonListItem Selected="True"  Text="Voucher Table" ToolTip="Print Voucher" Value="pv" />
                                                  <telerik:ButtonListItem Text="Block Voucher" ToolTip="Block Voucher" Value="bv" />
                                              </Items>
                                          </telerik:RadRadioButtonList><br />
                                          </td></tr>
                                      <tr><td runat="server" id="trsea" style="font-size: 12px">Search By:</td><td>
                                          <telerik:RadDropDownList ID="cmddrop" runat="server" SelectedText="Select Criteria" SelectedValue="0" CssClass="ddl" OnSelectedIndexChanged="cmddrop_click" AutoPostBack="true">
                                              <Items>
                                                  <telerik:DropDownListItem CssClass="drop" runat="server" Text="Select Criteria"/>
                                                  <telerik:DropDownListItem CssClass="drop" runat="server" Text="Used Vouchers"  Value="Used"/>
                                                  <telerik:DropDownListItem CssClass="drop" runat="server" Text="Unused Vouchers" Value="Unused" />
                                                  <telerik:DropDownListItem CssClass="drop" runat="server" Text="Blocked Vouchers" Value="Blocked" />
                                                  <telerik:DropDownListItem CssClass="drop" runat="server" Text="Rebatched Vouchers" value="Rebatched"/>
                                                  <telerik:DropDownListItem  CssClass="drop" runat="server" Text="Date Range" Value="Date"/>
                                                  <telerik:DropDownListItem CssClass="drop" runat="server" Text="Batch Code" value="Batch"/>
                                              </Items>
                                          </telerik:RadDropDownList></td>
                                      </tr>
                                      <tr runat="server" id="txtdate">
                                          <td><label>From:</label>
                                              <telerik:RadDatePicker ID="dtfrom" runat="server" CssClass="ddl" OnSelectedDateChanged="dtFrom_click" AutoPostBack="true"></telerik:RadDatePicker>
                                          </td>
                                           <td><label>To:</label>
                                              <telerik:RadDatePicker ID="dtTo" runat="server" CssClass="ddl" OnSelectedDateChanged="dtFrom_click" AutoPostBack="true"></telerik:RadDatePicker>
                                          </td>
                                      </tr>
                                               <tr runat="server" id="trbatch"><td style="text-align:right">
                                                   <asp:Label runat="server" Text="Batch Code: " Width="170px" ID="lblBatch"></asp:Label>
                                    <telerik:RadDropDownList ID="cmdBlockPrint" runat="server" CssClass="ddl" SelectedText="Savease Account" SelectedValue="1" Width="170px">
                                                        <Items>
                                                          <telerik:DropDownListItem  CssClass="drop" runat="server" Selected="True" Text="By Batch" Value="Batch" />
                                <telerik:DropDownListItem  CssClass="drop"  runat="server" Text="Serial Number" Value="Serials" />
                                <telerik:DropDownListItem  CssClass="drop" runat="server" Text="Card PIN" Value="PIN" />
                           </Items>
                                                    </telerik:RadDropDownList>
                                                   </td></tr>
                                      <tr style="height:5px;"><td></td></tr>
                                      <tr runat="server" id="trbatch1" visible="false"><td>
                            <telerik:RadNumericTextBox ID="txtbacth" runat="server" Width="200px" CssClass="ddl" BorderColor="#212435" BorderStyle="Solid" MaxValue="703687441776640000" MinValue="0" NumberFormat-KeepNotRoundedValue="False">
<NegativeStyle Resize="None"></NegativeStyle>

<NumberFormat ZeroPattern="n" AllowRounding="False" GroupSeparator="" DecimalDigits="0" ></NumberFormat>

<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
                                    </telerik:RadNumericTextBox></td>
                       <td><asp:ImageButton ID="btnsnd" runat="server" ImageUrl="~/images/confirm.png" OnClick="btnsnd_Click"/></td>
                        </tr>  </table>  <br /> 

 </div>
 </div>
 </div>
 </div>  
 
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
                                        <p class="title">Voucher Log</p>
                                        <div class="toggle-icon">
                                            <i class="plus fa fa-arrow-circle-o-right"></i><i class="minus fa fa-arrow-circle-o-right"></i>
                                        </div>
                                    </div>
                                    <div class="acc-content">

      <telerik:RadGrid RenderMode="Lightweight" ID="gridBatch" runat="server" CssClass="RadGrid_ModernBrowsers"
        AllowPaging="True" PageSize="20" AllowSorting="True" font-family="Arial,Helvetica,sans-serif"
          Font-Size="12px" Skin="WebBlue"  OnNeedDataSource="gridBatch_NeedDataSource" OnItemCreated="RadGrid1_ItemCreated">
    <PagerStyle Mode="Slider" Position="TopAndBottom" PageSizeControlType="RadComboBox"></PagerStyle>
        
    </telerik:RadGrid>
                            <asp:Label ID="lblGridBatch" runat="server" Text="" Visible="false"></asp:Label>
                            
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
        <asp:TemplateField HeaderText="Voucher PIN" ItemStyle-Width = "150">
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
</asp:GridView>
                            <asp:HiddenField ID="hideSEID" runat="server" /> <asp:HiddenField ID="hideFullName" runat="server" />
                            <br />
                            <br />
                            <div align="left" runat="server" id="tblAmount">
                                    <table><tr>
                                <td style="text-align:right;"><asp:Label Text="Total Amount Unused: " runat="server" ID="lblAmtunUsed" Width="200px" CssClass="labelstyle"></asp:Label></td><td style="text-align:left;font-weight:bolder; color:black"> &nbsp;N<%getPinAmount("completed"); %>.00</td></tr>
                               <tr><td style="text-align:right"><asp:Label Text="Total Amount Used: " runat="server" ID="Label1" Width="200px" CssClass="lblstyle"></asp:Label></td><td style="text-align:left;font-weight:bolder; color:black"> &nbsp;N<%getPinAmount("used"); %>.00</td></tr>
                                 <tr>  <td style="text-align:right"><asp:Label Text="Total Amount Blocked: " runat="server" ID="lblblock" Width="200px" CssClass="labelstyle3"></asp:Label></td><td style="text-align:left;font-weight:bolder; color:black"> &nbsp;N<%getPinAmount("Blocked"); %>.00</td></tr>
                               <tr><td style="text-align:right"><asp:Label Text="Total Amount Rebatch: " runat="server" ID="lblRebatch" Width="200px" CssClass="lblstyle2"></asp:Label></td><td style="text-align:left;font-weight:bolder; color:black;"> &nbsp;N<%getPinAmount("Rebatch"); %>.00</td>
                                  </tr></table>
                            </div>
                           <asp:Button ID="btnUpdate" runat="server" Text="Block Pin" class="thm-btn" OnClick = "BlockPin_Click" Visible = "false"/>
                            <%-- Block Pin Section below --%>
                          <asp:DropDownList ID="drpPrintOption" CssClass="ddl" runat="server">
                    <asp:ListItem Selected="True"  Value="0">Current Page</asp:ListItem>
                    <asp:ListItem Value="1">ALL</asp:ListItem>
                </asp:DropDownList><asp:Button runat="server" ID="btnprint" Text="Print" OnClick = "DownloadPDF_Click" />
            </div>

                        </div>
                    </div>
                    
                </div>


              

            
        </div>
    </div>
</div> 

                        </div>
                                
                        <div class="col-md-5 col-sm-5 col-xs-12">
                        </div>
                    </div>
</section>
</asp:Content>
