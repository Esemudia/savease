<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter1.Master" AutoEventWireup="true" CodeBehind="buy-voucher.aspx.cs" Inherits="saveasze.buy_voucher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <style>
        .content-wrapper {
            position: relative;
            background-image: url(assets/images/dashboard-bg.png);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: right bottom;
        }
        
        .content-wrapper .blue-button-group {
            position: absolute;
            top: 90%;
            margin-top: 15px;
        }
        
        .blue-button-group:after {
            content: "";
            clear: both;
            display: table;
        }
        
        .blue-button-group .btn {
            background: #131D33;
            border-radius: 6px;
            border: none;
            float: left;
            font-weight: bold;
            font-size: 17px;
            line-height: 28px;
            color: #FFFFFF;
            padding: 6.5px 13px;
            text-decoration: none;
        }
        
        .blue-button-group .btn:not(:last-child) {
            border-top-right-radius: 0px;
            border-bottom-right-radius: 0px;
            border-right: 0.5px solid white;
        }
        
        .blue-button-group .btn:last-child {
            border-top-left-radius: 0px;
            border-bottom-left-radius: 0px;
            border-left: 0.5px solid white;
        }
        
        .modal-content .orange-bg {
            color: white;
        }
        
        #statusContent {
            display: none;
        }
        
        @media (max-width: 767px) {
            .content-wrapper .blue-button-group {
                position: absolute;
                top: 93%;
                left: 2%;
                margin-top: 15px;
            }
        }
        input[type=radio] {
            height: 13px;
        }
    </style>
    <section class="col-12 p-md-5 p-0">
                        <div class="row justify-content-center">
                            <div class="col-12 col-md-10 col-lg-7 pl-md-3 pr-md-3 mt-2">
                                <h5 class="col-12 text-center mb-5">
                                    <strong>Hello Victor</strong>, You can buy voucher Here.
                                </h5>
                                <form action="" class="col-md-12 col-lg-9 col-12 mx-auto bg-white pt-2 pb-2 pl-3 pr-3">
                                    <div class="row justify-content-center bg-white pt-3 pb-3">
                                        <div class="form-group col-md-10 col-10 mb-4">
                                            <label class="col-12 text-left">Quantity</label>
                                           <asp:Label runat="server" ID="lblDispError"></asp:Label>
                                        </div>
                                        <div class="form-group col-10 mb-4 mt-3">
                                            <label class="col-12 text-left">Select Percetange charge On card</label>
                                           <asp:RadioButtonList runat="server" ID="rdbtn" CssClass="d-table">
                                               <asp:ListItem Value="0.5">0.5% charge</asp:ListItem>
                                               <asp:ListItem Value="1.0">1.0% charge</asp:ListItem>
                                               <asp:ListItem Value="1.5">1.5% charge</asp:ListItem>
                                               <asp:ListItem Value="2.0">2.0% charge</asp:ListItem>
                                           </asp:RadioButtonList>
                                        </div>
                                        <div class="form-group col-10 mb-4 mt-3">
                                            <asp:DropDownList runat="server" ID="drplist">
                                                <asp:ListItem Selected="True">Select Voucher</asp:ListItem>
                                                <asp:ListItem Value="50">50 Voucher</asp:ListItem>
                                               <asp:ListItem Value="100">100 Voucher</asp:ListItem>
                                                <asp:ListItem Value="200">200 Voucher</asp:ListItem>
                                                <asp:ListItem Value="500">500 Voucher</asp:ListItem>
                                                <asp:ListItem Value="1000">1000 Voucher</asp:ListItem>
                                                <asp:ListItem Value="2000">2000 Voucher</asp:ListItem>
                                                <asp:ListItem Value="5000">5000 Voucher</asp:ListItem>
                                                <asp:ListItem Value="10000">10000 Voucher</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group col-md-10 col-10 mb-4">
                                            <label class="col-12 text-left">Quantity</label>
                                            <asp:TextBox runat="server" ID="txtqty" OnTextChanged="txtqty_TextChanged" AutoPostBack="true"></asp:TextBox>
                                        </div>
                                         <div class="form-group col-10 mb-4">
                                            <label class="col-12 text-left">Amount</label>
                                            <label>N <asp:Label runat="server" ID="lblamout"></asp:Label></label>
                                        </div>
                                        <div class="form-group col-10 mb-4">
                                            <label class="col-12 text-left">Pin</label>
                                            <input type="password">
                                        </div>
                                        <p class="col-10 text-left">*max of 5 vouchers can be atained per session</p>
                                        <div class="form-group col-10 mt-3">
                                            <div class="row justify-content-center">
                                                <asp:Button runat="server" ID="btnBuypin" CssClass="dashboard-modal-button btn col-6 orange-bg p-2" BackColor="#FA9928" OnClick="btnBuypin_Click"  Text="Buy Voucher"/>
                                                <%--<button type="button" class="dashboard-modal-button btn col-6 orange-bg p-2" onclick="dashboardModal()">Buy Voucher</button>--%>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="row justify-content-start align-items-end mt-5">
                            <div class="blue-button-group">
                                <button class="btn" id="accountModalButton">
                                           Account Officer
                                        </button>
                                <a href="#" class="btn">
                                    <img src="assets/images/information.png" class="mr-2" alt="" width="23" height="23"> Help
                                </a>
                            </div>
                        </div>
                    </section>
</asp:Content>
