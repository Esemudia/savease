﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adm.Master" AutoEventWireup="true" CodeBehind="userManager.aspx.cs" Inherits="saveasze.admin.userManager" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
    <br />
    <br />
    <br /><br /><br /><br /><br />
   
        <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
        </telerik:RadScriptManager>
        <telerik:RadGrid ID="RadGrid1" runat="server"  AllowCustomPaging="True" AllowPaging="True" AutoGenerateDeleteColumn="True" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource1" GridLines="Both" PageSize="20" ShowFooter="false"
            OnDeleteCommand="RadGrid1_DeleteCommand" BorderStyle="Solid">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ExportSettings ExportOnlyData="True">
                <Pdf PaperSize="A4">
                </Pdf>
            </ExportSettings>
            <ClientSettings>
                <Scrolling AllowScroll="True" UseStaticHeaders="True" />
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="id" DataType="System.Int32" FilterControlAltText="Filter id column" HeaderText="ID" ReadOnly="True" SortExpression="id" UniqueName="id" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="fName" FilterControlAltText="Filter fName column" HeaderText="fName" SortExpression="fName" UniqueName="fName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="lName" FilterControlAltText="Filter lName column" HeaderText="lName" SortExpression="lName" UniqueName="lName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="email" FilterControlAltText="Filter email column" HeaderText="email" SortExpression="email" UniqueName="email">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="username" FilterControlAltText="Filter username column" HeaderText="username" SortExpression="username" UniqueName="username">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="password" FilterControlAltText="Filter password column" HeaderText="password" SortExpression="password" UniqueName="password">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="createdDate" DataType="System.DateTime" FilterControlAltText="Filter createdDate column" HeaderText="createdDate" SortExpression="createdDate" UniqueName="createdDate">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="createdBy" FilterControlAltText="Filter createdBy column" HeaderText="createdBy" SortExpression="createdBy" UniqueName="createdBy">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="phone" FilterControlAltText="Filter phone column" HeaderText="phone" SortExpression="phone" UniqueName="phone">
                    </telerik:GridBoundColumn>
                </Columns>
                <PagerStyle AlwaysVisible="True" />
            </MasterTableView>
            <PagerStyle AlwaysVisible="True" PageButtonCount="100" PageSizes="50;100;500" />
        </telerik:RadGrid>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:saveaseSqlLocal %>" DeleteCommand="DELETE FROM [users] WHERE [id] = @original_id AND (([fName] = @original_fName) OR ([fName] IS NULL AND @original_fName IS NULL)) AND (([lName] = @original_lName) OR ([lName] IS NULL AND @original_lName IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND [username] = @original_username AND [password] = @original_password AND (([createdDate] = @original_createdDate) OR ([createdDate] IS NULL AND @original_createdDate IS NULL)) AND (([createdBy] = @original_createdBy) OR ([createdBy] IS NULL AND @original_createdBy IS NULL)) AND (([phone] = @original_phone) OR ([phone] IS NULL AND @original_phone IS NULL))" InsertCommand="INSERT INTO [users] ([fName], [lName], [email], [username], [password], [createdDate], [createdBy], [phone]) VALUES (@fName, @lName, @email, @username, @password, @createdDate, @createdBy, @phone)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [id], [fName], [lName], [email], [username], [password], [createdDate], [createdBy], [phone] FROM [users] WHERE ([userlevel] &gt;= @userlevel) ORDER BY [fName]" UpdateCommand="UPDATE [users] SET [fName] = @fName, [lName] = @lName, [email] = @email, [username] = @username, [password] = @password, [createdDate] = @createdDate, [createdBy] = @createdBy, [phone] = @phone WHERE [id] = @original_id AND (([fName] = @original_fName) OR ([fName] IS NULL AND @original_fName IS NULL)) AND (([lName] = @original_lName) OR ([lName] IS NULL AND @original_lName IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND [username] = @original_username AND [password] = @original_password AND (([createdDate] = @original_createdDate) OR ([createdDate] IS NULL AND @original_createdDate IS NULL)) AND (([createdBy] = @original_createdBy) OR ([createdBy] IS NULL AND @original_createdBy IS NULL)) AND (([phone] = @original_phone) OR ([phone] IS NULL AND @original_phone IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_fName" Type="String" />
                <asp:Parameter Name="original_lName" Type="String" />
                <asp:Parameter Name="original_email" Type="String" />
                <asp:Parameter Name="original_username" Type="String" />
                <asp:Parameter Name="original_password" Type="String" />
                <asp:Parameter Name="original_createdDate" Type="DateTime" />
                <asp:Parameter Name="original_createdBy" Type="String" />
                <asp:Parameter Name="original_phone" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="fName" Type="String" />
                <asp:Parameter Name="lName" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="createdDate" Type="DateTime" />
                <asp:Parameter Name="createdBy" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="userlevel" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="fName" Type="String" />
                <asp:Parameter Name="lName" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="createdDate" Type="DateTime" />
                <asp:Parameter Name="createdBy" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_fName" Type="String" />
                <asp:Parameter Name="original_lName" Type="String" />
                <asp:Parameter Name="original_email" Type="String" />
                <asp:Parameter Name="original_username" Type="String" />
                <asp:Parameter Name="original_password" Type="String" />
                <asp:Parameter Name="original_createdDate" Type="DateTime" />
                <asp:Parameter Name="original_createdBy" Type="String" />
                <asp:Parameter Name="original_phone" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>
