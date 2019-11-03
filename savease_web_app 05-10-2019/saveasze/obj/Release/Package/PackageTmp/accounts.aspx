<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter.Master" AutoEventWireup="true" CodeBehind="accounts.aspx.cs" Inherits="saveasze.accounts" %>
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
                        <h3>Transaction Logs </h3>
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

                </div>
            </div>
        </div>
    </div>
</section>
</asp:Content>
