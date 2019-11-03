<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testing.aspx.cs" Inherits="saveasze.testing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="TextBoxPrice1" runat="server" CausesValidation="True" OnTextChanged="TextBoxPrice_TextChanged" AutoPostBack="true"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBoxPrice1" Type="Integer" ErrorMessage="CompareValidator" ForeColor="Red" Operator="DataTypeCheck">*</asp:CompareValidator>
                <asp:TextBox ID="TextBoxPrice2" runat="server" CausesValidation="True" OnTextChanged="TextBoxPrice_TextChanged" AutoPostBack="true"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="TextBoxPrice2" Type="Integer" ErrorMessage="CompareValidator" ForeColor="Red" Operator="DataTypeCheck">*</asp:CompareValidator>
               <asp:Label ID="rst" runat="server" Text=""></asp:Label></ContentTemplate>
            </asp:UpdatePanel>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Lighthouse.jpg" Width="100"/>
        &nbsp;&nbsp;&nbsp;
        </div>
    </form>
</body>
</html>
