<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="saveasze.Contact" %>

<%@ Register Src="~/Testimonial.ascx" TagPrefix="uc1" TagName="Testimonial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<header>
        <div class="banner-text col-md-5 col-12 mt-md-5">
            <h4>We are helping millions of people<br> save their money.</h4>
            <p>We have solved the banking hitch of distance, space and structure. <br>You can now make deposit into distinctive bank account without the need to walk into a banking hall.</p>
            <div class="button-container">
                <a class="btn orange-button m-2" href="verifypin.aspx">Verify Pin</a>
                <a class="btn orange-outline m-2" href="dashboard/make-deposit.aspx">Make Deposit</a>
            </div>
            <!-- <div class="button-container-2">
                <a class="btn m-1 text-center" href="#"><img src="assets/images/google.png" alt=""></a>
                <a class="btn m-1" href="#"><img src="assets/images/apple.png" alt=""></a>
            </div> -->
        </div>
    </header>

    <section class="container-fluid about mt-3">
        <div class="row">
            <div class="col-md-4 col-12 p-0 tab-container">
                <div class="col-12 tab-content" id="ourVision">
                    <h5 class="text-left col-12 section-heading">OUR VISION</h5>
                    <div class="col-12 text-left tab-content-text">
                        To create an africa where effective savings practice is effortless and deposit payment is simple.
                    </div>
                </div>
                <div class="col-12 tab-content" id="ourMission">
                    <h5 class="text-left col-12 section-heading">OUR MISSION</h5>
                    <div class="col-12 text-left tab-content-text">
                        To deliver an innovative digital based method for deposits payment and savings. Thus, leading in the , production promotion and marketing of effective savings habit.
                    </div>
                </div>
                <div class="col-12 tab-content" id="ourValues">
                    <h5 class="text-left col-12 section-heading">OUR VALUES</h5>
                    <div class="col-12 text-left tab-content-text">
                        We own an unlimited technological space, therefore we manipulate it to benefit the different class of men. We cast on integrity, effectiveness, simplicity and multiplication. We perform, so you prosper.
                    </div>
                </div>
                <div class="col-12 tab-content" id="ourBrand">
                    <h5 class="text-left col-12 section-heading">OUR BRAND</h5>
                    <div class="col-12 text-left tab-content-text">
                        We deliver simplicity and effectiveness, which is casted on integrity.
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-12 text-left">
                <p class="col-12 about-text">
                    SAVEASE was established to create simple solutions to complex savings problem. It was designed to initiate useful strategies that will promote effective savings culture among Africans.<br><br> It has created the first ever instant
                    deposit scratch card, offering its users: a simple and convenient way to make deposits into distinctive bank accounts across the continent starting from Nigeria.<br><br> We recognize that good savings habit is vital to capital development
                    and financial independence; thus, we have designed and provided a simple, yet compelling approach to help every person in the society achieve this fundamental goal.
                </p>
                <div class="col-12 span-container p-0">
                    <span><button class="tab-button" onclick="openTab(event, 'ourVision')">Our Vision</button></span>
                    <span><button class="tab-button" onclick="openTab(event, 'ourMission')">Our Mission</button></span>
                    <span><button class="tab-button" onclick="openTab(event, 'ourValues')">Our Values</button></span>
                    <span><button class="tab-button" onclick="openTab(event, 'ourBrand')">Our Brand</button></span>
                </div>
            </div>
        </div>
    </section>

    <section class="container-fluid banner-2 mt-5 p-4 mb-0">
        <div class="row mt-4 justify-content-center clearfix">
            <div class="col-lg-6 col-md-12 col-12 row justify-content-center mb-5">
                <img src="assets/images/NEW.png" alt="" width="300">
            </div>
            <div class="col-lg-6 col-md-12 col-12 mt-2">
                <h4>
                    Build custom payments experiences with well-documented APIs
                </h4>
                <p>
                    Developers love our thorough, well-documented APIs that let you to build everything from simple weekend projects, to complex financial products serving hundreds of thousands of customers. If you can imagine it, you can build it with Paystack.
                </p>
                <p><img src="assets/images/right-arrow.png" alt="" class="mr-2">Collect one-time and recurring payments from your app or website</p>
                <p><img src="assets/images/right-arrow.png" alt="" class="mr-2">Make instant transfers</p>
                <p><img src="assets/images/right-arrow.png" alt="" class="mr-2">Retrieve all your transaction and customer data </p>
                <p><img src="assets/images/right-arrow.png" alt="" class="mr-2">Verify the identity of customers</p>
            </div>
            <div class="col-lg-5 col-md-12 col-12 mt-2 move-y-text">
                <h4>
                    Build custom payments experiences with well-documented APIs
                </h4>
                <p>
                    Developers love our thorough, well-documented APIs that let you to build everything from simple weekend projects, to complex financial products serving hundreds of thousands of customers. If you can imagine it, you can build it with Paystack.
                </p>
                <p><img src="assets/images/right-arrow.png" alt="" class="mr-2">Collect one-time and recurring payments from your app or website</p>
                <p><img src="assets/images/right-arrow.png" alt="" class="mr-2">Make instant transfers</p>
                <p><img src="assets/images/right-arrow.png" alt="" class="mr-2">Retrieve all your transaction and customer data </p>
                <p><img src="assets/images/right-arrow.png" alt="" class="mr-2">Verify the identity of customers</p>
            </div>
            <div class="col-lg-5 col-md-12 col-12 text-center mb-5 move-y-img">
                <img src="assets/images/1.png" alt="" width="400">
            </div>
            <div class="col-lg-5 col-md-12 col-12 row justify-content-center mb-5">
                <img src="assets/images/new-card-display-4.png" alt="" width="400">
            </div>
            <div class="col-lg-6 col-md-12 col-12 mt-2">
                <h4>
                    Build custom payments experiences with well-documented APIs
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
    </section>

    <section class="container-fluid banner-3 pl-5 pr-5 mt-0 mb-0">
        <div class="row align-items-center">
            <!-- <div class="col-12 col-md-6">
                <h2 style="font-weight: 600">
                    Simple and straight-forward <br> documentation for everybody
                </h2>
                <p>
                    Rave is simple to use, and even simpler to use our API. Developers<br> are people too and we’ve written our documentation for the people<br> that will integrate Rave.
                </p>
            </div>
            <div class="col-12 col-md-6 text-center">
                <img src="assets/images/newGroup.png" alt="" style="width: 85%">
            </div> -->
            <div class="col-12 p-0 pt-3 text-center">
                <img src="assets/images/pic-2.png" alt="" class="banner-4" style="width: 70%;">
            </div>
        </div>
    </section>

    <!-- <section class="container-fluid banner-3 mt-5">
        <div class="row">
            <div class="col-12 row multiple-items mx-auto">
                <div class="col-md-4 col-sm-6 col-12 p-sm-3">
                    <div class="col">
                        <img src="assets/images/atm-card.png" alt="">
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-12 p-sm-3">
                    <div class="col">
                        <img src="assets/images/atm-card.png" alt="">
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-12 p-sm-3">
                    <div class="col">
                        <img src="assets/images/atm-card.png" alt="">
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-12 p-sm-3">
                    <div class="col">
                        <img src="assets/images/atm-card.png" alt="">
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-12 p-sm-3">
                    <div class="col">
                        <img src="assets/images/atm-card.png" alt="">
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-12 p-sm-3">
                    <div class="col">
                        <img src="assets/images/atm-card.png" alt="">
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-12 p-sm-3">
                    <div class="col">
                        <img src="assets/images/atm-card.png" alt="">
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-12 p-sm-3">
                    <div class="col">
                        <img src="assets/images/atm-card.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </section> -->

    <section class="container-fluid banner-3 p-0 mt-0 mb-0 text-center">
        <img src="assets/images/all.png" alt="" style="width: 80%;">
        <!-- <h3 class="col-12 text-center">adequate denomination for every situation.</h3> -->
    </section>
    <!-- <section class="container-fluid what-we-do">
        <div class="row">
            <h5 class="text-center col-12 section-heading">WHAT WE DO</h5>
            <p class="col-12 text-center">
                Our suite of services are the building block for you saving with ease
            </p>
            <div class="col-12 row multiple-items mx-auto">
                <div class="col-md-4 col-sm-6 col-12 p-sm-3">
                    <div class="card">
                        <div class="card-header">
                            <img src="assets/images/iconfinder_Finance_saving.png" class="text-center">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Savings & Goals</h5>
                            <p class="card-text">A contemporary and innovation approach to the production, promotion, and marketing of savings habit. Just Buy, Scratch n’ Click.</p>
                            <a href="#" class="card-link"><img src="assets/images/right-arrow.png" class="d-inline mr-1">see more...</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-12 p-sm-3">
                    <div class="card">
                        <div class="card-header">
                            <img src="assets/images/iconfinder_Finance_saving.png" class="text-center">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Savings & Goals</h5>
                            <p class="card-text">A contemporary and innovation approach to the production, promotion, and marketing of savings habit. Just Buy, Scratch n’ Click.</p>
                            <a href="#" class="card-link"><img src="assets/images/right-arrow.png" class="d-inline mr-1">see more...</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-12 p-sm-3">
                    <div class="card">
                        <div class="card-header">
                            <img src="assets/images/iconfinder_Finance_saving.png" class="text-center">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Savings & Goals</h5>
                            <p class="card-text">A contemporary and innovation approach to the production, promotion, and marketing of savings habit. Just Buy, Scratch n’ Click.</p>
                            <a href="#" class="card-link"><img src="assets/images/right-arrow.png" class="d-inline mr-1">see more...</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->


    <!-- <section class="container-fluid why-us">
        <div class="row"> -->
    <!-- <h5 class="text-center col-12 section-heading">WHY CHOOSE US</h5> -->
    <!-- <div class="col-12 mx-auto multiple-items">
                <div class="col-md-3 col-12 p-2">
                    <div class="img-card col-12">
                        <div class="col-12 p-0 card-header">
                            <img src="assets/images/ussd.jpg" class="img-fluid">
                        </div>
                        <div class="col-12 card-body">
                            <h5 class="primary-heading col-12">Strengthening Savings Habit</h5>
                            <p class="col-12">
                                Savings habit among Nigerians is very low. This is because attention and the provision of a structured system to help manage the petty finances...
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-12 p-2">
                    <div class="img-card col-12">
                        <div class="col-12 p-0 card-header">
                            <img src="assets/images/ussd.jpg" class="img-fluid">
                        </div>
                        <div class="col-12 card-body">
                            <h5 class="primary-heading col-12">Strengthening Savings Habit</h5>
                            <p class="col-12">
                                Savings habit among Nigerians is very low. This is because attention and the provision of a structured system to help manage the petty finances...
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-12 p-2">
                    <div class="img-card col-12">
                        <div class="col-12 p-0 card-header">
                            <img src="assets/images/ussd.jpg" class="img-fluid">
                        </div>
                        <div class="col-12 card-body">
                            <h5 class="primary-heading col-12">Strengthening Savings Habit</h5>
                            <p class="col-12">
                                Savings habit among Nigerians is very low. This is because attention and the provision of a structured system to help manage the petty finances...
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-12 p-2">
                    <div class="img-card col-12">
                        <div class="col-12 p-0 card-header">
                            <img src="assets/images/ussd.jpg" class="img-fluid">
                        </div>
                        <div class="col-12 card-body">
                            <h5 class="primary-heading col-12">Strengthening Savings Habit</h5>
                            <p class="col-12">
                                Savings habit among Nigerians is very low. This is because attention and the provision of a structured system to help manage the petty finances...
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-12 p-2">
                    <div class="img-card col-12">
                        <div class="col-12 p-0 card-header">
                            <img src="assets/images/ussd.jpg" class="img-fluid">
                        </div>
                        <div class="col-12 card-body">
                            <h5 class="primary-heading col-12">Strengthening Savings Habit</h5>
                            <p class="col-12">
                                Savings habit among Nigerians is very low. This is because attention and the provision of a structured system to help manage the petty finances...
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-12 p-2">
                    <div class="img-card col-12">
                        <div class="col-12 p-0 card-header">
                            <img src="assets/images/ussd.jpg" class="img-fluid">
                        </div>
                        <div class="col-12 card-body">
                            <h5 class="primary-heading col-12">Strengthening Savings Habit</h5>
                            <p class="col-12">
                                Savings habit among Nigerians is very low. This is because attention and the provision of a structured system to help manage the petty finances...
                            </p>
                        </div>
                    </div>
                </div>
            </div> -->
    <!-- <div class="col-12 p-0 text-center">
                <img src="assets/images/pic-2.png" alt="" class="banner-4">
            </div> -->
    <!-- </div>
    </section> -->

    <section class="container-fluid testimonials mt-0 pt-4 pb-2 pl-1 pr-1 pl-lg-3 pr-lg-3">
        <div class="row justify-content-center">
            <h5 class="text-center col-12 section-heading">Saver of the Week!</h5>
            <div class="col-md-2 col-10 img">
            </div>
            <div class="col-md-4 col-12 m-4">
                <h4 class="section-heading">
                    Meet Tasha
                </h4>
                <p>
                    Consistently, we sparkle a focus on one saver, asking them inquiries about their reserve funds culture and how the item is explicitly helping them shape how they spend and put something aside for future duties.
                </p>
                <p><a href="" class="btn card-button">Meet Tasha</a></p>
            </div>
        </div>
        <div class="row mt-5 mb-3">
            <h5 class="text-center col-12 section-heading">Customer Testimonials</h5>
            <div class="col-12 row multiple-items mx-auto">
                <div class="col-lg-4 col-md-6 col-12 p-md-3 p-0">
                    <div class="card text-left">
                        <div class="card-body">
                            <p class="card-text">
                                As a busy business owner, i need 21st century technology, backed by human touch. With savease i have both.
                            </p>
                        </div>
                        <div class="row p-3">
                            <div class="card-body col-6 mr-2">
                                <h6 class="card-title mb-1">Nnamdi Chima</h6>
                                <p class="card-text m-0">
                                    Business Man
                                </p>
                            </div>
                            <a href="#" class="card-link col-4"><img src="assets/images/Uzoma_Nwagba.jpg" class="img-fluid border-shadow"></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-12 p-md-3 p-0">
                    <div class="card text-left">
                        <div class="card-body">
                            <p class="card-text">
                                As a busy business owner, i need 21st century technology, backed by human touch. With savease i have both.
                            </p>
                        </div>
                        <div class="row p-3">
                            <div class="card-body col-6 mr-2">
                                <h6 class="card-title mb-1">Nnamdi Chima</h6>
                                <p class="card-text m-0">
                                    Business Man
                                </p>
                            </div>
                            <a href="#" class="card-link col-4"><img src="assets/images/Uzoma_Nwagba.jpg" class="img-fluid border-shadow"></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-12 p-md-3 p-0">
                    <div class="card text-left">
                        <div class="card-body">
                            <p class="card-text">
                                With savease i don't need to go ask for loan from any bank to grow my business. My business grew because i saved.
                            </p>
                        </div>
                        <div class="row p-3">
                            <div class="card-body col-6 mr-2">
                                <h6 class="card-title mb-1">Olaoluwa Ojo</h6>
                                <p class="card-text m-0">
                                    Trader
                                </p>
                            </div>
                            <a href="#" class="card-link col-4"><img src="assets/images/man-1.jpg" class="img-fluid border-shadow"></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-12 p-md-3 p-0">
                    <div class="card text-left">
                        <div class="card-body">
                            <p class="card-text">
                                Make Una help me thank this people oh, now i dey send money give my pikin for school from this village i dey so.
                            </p>
                        </div>
                        <div class="row p-3">
                            <div class="card-body col-6 mr-2">
                                <h6 class="card-title mb-1">Amaka Uche</h6>
                                <p class="card-text m-0">
                                    Petty Trader
                                </p>
                            </div>
                            <a href="#" class="card-link col-4"><img src="assets/images/market-1.jpg" class="img-fluid border-shadow"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="container-fluid partners">
        <div class="row justify-content-center">
            <h5 class="col-12 section-heading">Working with innovative brands</h5>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/Access-Bank-PLC-Logo.png" alt="" width="90" class="my-auto">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/Ecobank-Logo.png" alt="" width="80" height="100" class="img-fluid my-auto">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/First-Bank-Nigeria-Logo.png" alt="" width="80" height="100" class="img-fluid my-auto">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/First-City-Monument-Bank-Ltd-Logo.png" alt="" width="80" height="100" class="img-fluid my-auto">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/Guaranty-Trust-Bank-Logo.png" alt="" width="80" height="100" class="img-fluid my-auto">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/Standard-Chartered-Logo.png" alt="" width="100" class="my-auto">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/Sterling-Bank-Plc-Logo.png" alt="" width="60" class="my-auto">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/United-Bank-for-Africa-Logo.png" alt="" width="80" height="100" class="img-fluid my-auto">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/Wema-Bank-Logo.png" alt="" width="80" height="100" class="img-fluid my-auto">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/Zenith-Bank-Logo.png" alt="" width="60" class="my-auto">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/Polaris-Bank-Logo.png" alt="" class="img-fluid my-auto">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/Quickteller-Logo.png" alt="" class="my-auto" width="90" height="50">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/Paystack-Logo.png" alt="" width="30" height="30" class="my-auto">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/Heritage-Bank-PLC-Logo.png" alt="" class="img-fluid my-auto">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/Union-Bank-Nigeria-Logo.png" alt="" class="img-fluid my-auto">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/Flutterwave-Logo.png" alt="" class="img-fluid my-auto">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/Stanbic-IBTC-Bank-Logo.png" alt="" class="my-auto" width="120">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/suntrust.png" alt="" class="my-auto" width="100">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/american-express-logo.png" alt="" class="my-auto" width="60">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/citibank-logo.png" alt="" class="my-auto" width="60">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/Fidelity-Bank-Nigeria-Logo.png" alt="" class="my-auto" width="40">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/Mastercard-logo.png" alt="" class="my-auto" width="40">
            </div>
            <div class="col-6 col-md-2 d-flex justify-content-center">
                <img src="assets/images/keystone.png" alt="" class="my-auto" width="80">
            </div>
        </div>
    </section>

    <script>
        function openTab(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tab-content");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tab-button");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }

        {
            // When the user scrolls down 20px from the top of the document, show the button
            window.onload = window.onscroll = function() {
                scrollFunction()
            };


            function scrollFunction() {
                if (document.body.scrollTop > 4000 || document.documentElement.scrollTop > 4000) {
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
</asp:Content>


