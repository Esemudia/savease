<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter1.Master" AutoEventWireup="true" CodeBehind="Verify-pin.aspx.cs" Inherits="saveasze.Verify_pin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        .content-wrapper {
            position: relative;
            background-image: url(assets/images/dashboard-bg.png);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: right bottom;
        }
        
        .modal-content h3 {
            color: #55CD6C;
        }
    </style>
     <section class="col-12 p-5">
                        <div class="row justify-content-center">
                            <div class="col-12 col-md-6 col-lg-5 pl-md-4 pr-md-4 pl-0 pr-0 mt-2">
                                <div class="col-12 bg-white pl-2 pr-2 pt-3 pb-3" style="height: auto">
                                    <form >
                                        <p class="col-12 mb-5">
                                            <span class="bold-txt">Note:</span> Insert the voucher pin below the vefify button to check the if the card is verified
                                        </p>
                                        <div class="row justify-content-center">
                                            <asp:Label runat="server" ID="lblMessage"></asp:Label>
                                            <div class="form-group col-10 mb-2">
                                                <label class="col-12 text-left">Enter Voucher Pin<span class="red-txt">*</span></label>
                                                <asp:TextBox runat="server" ID="txtpin" TextMode="Number" OnTextChanged="txtpin_TextChanged" AutoPostBack="true"></asp:TextBox>
                                            </div>
                                            <div class="form-group col-10 mt-3">
                                                <div class="row justify-content-center">
                                                    <asp:Button runat="server" CssClass="dashboard-modal-button btn col-6 orange-bg p-2" Text="Verify" ID="btnVerify" BackColor="#FA9928" OnClick="btnVerify_Click"/>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-start align-items-end mt-5">
                            <a href="#" class="blue-button">
                                <img src="assets/images/information.png" class="mr-2" alt="" width="25" height="25"> Help
                            </a>
                        </div>
                    </section>
</asp:Content>
