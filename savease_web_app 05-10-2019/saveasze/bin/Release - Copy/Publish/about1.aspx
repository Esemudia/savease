<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about1.aspx.cs" Inherits="saveasze.about1" %>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <title>Savease</title> 

    <!-- mobile responsive meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />


    <link rel="stylesheet" href="about/css/style.css" />
    <link rel="stylesheet" href="about/css/responsive.css" />
    
    <link rel="apple-touch-icon" sizes="180x180" href="images/favicons/apple-touch-icon.png" />
    <link rel="icon" type="image/png" href="images/favicons/favicon-32x32.png" sizes="32x32" />
    <link rel="icon" type="image/png" href="images/favicons/favicon-16x16.png" sizes="16x16" />

</head>
<body>
    <form id="form1" runat="server">
<div class="boxed_wrapper">


 
    

<header class="header-area">
    <div class="top-bar">
        <div class="container">
            <div class="clearfix">
                <ul class="top-bar-text float_left">
                    <li><i class="fa fa-map-signs"></i>Making savings habit simple and effortless.</li>
                </ul>
                <ul class="top-bar-text float_right">
                    <li>  <span> &nbsp;&nbsp;&nbsp;&nbsp;<img src="images/google.png">  &nbsp;&nbsp;&nbsp;&nbsp;<img src="images/apple.png"></span></li>
                </ul>
                <ul class="top-bar-text float_right">
                    <li><i class="fa fa-clock-o"></i><span id="date_time">Saturday September 22 2018 17:23:25</span>
            <script type="text/javascript">window.onload = date_time('date_time');</script></li>
                </ul>
            </div>
                

        </div>
    </div>
    <div class="header-bottom">
        <div class="container">
            <div class="header-bottom-bg clearfix">
                <div class="main-logo float_left">
                    <a href="default.aspx"><img alt="" src="images/logo/logo.png"></a>
                </div>
                <div class="top-info float_right">
                    <ul>
                        <li class="single-info-box">
                            <div class="icon-holder">
                                <span class="icon-technology"></span>
                            </div>
                            <div class="text-holder">
                                <p><span>Call Us Now</span><br>0700SAVEASE</p>
                            </div>
                        </li>
                        <li class="single-info-box">
                            <div class="icon-holder">
                                <span class="icon-multimedia"></span>
                            </div>
                            <div class="text-holder">
                                <p><span>Send Us eMail </span> <br>Info@savease.ng</p>
                            </div>
                        </li>
                        <li><a class="thm-btn" id="loginAnchor" href="login.aspx">Login</a>
                            
                            <a class="thm-btn" style="display:none" href="login.aspx">Login | Register</a>
                        </li>
                    </ul>    
                </div> 
            </div>
                    
        </div>
    </div>  
        
</header>

<!-- Menu ******************************* -->
<section class="theme_menu stricky">
    <div class="container">
        <div class="menu-bg">
            <div class="row">
                <div class="col-md-9 menu-column">
                    <nav class="menuzord menuzord-responsive" id="main_menu"><a class="showhide" href="javascript:void(0)"><span></span><span></span><span></span><span></span></a>
                       <ul class="menuzord-menu menuzord-indented scrollable" style="max-height: 400px;">
                            <li class="home"><a href="Default.aspx"><span class="fa fa-home"></span></a></li>

                            <li><a href="#">About us<span class="indicator"></span></a>
                            <ul class="dropdown" style="right: auto; display: none;">
                                <li><a href="about.aspx">About Company</a></li>
                                <li><a href="team.aspx">Meet Our Team</a></li>
                                <li><a href="faq.aspx">FAQ’s</a></li>
                                <li><a href="#">Testimonials</a></li>
                             </ul>
                            </li>

                            <li><a href="#">services<span class="indicator"></span></a>
                            <ul class="dropdown" style="right: auto; display: none;">
                                <li><a href="#">Make Bank Deposit</a></li>
                                <li><a href="about.aspx">Savings &amp; Goals</a></li>
                             </ul>
                                
                            </li>
                           
                            <li><a href="#">Make Money With Us<span class="indicator"></span></a>
                            <ul class="dropdown" style="right: auto; display: none;">
                                <li><a href="login.aspx">Become an Authorized Vendor</a></li>
                                <li><a href="#">Retailer Outlet</a></li>
                                <li><a href="buypin.aspx">Buy Voucher</a></li>
                             </ul>
                                
                            </li>
                            <li><a href="accounts.aspx">My Savease</a> </li>

                            <li><a href="#">CONTACT US<span class="indicator"></span></a>
                            <ul class="dropdown" style="right: auto; display: none;">
                                <li><a href="#">Find Savease Vendors</a></li>
                                <li><a href="#">Complaint Resolution</a></li>
                                <li><a href="contact.aspx>Talk To US</a></li>
                             </ul></li>
                           
                           <%--<asp:Label runat="server" id=" lblUsr"></asp:Label>--%>
                        <li class="scrollable-fix"></li></ul><!-- End of .menuzord-menu -->
                    </nav> <!-- End of #main_menu -->
                </div>
                <div class="right-column">
                    <div class="right-area">
                        <div class="nav_side_content">
                              
                       </div>

                    </div>
                        
                </div>
            </div>
        </div>      
   </div> <!-- End of .conatiner -->
