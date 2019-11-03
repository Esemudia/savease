<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="templates.aspx.cs" Inherits="saveasze.templates" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
        <div>
        </div>
        <telerik:RadGrid ID="RadGrid2" runat="server" AutoGenerateColumns="false" CellSpacing="-1" DataSourceID="SqlDataSource1" GridLines="Both" AllowCustomPaging="True" AllowPaging="True" PageSize="20" ShowFooter="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ExportSettings ExportOnlyData="True" OpenInNewWindow="True">
            </ExportSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <FooterStyle BackColor="#cc6633"></FooterStyle>
                <Columns>
                    <telerik:GridBoundColumn DataField="SN" FilterControlAltText="Filter SN column" HeaderText="SN" SortExpression="SN" UniqueName="SN">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TransactionType" FilterControlAltText="Filter TransactionType column" HeaderText="Transaction Description" SortExpression="TransactionType" UniqueName="TransactionType">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="transactionDate" DataType="System.DateTime" FilterControlAltText="Filter transactionDate column" HeaderText="Transaction Date" SortExpression="transactionDate" UniqueName="transactionDate">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="referenceCode" FilterControlAltText="Filter referenceCode column" HeaderText="Reference ID" SortExpression="referenceCode" UniqueName="referenceCode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="recipientName" FilterControlAltText="Filter recipientName column" HeaderText="Name" SortExpression="recipientName" UniqueName="recipientName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="recipientID" FilterControlAltText="Filter recipientID column" HeaderText="Account Number" SortExpression="recipientID" UniqueName="recipientID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="senderName" FilterControlAltText="Filter senderName column" HeaderText="senderName" SortExpression="senderName" UniqueName="senderName" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="senderID" FilterControlAltText="Filter senderID column" HeaderText="senderID" SortExpression="senderID" UniqueName="senderID" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="credit" DataType="System.Double" FilterControlAltText="Filter credit column" HeaderText="Credit" SortExpression="credit" UniqueName="credit"
                         Aggregate="Sum" FooterText="Total Income: ">
                        <ItemStyle ForeColor="Blue" Font-Bold="true" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn  DataField="debit" DataType="System.Double" HeaderText="Debit" Aggregate="Sum" FooterText="Total Expenditure: ">
                        <ItemStyle ForeColor="Red" Font-Bold="true" />
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="id" DataType="System.Int32" FilterControlAltText="Filter id column" HeaderText="id" ReadOnly="True" SortExpression="id" UniqueName="id" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
            <PagerStyle Mode="Slider" Position="TopAndBottom" />
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:saveaseSqlLocal %>" SelectCommand="SELECT DISTINCT Row_Number() OVER(order by (SELECT 1)) as SN,[TransactionType], [transactionDate], [referenceCode], [recipientName], [recipientID], [senderName], [senderID], [credit], [debit], [id] FROM [transactionDetails] WHERE (([senderID] = @senderID) OR ([recipientID] = @recipientID))">
            <SelectParameters>
                <asp:SessionParameter Name="senderID" SessionField="sessSaveID" Type="String" />
                <asp:SessionParameter Name="recipientID" SessionField="sessSaveID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
