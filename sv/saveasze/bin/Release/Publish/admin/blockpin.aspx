<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adm.Master" AutoEventWireup="true" CodeBehind="blockpin.aspx.cs" Inherits="saveasze.admin.blockpin" %>
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
            background-color:#131d33;
            background-position:88px;
            background-repeat:no-repeat;
            text-indent: 0.01px;/*In Firefox*/
            text-overflow: '';/*In Firefox*/
        }
    </style>


    <div class="card-body p-6" style="width:900px;margin-left:auto;margin-right:auto;"><br /><br />
        <table align="center" width="100%">
            <tr>
                <td colspan="2" style="text-align:center">  <div class="section-title">
                        <h4>Block PIn Information</h4>
                    </div><br /></td>
            </tr>
            <tr>
                <td style="vertical-align: top" width="30%">
									
                                    <div class="form-group">
										<label class="form-label">Block PIN By</label>
                                         <telerik:RadDropDownList ID="txtby"  CssClass="ddl" runat="server" SelectedText="Savease Account" SelectedValue="1"  Width="200px">
                                                        <Items>
                                                            <telerik:DropDownListItem CssClass="drop" runat="server" Selected="True" Value="0" Text="Select Block Pattern"  />
                                                            <telerik:DropDownListItem CssClass="drop" runat="server" Text="By Pin" Value="cn" />
                                                            <telerik:DropDownListItem CssClass="drop" runat="server" Text="By Batch" Value="bn" />
                                                            <telerik:DropDownListItem CssClass="drop" runat="server" Text="By Serial" Value="sn" />
                                                        </Items>
                                                    </telerik:RadDropDownList><br />

									</div>
									<div class="form-group">
										<asp:Label runat="server"></asp:Label>
                                        <telerik:RadNumericTextBox ID="txtpin" runat="server" Width="200px"  CssClass="ddl" BorderColor="#212435" BorderStyle="Solid" MaxValue="70368744177664000">
<NegativeStyle Resize="None"></NegativeStyle>

<NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>

<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
                                </telerik:RadNumericTextBox>
										
									</div>
									<div class="form-group">
										<asp:Label ID="lblmes" runat="server"></asp:Label>
									</div>
									
									<div class="form-footer">
										
                                        <asp:Button class="btn btn-primary btn-block" Width="200px" runat="server" Text="Block" ID="btnblck" OnClick="btnblck_Click" />
									</div>

                </td>
                <td style="vertical-align: top" width="70%">
									  <div class="col-md-9">
                <div class="outer-box">
                        <h4>BlockPin Request</h4>
                    <div class="row">
                        <div class="col-md-10 col-sm-10 col-xs-14">
                            <div class="accordion-box accordion-style-two">
                                <div class="accordion animated out" data-delay="0" data-animation="fadeInUp">
                                  <%--  <div class="acc-btn">
                                        <p class="title">BlockPin Request</p>
                                        <div class="toggle-icon">
                                            <i class="plus fa fa-arrow-circle-o-right"></i><i class="minus fa fa-arrow-circle-o-right"></i>
                                        </div>
                                    </div>--%>
                                    <div class="acc-content">
                                              <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" runat="server" CssClass="RadGrid_ModernBrowsers"
        AllowPaging="True" PageSize="10" AllowSorting="True" font-family="Arial,Helvetica,sans-serif" Font-Size="12px" EnableEmbeddedSkins="false">
        <PagerStyle Mode="Slider"></PagerStyle>
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

                </td>
            </tr>
        </table>
            
								</div>
</asp:Content>
