<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adm.Master" AutoEventWireup="true" CodeBehind="newadmin.aspx.cs" Inherits="saveasze.admin.newadmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br />   <br />        
    <div class="card-body p-6" style="width:600px;margin-left:auto;margin-right:auto;">
									<div class="card-title text-center">Create New Account</div>
                                     <asp:Label runat="server" ID="lblmes"></asp:Label>
									<div class="form-group">
										<label class="form-label">First Name</label>
										<input type="text" class="form-control" id="txtfname" runat="server" placeholder=" first name"/>
									</div>
                                     <div class="form-group">
										<label class="form-label">Last Name</label>
										<input type="text" class="form-control" id="txtlname" runat="server" placeholder=" last name"/>
									</div>
                                     <div class="form-group">
										<label class="form-label">Phone</label>
										<input type="text" class="form-control" id="txtphone" runat="server" placeholder="phone"/>
									</div>
                                        <div class="form-group">
										<label class="form-label">Username</label>
										<input type="text" class="form-control" id="txtuname" runat="server" placeholder="Username"/>
									</div>
									<div class="form-group">
										<label class="form-label">Email address</label>
										<input type="email" class="form-control" id="txtmail" runat="server" placeholder="Enter email">
									</div>
									<div class="form-group">
										<label class="form-label">Password</label>
										<input type="password" class="form-control" id="txtpass" runat="server" placeholder="Password"/>
									</div>
                                    <div class="form-group">
										<label class="form-label">Confirm Password</label>
										<input type="password" class="form-control" id="txtcompass" runat="server" placeholder="Password"/>
									</div>
									<div class="form-group" style="display:none;">
										<label class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input" />
											<span class="custom-control-label">Agree the <a href="terms.html">terms and policy</a></span>
										</label>
									</div>
									<div class="form-footer">
										
                                        <asp:Button runat="server" class="btn btn-primary btn-block" OnClick="btnRegister_Click" Text="Create new account" />
									</div>
									
								</div>
</asp:Content>
