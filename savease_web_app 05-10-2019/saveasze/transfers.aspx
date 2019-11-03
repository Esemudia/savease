<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter1.Master" AutoEventWireup="true" CodeBehind="transfers.aspx.cs" Inherits="saveasze.transfers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        .content-wrapper {
            position: relative;
            background-image: url(assets/images/dashboard-bg.png);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: right bottom;
        }
        
        .content-wrapper .blue-button {
            position: absolute;
            top: 90%;
            margin-top: 15px;
        }
        
        .modal-content .orange-bg {
            color: white;
        }
        
        #statusContent {
            display: none;
        }
        
        @media (max-width: 767px) {
            .content-wrapper .blue-button {
                position: absolute;
                top: 93%;
                margin-top: 15px;
            }
        }
    </style>

      <section class="col-12 p-5">
                        <div class="row justify-content-center">
                            <div class="col-12 col-md-10 col-lg-10 pl-md-4 pr-md-4 pl-0 pr-0 mt-2">
                                <ul class="nav nav-pills nav-fill bg-white p-3" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="Savease-account-tab" data-toggle="tab" href="#Savease-account" role="tab" aria-controls="Savease-account" aria-selected="true">Savease account</a>
                                    </li>
                                    <%--<li class="nav-item">
                                        <a class="nav-link" id="Other-Account-tab" data-toggle="tab" href="#Other-Account" role="tab" aria-controls="Other-Account" aria-selected="true">Other Account</a>
                                    </li>--%>
                                </ul>
                                <div class="tab-content" id="myTabContent">
                                    <div class="" id="Savease-account" role="tabpanel" aria-labelledby="Savease-account-tab">
                                        <div class="col-12 col-lg-9 pl-0 pr-0 pt-3 pb-3 mx-auto mt-5 ml-0 mr-0">
                                            <h5 class="col-12 text-center mb-5">
                                                <strong>Hello <asp:Label runat="server" ID="lblBalh"></asp:Label></strong>, Make a Tranfer From to Your Savease Accout to another Savease Account.
                                            </h5>
                                            <form  class="col-md-9 col-12 mx-auto bg-white pt-2 pb-2 pl-3 pr-3">
                                                <div class="row justify-content-center bg-white pt-3 pb-3">
                                                    <div class="form-group col-10 mb-4 mt-3">
                                                        <label class="col-12 text-left"><asp:Label runat="server" ID="lblMessage"></asp:Label></label>
                                                        <label class="col-12 text-left"><asp:Label runat="server" Visible="false" ID="txtbalace"></asp:Label></label>
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label class="col-12 text-left">Account Number</label>
                                                        <asp:TextBox runat="server" ID="txtaccount" TextMode="Number" OnTextChanged="txtaccount_TextChanged" AutoPostBack="true" ></asp:TextBox>
                                                       
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label class="col-12 text-left">Account Name</label>
                                                        <asp:TextBox runat="server" ID="txtAccname"  Enabled="false"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label for="text" class="col-12 text-left">Amount</label>
                                                        <asp:TextBox runat="server" ID="txtamount"></asp:TextBox>
                                                    </div>
                                                    
                                                    <div class="form-group col-10 mb-4">
                                                        <label for="text" class="col-12 text-left">Narration</label>
                                                        <asp:TextBox runat="server" ID="txtnarration"></asp:TextBox>
                                                    </div>
                                                     <div class="form-group col-10 mb-4">
                                                        <label for="text" class="col-12 text-left">Pin</label>
                                                        <asp:TextBox runat="server" ID="txtpin" TextMode="Password" MaxLength="4"></asp:TextBox>
                                                    </div>
                                                     <asp:HiddenField runat="server" ID="hideSEID" />
                                                    <asp:HiddenField runat="server" ID="hideBenBal" />
                                                    <div class="form-group col-10 mt-3">
                                                        <div class="row justify-content-center">
                                                            <asp:Button  runat="server" ID="btnTransfer" Enabled="false" CssClass="dashboard-modal-button btn col-6 orange-bg p-2" Text="Make Transfer" BackColor="#FA9928" OnClick="btnTransfer_Click"/>
                                                           <%-- <button type="button" class="dashboard-modal-button btn col-6 orange-bg p-2" onclick="dashboardModal()">Make Transfer</button>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="Other-Account" role="tabpanel" aria-labelledby="Other-Account-tab">
                                        <div class="col-12 col-lg-9 pl-0 pr-0 pt-3 pb-3 mx-auto mt-5 ml-0 mr-0">
                                            <h5 class="col-12 text-center mb-5">
                                                <strong>Hello Victor</strong>, Make a Tranfer From to Your Savease accout to a bank account.
                                            </h5>
                                            <form action="" class="col-md-9 col-12 mx-auto bg-white pt-2 pb-2 pl-3 pr-3">
                                                <div class="row justify-content-center">
                                                    <div class="form-group col-10 mb-4 mt-3">
                                                        <label class="col-12 text-left">Select an account to transfer form</label>
                                                        <select>
                                                            <option selected>Open this select menu</option>
                                                            <option value="1">0766709456 Victor(savease) <br><br>Bal: $20,0000</option>
                                                            <option value="2">0766709456 Victor(savease) <br><br>Bal: $20,0000</option>
                                                            <option value="3">0766709456 Victor(savease) <br><br>Bal: $20,0000</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label class="col-12 text-left">Voucher Pin</label>
                                                        <input type="number">
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label class="col-12 text-left">Amount</label>
                                                        <input type="number">
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label for="text" class="col-12 text-left">Account Name</label>
                                                        <input type="text">
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label class="col-12 text-left">Account Number</label>
                                                        <input type="number">
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label for="text" class="col-12 text-left">Narration</label>
                                                        <input type="text">
                                                    </div>
                                                    <div class="form-group col-10 mt-3">
                                                        <div class="row justify-content-center">
                                                            <button type="button" class="dashboard-modal-button btn col-6 orange-bg p-2" onclick="dashboardModal()">Make Transfer</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row justify-content-start align-items-end">
                            <a href="#" class="blue-button">
                                <img src="assets/images/information.png" class="mr-2" alt="" width="25" height="25"> Help
                            </a>
                        </div>
                    </section>
</asp:Content>
