<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adm.Master" AutoEventWireup="true" CodeBehind="transactions.aspx.cs" Inherits="saveasze.admin.transactions" %>
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
							<h4 class="page-title"> <asp:Label ID="lblUserType" runat="server" Text="Label"></asp:Label>  Details</h4>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Forms</a></li>
								<li class="breadcrumb-item active" aria-current="page"></li>
							</ol>
						</div>

						
						<div class="row" id="gridFrm" runat="server" visible="true">
								<div class="card">
									<div class="card-header">
										<h3 class="card-title"><asp:Label ID="lblGridHeader" runat="server" Text="Label"></asp:Label> List</h3>
									</div>
									<div class="card-body">
										<div class="row">
                                        <%-- Start Users Repeater --%>
                                            
              <div class="table-responsive mailbox-messages">
          

            <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" DataSourceID="dtsTrans" PageSize="15" Height="455px" ShowFooter="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups" RetainGroupFootersVisibility="True"></GroupingSettings>
                <ExportSettings ExportOnlyData="True" OpenInNewWindow="True">
                </ExportSettings>
                <ClientSettings>
                    <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                </ClientSettings>
                <MasterTableView AutoGenerateColumns="False" DataSourceID="dtsTrans" ShowFooter="False">
                    <Columns>
                        <telerik:GridBoundColumn DataField="SN" DataType="System.Int64" AllowFiltering="false" FilterControlAltText="Filter SN column" HeaderText="S/N" ReadOnly="True" SortExpression="SN" UniqueName="SN">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TransactionDate" DataType="System.DateTime" FilterControlAltText="Filter TransactionDate column" HeaderText="Transaction Date" SortExpression="TransactionDate" UniqueName="TransactionDate">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TransactionType" FilterControlAltText="Filter TransactionType column" HeaderText="Transaction Type" SortExpression="TransactionType" UniqueName="TransactionType">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SenderName" FilterControlAltText="Filter SenderName column" HeaderText="Name" SortExpression="SenderName" UniqueName="SenderName">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="RefNumber" FilterControlAltText="Filter RefNumber column" HeaderText="Transaction Code" SortExpression="RefNumber" UniqueName="RefNumber">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="AccountNo" FilterControlAltText="Filter AccountNo column" HeaderText="Account No" SortExpression="AccountNo" UniqueName="AccountNo">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="credit" DataType="System.Double" FilterControlAltText="Filter credit column" HeaderText="Credit" SortExpression="credit" UniqueName="credit" Aggregate="Sum" FooterText="Total Credit">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="debit" DataType="System.Double" FilterControlAltText="Filter debit column" HeaderText="Debit" SortExpression="debit" UniqueName="debit" Aggregate="Sum" FooterText="Total Debit">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="userlevel" DataType="System.Int32" Display="False" FilterControlAltText="Filter userlevel column" HeaderText="userlevel" ReadOnly="True" SortExpression="userlevel" UniqueName="userlevel">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
            <asp:SqlDataSource ID="dtsTrans" runat="server" ConnectionString="<%$ ConnectionStrings:saveaseSqlLocal %>" SelectCommand="getTransactionDetailsAdmn" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter Name="in_userlevel" QueryStringField="utype" Type="String" />
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
											
											<div class="col-sm-6 col-md-3">
												<div class="form-group">
													<label class="form-label">Username</label>
													<input type="text" class="form-control" placeholder="Username" >
												</div>
											</div>
											<div class="col-sm-6 col-md-4">
												<div class="form-group">
													<label class="form-label">Email address</label>
													<input type="email" class="form-control" placeholder="Email">
												</div>
											</div>
											<div class="col-sm-6 col-md-6">
												<div class="form-group">
													<label class="form-label">First Name</label>
													<input type="text" class="form-control" placeholder="Company">
												</div>
											</div>
											<div class="col-sm-6 col-md-6">
												<div class="form-group">
													<label class="form-label">Last Name</label>
													<input type="text" class="form-control" placeholder="Last Name">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="form-label">Address</label>
													<input type="text" class="form-control" placeholder="Home Address" >
												</div>
											</div>
                                            <div class="col-md-12">
												<div class="form-group">
													<label class="form-label">Phone</label>
													<input type="text" class="form-control" placeholder="Phone" >
												</div>
											</div>
										</div>
									</div>
                                        
									<div class="card-footer text-right">
										<button type="submit" class="btn btn-primary">Update Profile</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
</asp:Content>