</section>
    <!-- End of .theme_menu -->

 

<div class="inner-banner has-base-color-overlay text-center" style="background-image: url('images/resource/Graphic1.jpg' );background-size:cover;height:325px;">
    <div class="container">
        <div class="box">       
            <h3>About Us</h3>
        </div>
    </div>
</div>
    
<section class="about-faq sec-padd">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-12 col-xs-12">
                <figure class="img-box">
                    <a href="#"><img src="images/resource/about.jpg"alt=""/></a>
                </figure>
            </div>
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="about-info">
                    <h4>The Innovative Digital Company for Deposits and Savings. </h4>
                    <div class="text">
                        <p>SAVEASE was established to create simple solutions to complex savings problem. It was designed to initiate useful strategies that will promote effective savings culture among Africans.</p>
                        <p>It has created the first ever instant deposit scratch card, offering its users: a simple and convenient way to make deposits into distinctive bank accounts across the continent starting from Nigeria.</p>
                        <p>We recognize that good savings habit is vital to capital development and financial independence; thus, we have designed and provided a simple, yet compelling approach to help every person in the society achieve this fundamental goal.  
.</p>
                    </div>

                    <div class="link_btn">
                       <%-- <a href="#" class="thm-btn">know more</a>--%>
                        <div class="sign"><img src="images/resource/sign.jpg" alt=""></div>
                    </div>
                </div>
            </div>
            
            
        </div>
    </div>
</section>

<div class="container">
    <div class="border-bottom"></div>
</div>
    
<section class="four-column sec-padd-top">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="item center">
                    <figure class="img-box">
                        <a href="#"><img src="images/resource/mission.png" alt=""></a>
                    </figure>
                    <div class="content">
                        <h4>Our Mission</h4>
                        <p>To deliver an innovative digital based <br>method for deposits payment and <br> savings. Thus, leading in the ,<br />production promotion and marketing of effective savings habit.</p>
                    </div>
                      
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="item center">
                    <figure class="img-box">
                        <a href="#"><img src="images/resource/vision.png" alt=""/></a>
                    </figure>
                    <div class="content">
                        <h4>Our Vision</h4>
                        <p>To create an africa where effective <br/>savings practice is effortless and  <br>deposit payment is simple.</p>
                    </div>
                        
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="item center">
                    <figure class="img-box">
                        <a href="#"><img src="images/resource/live values.png" alt=""></a>
                    </figure>
                    <div class="content">
                        <h4>Our Values</h4>
                        <p>We own an unlimited technological  <br/>space, therefore we manipulate it to  <br/>benefit the different class of men.<br />We cast on integrity, effectiveness, 
                            simplicity and multiplication. We perform, so you prosper. </p>
                    </div>
                        
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="item center">
                    <figure class="img-box">
                        <a href="#"><img src="images/resource/be a brand.png" alt=""></a>
                    </figure>
                    <div class="content">
                        <h4>Our Brand</h4>
                        <p>We deliver simplicity and <br>effectiveness, which is casted<br>on integrity.</p>
                    </div>
                        
                </div>
            </div>

        </div>
    </div>
