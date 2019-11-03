<%@ Page Title="" Language="C#" MasterPageFile="~/loginz.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="saveasze.login" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
                            <a href="index.html" class="col-12 mt-5"><img src="assets/images/logo.png" alt="savease logo" style="width: 120px;"></a>
                            <h4 class="col-12">Welcome back, <br><span>please login to contine</span></h4>
                        <asp:Label runat="server" ID="lblMessage" Visible="false"></asp:Label>
                            <div class="form-control">
                                <!-- <label for="text">User Id</label> -->
                                <input type="text" id="txtUserName" runat="server" placeholder="User Id" required style="background-image: url('assets/images/user.png');background-size: 20px;">
                            </div>
                            <div class="form-control">
                                <!-- <label for="text">User Id</label> -->
                                <input type="password" id="txtPassword1" runat="server" placeholder="Password" required style="background-image: url('assets/images/padlock.png');background-size: 17px;">
                            </div>
                            <div class="form-control">
                                <div class="row">
                                    <div class="col-md-6 col-12 mb-1">
                                        <div class="custom-control custom-checkbox mr-sm-2">
                                            <input type="checkbox" class="custom-control-input" id="customControlAutosizing">
                                            <label class="custom-control-label" for="customControlAutosizing">Remember me</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12 row mb-1">
                                        <a href="reset-password.html" class="col-12 text-md-right">Forget Password?</a>
                                    </div>
                                </div>
                            </div>
                            <div class="form-control col-12 text-center">
                                <%--<button type="submit" class="btn orange-button">Login</button>--%>
                                <asp:Button runat="server" ID="btnLogin" OnClick="btnLogin_Click" Text="Login" CssClass="btn orange-button"  />
                            </div>
                            <p class="col-12 mt-5 text-center">New to Savease? <a href="register.aspx">Sign Up</a></p>
                       
                            
</asp:Content>
