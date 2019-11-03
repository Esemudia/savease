<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze.Master" AutoEventWireup="true" CodeBehind="activate1.aspx.cs" Inherits="saveasze.activate1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr runat="server" id="rowValid" visible="false">
            <td style=' text-align:center; color:red;'>

            <p></p>
            <p></p>
            <p></p>Invalid token please register as new user. </td>
        </tr>
        <tr runat="server" id="rowInvalid" visible="false">
            <td style=' text-align:center; color:green;'>
            <p></p>
            <p></p>
            <p></p >Account activation is succesfull,<a href="login.aspx" style='color:red;'>Click here to login.</a>
                </td>
        </tr>
    </table>
</asp:Content>
