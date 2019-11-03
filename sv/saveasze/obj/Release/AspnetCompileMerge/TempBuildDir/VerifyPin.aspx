<%@ Page Title="" Language="C#" MasterPageFile="~/Loginz.Master" AutoEventWireup="true" CodeBehind="VerifyPin.aspx.cs" Inherits="saveasze.VerifyPin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    



     
                            <a href="index.html" class="col-12 mt-4"><img src="assets/images/logo.png" alt="" style="width: 120px;"></a>
                            <h4 class="col-12">Verify Pin <br><span>Insert the voucher pin below the vefify button to check the if the card is verified</span></h4>
                            <div class="form-control mt-4">
                                <asp:Label runat="server" ID="lblerror"></asp:Label>
                                <!-- <label for="text">User Id</label> -->
                                <input type="text" runat="server" id="txtPIN1" placeholder="Enter Voucher Pin" required style="background-image: url('assets/images/padlock.png');">
                            </div>
                            <div class="form-control text-center">
                                <asp:Button Text="Verify" runat="server" CssClass="btn orange-button" ID="btnVeriy" OnClick="btnVeriy_Click" Width="160" />
                               <%-- <button type="submit" class="btn orange-button">Verify</button>--%>
                            </div>
                            <!-- <p class="col-12 mt-5 text-center">New to Savease? <a href="register.html">Sign Up</a></p>
                            <p class="col-12 mt-1 text-center">Already have an existing account?, <a href="login.html">Login</a></p> -->
                       


</asp:Content>
