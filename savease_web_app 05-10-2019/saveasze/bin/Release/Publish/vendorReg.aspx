<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vendorReg.aspx.cs" Inherits="saveasze.vendorReg" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 50%;
        }
        .auto-style2 {
            text-align: right;
        }
        .auto-style3 {
            text-align: right;
            height: 26px;
        }
        .auto-style4 {
            height: 26px;
        }
        .auto-style5 {
            text-align: left;
        }
        .auto-style6 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div>
            <asp:UpdatePanel ID="updatepnl" runat="server">

<ContentTemplate>
            <table class="auto-style1" align="center">
                <tr>
                    <td class="auto-style2">
                        <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
                        </telerik:RadScriptManager>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="2">
                        <telerik:RadLabel ID="lblDisplay" runat="server">
                        </telerik:RadLabel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">First Name</td>
                    <td>
                        <telerik:RadTextBox ID="txtFName" Runat="server">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Last Name</td>
                    <td>
                        <telerik:RadTextBox ID="txtLName" Runat="server">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Phone</td>
                    <td>
                        <telerik:RadTextBox ID="txtPhone" Runat="server">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Company</td>
                    <td>
                        <telerik:RadTextBox ID="txtCompany" Runat="server">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Address</td>
                    <td class="auto-style4">
                        <telerik:RadTextBox ID="txtAddress" Runat="server" TextMode="MultiLine">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">email</td>
                    <td>
                        <telerik:RadTextBox ID="txtEmail" Runat="server">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">username</td>
                    <td>
                        <telerik:RadTextBox ID="txtUName" Runat="server">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">password</td>
                    <td>
                        <telerik:RadTextBox ID="txtPassword1" Runat="server" TextMode="Password">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">confirm password</td>
                    <td>
                        <telerik:RadTextBox ID="txtPassword2" Runat="server" TextMode="Password">
                        </telerik:RadTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                       <telerik:RadAsyncUpload RenderMode="Lightweight" runat="server" ID="AsyncUpload1" ChunkSize="1048576" />
        <telerik:RadProgressArea RenderMode="Lightweight" runat="server" ID="RadProgressArea1" DisplayCancelButton="True" ProgressIndicators="TotalProgressBar, TotalProgress, CurrentFileName, TimeElapsed, TimeEstimated, TransferSpeed" /></td>
                </tr>
                <tr>
                    <td class="auto-style2">Identification type</td>
                    <td>
                        <asp:FileUpload ID="uplIDType" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Passport</td>
                    <td>
                        <asp:FileUpload ID="uplpassport" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">CAC Certificate</td>
                    <td>
                        <asp:FileUpload ID="uplCAC" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">CAC Documents</td>
                    <td>
                        <asp:FileUpload ID="uplcacothers" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">VAT REGISTRATION</td>
                    <td>
                        <asp:FileUpload ID="uplvatreg" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">TAX </td>
                    <td>
                        <asp:FileUpload ID="uplTax" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td>
                       <table align="left">
                            <tr>
                                <td class="auto-style5"> <telerik:RadCheckBox ID="chkTCv" runat="server" Text="  " OnClick="chkTC2_CheckedChanged"></telerik:RadCheckBox></td>
                            <td class="auto-style5"><a href="doc/TC.pdf" target="_blank"> Terms & Conditions</a></td>
                            </tr>
                           
                        </table></td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <telerik:RadButton ID="RadButton1" runat="server" Text="Register Vendor" OnClick="RadButton1_Click">
                        </telerik:RadButton>
                    </td>
                </tr>
            </table>
    
</ContentTemplate>

</asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
