<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mailTemplate.aspx.cs" Inherits="saveasze.mailTemplate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 60%;
        }
        .auto-style2 {
            width: 203px;
            text-align: right;
        }
        .auto-style3 {
            width: 203px;
            text-align: right;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <img ImageUrl="~/images/logo/logo.png" runat="server" />
            <br />
            <br />
&nbsp;Hello displayname<br />
&nbsp;<br />
&nbsp;<table cellpadding="5" class="auto-style1">
                <tr>
                    <td class="auto-style2">Beneficiary Bank:</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Beneficiary Name:</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Beneficiary Account:</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Transact Amount:</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Transaction Date:</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Narative:</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Balance:</td>
                    <td><b></b></td>
                </tr>
            </table><b><i><u><span style="font-size: 10.0pt; line-height: 115%; font-family: &quot;Arial&quot;,sans-serif; mso-fareast-font-family: &quot;Times New Roman&quot;; color: #003399; background: white; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">Please click here to provide feedback on your experience<br />
          </span></u></i></b> 
            <br />
            <br />
            <span style="font-size:10.0pt;line-height:115%;
font-family:&quot;Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;
color:#003399;mso-ansi-language:EN-US;mso-fareast-language:EN-US;mso-bidi-language:
AR-SA">Thank you for using Savease Nigeria</span></div>
    </form>
</body>
</html>
