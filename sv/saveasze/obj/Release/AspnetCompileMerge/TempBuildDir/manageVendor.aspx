<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze.Master" AutoEventWireup="true" CodeBehind="manageVendor.aspx.cs" Inherits="saveasze.manageVendor" %>

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
                        <h3>Vendors Transaction Logs </h3>
                    </div>
                    <div class="row">
                        <div class="col-md-10 col-sm-10 col-xs-14">
                            <div class="accordion-box accordion-style-two">
                                <!--Start single accordion box-->
                                <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                                    <div  class="acc-btn active">
                                        <p class="title">Vendors Listings(Quick View)</p>
                                        <div class="toggle-icon">
                                            <span class="plus fa fa-arrow-circle-o-right"></span><span class="minus fa fa-arrow-circle-o-right"></span>
                                        </div>
                                    </div>
                                    <div class="acc-content">
                                        <div class="text">
                                        <!-- Start Vendors Grid-->
                                            
                            <div class="text">
                                Add New Vendor<telerik:RadGrid ID="RadGrid1" runat="server" CellSpacing="-1" DataSourceID="dtsVendorGrid" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <MasterTableView AutoGenerateColumns="False" DataSourceID="dtsVendorGrid">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="registration_number" FilterControlAltText="Filter registration_number column" HeaderText="registration_number" SortExpression="registration_number" UniqueName="registration_number">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="vendors_name" FilterControlAltText="Filter vendors_name column" HeaderText="vendors_name" SortExpression="vendors_name" UniqueName="vendors_name">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="contact_phone" FilterControlAltText="Filter contact_phone column" HeaderText="contact_phone" SortExpression="contact_phone" UniqueName="contact_phone">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="contact_email" FilterControlAltText="Filter contact_email column" HeaderText="contact_email" SortExpression="contact_email" UniqueName="contact_email">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="location" FilterControlAltText="Filter location column" HeaderText="location" SortExpression="location" UniqueName="location">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="createdDate" DataType="System.DateTime" FilterControlAltText="Filter createdDate column" HeaderText="createdDate" SortExpression="createdDate" UniqueName="createdDate">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="districtID" DataType="System.Int32" FilterControlAltText="Filter districtID column" HeaderText="districtID" SortExpression="districtID" UniqueName="districtID">
                                            </telerik:GridBoundColumn>
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



                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-10 col-sm-10 col-xs-14">
                            <div class="accordion-box accordion-style-two">
                                <!--Start single accordion box-->
                                <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                                    <div  class="acc-btn active">
                                        <p class="title">Vendors Last Transaction(Quick View)</p>
                                        <div class="toggle-icon">
                                            <span class="plus fa fa-arrow-circle-o-right"></span><span class="minus fa fa-arrow-circle-o-right"></span>
                                        </div>
                                    </div>
                                    <div class="acc-content">
                                        <div class="text">
                                        <!-- Start Vendors Grid-->
                                            
                            <div class="text">
                                Transaction Listings<telerik:RadGrid ID="RadGrid2" runat="server" CellSpacing="-1" DataSourceID="SqlDataSource2" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                    <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="registration_number" FilterControlAltText="Filter registration_number column" HeaderText="registration_number" SortExpression="registration_number" UniqueName="registration_number">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="vendors_name" FilterControlAltText="Filter vendors_name column" HeaderText="vendors_name" SortExpression="vendors_name" UniqueName="vendors_name">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="contact_phone" FilterControlAltText="Filter contact_phone column" HeaderText="contact_phone" SortExpression="contact_phone" UniqueName="contact_phone">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="contact_email" FilterControlAltText="Filter contact_email column" HeaderText="contact_email" SortExpression="contact_email" UniqueName="contact_email">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="location" FilterControlAltText="Filter location column" HeaderText="location" SortExpression="location" UniqueName="location">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="createdDate" DataType="System.DateTime" FilterControlAltText="Filter createdDate column" HeaderText="createdDate" SortExpression="createdDate" UniqueName="createdDate">
                                            </telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="districtID" DataType="System.Int32" FilterControlAltText="Filter districtID column" HeaderText="districtID" SortExpression="districtID" UniqueName="districtID">
                                            </telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                </telerik:RadGrid>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:saveaseSqlLocal %>" SelectCommand="SELECT [registration_number], [vendors_name], [contact_phone], [contact_email], [location], [createdDate], [districtID] FROM [vendor]"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:saveaseSqlLocal %>" SelectCommand="SELECT [registration_number], [vendors_name], [contact_phone], [contact_email], [location], [createdDate], [districtID] FROM [vendor]"></asp:SqlDataSource>
                                <p>
                                </p>
                            </div>
                            <ul class="benifit-list">
                                <li>View Detailed Transactions</li>
                            </ul>
                                        <!-- End Vendors Grid--></div>
                                    </div>
                                </div>



                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-10 col-sm-10 col-xs-14">
                            <div class="accordion-box accordion-style-two">
                                <!--Start single accordion box-->
                                <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                                    <div  class="acc-btn active">
                                        <p class="title">Sell to Vendors</p>
                                        <div class="toggle-icon">
                                            <span class="plus fa fa-arrow-circle-o-right"></span><span class="minus fa fa-arrow-circle-o-right"></span>
                                        </div>
                                    </div>
                                    <div class="acc-content">
                                        <div class="text">
                                        <!-- Start Vendors Grid-->
                                            
                            <div class="text">
                                Transaction Listings
                               <table width="100%">
                                   <tr>
                                       <td colspan="3" style="text-align:center"><asp:Label ID="lbltitle" Width="100%" runat="server" Text=" Unit Sell to a registered Customer"></asp:Label></td>
                                   </tr>
                                   <tr>
                                       <td><asp:Label ID="lblAmt" runat="server" Text="Amount"></asp:Label></td>
                                       <td><asp:Label ID="Label1" runat="server" Text="Customer"></asp:Label></td> 
                                       <td></td>
                                   </tr>
                                   <tr>
                                       <td>
                                        <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
                                       </td>
                                       <td><asp:TextBox ID="txtCustomer" runat="server"></asp:TextBox></td>
                                       <td><asp:Button runat="server" ID="genPin1" Text="Get Savease PIN" OnClick="genPin1_Click" /></td>
                                   </tr>
                                   <tr id="pinRow1" runat="server" visible="false">
                                       <td colspan="2"><asp:Label ID="lblgenPin1" runat="server"></asp:Label></td>
                                       <td><asp:Button runat="server" ID="btnSell1" Text="Sell to Customer" /></td>
                                   </tr>
                               </table>
                            </div>
                            <ul class="benifit-list">
                                <li>View Detailed Transactions</li>
                            </ul>
                                        <!-- End Vendors Grid--></div>
                                    </div>
                                </div>



                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
</asp:Content>
