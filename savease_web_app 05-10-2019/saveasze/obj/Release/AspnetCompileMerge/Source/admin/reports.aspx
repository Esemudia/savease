<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adm.Master" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="saveasze.admin.reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular.min.js"></script>
    
        <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
        </telerik:RadScriptManager>

    <div class="container" style="max-width:900px;">
					<div class="side-app">
						<div class="page-header">
							<h4 class="page-title">Reports</h4>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Detailed</a></li>
								<li class="breadcrumb-item active" aria-current="page">Reports</li>
							</ol>
						</div>
						<div class="row">
							<div class="col-12">
                            <br /><br />
                            <br /><br />
								<div class="card">
									<div class="card-status bg-yellow br-tr-3 br-tl-3"></div>
									<div class="card-header">
										<h3 class="card-title">Reports </h3>
									</div>
									<div class="card-body">
										<div class="panel panel-default">
											<div class="panel-body p-0">
                                                    <div class="col-sm-6 col-md-4">
												    <div class="form-group">
                                                        <table>
                                                            <tr>   <td style="text-align:right">
                                                                <asp:Label CssClass="form-label" Text="Filter By:" Width="80" runat="server" ></asp:Label>
                                                                </td>
                                                              <td style="text-align:left">
        <telerik:RadDropDownList ID="drpReportType" runat="server" SelectedText="Deposit" SelectedValue="Dep">
            <Items>
                <telerik:DropDownListItem runat="server" Selected="True" Text="Deposit" Value="Dep" />
                <telerik:DropDownListItem runat="server" Text="Purchased Voucher" Value="PV" />
                <telerik:DropDownListItem runat="server" Text="Transfer" Value="TR" />
                <telerik:DropDownListItem runat="server" Text="Fund Account" Value="FA" />
                <telerik:DropDownListItem runat="server" Text="Complain" Value="CP" />
            </Items>
        </telerik:RadDropDownList></td>
                                                                   <td style="text-align:right">
                                                                <label class="form-label">From:</label>
                                                                </td>
                                                                   <td style="text-align:left">
<telerik:RadDatePicker ID="dtFrom" Runat="server">
                                                         </telerik:RadDatePicker>
                                                                   </td>
                                                                   <td style="text-align:right">
                                                                <label class="form-label">To:</label>
                                                                </td>
                                                                   <td style="text-align:left">
<telerik:RadDatePicker ID="dtTo" Runat="server">
                                                         </telerik:RadDatePicker>
                                                                       </td>
                                                                   <td style="text-align:right">
<asp:button ID="BtnDaily" Text="Generate" runat="server" class="btn btn-primary" OnClick="GenerateReport"/>
                                                                   </td>
                                                            </tr>
                                                        </table>
														</div>
											</div>
												
                                                	
											</div>
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
</asp:Content>
