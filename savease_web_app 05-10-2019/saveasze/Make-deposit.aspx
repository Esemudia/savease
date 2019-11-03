<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter1.Master" AutoEventWireup="true" CodeBehind="Make-deposit.aspx.cs" Inherits="saveasze.Make_deposit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
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
                                
                                <ul class="nav nav-pills nav-fill bg-white p-3" runat="server" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <asp:LinkButton CssClass="nav-link active" runat="server" ID="selfTab" Text="Self" OnClick="selfTab_Click" ></asp:LinkButton>
                                        <%--<a class="nav-link active" id="Self-tab" data-toggle="tab"  onclick=""   href="#Self" role="tab" aria-controls="Self" aria-selected="true">Self</a>--%>
                                    </li>       
                                    <li class="nav-item">
                                        <asp:LinkButton CssClass="nav-link" runat="server" ID="SaccTab" OnClick="SaccTab_Click" Text="Savease account" ></asp:LinkButton>
                                        <%--<a class="nav-link"  id="Savease-account-tab"   data-toggle="tab" href="#Savease-account" role="tab" aria-controls="Savease-account" aria-selected="true">Savease account</a>--%>
                                    </li>
                                   <%-- <li class="nav-item">
                                        <a class="nav-link"  id="Other-Bank-tab" data-toggle="tab" href="#Other-Bank" role="tab" aria-controls="Other-Bank" aria-selected="true">Other Bank</a>
                                    </li>--%>
                                    <li class="nav-item">
                                        <asp:LinkButton runat="server" ID="SbenTab" CssClass="nav-link" OnClick="SbenTab_Click" Text="Saved-Beneficiary" ></asp:LinkButton>
                                       <%-- <a class="nav-link"  id="Saved-Beneficiary-tab"  data-toggle="tab" href="#Saved-Beneficiary" role="tab" aria-controls="Saved-Beneficiary" aria-selected="true">Save Beneficiary</a>--%>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent">
                                    
                                    <div class=""   role="tabpanel" aria-labelledby="Self-tab">
                                        <div class="col-12 col-lg-9 pl-0 pr-0 pt-3 pb-3 mx-auto mt-5 ml-0 mr-0">
                                            <h5 class="col-12 text-center mb-5">
                                                <strong>Hello </strong>,<asp:Label ID="lblBalh" runat="server"></asp:Label>
                                            </h5>
                                            <h6 class="col-12 text-center mb-5">
                                              <asp:Label runat="server" ID="lblMessage"></asp:Label>
                                                </h6>
                                            <div  id="self"  runat="server" class="col-md-10 col-12 mx-auto bg-white pt-2 pb-2 pl-md-3 pr-md-3 pl-0 pr-0">
                                                <div class="row justify-content-center bg-white pt-3 pb-3">
                                                    <div class="form-group col-10 mb-4 mt-3">
                                                        <label class="col-12 text-left">Select an account deposit to</label>
                                                         
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label class="col-12 text-left">Voucher Pin</label>
                                                        <asp:TextBox runat="server" AutoPostBack="true" TextMode="SingleLine"  AutoCompleteType="Disabled"  AutoComplete="off" ID="txtpin1" OnTextChanged="txtpin1_TextChanged"   ></asp:TextBox>
                                                        </div>
                                                  
                                                    <div class="form-group col-10 mb-4">
                                                        <label class="col-12 text-left">Amount</label>
                                                        <asp:TextBox ID="txtamount1" runat="server" Enabled="false" ></asp:TextBox>
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label for="text" class="col-12 text-left">Narration</label>
                                                        <asp:TextBox runat="server" ID="txtNarration1"  AutoCompleteType="Disabled"  AutoComplete="off"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group col-10 mt-3">
                                                        <div class="row justify-content-center">
                                                            <asp:Button  runat="server" ID="btnDeposit" CssClass="dashboard-modal-button btn col-6 orange-bg p-2" Enabled="false" Text=" Make Deposit" BackColor="#FA9928" OnClick="btnDeposit_Click"/>
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div  id="Saveaseaccount1"  runat="server" visible="false" class="col-md-10 col-12 mx-auto bg-white pt-2 pb-2 pl-md-3 pr-md-3 pl-0 pr-0">
                                                <div class="row justify-content-center bg-white pt-3 pb-3">
                                                    <div class="form-group col-10 mb-4 mt-3">
                                                        <label class="col-12 text-left">Voucher Pin</label>
                                                        <asp:TextBox runat="server" AutoCompleteType="Disabled"  AutoComplete="off"  ID="txtPIN2" TextMode="SingleLine" AutoPostBack="true" OnTextChanged="txtPIN_TextChanged"></asp:TextBox>
                                                       
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label class="col-12 text-left">Amount</label>
                                                        <asp:TextBox runat="server" ID="txtamount2" Enabled="false"/>
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label class="col-12 text-left">Account Number</label>
                                                       <asp:TextBox TextMode="SingleLine" runat="server" ID="txtaccNum" AutoCompleteType="Disabled"  AutoComplete="off" OnTextChanged="txtaccName_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                     <asp:RangeValidator ID="RangeValidator3" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtpin1" runat="server"  ErrorMessage="enter only numbers between 1 and 10"></asp:RangeValidator>
                                                   
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label for="text" class="col-12 text-left">Account Name</label>
                                                        <asp:TextBox runat="server" ID="txtAccname" Enabled="false" AutoCompleteType="Disabled"  AutoComplete="off"></asp:TextBox>
                                                    </div>
                                                    
                                                    <div class="form-group col-10 mb-4">
                                                        <label for="text" class="col-12 text-left">Narration</label>
                                                        <input type="text" runat="server" id="txtnarration2">
                                                    </div>
                                                    <div class="form-group col-10 mt-3">
                                                        <div class="row justify-content-center">
                                                            <asp:Button runat="server" ID="btnDepozit" Class="dashboard-modal-button btn col-6 orange-bg p-2" Enabled="false"  BackColor="#FA9928" Text="Make Deposit" OnClick="btnDepozit_Click" />
                                                            <%--<button type="button" class="dashboard-modal-button btn col-6 orange-bg p-2" onclick="dashboardModal()">Make Deposit</button>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div  id="SavedBeneficiary1" runat="server" visible="false" class="col-md-10 col-12 mx-auto bg-white pt-2 pb-2 pl-md-3 pr-md-3 pl-0 pr-0">
                                                <div class="row justify-content-center bg-white pt-3 pb-3">
                                                    <div class="form-group col-10 mb-4">
                                                        <asp:DropDownList runat="server" ID="cmdSavedBen" OnSelectedIndexChanged="cmdSavedBen_SelectedIndexChanged" AutoPostBack="true">
                                                            <asp:ListItem Selected>Select a beneficiary</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <%--<select>
                                                            <option selected>Select saved Beneficary</option>
                                                            <option value="1">0766709456 Victor(savease)</option>
                                                            <option value="2">0766709456 Victor(savease)</option>
                                                            <option value="3">0766709456 Victor(savease)</option>
                                                        </select>--%>
                                                    </div>
                                                    <div class="form-group col-10 mb-4 mt-3">
                                                        <label class="col-12 text-left">Voucher Pin</label>
                                                       <asp:TextBox runat="server" ID="txtvpin" AutoCompleteType="Disabled"  AutoComplete="off"  TextMode="SingleLine" AutoPostBack="true" OnTextChanged="txtvpin_TextChanged" ></asp:TextBox>
                                                         <asp:RangeValidator ID="RangeValidator4" Type="Integer" MinimumValue="0" MaximumValue="200" ControlToValidate="txtpin1" runat="server" ErrorMessage="enter only numbers between 1 and 30"></asp:RangeValidator>
                                                   
                                                    </div>
                                                    
                                                    <div class="form-group col-10 mb-4">
                                                        <label class="col-12 text-left">Amount</label>
                                                        <asp:TextBox Enabled="false" ID="txtvamount" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label for="text" class="col-12 text-left">Account Details</label>
                                                       <asp:Label runat="server" ID="savedBenDetails"></asp:Label>
                                                    </div>
                                                    <div class="form-group col-10 mb-4">
                                                        <label for="text" class="col-12 text-left">Narration</label>
                                                        <input type="text"  runat="server" id="txtvnarration" AutoComplete="off" >
                                                    </div>
                                                    <div class="form-group col-10 mt-3">
                                                        <div class="row justify-content-center">
                                                            <asp:HiddenField runat="server" ID="hidAccount3"/>
                                                             <asp:HiddenField runat="server" ID="hidBankName" />
                                                             <asp:HiddenField runat="server" ID="hidAcctName" />
                                                            <asp:Button runat="server" ID="btnBen" BackColor="#FA9928" Enabled="false"  Text="Make Deposit" CssClass="dashboard-modal-button btn col-6 orange-bg p-2" OnClick="btnBen_Click"/>
                                                            <%--<button type="button" class="dashboard-modal-button btn col-6 orange-bg p-2" onclick="dashboardModal()">Make Deposit</button--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row justify-content-start align-items-end">
                            <a href="#" class="blue-button bottom-button">
                                <img src="assets/images/information.png" class="mr-2" alt="" width="25" height="25"> Help
                            </a>
                        </div>
                    </section>
     
    <div id="dashboardModal" class="dashboard-modal">
        <span class="close-dashboard-modal">&times;</span>
        <div class="modal-content p-5">
            <div class="row" id="confirmContent">
                <!-- <img src="assets/images/checked.svg" alt="" class="mb-2 mx-auto">
                <h3 class="col-12 mb-2 text-center">voucher pin Verfied</h3> -->
                <p class="col-12 text-left mb-3"><strong>Voucher Pin</strong> : 148620169484</p>
                <p class="col-12 text-left mb-3"><strong>Bank Name</strong> : Access bank Plc</p>
                <p class="col-12 text-left mb-3"><strong>Account Number</strong> : 148620169484</p>
                <p class="col-12 text-left mb-3"><strong>Account Name</strong> : victor segun</p>
                <p class="col-12 text-left mb-3"><strong>Amount</strong> : 500(Naria)</p>
                <p class="col-12 text-left mb-3"><strong>Narration</strong> : to Victor</p>
                <div class="col-12 mt-1 p-0">
                    <div class="row justify-content-center m-0 p-0">
                        <button class="btn orange-bg" id="confirmContentButton">Continue</button>
                    </div>
                </div>
            </div>
            <div class="row text-center" id="statusContent">
                <div class="col-12 text-right">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 129 129" width="23" height="23" id="backButton"><style>.a{fill:#131D33;}</style><path d="m64.5 122.6c32 0 58.1-26 58.1-58.1s-26-58-58.1-58-58 26-58 58 26 58.1 58 58.1zm0-108c27.5 0 49.9 22.4 49.9 49.9s-22.4 49.9-49.9 49.9-49.9-22.4-49.9-49.9 22.4-49.9 49.9-49.9z" data-original="#131D33" class="active-path" data-old_color="#131D33" class="a"/><path d="m70 93.5c0.8 0.8 1.8 1.2 2.9 1.2 1 0 2.1-0.4 2.9-1.2 1.6-1.6 1.6-4.2 0-5.8l-23.5-23.5 23.5-23.5c1.6-1.6 1.6-4.2 0-5.8s-4.2-1.6-5.8 0l-26.4 26.4c-0.8 0.8-1.2 1.8-1.2 2.9s0.4 2.1 1.2 2.9l26.4 26.4z" data-original="#131D33" class="active-path" data-old_color="#131D33" class="a"/></svg>
                </div>
                <svg xmlns="http://www.w3.org/2000/svg" width="240" height="240" viewBox="0 0 284 284" fill="none"><style>.a{stroke-width:2;stroke:white;}</style><path d="M142 284C220.4 284 284 220.4 284 142 284 63.6 220.4 0 142 0 63.6 0 0 63.6 0 142 0 220.4 63.6 284 142 284Z" fill="#D75A4A"/><path d="M90.9 193.1L142 142 193.1 90.9" class="a"/><path d="M90.9 90.9L142 142 193.1 193.1" class="a"/></svg>
                <h3 class="col-12 mb-2 text-center">Oops</h3>
                <p class="col-12 text-center mb-3">An Error Occured in transaction</p>
                <div class="col-12 mt-1 mb-3 p-0">
                    <div class="row justify-content-center m-0 p-0">
                        <button class="btn orange-bg mx-auto">Try Again</button>
                    </div>
                </div>
                <svg width="92" height="92" viewBox="0 0 92 92" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g clip-path="url(#clip0)">
                    <path d="M46 92C71.4051 92 92 71.4051 92 46C92 20.5949 71.4051 0 46 0C20.5949 0 0 20.5949 0 46C0 71.4051 20.5949 92 46 92Z" fill="#32BA7C"/>
                    <path d="M34.2461 66.7506L57.8991 90.4036C77.489 85.1796 92 67.3311 92 45.9998C92 45.5645 92 45.1292 92 44.6938L73.4259 27.5708L34.2461 66.7506Z" fill="#0AA06E"/>
                    <path d="M47.1597 56.3029C49.1913 58.3344 49.1913 61.8171 47.1597 63.8486L42.9515 68.0568C40.92 70.0884 37.4373 70.0884 35.4058 68.0568L16.9768 49.4827C14.9452 47.4511 14.9452 43.9685 16.9768 41.9369L21.185 37.7287C23.2165 35.6972 26.6992 35.6972 28.7307 37.7287L47.1597 56.3029Z" fill="white"/>
                    <path d="M63.2683 24.2334C65.2998 22.2018 68.7825 22.2018 70.814 24.2334L75.0222 28.4416C77.0538 30.4731 77.0538 33.9558 75.0222 35.9873L43.0979 67.7665C41.0664 69.7981 37.5837 69.7981 35.5522 67.7665L31.344 63.5583C29.3124 61.5268 29.3124 58.0441 31.344 56.0126L63.2683 24.2334Z" fill="white"/>
                    </g>
                    <defs>
                    <clipPath id="clip0">
                    <rect width="92" height="92" fill="white"/>
                    </clipPath>
                    </defs>
                    </svg>
                <h3 class="col-12 mb-2 text-center">Confirmed</h3>
                <p class="col-12 text-center mb-3">Click the button below to finish transaction.</p>
                <div class="col-12 mt-1 p-0">
                    <div class="row justify-content-center m-0 p-0">
                        <button type="submit" class="btn orange-bg mx-auto">Finish</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ModalPopupExtender -->


</asp:Content>
