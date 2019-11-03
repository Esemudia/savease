<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aboutt.aspx.cs" Inherits="saveasze.aboutt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>  
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />


    <link rel="stylesheet" href="about/css/style.css" />
    <link rel="stylesheet" href="about/css/responsive.css" />
    
  
</head>
<body>
    <form id="form1" runat="server">
    
<div class="boxed_wrapper">
<!-- Menu ******************************* -->
<section class="theme_menu stricky">
    <div class="container">
        <div class="menu-bg">
            <div class="row">
                <div class="col-md-9 menu-column">
                    <nav class="menuzord" id="main_menu">
                       <ul class="menuzord-menu">
                            <li class="home"><a href="index.php"><span class="fa fa-home"></span></a></li>

                            <li><a href="#">About us</a>
                            <ul class="dropdown">
                                <li><a href="about.html">About Company</a></li>
                                <li><a href="team.html">Meet Our Team</a></li>
                                <li><a href="faq.html">FAQ’s</a></li>
                                <li><a href="testimonials.html">Testimonials</a></li>
                             </ul>
                            </li>

                            <li><a href="servie.html">services</a>
                            <ul class="dropdown">
                                <li><a href="business-growth.html">Business Growth</a></li>
                                <li><a href="sustainability.html">Sustainability</a></li>
                                <li><a href="performance.html">Performance</a></li>
                                <li><a href="advanced-analytics.html">Advanced Analytics</a></li>
                                <li><a href="organization.html">Organization</a></li>
                                <li><a href="customer-insights.html">Customer Insights</a></li>
                             </ul>
                                
                            </li>

                            <li><a href="#">blog</a>
                            <ul class="dropdown">
                                <li><a href="blog-default.html">Blog Default</a></li>
                                <li><a href="blog-large.html">Blog Large Image</a></li>
                                <li><a href="blog-details.html">Blog Single Post</a></li>
                             </ul>
                            </li>
                            <li><a href="#">PROJECTS</a>
                            <ul class="dropdown">
                                <li><a href="projects.html">Our Projects</a></li>
                                <li><a href="projects-single.html">Projects Single</a></li>
                             </ul>
                            </li>

                            <li><a href="#">SHOP</a>
                            <ul class="dropdown">
                                <li><a href="shop.html">Shop Products</a></li>
                                <li><a href="shop-single.html">Product Detail Page</a></li>
                                <li><a href="shop-cart.html">View Shopping Items</a></li>
                                <li><a href="checkout.html">Checkout Your Page</a></li>
                                <li><a href="login_reg.php">Login or Register</a></li>
                             </ul>
                                
                            </li>

                            <li><a href="contact.html">CONTACT US</a></li>




                        </ul><!-- End of .menuzord-menu -->
                    </nav> <!-- End of #main_menu -->
                </div>
                <div class="right-column">
                    <div class="right-area">
                        <div class="nav_side_content">
                            <div class="select-box">
                                <select name="branceh" class="selectpicker">
                                    <option>Los Angeles Branch</option>
                                    <option>San Fransisco Branch</option>
                                    <option>Chicago Branch</option>
                                    <option>San Jose Branch</option>
                                    <option>Newyork City Branch</option>
                                </select>
                            </div>
                            <div class="search_option">
                                <button class="search tran3s dropdown-toggle color1_bg" id="searchDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-search" aria-hidden="true"></i></button>
                                <form action="#" class="dropdown-menu" aria-labelledby="searchDropdown">
                                    <input type="text" placeholder="Search...">
                                    <button><i class="fa fa-search" aria-hidden="true"></i></button>
                                </form>
                            </div>
                       </div>

                    </div>
                        
                </div>
            </div>
        </div>      

   </div> <!-- End of .conatiner -->
</section> <!-- End of .theme_menu -->

