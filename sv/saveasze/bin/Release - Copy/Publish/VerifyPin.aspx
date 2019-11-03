<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter.Master" AutoEventWireup="true" CodeBehind="VerifyPin.aspx.cs" Inherits="saveasze.VerifyPin" %>
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
    .search{
        
        margin-left:auto;
        margin-right:auto;
        max-width:100%;
        height:386px;
    }
      .drop{
            background-color:#131d33;
            color:#fa9928;
            width:100%;
        }
         .ddl
        {
            border:2px solid #fa9928;
            border-radius:5px;
            padding:3px;
            color:#fa9928;
            -webkit-appearance: none; 
            /*background-color:#131d33;*/
            background-position:88px;
            background-repeat:no-repeat;
            text-indent: 0.01px;/*In Firefox*/
            text-overflow: '';/*In Firefox*/
        }
         .numeric{
             max-width:350px;
             margin-left:auto;
             margin-right:auto;
             margin-top :40px;
         }
         .btn111{
             width:250px;
             margin-left:auto;
             margin-right:auto;
             font-family:Verdana;
             
         }
         #btnverify{
             font-family:Verdana;
         }
</style>


    <div class="search" >
     
       <div align="center" style="margin-top:50px;">
<p style="text-align:center; font-family:Arial,sans-serif; font-size:14px; font-weight:bolder;">
Insert the voucher pin below and <br />click the verify button to <br />check the validity of your voucher.
</p>
      </div>

        <div style="display:none;" align="center"> 
            <telerik:RadNumericTextBox ID="Txtamount" runat="server" Width="350px" Enabled="false" CssClass="ddl" BorderColor="#212435" BorderStyle="Solid" ></telerik:RadNumericTextBox>
                                    
        </div>
    
       <div class="numeric" align="center">
           <asp:TextBox runat="server" ID="txtAmount2" Visible="false"></asp:TextBox>
           <asp:Label runat="server" ID="lblerror"></asp:Label>
           <telerik:RadNumericTextBox ID="txtPIN"  autocomplete="off" runat="server"  Width="200px" Height="40" AutoPostBack="True" postback="false" CssClass="ddl" BorderColor="#212435"  BorderStyle="Solid" MaxValue="70368744177664000000000000" MinValue="-70368744177664000000000000" BorderWidth="3">
<NegativeStyle Resize="None"></NegativeStyle>

<NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>

<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
                                </telerik:RadNumericTextBox>
           <br /><br />
           <div class="btn111" align="center">
                <asp:Button class="thm-btn" runat="server" ID="btnVeriy" Text="Verify" Font-Names="Verdana" OnClick="btnVeriy_Click" />
           </div><br /><br /><br /><br />



           <div class="text-savease" style="margin-top:-35px;">
                     <p style="font-family:Calibri; color:#212435;text-align:center;"><b>You may contact us through any of the options below:</b><br />
                    Telephone: 0700SAVEASE, 09064215137, 09064214402<br />
                    Email: enquiry@savease.ng, care@savease.ng, 
                    </p>
           </div>
          
       </div>
        
    </div>



</asp:Content>
