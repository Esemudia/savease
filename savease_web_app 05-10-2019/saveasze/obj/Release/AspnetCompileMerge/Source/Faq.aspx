<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faq.aspx.cs" Inherits="saveasze.Faq" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale = 1.0,maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Savease - Instant Deposit </title>
    <link rel="stylesheet" href="assets/css/slick-theme.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/all.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <link rel="icon" href="assets/images/fav_icon.ico" type="image/ico">

    <style>
        header {
            /* width: 100vw; */
            height: 100vh;
            background: linear-gradient(175.98deg, rgba(19, 29, 51, 0.54) -173.17%, rgba(19, 29, 51, 0.08) 25.78%, rgba(101, 140, 226, 0.1) 63.23%, rgba(19, 29, 51, 0.01) 94.68%, rgba(19, 29, 51, 0) 109.72%);
        }
        
        header .banner-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        
        .card {
            position: relative;
            display: -ms-flexbox;
            display: flex;
            text-align: justify;
            -ms-flex-direction: column;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border-bottom: 1.3px solid rgba(0, 0, 0, .125) !important;
            border-radius: .25rem !important;
            box-shadow: unset;
        }
        
        .card .card-header h2 button {
            color: #131D33;
            text-decoration: none;
            transition: all .4s ease;
        }
        
        .form-section .card button {
            text-align: left !important;
            color: #131D33 !important;
        }
        
        .form-section .card button:focus,
        .form-section .card button:hover,
        .form-section .card button:active {
            text-decoration: none;
        }
        
        .form-section .card button h5:focus,
        .form-section .card button h5:hover,
        .form-section .card button h5:active {
            color: rgb(250, 153, 40);
            text-decoration: none;
            font-weight: bold;
        }
        
        .form-section .card button.btn.btn-link.collapsed img {
            transform: rotate(0deg);
            transition: all .5s ease;
        }
        
        .form-section .card button.btn.btn-link img {
            transform: rotate(90deg);
            transition: all .5s ease;
        }
        
        @media (max-width: 768px) {
            header .banner-text {
                position: absolute;
                top: 35%;
                left: 3%;
                transform: translateY(-20%);
            }
        }
        
        @media (max-width: 368px) {
            .bench-mark {
                margin-top: 8.5em !important;
            }
        }
        
        section .section-heading {
            font-size: 160%;
        }
        
        .top-customer h5,
        .testimonials .section-heading {
            font-size: 35px;
            line-height: 40px;
            margin-bottom: 10px;
        }
        
        @media (max-width: 767px) {
            .top-customer h5,
            .testimonials .section-heading {
                font-size: 25px;
            }
        }
        
        .top-customer h4 {
            font-size: 25px;
            line-height: 40px;
            margin-bottom: 10px;
        }
        
        .top-customer p {
            font-size: inherit;
            line-height: 30px;
        }
        
        .top-customer p a:link,
        .top-customer p a:hover,
        .top-customer p a:active {
            background-color: #131D33 !important;
            color: white;
        }
    </style>
</head>