<div class="inner-banner has-base-color-overlay text-center" style="background: url(images/background/1.jpg);">
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
                    <a href="#"><img src="images/resource/7.jpg" alt=""></a>
                </figure>
            </div>
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="about-info">
                    <h4>Everyboy has something important to say!</h4>
                    <div class="text">
                        <p>We have built an enviable reputation in the consumer goods, heavy industry, high-tech, manufacturing, medical, recreational vehicle, and transportation sectors. multidisciplinary team of engineering experts.</p>
                        <p>Who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain.</p>
                        <p>Denouncing pleasure and praising pain was born and I will give you a complete account of the system, expound the actual teachings.</p>
                    </div>

                    <div class="link_btn">
                        <a href="#" class="thm-btn">know more</a>
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
                        <a href="#"><img src="images/resource/7.jpg" alt=""></a>
                    </figure>
                    <div class="content">
                        <h4>Our Mission</h4>
                        <p>Declares our purpose as a company <br>and serves as standard against which <br> we weigh actions decisions.</p>
                    </div>
                        
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="item center">
                    <figure class="img-box">
                        <a href="#"><img src="images/resource/8.jpg" alt=""></a>
                    </figure>
                    <div class="content">
                        <h4>Our Vision</h4>
                        <p>Our vision serves as framework for <br>all guides every aspect of our all <br>business by what we need.</p>
                    </div>
                        
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="item center">
                    <figure class="img-box">
                        <a href="#"><img src="images/resource/9.jpg" alt=""></a>
                    </figure>
                    <div class="content">
                        <h4>Live Values</h4>
                        <p>Our values serve as compass for our <br>actions and describe how we behave <br> in the world customers.</p>
                    </div>
                        
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="item center">
                    <figure class="img-box">
                        <a href="#"><img src="images/resource/10.jpg" alt=""></a>
                    </figure>
                    <div class="content">
                        <h4>Be the Brand</h4>
                        <p>Declares our purpose as a company  <br>and serves as standard against which <br> we weigh actions decisions.</p>
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
                            <a class="active" data-slide-index="0" href="#">1975</a>
                        </li>
                        <li>
                            <a data-slide-index="1" href="#">1978</a>
                        </li>
                        <li>
                            <a data-slide-index="2" href="#">1984</a>
                        </li>
                        <li>
                            <a data-slide-index="3" href="#">1985</a>
                        </li>
                        <li>
                            <a data-slide-index="4" href="#">1988</a>
                        </li>

                    </ul>


                    
                </div>
            </div>
            <div class="col-md-11 col-sm-11 col-xs-11">
                <ul class="bxslider ">
                    <li>
                        <div class="clearfix">
                            <figure class="img-box pull-left">
                                <a href="#"><img src="images/resource/history.jpg" alt=""></a>
                            </figure>
                            <div class="content">
                                <h4>Starts at California City</h4>
                                <p class="theme-color">21st January 1975</p>
                                <div class="text">
                                    <p>Universal story stretches back more than 125 years & encompases several predecessor companies sed and the inspiring work of tens and thousands of people. But our core mission and values rise in the costof materials.</p>
                                    <p>Competition and a sudden sharp rise in the cost of raw materials leads many to set up associations, promoting their interets & defending seds themselves against supplier monopolies, all around the world.</p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="clearfix">
                            <figure class="img-box pull-left">
                                <a href="#"><img src="images/resource/history2.jpg" alt=""></a>
                            </figure>
                            <div class="content">
                                <h4>Starts at California City</h4>
                                <p class="theme-color">21st January 1978</p>
                                <div class="text">
                                    <p>Universal story stretches back more than 125 years & encompases several predecessor companies sed and the inspiring work of tens and thousands of people. But our core mission and values rise in the costof materials.</p>
                                    <p>Competition and a sudden sharp rise in the cost of raw materials leads many to set up associations, promoting their interets & defending seds themselves against supplier monopolies, all around the world.</p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="clearfix">
                            <figure class="img-box pull-left">
                                <a href="#"><img src="images/resource/history3.jpg" alt=""></a>
                            </figure>
                            <div class="content">
                                <h4>Starts at California City</h4>
                                <p class="theme-color">21st January 1984</p>
                                <div class="text">
                                    <p>Universal story stretches back more than 125 years & encompases several predecessor companies sed and the inspiring work of tens and thousands of people. But our core mission and values rise in the costof materials.</p>
                                    <p>Competition and a sudden sharp rise in the cost of raw materials leads many to set up associations, promoting their interets & defending seds themselves against supplier monopolies, all around the world.</p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="clearfix">
                            <figure class="img-box pull-left">
                                <a href="#"><img src="images/resource/history4.jpg" alt=""></a>
                            </figure>
                            <div class="content ">
                                <h4>Starts at California City</h4>
                                <p class="theme-color">21st January 1985</p>
                                <div class="text">
                                    <p>Universal story stretches back more than 125 years & encompases several predecessor companies sed and the inspiring work of tens and thousands of people. But our core mission and values rise in the costof materials.</p>
                                    <p>Competition and a sudden sharp rise in the cost of raw materials leads many to set up associations, promoting their interets & defending seds themselves against supplier monopolies, all around the world.</p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="clearfix">
                            <figure class="img-box pull-left">
                                <a href="#"><img src="images/resource/history5.jpg" alt=""></a>
                            </figure>
                            <div class="content">
                                <h4>Starts at California City</h4>
                                <p class="theme-color">21st January 1988</p>
                                <div class="text">
                                    <p>Universal story stretches back more than 125 years & encompases several predecessor companies sed and the inspiring work of tens and thousands of people. But our core mission and values rise in the costof materials.</p>
                                    <p>Competition and a sudden sharp rise in the cost of raw materials leads many to set up associations, promoting their interets & defending seds themselves against supplier monopolies, all around the world.</p>
                                </div>
                            </div>
                        </div>
                    </li>

                    
                </ul>
                <div class="slider-pager">
                    <div class="center">
                        <ul class="nav-link list-inline">
                            <li id="slider-prev"></li>
                            <li id="slider-next"></li>
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

