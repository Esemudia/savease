<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="saveasze.profile" %>
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
        .user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 0px solid rgb(221, 221, 221);
    max-width:100%;
}
.table-user-information > tbody > tr > td{
    width:0px!important;
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


        .auto-style1 {
            width: 296px;
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
                <div class="outer-box">
                <div class="row">
                    <asp:UpdatePanel ID="updatepnl" runat="server">
<ContentTemplate>
   
                    
                        
                    

                        <div class="col-md-10 col-sm-10 col-xs-14">
                            <div class="accordion-box accordion-style-two">
                            <%-- <table>
                                 
                                  <tr>
                                    <td><telerik:RadLabel runat="server">Username:</telerik:RadLabel></td>
                                    <td><telerik:RadLabel runat="server"  ID="lblUname"></telerik:RadLabel></td>
                                 </tr>
                                 <tr>
                                    <td><telerik:RadLabel runat="server">Full Name:</telerik:RadLabel></td>
                                    <td><telerik:RadLabel runat="server"  ID="lblFullName"></telerik:RadLabel></td>
                                 </tr>
                                 <tr>
                                    <td><telerik:RadLabel runat="server">Account No:</telerik:RadLabel></td>
                                    <td><telerik:RadLabel runat="server"  ID="lblAcctNo"></telerik:RadLabel></td>
                                 </tr>
                                 <tr>
                                    <td><telerik:RadLabel runat="server">Email:</telerik:RadLabel></td>
                                    <td><telerik:RadLabel runat="server"  ID="lblEmail"></telerik:RadLabel></td>
                                 </tr>
                                 <tr>
                                    <td><telerik:RadLabel runat="server">Phone Number:</telerik:RadLabel></td>
                                    <td><telerik:RadLabel runat="server"  ID="lblPhone"></telerik:RadLabel></td>
                                 </tr>
                                  <tr>
                                    <td><telerik:RadRadioButtonList runat="server" ID="ctl40" Direction="Horizontal" SelectedIndex="0" SelectedValue="M" Width="173px">
                                        <Items>
                                            <telerik:ButtonListItem Selected="True" Text="Male" Value="M" />
                                            <telerik:ButtonListItem Text="Female" Value="F" />
                                        </Items>
                                        </telerik:RadRadioButtonList></td>
                                 </tr>
                                  
                                 <tr><td>
                                            <telerik:RadButton ID="btnUpdate" runat="server" Text="Update profile" OnClick="btnUpdate_Click"></telerik:RadButton>
                                 </tr>
                             </table>--%>
                                 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
   
   
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title"><telerik:RadLabel runat="server"  ID="lblFullName" Font-Bold="True" ForeColor="#FA9928"></telerik:RadLabel></h3>
            </div>
            <div class="panel-body">
              <div class="row" style="width:100%;">
                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="images/man.png" class="img-circle img-responsive"><asp:Button  runat="server" Text="Upload" /> </div>
                
               
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                    </tbody>
                      <caption>
                          <br />
                          <tr>
                              <td class="auto-style1">Username:
                                  <telerik:RadLabel ID="lblUname" runat="server">
                                  </telerik:RadLabel>
                              </td>
                          </tr>
                          <tr>
                              <%--  <td>Full Name:</td>
                        <td><telerik:RadLabel runat="server"  ID="lblFullName"></telerik:RadLabel></td>--%>
                          </tr>
                          <tr>
                              <td class="auto-style1">Account No:
                                  <telerik:RadLabel ID="lblAcctNo" runat="server">
                                  </telerik:RadLabel>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style1">Email:&nbsp;&nbsp;&nbsp;<telerik:RadLabel ID="lblEmail" runat="server">
                                  </telerik:RadLabel>
                              </td>
                              <%--<td><telerik:RadLabel runat="server"  ID="lblEmail"></telerik:RadLabel></td>--%>
                          </tr>
                          <tr>
                              <td class="auto-style1">Phone:<telerik:RadLabel ID="lblPhone" runat="server">
                                  </telerik:RadLabel>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style1">
                                  <telerik:RadRadioButtonList ID="ctl40" runat="server" Direction="Horizontal" SelectedIndex="0" SelectedValue="M" Width="173px">
                                      <Items>
                                          <telerik:ButtonListItem Selected="True" Text="Male" Value="M" />
                                          <telerik:ButtonListItem Text="Female" Value="F" />
                                      </Items>
                                  </telerik:RadRadioButtonList>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style1">
                                  <telerik:RadButton ID="btnUpdate" runat="server" BorderColor="#FA9928" BorderStyle="Solid" OnClick="btnUpdate_Click" Text="Update profile" BackColor="#FA9928">
                                  </telerik:RadButton>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style1">Old Password:&nbsp;&nbsp;&nbsp;<telerik:RadTextBox ID="txtpassold" runat="server" BorderColor="#212435" BorderStyle="Solid" DisplayText="old Password" TextMode="Password">
                                  </telerik:RadTextBox>
                              </td>
                              <%--<td> <telerik:RadTextBox ID="txtpassold"  runat="server" TextMode="Password" DisplayText="old Password"></telerik:RadTextBox></td>--%>
                          </tr>
                          <tr>
                              <td class="auto-style1">New Password:<telerik:RadTextBox ID="txtpass1" runat="server" BorderColor="#212435" BorderStyle="Solid" Text="New password" TextMode="Password">
                                  </telerik:RadTextBox>
                              </td>
                              
                          </tr>
                          <tr>
                              <td class="auto-style1">Confirm New Password:<telerik:RadTextBox ID="txtpass2" runat="server" BorderColor="#212435" BorderStyle="Solid" Text="Confirm password" TextMode="Password">
                                  </telerik:RadTextBox>
                              </td>
                              
                          </tr>
                          <tr>
                              <td class="auto-style1">
                                  <telerik:RadButton ID="passchng" runat="server" OnClick="passchng_Click" Text="Change Password">
                                  </telerik:RadButton>
                              </td>
                          </tr>
                           <telerik:RadLabel runat="server" ID="lblDisplay"></telerik:RadLabel>
                          </tbody>
                      </caption>
                  </table>
                  
                 
                </div>
              </div>
            </div>
                 <div class="panel-footer">
                        <%-- <a data-original-title="Broadcast Message" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-envelope"></i></a>
                       <span class="pull-right">
                            <a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>--%>
                    </div>
            
          </div>
        </div>
                            </div>
                        </div>
                            </td>
                          <%--  <td width="50%" style="vertical-align:top;">
                    <div class="section-title" style="background:#212435;">
                        <h3 style="color:#fa9228">Change Password</h3><br /><br />
                    </div>
                        <div class="col-md-10 col-sm-10 col-xs-14">
                            <div class="accordion-box accordion-style-two">
                                <table runat="server">
                                    <tr>
                                        <td><telerik:RadLabel runat="server" id="lblOldPwd"  Style="margin-left:68px;">Old Password:</telerik:RadLabel></td>
                                     <td> <telerik:RadTextBox ID="txtpassold"  runat="server" TextMode="Password" DisplayText="old Password"></telerik:RadTextBox></td>
                                    </tr>
                                    <tr>
                                        <td><telerik:RadLabel runat="server" id="RadLabel1" Style="margin-left:60px;">New Password:</telerik:RadLabel></td>
                                        <td>
                                            <telerik:RadTextBox id="txtpass1" runat="server" TextMode="Password" Text="New password"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><telerik:RadLabel runat="server" id="RadLabel2">Confirm New Password:</telerik:RadLabel></td>
                                        <td>
                                            <telerik:RadTextBox  id="txtpass2" runat="server" TextMode="Password" Text="Confirm password"></telerik:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <telerik:RadButton ID="passchng" runat="server" Text="Change Password" OnClick="passchng_Click"></telerik:RadButton>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                            </td>--%>
                        </tr>
                   
    
</ContentTemplate>

</asp:UpdatePanel>
                    </div>
                    <br>

                </div>
            </div>
        </div>
    </div>
</section>
</asp:Content>