<body>
    <nav class="navbar fixed-top navbar-expand-lg navbar-light p-3">
        <a class="navbar-brand" href="default.aspx"><img src="assets/images/logo.png" alt="" class="img-fluid"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-md-auto mr-0 ml-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarServicesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Services
                      </a>
                    <div class="dropdown-menu" aria-labelledby="navbarServicesDropdown">
                        <a class="dropdown-item" href="dashboard/make-deposit.aspx">Make Deposit</a>
                        <a class="dropdown-item" href="dashboard/transfer.aspx">Transfer</a>
                        <a class="dropdown-item" href="dashboard/withdrawal.aspx">Withdraw</a>
                        <a class="dropdown-item" href="dashboard/fund-account.aspx">Fund Account</a>
                        <!--<a class="dropdown-item" href="#">Savease Business</a>-->
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarAboutDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            About Us
                          </a>
                    <div class="dropdown-menu" aria-labelledby="navbarAboutDropdown">
                        <a class="dropdown-item" href="about.aspx">About</a>
                        <!--<a class="dropdown-item" href="meet-team.aspx">Meet our Team</a>-->
                        <a class="dropdown-item" href="faq.aspx">FAQ</a>
                        <!--<a class="dropdown-item" href="#">Testimonials</a>-->
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.aspx">Contact Us</a>
                </li>
            </ul>
            <ul class="navbar-nav my-2 my-lg-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Support
                            </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="sales-support.aspx">Sales Support</a>
                        <a class="dropdown-item" href="technical-support.aspx">Technical Support</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link mr-2" href="register.aspx">Create Account</a>
                </li>
                <li class="nav-item">
                    <a class="btn my-2 my-sm-0" href="login.aspx">Login | Register</a>
                </li>
            </ul>
        </div>
    </nav>


    <section class="container mt-md-5 form-section">
        <div class="row justify-content-center">
            <div class="col-12 pt-3 pb-3">
                <div class="row justify-content-center align-items-center">
                    <h5 class="col-12 section-heading text-center mt-5" style="margin-bottom: 15px;">Frequently Asked Questions</h5>
                    <div class="col-12">
                        <div class="accordion" id="accordionExample">
                            <div class="card">
                                <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <div class="card-header row" id="headingOne">
                                        <h5 class="col-11 mb-0">
                                                What is Savease?
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>

                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Savease is a financial solution that solves the complex problem of making deposits and savings. It is available as a USSD App, Mobile App, and a Web App. It adopts the style of scratch cards, but uses preloaded prepaid deposit pin as exchange for value,
                                        thereby translating paper money into electronic money which is then understood electronically. It is helping millions of people save their money, due to convenience it presents and represents. It has broken the
                                        banking barrier of distance, space and structure.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <div class="card-header row" id="headingTwo">
                                        <h5 class="col-11 mb-0">
                                                Getting started with Savease
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                    <div class="card-body">
                                        You can get started on any of the following: USSD, Mobile App and Web App. To use the USSD App, kindly dial the *0456#, then follow the on-screen options to sign up to Savease. You can use the Mobile App by downloading it from Playstore for Android users
                                        or Applestore for IOS users. When downloaded, navigate to the Register now page, then fill in the required information. You can also log on to www.savease.ng, then nagivate to sign up page.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <div class="card-header row" id="headingThree">
                                        <h5 class="col-11 mb-0">
                                                What is a username
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                    <div class="card-body">
                                        A username is a unique identification used by a person with access to the Savease online services
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    <div class="card-header row" id="headingFour">
                                        <h5 class="col-11 mb-0">
                                                Changing your password
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseFour" class="collapse" aria-labelledby="headingfour" data-parent="#accordionExample">
                                    <div class="card-body">
                                        To change your password, log on to Savease, then navigate to your profile page. Click on Change Password
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                    <div class="card-header row" id="headingFive">
                                        <h5 class="col-11 mb-0">
                                                Forgot Password
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
                                    <div class="card-body">
                                        To change your password, kindly go to your login page. Click on Forgot Password. Type in your Savease ID, which is also your wallet/account number. A password change link will be generated and sent to email address used during registration.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                    <div class="card-header row" id="headingSix">
                                        <h5 class="col-11 mb-0">
                                                How to make a deposit to your wallet/account
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Kindly locate and purchase a Savease prepaid deposit card with the equivalent value of money from the nearest authorized vendor. Open the Savease mobile app and login. Select the Deposit icon on the dashboard. Select self deposit. Provide the card pin
                                        then proceed by clicking the make deposit button. A success message will be sent if transaction is successful, also a failure message will be received.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                                    <div class="card-header row" id="headingSeven">
                                        <h5 class="col-11 mb-0">
                                                How to make a deposit to another wallet/account
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseSeven" class="collapse" aria-labelledby="headingSeven" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Kindly locate and purchase a Savease prepaid deposit card with the equivalent value of money from the nearest authorized vendor. Open the Savease mobile app and login. Select the Deposit icon on the dashboard. Provide the card pin, wallet/account number,
                                        then proceed by clicking the make deposit button. A success message will be sent if transaction is successful, also a failure message will be received.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
                                    <div class="card-header row" id="headingEight">
                                        <h5 class="col-11 mb-0">
                                                How to transfer money from a wallet to another wallet
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseEight" class="collapse" aria-labelledby="headingEight" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Login. Click on the transfer icon or navigation button. Click on the select transfer type and select Savease Account. Provide the wallet ID of the recipient, followed by the amount to be transferred. Confirm the attestation. A success message will be
                                        sent if transaction is successful, else a failure message will be received.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
                                    <div class="card-header row" id="headingNine">
                                        <h5 class="col-11 mb-0">
                                                How to transfer money from your wallet to a bank account
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseNine" class="collapse" aria-labelledby="headingNine" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Login. Click on the Transfer icon or the navigation bar. Click on the dropdown tab or button to select the appropriate account. Click on other bank, then select the appropriate bank as available in the drop-down tab. Insert the account number of the recipient,
                                        followed by the amount to be transferred. Confirm the attestation. A success message will be sent if transaction is successful, also a failure message will be received.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
                                <div class="card-header row" id="headingTen">
                                    <h5 class="col-11 mb-0">
                                            How to become a Vendor on Savease
                                    </h5>
                                    <div class="col-1">
                                        <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                    </div>
                                </div>
                            </button>
                                <div id="collapseTen" class="collapse" aria-labelledby="headingTen" data-parent="#accordionExample">
                                    <div class="card-body">
                                        All registered Savease users are Vendors. Login to Savease, then navigate to the buy voucher icon and vendor table. On the vendor table, click on Request for Vendor Materials. A Savease representative will contact you to complete your registration.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseEleven" aria-expanded="false" aria-controls="collapseEleven">
                                    <div class="card-header row" id="headingEleven">
                                        <h5 class="col-11 mb-0">
                                                How to buy the Savease prepaid deposit cards
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseEleven" class="collapse" aria-labelledby="headingEleven" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Savease vouchers are available in stores, markets, minimarkets, neighboring shops, kiosks and any other place where human activities are done. You could also buy the prepaid cards from the mobile app or web app by logging in, then navigate to the buy
                                        voucher page.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwelve" aria-expanded="false" aria-controls="collapseTwelve">
                                    <div class="card-header row" id="headingTwelve">
                                        <h5 class="col-11 mb-0">
                                                What to do if a Savease voucher is misplaced or stolen
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseTwelve" class="collapse" aria-labelledby="headingTwelve" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Login to the web application. Click on Voucher Table navigation bar. Select the Block Voucher radio button. The block voucher button present an elevated section where vouchers can be blocked, whenever there is a case of misplacement or theft. You can
                                        block vouchers by their serial number, voucher pin or batch code. Once blocked, the vouchers will be rebatched and the rebatched vouchers will be sent to your inbox and voucher table.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThirteen" aria-expanded="false" aria-controls="collapseThirteen">
                                    <div class="card-header row" id="headingThirteen">
                                        <h5 class="col-11 mb-0">
                                                How to make money on Savease
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseThirteen" class="collapse" aria-labelledby="headingThirteen" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Everything
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFourteen" aria-expanded="false" aria-controls="collapseFourteen">
                                    <div class="card-header row" id="headingFourteen">
                                        <h5 class="col-11 mb-0">
                                                How to block vouchers and rebatch them
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseFourteen" class="collapse" aria-labelledby="headingFourteen" data-parent="#accordionExample">
                                    <div class="card-body">
                                        After logging in to the web application, navigate to the voucher table. You will find two radio button labelled Voucher Table and Block Voucher. Select the block voucher button, which present an elevated section where vouchers can be blocked, whenever
                                        there is a case of misplacement or theft. You can block vouchers by their serial number, voucher pin or batch code. Once blocked, the vouchers will be rebatched and the rebatched vouchers will be sent to your inbox
                                        and voucher table.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFifteen" aria-expanded="false" aria-controls="collapseFifteen">
                                    <div class="card-header row" id="headingFifteen">
                                        <h5 class="col-11 mb-0">
                                                How to view your transaction summary on Savease
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseFifteen" class="collapse" aria-labelledby="headingFifteen" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Login. On your dashboard, open the statement icon, which presents a list of your transactions. According to date, time,amount,beneficiary name, among others
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseSixteen" aria-expanded="false" aria-controls="collapseSixteen">
                                    <div class="card-header row" id="headingSixteen">
                                        <h5 class="col-11 mb-0">
                                                Who is an account officer
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseSixteen" class="collapse" aria-labelledby="headingSixteen" data-parent="#accordionExample">
                                    <div class="card-body">
                                        The account officer assigned to you is tasked with the responsibility of helping you gain financial literacy. His/her ultimate purpose is to help you build capital through savings then design financial packages to aid you gain financial independence.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseSeventeen" aria-expanded="false" aria-controls="collapseSeventeen">
                                    <div class="card-header row" id="headingSeventeen">
                                        <h5 class="col-11 mb-0">
                                                How can Savease help you gain financial independence
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseSeventeen" class="collapse" aria-labelledby="headingSeventeen" data-parent="#accordionExample">
                                    <div class="card-body">
                                        No. it is not bank. It is a financial technology corporation in partnership to the banking and other financial institutions.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseEighteen" aria-expanded="false" aria-controls="collapseEighteen">
                                    <div class="card-header row" id="headingEighteen">
                                        <h5 class="col-11 mb-0">
                                                Is Savease a bank
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseEighteen" class="collapse" aria-labelledby="headingEighteen" data-parent="#accordionExample">
                                    <div class="card-body">
                                        No. it is not bank.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseNineteen" aria-expanded="false" aria-controls="collapseNineteen">
                                    <div class="card-header row" id="headingNineteen">
                                        <h5 class="col-11 mb-0">
                                                Reporting a problem
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseNineteen" class="collapse" aria-labelledby="headingNineteen" data-parent="#accordionExample">
                                    <div class="card-body">
                                        From the mobile app, navigate to the complaint page and fill in as requested. Otherwise, call customer care on 456; or log on to www.savease.ng , then navigate to the compliant page to fill in the required information.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwenty" aria-expanded="false" aria-controls="collapseTwenty">
                                    <div class="card-header row" id="headingTwenty">
                                        <h5 class="col-11 mb-0">
                                                Updating Savease
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseTwenty" class="collapse" aria-labelledby="headingTwenty" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Periodically, modifications are made available to serve you better. This update will require you to download a new version from Google playstore or Apple store respectively. Updates on the web applications are automatic, and will not require you downloading
                                        anything. The USSD update are made available automatically, but with adequate user guide information as they become available.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwentyOne" aria-expanded="false" aria-controls="collapseTwentyOne">
                                    <div class="card-header row" id="headingTwentyOne">
                                        <h5 class="col-11 mb-0">
                                                How to use Savease on your computer
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseTwentyOne" class="collapse" aria-labelledby="headingTwentyOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        To use Savease on your computer, you will log on to the www.savease.ng from a web browser.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwentyTwo" aria-expanded="false" aria-controls="collapseTwentyTwo">
                                    <div class="card-header row" id="headingTwentyTwo">
                                        <h5 class="col-11 mb-0">
                                                Reinstalling Savease
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseTwentyTwo" class="collapse" aria-labelledby="headingTwentyTwo" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Kindly go to google playstore or apple store respectively. Download and install the Savease app.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwentyThree" aria-expanded="false" aria-controls="collapseTwentyThree">
                                    <div class="card-header row" id="headingTwentyThree">
                                        <h5 class="col-11 mb-0">
                                                Where can i buy Savease Voucher
                                        </h5>
                                    </div>
                                </button>
                                <div id="collapseTwentyThree" class="collapse" aria-labelledby="headingTwentyThree" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Savease vouchers are available in stores, markets, minimarkets, neighbouring shops, kiosks and any other place where human activities are done. You could also buy the prepaid cards from the mobile app or web app by logging in, then navigate to the buy
                                        voucher page.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwentyFour" aria-expanded="false" aria-controls="collapseTwentyFour">
                                    <div class="card-header row" id="headingTwentyFour">
                                        <h5 class="col-11 mb-0">
                                                How many wallet can i have
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseTwentyFour" class="collapse" aria-labelledby="headingTwentyFour" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Due to regulations, you can only have a maximum of 3 wallets attached to a BVN.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwentyFive" aria-expanded="false" aria-controls="collapseTwentyFive">
                                    <div class="card-header row" id="headingTwentyFive">
                                        <h5 class="col-11 mb-0">
                                                How to fund your account
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseTwentyFive" class="collapse" aria-labelledby="headingTwentyFive" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Login. On your dashboard, click on your fund account icon. Provide details from credit card you intend to fund your account with. An OTP(One Time Password) will be sent to the credit card telephone number which will be provided upon request. Your account
                                        will be credited and updated with the equivalent.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwentySix" aria-expanded="false" aria-controls="collapseTwentySix">
                                    <div class="card-header row" id="headingTwentySix">
                                        <h5 class="col-11 mb-0">
                                                What is Pin Code
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseTwentySix" class="collapse" aria-labelledby="headingTwentySix" data-parent="#accordionExample">
                                    <div class="card-body">
                                        This is your private identification number which serves as a personal secret number that shouldn't be disclosed to any other person, which will serve as your true authentication and signature.
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwentySeven" aria-expanded="false" aria-controls="collapseTwentySeven">
                                    <div class="card-header row" id="headingTwentySeven">
                                        <h5 class="col-11 mb-0">
                                                How to make withdrawal
                                        </h5>
                                        <div class="col-1">
                                            <img src="assets/images/chevron-right.png" alt="" class="img-fluid" width="7" height="7">
                                        </div>
                                    </div>
                                </button>
                                <div id="collapseTwentySeven" class="collapse" aria-labelledby="headingTwentySeven" data-parent="#accordionExample">
                                    <div class="card-body">
                                        Login. CLick on the withdraw icon on the dashboard. Provide the receiving bank details, followed with your personal secret pin, then click on the verify button. Automatically the transaction will be processed and a credit alert will received. Please note
                                        that to make a withdrawal you must have a minimum balance of one thousand five hundred naira.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="footer-div col-12 pt-3 pb-3">
        <div class="row justify-content-center align-items-center">
            <div class="col-12 col-sm-6 col-md-8 mb-2 mb-md-0">
                Copyrights © 2019 All Rights Reserved. Powered by Savease Nigeria LLC, a sub-class of Savease Africa.
            </div>
            <div class="col-12 col-sm-6 col-md-4 text-center">
                <div class="row align-items-center">
                    <ul class="col-12 m-0">
                        <li class="mt-1">
                            <a href="">
                                <img src="assets/images/linkedin.png" alt="" width="27" height="27">
                            </a>
                        </li>
                        <li class="mt-1">
                            <a href="">
                                <img src="assets/images/instagram.png" alt="" width="27" height="27">
                            </a>
                        </li>
                        <li class="mt-1">
                            <a href="">
                                <img src="assets/images/twitter.png" alt="" width="27" height="27">
                            </a>
                        </li>
                        <li class="mt-1">
                            <a href="">
                                <img src="assets/images/facebook.png" alt="" width="27" height="27">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>


    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>

</body>
</html>