</section>
    
  
    
 <div class="our-history sec-padd-top">
    <div class="container">
        <div class="section-title">
            <h2>History In Words</h2>
        </div>
        <div class="row">
            <div class="col-md-1 col-sm-1 col-xs-1">
                <div class="slider-pager">
                    
                    <ul class="list-inline thumb-box">

                        <li>
                            <a class="" data-slide-index="0" href="#">2014</a>
                        </li>
                        <li>
                            <a data-slide-index="1" href="#" class="">2015</a>
                        </li>
                        <li>
                            <a data-slide-index="2" href="#" class="">2016</a>
                        </li>
                        <li>
                            <a data-slide-index="3" href="#" class="">2017</a>
                        </li>
                        <li>
                            <a data-slide-index="4" href="#" class="active">2018</a>
                        </li>

                    </ul>


                    
                </div>
            </div>
            <div class="col-md-11 col-sm-11 col-xs-11">
                <div class="bx-wrapper" style="max-width: 100%;"><div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 298px;"><ul class="bxslider " style="width: auto; position: relative;">
                    <li style="float: none; list-style: none; position: absolute; width: 859px; z-index: 0; display: none;">
                        <div class="clearfix">
                            <figure class="img-box pull-left">
                                <a href="#"><img src="images/resource/h1.jpg" alt="" style="width:470px; height:280px;"></a>
                            </figure>
                            <div class="content">
                                <h4>The Creation of Savease</h4>
                                <p class="theme-color">10th July, 2014</p>
                                <div class="text">
                                    <p>
                                        Growing up as children, we had challenges with saving money. This challenge persisted into adulthood, as we grew into believing that money was created to be spent. 
                                    </p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li style="float: none; list-style: none; position: absolute; width: 859px; z-index: 0; display: none;">
                        <div class="clearfix">
                            <figure class="img-box pull-left">
                                <a href="#"><img src="images/resource/h2.jpg" alt="" style="width:470px; height:280px;"></a>
                            </figure>
                            <div class="content">
                                <h4>The Creation of Savease</h4>
                                <p class="theme-color">10th July, 2014</p>
                                <div class="text">
                                    <p>
                                        In true realism, money was not created to be spent; it was created to be kept (saved) for the future. This understanding came later in life and inspired us to indulge in many studies on the concept of money.
                                    </p>
                                    </div>
                            </div>
                        </div>
                    </li>
                    <li style="float: none; list-style: none; position: absolute; width: 859px; z-index: 0; display: none;">
                        <div class="clearfix">
                            <figure class="img-box pull-left">
                                <a href="#"><img src="images/resource/h3.png" alt="" style="width:470px; height:280px;"></a>
                            </figure>
                            <div class="content">
                                <h4>The Creation of Savease</h4>
                                <p class="theme-color">10th July, 2014</p>
                                <div class="text">
                                    <p>
                                        Thus, we realized that to gain financial independence and capital development – a person first has to have effective savings habit. 
                                    </p>
                                   </div>
                            </div>
                        </div>
                    </li>
                    <li style="float: none; list-style: none; position: absolute; width: 859px; z-index: 0; display: none;">
                        <div class="clearfix">
                            <figure class="img-box pull-left">
                                <a href="#"><img src="images/resource/h4.png" alt="" style="width:470px; height:280px;"></a>
                            </figure>
                            <div class="content ">
                                <h4>The Creation of Savease</h4>
                                <p class="theme-color">10th July, 2014</p>
                                <div class="text">
                                    <p>
                                        In year 2014, we asked the ALMIGHTY to give the world an effective, simple and effortless solution to the complex problem of saving money among the vast majority of africans and HE gave us Savease.
                                    </p>
                                  </div>
                            </div>
                        </div>
                    </li>
                    <li style="float: none; list-style: none; position: absolute; width: 859px; z-index: 50; display: list-item;">
                        <div class="clearfix">
                            <figure class="img-box pull-left">
                                <a href="#"><img src="images/resource/h5.png" alt="" style="width:470px; height:280px;"></a>
                            </figure>
                            <div class="content">
                                <h4>The Creation of Savease</h4>
                                <p class="theme-color">10th July, 2014</p>
                                <div class="text">
                                    <p>We have destroyed the banking constraint of distance, time and structure. You can now make deposits into distinctive bank accounts without the need to walk into a banking hall. </p>
                                  </div>
                            </div>
                        </div>
                    </li>            
                </ul></div><div class="bx-controls"></div></div>
                <div class="slider-pager">
                    <div class="center">
                        <ul class="nav-link list-inline">
                           <li id="slider-prev"><a class="bx-prev" href=""></a></li>
                            <li id="slider-next"><a class="bx-next" href=""> </a></li>
                        </ul>  
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
  

