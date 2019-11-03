<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter.Master" AutoEventWireup="true" CodeBehind="transactionsMyDeposit.aspx.cs" Inherits="saveasze.transactionsMyDeposit" %>
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
    background-color: #9ab5c1;
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
        /*border-radius: 15px;*/
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
  /* border-radius: 10px;*/
   overflow: hidden;
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
            
            <div class="col-md-9"> 
                <div class="outer-box"><br><br>
                    <div class="section-title">
                        <h3>Transaction Logs(My WITHDRAWAL) </h3>
                    </div>
                    <div class="row">
                        <div class="col-md-5 col-sm-5 col-xs-12"><br><br>
                               <telerik:RadDropDownList ID="cmdAcctType"  CssClass="ddl" runat="server" SelectedText="My Deposit" SelectedValue="2" AutoPostBack="True" OnSelectedIndexChanged="cmdAcctType_SelectedIndexChanged"  Width="200px">
                                                        <Items>
                                                            <telerik:DropDownListItem CssClass="drop" runat="server"  Value="0" Text="MY Deposit"  />
                                                            <telerik:DropDownListItem CssClass="drop" runat="server"  Text="Order Details" Value="1" />
                                                            <telerik:DropDownListItem CssClass="drop" runat="server" Selected="True" Text="My Withdrawal" Value="2" />
                                                            <telerik:DropDownListItem CssClass="drop" runat="server" Text="Transfered to Savease" Value="3" />
                                                        </Items>
                                                    </telerik:RadDropDownList><br /><br />
                              <table>
             <tr>
                 <td style="text-align:left">
                 <div class="demo-container size-thin">
      <br /><br />
        </div>
                      <div class="acc-content">
                   
                          </div>
                 </td>
             </tr>
         </table>
                        </div>
                    </div>
                    <br>

                </div>
            </div>
              <div class="col-md-9">
                <div class="outer-box"><br><br>
                    <div class="section-title">
                        <h3>Transaction Logs </h3>
                    </div>
                    <div class="row">
                        <div class="col-md-10 col-sm-10 col-xs-14">
                            <div class="accordion-box accordion-style-two">
                                <!--Start single accordion box-->
                                <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                                    <div class="acc-btn" style="width:100%!important;" >
                                        <p class="title">Transaction Log</p>
                                        <div class="toggle-icon">
                                            <i class="plus fa fa-arrow-circle-o-right"></i><i class="minus fa fa-arrow-circle-o-right"></i>
                                        </div>
                                    </div>
                                    <div class="acc-content">
                                        <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" runat="server" Skin="WebBlue" CssClass="RadGrid_ModernBrowsers"
        AllowPaging="True" PageSize="5" Font-Size="12px" AllowSorting="True" OnNeedDataSource="gridBatch_NeedDataSource">
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
