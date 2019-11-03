<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="saveasze.admin.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <telerik:RadRadioButtonList ID="RadRadioButtonList1" Runat="server" AutoPostBack="False" Direction="Horizontal" SelectedIndex="0" SelectedValue="Daily" Skin="WebBlue">
                <Items>
                    <telerik:ButtonListItem Selected="True" Text="Daily" ToolTip="Generate Daily Report" Value="Daily" />
                    <telerik:ButtonListItem Text="Monthly" ToolTip="Generate Monthly Report" Value="Monthly" />
                    <telerik:ButtonListItem Text="Yearly" ToolTip="Generate Annual Report" Value="Yearly" />
                </Items>
            </telerik:RadRadioButtonList>
        </div>
        <telerik:RadDropDownList ID="RadDropDownList1" runat="server" SelectedText="Deposit" SelectedValue="Dep">
            <Items>
                <telerik:DropDownListItem runat="server" Selected="True" Text="Deposit" Value="Dep" />
                <telerik:DropDownListItem runat="server" Text="Purchased Voucher" Value="PV" />
                <telerik:DropDownListItem runat="server" Text="Tranfer" Value="TR" />
                <telerik:DropDownListItem runat="server" Text="Fund Account" Value="FA" />
                <telerik:DropDownListItem runat="server" Text="Complain" Value="CP" />
            </Items>
        </telerik:RadDropDownList>
    </form>
</body>
</html>
