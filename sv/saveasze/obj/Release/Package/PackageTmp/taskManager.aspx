<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter.Master" AutoEventWireup="true" CodeBehind="taskManager.aspx.cs" Inherits="saveasze.taskManager" %>
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
<section class="service-single task-padd">
    <div class="container">
        <div class="row">     
            <div class="col-md-3">
            
                <div class="service-sidebar">
                    <ul class="brochures-list" style="display:none">
                        <%leftNavigation(); %>
                    </ul>

                    <div class="sidebar_tasks">
                        <div class="theme_inner_title">
                            <h4>Quick Task</h4>
                        </div>
                        <ul class="list">
                            <li><a href="#">Instant Deposit</a></li>
                            <li><a href="#">Become a Vendor</a></li>
                            <li><a href="#">Request Savease Card</a></li>
                            <li><a href="#">Corporate Interior</a></li>
                        </ul>
                    </div> 

                </div>
            </div>
            <div class="col-md-9 col-sm-12 col-xs-12"><br /><br />
                <div class="row">
                    <div class="col-md-4 col-sm-6 col-xs-12 hover-effect">
                        <div class="single-shop-item">
                            <div class="img-box">
                                <img src="images/resource/Account_summary1.png" alt="Account Summary">
                                <div class="default-overlay-outer">
                                    <div class="inner">
                                        <div class="content-layer">Account Summary
                                            <a href="accountsummary.aspx" class=" tool_tip" title="Account Summary"><i class=" icon-business-1"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.img-box -->
                            <div class="content-box">
                                <h4 style="text-align:center"><a href="accountsummary.aspx"> Account Informations</a></h4>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-12 hover-effect">
                        <div class="single-shop-item" >
                            <div class="img-box">
                                <img src="images/resource/fundtransfer1.png" alt="Fund Transfer">
                                <div class="default-overlay-outer">
                                    <div class="inner">
                                        <div class="content-layer">Transfer Informations
                                            <a href="fundtransfer.aspx" class=" tool_tip" title="Fund Transfer"><i class=" icon-commerce"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.img-box -->
                            <div class="content-box">
                                <h4 style="text-align:center"><a href="shop-single.html"> Fund Transfer Informations</a></h4>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-12 hover-effect">
                        <div class="single-shop-item">
                            <div class="img-box">
                                <img src="images/resource/profile.png" alt="My Profile">
                                <div class="default-overlay-outer">
                                    <div class="inner">
                                        <div class="content-layer">Profile Information
                                            <a href="profile.aspx" class=" tool_tip" title="My Profile"><i class=" icon-people"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.img-box -->
                            <div class="content-box">
                                <h4 style="text-align:center"><a href="profile.aspx"> Profile Informations</a></h4>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-12 hover-effect">
                        <div class="single-shop-item">
                            <div class="img-box">
                                <img src="images/resource/customer.png" alt="Customer Information">
                                <div class="default-overlay-outer">
                                    <div class="inner">
                                        <div class="content-layer">Customer Information
                                            <a href="customer.aspx" class=" tool_tip" title="Customer Information"><i class=" icon-people"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.img-box -->
                            <div class="content-box">
                                <h4 style="text-align:center"><a href="customer.aspx"> Customer Information</a></h4>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-12 hover-effect">
                        <div class="single-shop-item">
                            <div class="img-box">
                                <img src="images/resource/bonus.png" alt="Bonus Information">
                                <div class="default-overlay-outer">
                                    <div class="inner">
                                        <div class="content-layer">Bonus Information
                                            <a href="bonus.aspx" class=" tool_tip" title="Bonus Information"><i class=" icon-commerce"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.img-box -->
                            <div class="content-box">
                                <h4 style="text-align:center"><a href="bonus.aspx"> Bonus information</a></h4>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-12 hover-effect">
                        <div class="single-shop-item">
                            <div class="img-box">
                                <img src="images/resource/selfservice.png" alt="Self Service">
                                <div class="default-overlay-outer">
                                    <div class="inner">
                                        <div class="content-layer">Self Service
                                            <a href="self.aspx" class=" tool_tip" title="Self Service"><i class=" icon-people"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.img-box -->
                            <div class="content-box">
                                <h4 style="text-align:center"><a href="selfservice.aspx"> Self Service</a></h4>
                            </div>
                        </div>

                    </div>
                <div class="border-bottom"></div>
            </div> 
        </div>
    </div>
</section>
</asp:Content>
