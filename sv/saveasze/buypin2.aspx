<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter.Master" AutoEventWireup="true" CodeBehind="buypin2.aspx.cs" Inherits="saveasze.buypin2" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   
    <section class="service-single sec-padd">
    <div class="container">
        <div class="row">     
            <div class="col-md-9">
                <div class="outer-box">
                    <div class="section-title">
                       <h3>Account Summary</h3>
                    </div>
                    
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <panel><p></p><p></p><br /><br /><br />
                   <table>
                       <tr>
                           <td>

                           </td>
                       </tr>
                        <tr>
                            <td style="text-align:right"><asp:Label ID="lblCardType" Text="Card Type:" runat="server" Width="100px"></asp:Label></td>
                            <td style="text-align:left">
<telerik:RadDropDownList ID="drpCardType" runat="server" SelectedText="N50.00" SelectedValue="50" AutoPostBack="True" OnSelectedIndexChanged="drpCardType_SelectedIndexChanged">
                                    <Items>
                                        <telerik:DropDownListItem runat="server" Selected="True" Text="N50.00" ToolTip="Fifty Naira Voucher" Value="50" />
                                        <telerik:DropDownListItem runat="server" Text="N100.00" ToolTip="One Hundred Naira Voucher" Value="100" />
                                        <telerik:DropDownListItem runat="server" Text="N200.00" ToolTip="Two Hundred Naira Voucher" Value="200" />
                                        <telerik:DropDownListItem runat="server" Text="N500.00" ToolTip="Five  Hundred Naira Voucher" Value="500" />
                                        <telerik:DropDownListItem runat="server" Text="N1000.00" ToolTip="One Thousand Naira Voucher" Value="1000" />
                                        <telerik:DropDownListItem runat="server" Text="N2000.00" ToolTip="Two Thousand Naira Voucher" Value="2000" />
                                        <telerik:DropDownListItem runat="server" Text="N5000.00" ToolTip="Five Thousand Naira Voucher" Value="5000" />
                                    </Items>
                                </telerik:RadDropDownList>
                               </td> 
                            <td style="text-align:center">&nbsp;&nbsp;&nbsp;
<telerik:RadNumericTextBox runat="server" ID="txtQtys" OnTextChanged="txtQtys_TextChanged" Width="50px" Value="1"></telerik:RadNumericTextBox>                         
</td> <td style="text-align:center">
<asp:ImageButton runat="server" ImageUrl="~/images/shop/add2cart.png" OnClick="btnAdd_Click" ID="btnAdd" />
                               </td>
                            <td style="text-align:right"><asp:Label ID="lblQTY" Text="Amount:"  runat="server" Width="100px"></asp:Label>
                                </td>
                            <td style="text-align:center">
<asp:Label ID="rstLineAmount" Text="N0.00"  runat="server" Width="100px"></asp:Label><asp:HiddenField ID="hidRst" runat="server" Value="0" />
                                </td>
                           
                        </tr>
                    </table> 

                    </panel>
                    <div class="row bottom">
                        <div class="sec-title-two">
                        <h3><p></p><p></p>Puchase Details<h3></h3>
                            </h3>
                    </div>
                    
            <div class="col-lg-6 col-md-6">
                <div class="cart-total">
                   
                    <ul class="cart-total-table">

                        <li class="clearfix" style="display:none">
                            <span class="col col-title"><asp:Label ID="lblBalance" Text="Current Savease Balance" runat="server" Width="300px"></asp:Label></span>
                          </li>
                          <li class="clearfix">
                               <span class="col col-title"><asp:Label ID="Label1" Text="Sub Total" runat="server" Width="300px"></asp:Label></span>
                          <span class="col"><asp:Label ID="rstSubTotal" Text="N0.00" runat="server" Width="300px"></asp:Label></span>    
                   
                        </li>
                        <li class="clearfix">
                               <span class="col col-title"><asp:Label ID="Label2" Text="Order Total" runat="server" Width="300px"></asp:Label></span>
                          <span class="col"><asp:Label ID="rstTotal" Text="N0.00" runat="server" Width="300px"></asp:Label></span>    
                    </li>      
                    </ul>
                    <div class="payment-options">

                        <div class="option-block">
                            <div class="radio-block">
                                <div class="checkbox">
                                    <label>
                                        <asp:CheckBox ID="chkAgree" runat="server" AutoPostBack="true" OnCheckedChanged="chkAgree_CheckedChanged"/>
                                        <span>Agree to <b>Terms & Conditions</b></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="placeorder-button text-left">
                            <asp:Button ID="btnSubmit" runat="server" Text="Place Order"  class="thm-btn"  OnClick="btnOrder_click" />
                        </div>   

                    </div> 
                    <asp:Label ID="lblDispError" Text="" runat="server"></asp:Label>
                    <asp:GridView ID="GridView1" Font-Names="Arial" Font-Size="0.75em" ForeColor="#333" runat="server" Width="100%" GridLines="Both" CellPadding="4" Height="200px" Visible="true">
                <HeaderStyle BackColor="#EDEDED" Height="26px" />
                
            </asp:GridView>
                </div>    
            </div>
        </div>
                   </ContentTemplate>
            </asp:UpdatePanel>

                </div>
            </div>
        </div>
    </div>
</section>
</asp:Content>
