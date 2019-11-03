<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sales-support.aspx.cs" Inherits="saveasze.sales_support" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale = 1.0,maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Savease Frontend</title>
    <link rel="stylesheet" href="assets/css/slick-theme.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/css/all.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <link rel="icon" href="assets/images/fav_icon.ico" type="image/ico">

    <style>
        body {
            background-image: url('dashboard/assets/images/dashboard-bg.png');
            background-position: right bottom;
            background-repeat: no-repeat;
            background-size: cover;
        }
        
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
            margin-top: 70px;
        }
        
        section ul li {
            list-style: none;
            padding: 3px 0px !important;
            color: #848484;
            line-height: 4px;
        }
        
        section ul li span {
            font-weight: 600;
            color: #fa9928;
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
        <a class="navbar-brand" href="index.html"><img src="assets/images/logo.png" alt="" class="img-fluid"></a>
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
                        <a class="dropdown-item" href="dashboard/make-deposit.html">Make Deposit</a>
                        <a class="dropdown-item" href="dashboard/transfer.html">Transfer</a>
                        <a class="dropdown-item" href="dashboard/withdrawal.html">Withdraw</a>
                        <a class="dropdown-item" href="dashboard/fund-account.html">Fund Account</a>
                        <!--<a class="dropdown-item" href="#">Savease Business</a>-->
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarAboutDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            About Us
                          </a>
                    <div class="dropdown-menu" aria-labelledby="navbarAboutDropdown">
                        <a class="dropdown-item" href="about.html">About</a>
                        <!--<a class="dropdown-item" href="meet-team.html">Meet our Team</a>-->
                        <a class="dropdown-item" href="faq.html">FAQ</a>
                        <!--<a class="dropdown-item" href="#">Testimonials</a>-->
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.html">Contact Us</a>
                </li>
            </ul>
            <ul class="navbar-nav my-2 my-lg-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Support
                            </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="sales-support.html">Sales Support</a>
                        <a class="dropdown-item" href="technical-support.html">Technical Support</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link mr-2" href="register.html">Create Account</a>
                </li>
                <li class="nav-item">
                    <a class="btn my-2 my-sm-0" href="login.html">Login | Register</a>
                </li>
            </ul>
        </div>
    </nav>


    <section class="container-fluid mt-md-5 form-section">
        <div class="row justify-content-center">
            <h5 class="col-12 section-heading text-center">Sales Support</h5>
            <div class="col-lg-7 col-md-7 col-12 pt-3 pb-3 mt-4">
                <div class="row justify-content-center align-items-center">
                    <form action="#" runat="server" id="form1" class="col-12 col-md-10">
                        <div class="row justify-content-center">
                            <div class="form-group col-md-6 col-12 mb-4">
                                <input type="text" runat="server" id="txtname" placeholder="Full Name" required>
                            </div>
                            <div class="form-group col-md-6 col-12 mb-4">
                                <input type="text" runat="server" id="txtsaveid" placeholder="Savease Id" required>
                            </div>
                            <div class="form-group col-12 mb-4">
                                <input type="email" runat="server" id="txtemail" placeholder="Email Address" required>
                            </div>
                            <div class="form-group col-12 mb-4">
                                <input type="number" runat="server" id="txtphone" placeholder="Phone Number" required>
                            </div>
                            <div class="form-group col-12 mb-4">
                                <input type="text" runat="server" id="txtsubject" placeholder="Subject" required>
                            </div>
                            <div class="form-group col-12 mb-4">
                                <textarea rows="4" runat="server" id="txtmessage" placeholder="Message Here" required></textarea>
                            </div>
                            <div class="form-group col-10 mt-3">
                                <div class="row justify-content-center">
                                   <%-- <button type="submit" class="btn col-6 orange-bg p-2">Send Message</button>--%>
                                    <asp:Button Text="Send Message" CssClass="btn col-6 orange-bg p-2" runat="server" ID="btnsend" OnClick="btnsend_Click"/>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-5 col-12 pt-3 pb-3 mt-md-3 mt-0">
                <div class="row justify-content-center align-items-center">

                    <div class="col-12 mb-2">
                        <div class="col-12 grey-bg pt-3 pb-1">
                            <div class="row justify-content-center">
                                <div class="col-3">
                                    <img src="assets/images/supporting-user.png" alt="" class="img-fluid">
                                </div>
                                <div class="col-9">
                                    <h5 class="col-12">Quick Contact</h5>
                                    <ul class="col-12">
                                        <li class="row">
                                            <span class="col-2">Email: </span>
                                            <p class="col-10">sales@savease.ng</p>
                                        </li>
                                        <li class="row">
                                            <span class="col-2">Phone: </span>
                                            <p class="col-10">09090692222</p>
                                        </li>
                                        <li class="row">
                                            <span class="col-2">phone:</span>
                                            <p class="col-10">08027226627</p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 mt-5">
                        <div class="row justify-content-center">
                            <img src="assets/images/24-hours-support.png" alt="">
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