<section class="our-team">
    <div class="container">
        <div class="section-title center">
            <h2>Meet Our Team</h2>
        </div>  
        <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="single-team-member">
                    <figure class="img-box">
                        <a href="#"><img src="images/team/1.jpg" alt=""></a>
                        <div class="overlay">
                            <div class="inner-box">
                                <ul class="link">
                                    <li><a href="#" class="thm-btn">View Profile</a></li>
                                </ul>
                            </div>
                                
                        </div>
                    </figure>
                    <div class="author-info text-center">
                        <h4>Allan Donald</h4>
                        <a href="#"><p class="position">Designer</p></a>
                    </div>
                    <div class="text center">
                        <p>Pursue pleasure rationally encounter <br>consequences that  extremely. </p>
                    </div>
                    <ul class="social center">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                    </ul>
                        
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="single-team-member">
                    <figure class="img-box">
                        <a href="#"><img src="images/team/2.jpg" alt=""></a>
                        <div class="overlay">
                            <div class="inner-box">
                                <ul class="link">
                                    <li><a href="#" class="thm-btn">View Profile</a></li>
                                </ul>
                            </div>
                                
                        </div>
                    </figure>
                    <div class="author-info text-center">
                        <h4>Astley Fletcher</h4>
                        <a href="#"><p class="position">Founder</p></a>
                    </div>
                    <div class="text center">
                        <p>Pursue pleasure rationally encounter <br>consequences that  extremely. </p>
                    </div>
                    <ul class="social center">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                    </ul>
                        
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="single-team-member">
                    <figure class="img-box">
                        <a href="#"><img src="images/team/3.jpg" alt=""></a>
                        <div class="overlay">
                            <div class="inner-box">
                                <ul class="link">
                                    <li><a href="#" class="thm-btn">View Profile</a></li>
                                </ul>
                            </div>
                                
                        </div>
                    </figure>
                    <div class="author-info text-center">
                        <h4>Mark Thomas</h4>
                        <a href="#"><p class="position">Designer</p></a>
                    </div>
                    <div class="text center">
                        <p>Pursue pleasure rationally encounter <br>consequences that  extremely. </p>
                    </div>
                    <ul class="social center">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                    </ul>
                        
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="single-team-member">
                    <figure class="img-box">
                        <a href="#"><img src="images/team/4.jpg" alt=""></a>
                        <div class="overlay">
                            <div class="inner-box">
                                <ul class="link">
                                    <li><a href="#" class="thm-btn">View Profile</a></li>
                                </ul>
                            </div>
                                
                        </div>
                    </figure>
                    <div class="author-info text-center">
                        <h4>Richard Anto</h4>
                        <a href="#"><p class="position">Manager</p></a>
                    </div>
                    <div class="text center">
                        <p>Pursue pleasure rationally encounter <br>consequences that  extremely. </p>
                    </div>
                    <ul class="social center">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                    </ul>
                        
                </div>
            </div>

               
                
        </div>
    </div>

</section>
    
    <section class="subscribe center sec-padd" style="background-image: url(images/background/newsletter.jpg);">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
                <h2>Subscribe For Newsletter</h2>
                <p>Idea of denouncing pleasure praising pain was born and I will give you a complete account <br> ofsystem, expound the great explorer.</p>
               <input type="email" placeholder="Email Address" style="width:70%; height:51px; margin-top:30px;">
                    <button type="submit" style="margin-top:-80px;margin-right:-520px;" class="thm-btn">subscribe us</button>
            </div>
        </div>
                
    </div>
</section>

