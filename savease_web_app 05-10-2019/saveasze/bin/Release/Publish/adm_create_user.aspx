<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze.Master" AutoEventWireup="true" CodeBehind="adm_create_user.aspx.cs" Inherits="saveasze.adm_create_user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="register-section sec-padd-top">
    <div class="container">
        <div class="row">
            
            <!--Form Column-->
            <div class="form-column column col-lg-6 col-md-6 col-sm-12 col-xs-12">
            
                <div class="section-title">
                    <h3><asp:Label runat="server" ></asp:Label></h3>
                    <div class="decor"></div>
                </div>
                
                <!--Login Form-->
                <asp:Label runat="server" ID="lblDisplay" Width="100%"></asp:Label>
                <div class="styled-form login-form">
                        <div class="form-group">
                            <span class="adon-icon"><span class="fa fa-user"></span></span>
                            <input type="text" id="username" name="username" value="" placeholder="Your Name *" runat="server">
                        </div>
                        <div class="form-group">
                            <span class="adon-icon"><span class="fa fa-envelope-o"></span></span>
                            <input type="text" id="txtEmail" name="txtEmail" value="" placeholder="Enter Email *" runat="server">
                        </div>
                        <div class="form-group">
                            <span class="adon-icon"><span class="fa fa-unlock-alt"></span></span>
                            <input type="password" name="userpassword" value="" placeholder="Enter Password" id="userpassword" runat="server">
                        </div>
                            <div class="form-group select-box">
                                <select name="cmdLevels" id="cmdLevels" style="width:100%" runat="server"  class="selectpicker" >
                             
                                </select>
                            </div>
                        <div class="clearfix">
                            <div class="form-group pull-left">
                                <asp:Button ID="btnCreate" runat="server" Text="login now"  class="thm-btn thm-tran-bg" OnClick="btnCreate_Click"/>
                                
                            </div>
                            <div class="form-group padd-top-5 pull-right">
                             <a href="#" class="forgot">Forgot Password?</a>
                            </div>
                        </div>
                        
                        <div class="clearfix">
                            <div class="pull-left">
                                <input type="checkbox" id="remember-me"><label for="remember-me">&nbsp; Remember Me</label>
                            </div>
                        </div>
                        
                </div>
                
            </div>
            
            
        </div>
    </div>
</section>
</asp:Content>
