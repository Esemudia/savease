<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze.Master" AutoEventWireup="true" CodeBehind="adm_userGrid.aspx.cs" Inherits="saveasze.adm_userGrid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="service-single sec-padd">
    <div class="container">
        <div class="row">     
            <div class="col-md-3">
            
                <div class="service-sidebar">
                    <ul class="service-catergory">
                        <%leftNavigation(); %>
                        <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2">
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                        <li>
                            <br />
                            <asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSource3" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                    <asp:BoundField DataField="salutation" HeaderText="salutation" SortExpression="salutation" />
                                    <asp:BoundField DataField="fName" HeaderText="fName" SortExpression="fName" />
                                    <asp:BoundField DataField="mName" HeaderText="mName" SortExpression="mName" />
                                    <asp:BoundField DataField="lName" HeaderText="lName" SortExpression="lName" />
                                    <asp:BoundField DataField="dName" HeaderText="dName" SortExpression="dName" />
                                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                    <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                                    <asp:BoundField DataField="role_group_id" HeaderText="role_group_id" SortExpression="role_group_id" />
                                    <asp:BoundField DataField="createdDate" HeaderText="createdDate" SortExpression="createdDate" />
                                    <asp:BoundField DataField="createdBy" HeaderText="createdBy" SortExpression="createdBy" />
                                    <asp:BoundField DataField="userlevel" HeaderText="userlevel" SortExpression="userlevel" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SQLsaveaseConnectionString %>" SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
                        </li>
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
                            <a href="contactus.aspx" class="default_link">User Management<i class="fa fa-angle-right"></i></a>
                        </div>
                        <i class="icon icon-multimedia-1"></i>
                    </div>

                </div>
            </div>
            <div class="col-md-9">
                <div class="outer-box">
                    <div class="text">
                        
                        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:saveaseConnectionString %>" ProviderName="<%$ ConnectionStrings:saveaseConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [contents]"></asp:SqlDataSource>
                        
                    </div>
                    <div class="section-title">
                        <h3>Key Benefits of the Service</h3>
                    </div>
                    <div class="row">
                        <div class="col-md-7 col-sm-7 col-xs-12">
                            <div class="text">
                                <p>Beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire trouble.</p><br>
                            </div>
                            <ul class="benifit-list">
                                <li><i class="fa fa-angle-right"></i>Develop new ideas and market them</li>
                                <li><i class="fa fa-angle-right"></i>Build leadership and management skills</li>
                                <li><i class="fa fa-angle-right"></i>Improve manufacturing processes</li>
                                <li><i class="fa fa-angle-right"></i>Build a business strategy and plan</li>
                            </ul>
                        </div>
                        <div class="col-md-5 col-sm-5 col-xs-12">
                            <div class="img-box"><a href="#"><img src="images/service/8.jpg" alt=""></a></div>
                        </div>
                    </div><br><br>
                    <div class="section-title">
                        <h3>Performance System </h3>
                    </div>
                    <div class="row">
                        <div class="col-md-7 col-sm-7 col-xs-12">
                            <div class="accordion-box accordion-style-two">
                                <!--Start single accordion box-->
                                <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                                    <div class="acc-btn">
                                        <p class="title">Customer Insights</p>
                                        <div class="toggle-icon">
                                            <span class="plus fa fa-arrow-circle-o-right"></span><span class="minus fa fa-arrow-circle-o-right"></span>
                                        </div>
                                    </div>
                                    <div class="acc-content">
                                        <div class="text"><p>
                                            Employers across all industry sectors to ensure that their internal sed HR systems processes align to their business requirements idea of denouncing pleasure and praising pain expound. 
                                        </p></div>
                                    </div>
                                </div>
                                <!--Start single accordion box-->
                                <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                                    <div class="acc-btn active">
                                        <p class="title">Customer Experience</p>
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
