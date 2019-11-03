<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="saveasze.about" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale = 1.0,maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Savease - Instant Deposit </title>
    <link rel="stylesheet" href="assets/css/slick-theme.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/css/all.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <link rel="icon" href="assets/images/fav_icon.ico" type="image/ico">

    <style>
        header {
            position: relative;
            /* width: 100vw; */
            height: 65vh;
            background: linear-gradient(175.98deg, rgba(19, 29, 51, 0.54) -173.17%, rgba(19, 29, 51, 0.08) 25.78%, rgba(101, 140, 226, 0.1) 63.23%, rgba(19, 29, 51, 0.01) 94.68%, rgba(19, 29, 51, 0) 109.72%);
        }
        
        header .banner-text {
            position: absolute;
            top: 57%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        
        @media (max-width: 768px) {
            header .banner-text {
                position: absolute;
                top: 38%;
                left: 3%;
                transform: translateY(-20%);
            }
        }
        
        @media (max-width: 368px) {
            .bench-mark {
                margin-top: 8.5em !important;
            }
        }
        
        .banner-text h4 {
            font-size: 30px;
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

    <header>
        <div class="banner-text col-md-10 col-12 mt-md-5 text-center">
            <div class="row justify-content-center">
                <h4 class="col-12 col-lg-9">We are changing the way the world does saving,Making savings simple and effortless</h4>
                <p class="col-12 col-lg-9">
                    The foremost corporation in the production, promotion and marketing of savings habit, inspired to deliver an innovative digital based approach to savings and deposits, with a simple mission to create a world where developing savings habit is simple and
                    practicable, structured upon a belief that proper savings habit is fundamental to capital development and financial independence .
                </p>
            </div>
        </div>
    </header>

    <section class="container-fluid about mt-5 bench-mark">
        <div class="row">
            <div class="col-12 col-lg-3 col-md-6 text-center mb-3">
                <h5 class="col-12 section-heading mb-2">$2.5B</h5>
                <div class="col-12">
                    in payment process
                </div>
            </div>
            <div class="col-12 col-lg-3 col-md-6 text-center mb-3">
                <h5 class="col-12 section-heading mb-2">100M</h5>
                <div class="col-12">
                    transactions processed
                </div>
            </div>
            <div class="col-12 col-lg-3 col-md-6 text-center mb-3">
                <h5 class="col-12 section-heading mb-2">50</h5>
                <div class="col-12">
                    bank partners in Africa
                </div>
            </div>
            <div class="col-12 col-lg-3 col-md-6 text-center mb-3">
                <h5 class="col-12 section-heading mb-2">50M</h5>
                <div class="col-12">
                    active users
                </div>
            </div>
        </div>
    </section>

    <section class="container-fluid banner-2 mt-5 mb-0 p-4">
        <div class="row mt-4 justify-content-center align-items-center">
            <div class="col-lg-6 col-md-12 col-12 row justify-content-center mb-5">
                <img src="assets/images/undraw_team_spirit.png" alt="" class="img-fluid">
            </div>
            <div class="col-lg-6 col-md-12 col-12 mt-2">
                <h4>
                    Africa's first deposit gateway.
                </h4>
                <p>
                    SAVEASE was established to create simple solutions to complex savings problem. It was designed to initiate useful strategies that will promote effective savings culture among Africans. <br><br>It has created the first ever instant
                    deposit scratch card, offering its users: a simple and convenient way to make deposits into distinctive bank accounts across the continent starting from Nigeria. <br><br>We recognize that good savings habit is vital to capital development
                    and financial independence; thus, we have designed and provided a simple, yet compelling approach to help every person in the society achieve this fundamental goal. .
                </p>
            </div>
        </div>
        <div class="row mt-4 justify-content-center align-items-center">
            <div class="col-lg-5 col-md-12 col-12 mt-2">
                <h4>
                    Our Mission
                </h4>
                <p>
                    To deliver an innovative digital based method for deposits payment and savings. Thus, leading in the , production promotion and marketing of effective savings habit.
                </p>
            </div>
            <div class="col-lg-5 col-md-12 col-12 text-center mb-5">
                <img src="assets/images/undraw_launching.png" alt="" class="img-fluid">
            </div>
        </div>
        <div class="row mt-4 justify-content-center align-items-center">
            <div class="col-lg-5 col-md-12 col-12 row justify-content-center mb-5">
                <img src="assets/images/undraw_investing.png" alt="" class="img-fluid">
            </div>
            <div class="col-lg-6 col-md-12 col-12 mt-2">
                <h4>
                    Our Value
                </h4>
                <p>
                    Developers love our thorough, well-documented APIs that let you to build everything from simple weekend projects, to complex financial products serving hundreds of thousands of customers. If you can imagine it, you can build it with Paystack.
                </p>
                <p><img src="assets/images/right-arrow.png" alt="" class="mr-2">Collect one-time and recurring payments from your app or website</p>
                <p><img src="assets/images/right-arrow.png" alt="" class="mr-2">Make instant transfers</p>
                <p><img src="assets/images/right-arrow.png" alt="" class="mr-2">Retrieve all your transaction and customer data </p>
                <p><img src="assets/images/right-arrow.png" alt="" class="mr-2">Verify the identity of customers</p>
            </div>
        </div>
        <div class="row mt-4 justify-content-center align-items-center">
            <div class="col-lg-5 col-md-12 col-12 mt-2">
                <h4>
                    Our Value
                </h4>
                <p>
                    Developers love our thorough, well-documented APIs that let you to build everything from simple weekend projects, to complex financial products serving hundreds of thousands of customers. If you can imagine it, you can build it with Paystack.
                </p>
                <p><img src="assets/images/right-arrow.png" alt="" class="mr-2">Collect one-time and recurring payments from your app or website</p>
                <p><img src="assets/images/right-arrow.png" alt="" class="mr-2">Make instant transfers</p>
                <p><img src="assets/images/right-arrow.png" alt="" class="mr-2">Retrieve all your transaction and customer data </p>
                <p><img src="assets/images/right-arrow.png" alt="" class="mr-2">Verify the identity of customers</p>
            </div>
            <div class="col-lg-5 col-md-12 col-12 text-center mb-5">
                <img src="assets/images/undraw_forming_ideas.png" alt="" class="img-fluid">
            </div>
        </div>
    </section>


    <footer class="container-fluid">
        <div class="row">
            <div class="col-12 row pt-4 pb-4">
                <div class="col-12 col-md-4 col-lg-3 logo d-flex mb-md-0 mb-5">
                    <img src="assets/images/logo.png" alt="" style="width: 120px;">
                </div>
                <div class="col-12 col-md-4 col-lg-2">
                    <h5 class="col-12 section-heading">Discover Savease</h5>
                    <ul class="col-12">
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Privacy and Terms</a></li>
                        <li><a href="#">Working With Us</a></li>
                        <li><a href="#">Our Solutions</a></li>
                        <li><a href="#">Savease Social Media</a></li>
                    </ul>
                </div>
                <div class="col-12 col-md-4 col-lg-2">
                    <h5 class="col-12 section-heading">Get in Touch</h5>
                    <ul class="col-12">
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">Technical Support</a></li>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="tel:+2349090692222">Call Us Now 0700SAVEASE</a></li>
                        <li><a href="mailto:Info@savease.ng">Send Us an email Info@savease.ng</a></li>
                    </ul>
                </div>
                <div class="col-12 col-md-4 col-lg-2">
                    <h5 class="col-12 section-heading">Information For</h5>
                    <ul class="col-12">
                        <li><a href="#">Vendor / Savease Agent</a></li>
                        <li><a href="#">Join Our Team</a></li>
                    </ul>
                </div>
                <div class="col-12 col-md-4 col-lg-2">
                    <h5 class="col-12 section-heading">Location</h5>
                    <ul class="col-12">
                        <p>
                            1C, Evo Crescent, GRA II, Portharcourt, Rivers State, Nigeria.
                        </p>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
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

    <button id="scrollButton" class="scroll-button" onclick="topFunction()">
        <img src="assets/images/up-arrow.png" alt="" width="17" height="17">
    </button>

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script>
        // function openTab(evt, cityName) {
        //     var i, tabcontent, tablinks;
        //     tabcontent = document.getElementsByClassName("tab-content");
        //     for (i = 0; i < tabcontent.length; i++) {
        //         tabcontent[i].style.display = "none";
        //     }
        //     tablinks = document.getElementsByClassName("tab-button");
        //     for (i = 0; i < tablinks.length; i++) {
        //         tablinks[i].className = tablinks[i].className.replace(" active", "");
        //     }
        //     document.getElementById(cityName).style.display = "block";
        //     evt.currentTarget.className += " active";
        // }

        {
            // When the user scrolls down 20px from the top of the document, show the button
            window.onload = window.onscroll = function() {
                scrollFunction()
            };


            function scrollFunction() {
                if (document.body.scrollTop > 2800 || document.documentElement.scrollTop > 2800) {
                    document.getElementById("scrollButton").style.display = "block";
                } else {
                    document.getElementById("scrollButton").style.display = "none";
                }
            }

            // When the user clicks on the button, scroll to the top of the document

            function topFunction() {
                document.body.scrollTop = 0;
                document.body.style.scrollBehaviour = 'smooth';
                document.documentElement.style.scrollBehavior = 'smooth';
                document.documentElement.scrollTop = 0;
            }
        }
    </script>
</body>
</html>
