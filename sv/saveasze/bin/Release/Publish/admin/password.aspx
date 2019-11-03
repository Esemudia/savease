<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adm.Master" AutoEventWireup="true" CodeBehind="password.aspx.cs" Inherits="saveasze.admin.password" %>
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

<div class="container" style="max-width:900px;">
					<div class="side-app">
						<div class="page-header">
							<h4 class="page-title">Change Password</h4>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Forms</a></li>
								<li class="breadcrumb-item active" aria-current="page"></li>
							</ol>
						</div>
                        <br />     <br />     <br />     <br />
						
						<div class="row" id="gridFrm" runat="server" visible="false">
								<div class="card" runat="server" visible="false">
									<div class="card-header">
										<h3 class="card-title"><asp:Label ID="lblGridHeader" runat="server" Text="Label"></asp:Label> List</h3>
									</div>
									<div class="card-body">
										<div class="row">
                                        <%-- Start Users Repeater --%>
              <div class="table-responsive mailbox-messages">
          
            <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowPaging="True"  Visible="false" DataSourceID="usrDTS" Height="455px" PageSize="15" BorderColor="#212435">
<GroupingSettings CollapseAllTooltip="Collapse all groups"  ></GroupingSettings>
                <ClientSettings>
                    <Selecting AllowRowSelect="True" />
                    <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                </ClientSettings>
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="usrDTS" >
                    <Columns>
                        <telerik:GridBoundColumn DataField="SN" DataType="System.Int64" FilterControlAltText="Filter SN column" HeaderText="S/N" ReadOnly="True" SortExpression="SN" UniqueName="SN" AllowFiltering="false" HeaderStyle-Width="50" ItemStyle-Width="50">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="saveaseID" FilterControlAltText="Filter saveaseID column" HeaderText="Savease ID" SortExpression="saveaseID" UniqueName="saveaseID" HeaderStyle-Width="100" ItemStyle-Width="100">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="id" DataType="System.Int32" FilterControlAltText="Filter id column" HeaderText="id" ReadOnly="True" SortExpression="id" UniqueName="id" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="username" FilterControlAltText="Filter username column" HeaderText="User Name" SortExpression="username" UniqueName="username">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="dname" FilterControlAltText="Filter dname column" HeaderText="Full Name" SortExpression="dname" UniqueName="dname">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="email" FilterControlAltText="Filter email column" HeaderText="Email #" SortExpression="email" UniqueName="email">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="phone" FilterControlAltText="Filter phone column" HeaderText="Phone #" SortExpression="phone" UniqueName="phone" HeaderStyle-Width="100" ItemStyle-Width="100">
                        </telerik:GridBoundColumn>
                        <telerik:GridHyperLinkColumn AllowSorting="False" Text="Transaction" UniqueName="column1" AllowFiltering="false" HeaderStyle-Width="100" ItemStyle-Width="100">
                        </telerik:GridHyperLinkColumn>
                        <telerik:GridHyperLinkColumn AllowSorting="False" Text="Modify User" UniqueName="column" AllowFiltering="false" HeaderStyle-Width="100" ItemStyle-Width="100"
                            DataNavigateUrlFields="id,userlevel" DataNavigateUrlFormatString="users.aspx?utype={1}&i00={0}">
                        </telerik:GridHyperLinkColumn>
                        <telerik:GridBoundColumn DataField="userlevel" FilterControlAltText="Filter email column" HeaderText="userlevel #" SortExpression="userlevel"
                            UniqueName="userlevel" Display="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
            <asp:SqlDataSource ID="usrDTS" runat="server" ConnectionString="<%$ ConnectionStrings:saveaseSqlLocal %>" SelectCommand="getAllUserAdm" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="" Name="in_userlevel" QueryStringField="utype" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
                <!-- /.table -->
              </div>
                                        <%-- End Users Repeater --%>
									</div>
								</div>

								</div>
							</div>
						<div class="row" id="editFrm" runat="server" visible="false">
							<div class="col-lg-8">
								<div class="card">
									<div class="card-header">
										<h3 class="card-title">Edit Profile</h3>
									</div>
									<div class="card-body">
										<div class="row">
                                            <asp:HiddenField runat="server" ID="lblID"/>
											 <div class="col-md-12">
												<div class="form-group">
													<label class="form-label">Balance</label>
													<asp:label runat="server" id="lblBalance"  class="form-control"></asp:label>
												</div>
											</div>
                                             <div class="col-md-12">
												<div class="form-group">
													<label class="form-label">Savease ID</label>
														<asp:label runat="server" id="lblSaveaseid"  class="form-control"></asp:label>
												</div>
											</div>
											<div class="col-sm-6 col-md-3">
												<div class="form-group">
													<label class="form-label">Username</label>
													<input type="text" runat="server" id="txtuname" class="form-control" placeholder="Username" >
												</div>
											</div>
											<div class="col-sm-6 col-md-4">
												<div class="form-group">
													<label class="form-label">Email address</label>
													<input type="email" runat="server" id="txtemail" class="form-control" placeholder="Email">
												</div>
											</div>
											<div class="col-sm-6 col-md-6">
												<div class="form-group">
													<label class="form-label">First Name</label>
													<input type="text" runat="server" id="txtFname" class="form-control" placeholder="FirstName">
												</div>
											</div>
											<div class="col-sm-6 col-md-6">
												<div class="form-group">
													<label class="form-label">Last Name</label>
													<input type="text" runat="server" id="txtLname"  class="form-control" placeholder="Last Name">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="form-label">Address</label>
													<input type="text" runat="server" id="txtAddress"  class="form-control" placeholder="Home Address" >
												</div>
											</div>
                                            <div class="col-md-12">
												<div class="form-group">
													<label class="form-label">Phone</label>
													<input type="text" runat="server" id="txtPhone"  class="form-control" placeholder="Phone" >
												</div>
											</div>
										</div>
									</div>
                                        
									<div class="card-footer text-right">
                                        <asp:Button text="Update Profile" CssClass="btn btn-primary" runat="server" ID="btnupdate" OnClick="btupdate"/>
									</div>
								</div>
							</div>
						</div>

                        <div class="row" id="passupdate" runat="server" visible="true">
							<div class="col-lg-8">
								<div class="card">
									<div class="card-header">
										<h3 class="card-title">Password Update</h3>
									</div>
									<div class="card-body">
										<div class="row">
                                            <asp:Label runat="server" ID="lblmess"></asp:Label>
                                            <div class="col-md-12">
												<div class="form-group">
													<label class="form-label">New Password</label>
													<input type="password" runat="server" id="txtnewpass"  class="form-control" placeholder="New Password" >
												</div>
											</div>
                                            <div class="col-md-12">
												<div class="form-group">
													<label class="form-label">Confirm New Password</label>
													<input type="password" runat="server" id="txtconnewpass"  class="form-control" placeholder="Confirm New Password" >
												</div>
											</div>
										</div>
									</div>
                                        
									<div class="card-footer text-right">
                                        <asp:Button text="Update password" CssClass="btn btn-primary" runat="server" ID="btnpass" OnClick="btpassupdate"/>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
</asp:Content>
