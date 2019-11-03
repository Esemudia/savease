<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter.Master" AutoEventWireup="true" CodeBehind="transactions.aspx.cs" Inherits="saveasze.transactions" %>
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
            
               <table style="margin-left:10px; background-color:#fff!important;">
                <tr style="background-color:#fff!importantf">
                                <td style=" color:#212435; font-size:13px; font-weight:bolder;">
                                   Click on the Tabs below to display details<br /> of  your transaction history.
                                    <asp:HiddenField runat="server" ID="lblAcctName" />
                                    <asp:HiddenField runat="server" ID="HideBenUNAme" />
                                </td>
                            </tr>
            </table>
          <%--  <table id="tbl1" >
                            <tr>
                                <td style="vertical-align:middle">&nbsp;</td><td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
            </table>--%>
            <div class="col-md-9"> 
                <div class="outer-box"><br><br>
                    <div class="section-title">
                        <h3>Transaction Logs </h3>
                    </div>
                    <div class="row" style="display:none">
                        <div class="col-md-5 col-sm-5 col-xs-12"><br><br>
                     
                              <telerik:RadDropDownList ID="cmdAcctType"  CssClass="ddl" runat="server" SelectedText="Withdrawal" SelectedValue="0" AutoPostBack="True" OnSelectedIndexChanged="cmdAcctType_SelectedIndexChanged"  Width="200px">
                                                        <Items>
                                                            <telerik:DropDownListItem CssClass="drop" runat="server" Selected="True" Value="0" Text="My Deposit"  />
                                                            <telerik:DropDownListItem CssClass="drop" runat="server" Text="Order Details" Value="1" />
                                                            <telerik:DropDownListItem CssClass="drop" runat="server" Text="My Withdrawal" Value="2" />
                                                            <telerik:DropDownListItem CssClass="drop" runat="server" Text="Transfered to Savease" Value="3" />
                                                        </Items>
                                                    </telerik:RadDropDownList><br /><br />


                        </div>
                    </div>
                    
                </div>
            </div>
              <div class="col-md-9">
                <div class="outer-box"><br><br>
                    <div class="row">
                        <div class="col-md-10 col-sm-10 col-xs-14">
                            <div class="accordion-box accordion-style-two">
                                   <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                                    <div class="acc-btn active" >
                                        <p class="title">Click here to view Transaction Summary</p>
                                        <div class="toggle-icon">
                                            <i class="plus fa fa-arrow-circle-o-right"></i><i class="minus fa fa-arrow-circle-o-right"></i>
                                        </div>
                                    </div>
                                    
                                <!--Start single accordion box-->
                                     <div class="acc-content">
        <telerik:RadGrid ID="RadGrid2" RenderMode="Lightweight" runat="server" AutoGenerateColumns="False" CellSpacing="-1" DataSourceID="SqlDataSource1" 
            GridLines="Both" AllowCustomPaging="True" AllowPaging="True" PageSize="20" font-family="Arial,Helvetica,sans-serif" Font-Size="12px" ShowFooter="True" CssClass="RadGrid_ModernBrowsers"
             Skin="WebBlue">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ExportSettings ExportOnlyData="True" OpenInNewWindow="True">
            </ExportSettings>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="true">
               
                <Columns>
                    <telerik:GridBoundColumn DataField="SN" FilterControlAltText="Filter SN column" HeaderText="SN" SortExpression="SN" UniqueName="SN" DataType="System.Int64" ReadOnly="True">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TransactionDate" FilterControlAltText="Filter TransactionDate column" HeaderText="TransactionDate" SortExpression="TransactionDate" UniqueName="TransactionDate" DataType="System.DateTime">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn HeaderStyle-Width="130px" ItemStyle-Width="130px" DataField="TransactionType" FilterControlAltText="Filter TransactionType column" HeaderText="TransactionType" SortExpression="TransactionType" UniqueName="TransactionType">
                        
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="SenderName" HeaderStyle-Width="120px" ItemStyle-Width="120px" FilterControlAltText="Filter SenderName column" HeaderText="Name" SortExpression="SenderName" UniqueName="SenderName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RefNumber" FilterControlAltText="Filter RefNumber column" HeaderText="RefNumber" SortExpression="RefNumber" UniqueName="RefNumber">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AccountNo" HeaderStyle-Width="150px" ItemStyle-Width="150px" FilterControlAltText="Filter AccountNo column" HeaderText="AccountNo" SortExpression="AccountNo" UniqueName="AccountNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="credit" FilterControlAltText="Filter credit column" HeaderText="Credit" SortExpression="credit" UniqueName="credit" DataType="System.Double">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="debit" DataType="System.Double" FilterControlAltText="Filter debit column" HeaderText="Debit" SortExpression="debit" UniqueName="debit">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
            <PagerStyle Mode="Slider" Position="TopAndBottom" />

<FilterMenu RenderMode="Lightweight"></FilterMenu>

<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:saveaseSqlLocal %>" SelectCommand="getTransactionDetails1" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="in_uname" SessionField="sessSaveID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                                    </div>


                            </div>
                        </div>
                        <%-- Start Sample Template --%>
                        
                        <%-- End Sample Template --%>
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