<section class="achive sec-padd">
    <div class="container">
        <div class="section-title center">
            <h2>Our Achivement</h2>
        </div>
        <div class="achive-carousel">
            <figure class="item">
                <a href="#"><img src="images/resource/achive1.jpg" alt=""></a>
            </figure>
            <figure class="item">
                <a href="#"><img src="images/resource/achive2.jpg" alt=""></a>
            </figure>
            <figure class="item">
                <a href="#"><img src="images/resource/achive3.jpg" alt=""></a>
            </figure>
            <figure class="item">
                <a href="#"><img src="images/resource/achive4.jpg" alt=""></a>
            </figure>
            <figure class="item">
                <a href="#"><img src="images/resource/achive1.jpg" alt=""></a>
            </figure>
            <figure class="item">
                <a href="#"><img src="images/resource/achive2.jpg" alt=""></a>
            </figure>
            <figure class="item">
                <a href="#"><img src="images/resource/achive3.jpg" alt=""></a>
            </figure>
            <figure class="item">
                <a href="#"><img src="images/resource/achive4.jpg" alt=""></a>
            </figure>
            <figure class="item">
                <a href="#"><img src="images/resource/achive1.jpg" alt=""></a>
            </figure>
            <figure class="item">
                <a href="#"><img src="images/resource/achive2.jpg" alt=""></a>
            </figure>
            <figure class="item">
                <a href="#"><img src="images/resource/achive3.jpg" alt=""></a>
            </figure>
            <figure class="item">
                <a href="#"><img src="images/resource/achive4.jpg" alt=""></a>
            </figure>


        </div>
    </div>
</section>

    
<div class="call-out style-2">
    <div class="container">
        <div class="float_left">
            <h4>Universal deliver the right solution for you and your business</h4>
        </div>
        <div class="float_right">
            <a href="contact.html" class="thm-btn">Free Consultation</a>
        </div>
    </div>
</div>


    <footer class="main-footer sec-padd-top" style="background-image: url(images/background/4.jpg);">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="about-widget">
                    <figure class="footer-logo"><a href="index.html"><img alt="" src="images/logo/logo.png"></a></figure>
                    
                    <div class="text">
                        <p>The foremost corporation in the production, promotion and marketing of savings habit, 
inspired to deliver an innovative digital based approach to savings and deposits, 
with a simple mission to create a world where developing savings habit is simple and practicable, structured upon a belief that proper savings habit is fundamental to capital development 
and financial independence
.</p>
                    </div>
                    <br>
                    <ul class="contact-infos">
                        <li>
                            <div class="icon_box">
                                <i class="icon-location"></i>
                            </div><!-- /.icon-box -->
                            <div class="text-box">
                                <h5>1C, Evo Crescent, GRA II,<br> Portharcourt, Rivers State, <br>Nigeria.</h5>
                            </div><!-- /.text-box -->
                        </li>
                        <li>
                            <div class="icon_box">
                                <i class="icon-technology"></i>
                            </div><!-- /.icon-box -->
                            <div class="text-box">
                                <h5>Call Us Now</h5>
                                <p>0800Savease</p>
                            </div><!-- /.text-box -->
                        </li>
                        <li>
                            <div class="icon_box">
                                <i class="icon-multimedia"></i>
                            </div><!-- /.icon-box -->
                            <div class="text-box">
                                <h5>Send Mail Us</h5>
                                <p>info@savease.ng</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="latest-post">
                    <div class="section-title">
                        <h3>Latest News</h3>
                    </div>
                    <div class="post">
                        <figure class="post-thumb"><img alt="" src="images/resource/post-thumb-1.jpg"><a class="overlay-link" href="#"><span class="fa fa-link"></span></a></figure>
                        <h5><a href="#">Nigeria records $24.7bn forex inflow<br>business growth </a></h5>
                        <p>The Nigerian economy recorded a total foreign exchange inflow of $24.71bn...</p>
                        <div class="link">
                            <a class="default_link" href="http://punchng.com/nigeria-records-24-7bn-forex-inflow-in-three-months/" target="_blank">More About us <i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>
                    <div class="post">
                        <figure class="post-thumb"><img alt="" src="images/resource/post-thumb-2.jpg"><a class="overlay-link" href="#"><span class="fa fa-link"></span></a></figure>
                        <h5><a href="#">Knowing when to quit a businesss <br>efficient skills </a></h5>
                        <p>It is important to fight against all odds but there are times when giving up is...</p>
                        <div class="link">
                            <a class="default_link" href="http://punchng.com/knowing-when-to-quit-a-business/" target="_blank">More About us <i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="footer-link-widget">
                    <div class="section-title">
                        <h3>Useful Links</h3>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-sx-6">
                            <ul class="list">
                                <li><a href="service-single.html">Make Bank Deposit</a></li>
                                <li><a href="service-single.html">Wealth &amp; Investment</a></li>
                                <li><a href="service-single.html">Find Vendor</a></li>
                                <li><a href="service-single.html">Become Vendor</a></li>
                            </ul>
                        </div>
                        <div class="col-md-6 col-sm-6 col-sx-6">
                            <ul class="list">
                                <li><a href="service-single.html">FAQ</a></li>
                                <li><a href="buypin.aspx">Buy PIN</a></li>
                                <li><a href="faq.html">Retailer Outlets</a></li>
                                <li><a href="testimonials.html">Testimonials</a></li>
                                <li><a href="contact.html">Register</a></li>
                            </ul>
                        </div>
                    </div>
                    <br>
                    <div class="opening-hour">
                        <h3>Opening Hours</h3>
                        <br>
                        <p>Monday to Sunday:     &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;           24/7</p>
                     </div>
                </div>
            </div>
        </div>
    </div>
    
    
     
