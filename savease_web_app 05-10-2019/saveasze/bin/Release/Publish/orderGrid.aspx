<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter.Master" AutoEventWireup="true" CodeBehind="orderGrid.aspx.cs" Inherits="saveasze.orderGrid" %>
<%@ Register namespace="Telerik.Web.UI" tagprefix="UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /*gridview*/

/*end gridview */
    </style>
    
    <table>
        <tr>
            <td>
                <asp:Label ID="lblSearchByOrderNumber" runat="server" Text="Order Number:"></asp:Label>
            </td>
            <td colspan="3">
             <asp:TextBox ID="txtOrderNumber" runat="server" Width="100%"></asp:TextBox>
            </td>
            <td>
                <asp:ImageButton ID="go1" runat="server" AlternateText="Process Option" ImageUrl="~/images/process.png" OnClick="go_fs_Click" ToolTip="Process" />
            </td>
            <td>
                <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="Xlsx" Height="27px" ImageUrl="~/images/Features-export.gif" OnClick="ImageButton1_Click" ToolTip="Export to Excel" Width="63px" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:GridView ID="GridView11"
CssClass="table table-striped table-bordered table-hover"
   runat="server" PageSize="10"
   AllowPaging="true" ></asp:GridView>
             <asp:GridView AllowPaging="true" GridLines="None" PagerStyle-CssClass="paging"  PageSize="10" CssClass="myGridStyle" runat="server" ID="GridView1">
        </asp:GridView> 
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>

</asp:Content>