<section class="subscribe center sec-padd" style="background-image: url(images/background/2.jpg);">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 col-sm-12 col-xs-12">
                <h2>Subscribe For Newsletter</h2>
                <p>Idea of denouncing pleasure praising pain was born and I will give you a complete account <br> ofsystem, expound the great explorer.</p>
                <form class="subscribe-form">
                    <input type="email" placeholder="Email Address"><span class="fa fa-envelope"></span>
                    <button type="submit" class="thm-btn">subscribe us</button>
                </form>
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
                    <figure class="footer-logo"><a href="index.php"><img src="images/logo/logo2.png" alt=""></a></figure>
                    
                    <div class="text">
                        <p>Our team offers the most up-to-date, sustainable all manufacturing allsolutions. teachings of the great explorer of the truth We only source materrials from tried and trusted suppliers.</p>
                    </div>
                    <br>
                    <ul class="contact-infos">
                        <li>
                            <div class="icon_box">
                                <i class="icon-location"></i>
                            </div><!-- /.icon-box -->
                            <div class="text-box">
                                <h5>Universal 234, Triumph Street, Los Angeles <br>California, United states.</h5>
                            </div><!-- /.text-box -->
                        </li>
                        <li>
                            <div class="icon_box">
                                <i class="icon-technology"></i>
                            </div><!-- /.icon-box -->
                            <div class="text-box">
                                <h5>Call Us Now</h5>
                                <p>1800-45-678-9012 & 8012</p>
                            </div><!-- /.text-box -->
                        </li>
                        <li>
                            <div class="icon_box">
                                <i class="icon-multimedia"></i>
                            </div><!-- /.icon-box -->
                            <div class="text-box">
                                <h5>Send Mail Us</h5>
                                <p>Supportyou@Universal.com</p>
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
                        <figure class="post-thumb"><img src="images/resource/post-thumb-1.jpg" alt=""><a href="#" class="overlay-link"><span class="fa fa-link"></span></a></figure>
                        <h5><a href="#">Seminar for improve your <br>business growth </a></h5>
                        <p>Master builder of human happiness</p>
                        <div class="link">
                            <a href="#" class="default_link">More About us <i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>
                    <div class="post">
                        <figure class="post-thumb"><img src="images/resource/post-thumb-2.jpg" alt=""><a href="#" class="overlay-link"><span class="fa fa-link"></span></a></figure>
                        <h5><a href="#">How to improve employees <br>efficient skills </a></h5>
                        <p>To take a trivial example, which of us</p>
                        <div class="link">
                            <a href="#" class="default_link">More About us <i class="fa fa-angle-right"></i></a>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="footer-link-widget">
                    <div class="section-title">
                        <h3>Usefull Links</h3>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-sx-6">
                            <ul class="list">
                                <li><a href="service-single.html">Business Growth</a></li>
                                <li><a href="service-single.html">Sustainability</a></li>
                                <li><a href="service-single.html">Performance</a></li>
                                <li><a href="service-single.html">Customer Insights</a></li>
                                <li><a href="service-single.html">Organization</a></li>
                            </ul>
                        </div>
                        <div class="col-md-6 col-sm-6 col-sx-6">
                            <ul class="list">
                                <li><a href="about.html">About Universal</a></li>
                                <li><a href="faq.html">Customer FAQ’s</a></li>
                                <li><a href="testimonials.html">Testimonials</a></li>
                                <li><a href="contact.html">Free Consultation</a></li>
                                <li><a href="#">Buy Universal</a></li>
                            </ul>
                        </div>
                    </div>
                    <br>
                    <div class="opening-hour">
                        <h3>Opening Hours</h3>
                        <br>
                        <p>Monday to Firday:     &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;           09.00am to 18.00pm</p>
                        <p>Saturday and Sunday:      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        Closed</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
     
</footer>
<div class="footer-bottom">
    <div class="container">
        <div class="float_left copy-text">
            <p>Copyrights © 2016 All Rights Reserved. Powered by  <a href="#">Universal.</a></p>
            
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