</footer>

<div class="footer-bottom">
    <div class="container">
        <div class="float_left copy-text">
            <p>Copyrights © 2019 All Rights Reserved. Powered by  <a href="#">Savease Nigeria Limited.</a></p>
            
        </div>
        <div class="float_right">
            <ul class="social">
                <li>
                    <a href="#"><i class="fa fa-facebook"></i></a>                              
                </li>
                <li>
                    <a href="#"><i class="fa fa-twitter"></i></a>                               
                </li>
                <li>
                    <a href="#"><i class="fa fa-skype"></i></a>                             
                </li>
                <li>
                    <a href="#"><i class="fa fa-linkedin"></i></a>                              
                </li>
            </ul>
        </div>

    </div>
</div>


<!-- Scroll Top Button -->
    <button class="scroll-top tran3s color2_bg">
        <span class="fa fa-angle-up"></span>
    </button>
    <!-- pre loader  -->
    <div class="preloader"></div>


    <!-- jQuery js -->
    <script src="about/js/jquery.js"></script>
    <!-- bootstrap js -->
    <script src="about/js/bootstrap.min.js"></script>
    <!-- jQuery ui js -->
    <script src="about/js/jquery-ui.js"></script>
    <!-- owl carousel js -->
    <script src="about/js/owl.carousel.min.js"></script>
    <script src="about/js/bxslider.js"></script>

    <!-- jQuery validation -->
    <script src="about/js/jquery.validate.min.js"></script>
    <!-- google map -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRvBPo3-t31YFk588DpMYS6EqKf-oGBSI"></script> 
    <script src="about/js/gmap.js"></script>
    <!-- mixit up -->
    <script src="about/js/wow.js"></script>
    <script src="about/js/jquery.mixitup.min.js"></script>
    <script src="about/js/jquery.fitvids.js"></script>
    <script src="about/js/bootstrap-select.min.js"></script>
    <script src="about/js/menuzord.js"></script>

    <!-- revolution slider js -->
    <script src="about/assets/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script src="about/assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
    <script src="about/assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <script src="about/assets/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
    <script src="about/assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
    <script src="about/assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script src="about/assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
    <script src="about/assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
    <script src="about/assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
    <script src="about/assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
    <script src="about/assets/revolution/js/extensions/revolution.extension.video.min.js"></script>

    <!-- fancy box -->
    <script src="about/js/jquery.fancybox.pack.js"></script>
    <script src="about/js/jquery.polyglot.language.switcher.js"></script>
    <script src="about/js/nouislider.js"></script>
    <script src="about/js/jquery.bootstrap-touchspin.js"></script>
    <script src="about/js/SmoothScroll.js"></script>
    <script src="about/js/jquery.appear.js"></script>
    <script src="about/js/jquery.countTo.js"></script>
    <script src="about/js/jquery.flexslider.js"></script>
    <script src="about/js/imagezoom.js"></script> 
    <script src="about/js/Chart.js"></script> 
    <script id="map-script" src="about/js/default-map.js"></script>
    <script src="about/js/custom.js"></script>

</div>
    
    </form>
</body>
</html>