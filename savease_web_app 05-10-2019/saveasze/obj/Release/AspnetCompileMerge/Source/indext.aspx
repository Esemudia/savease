<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="indext.aspx.cs" Inherits="saveasze.indext" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />


	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/responsive.css" />
    
    <link rel="apple-touch-icon" sizes="180x180" href="images/favicons/apple-touch-icon.png" />
    <link rel="icon" type="image/png" href="images/favicons/favicon-32x32.png" sizes="32x32" />
    <link rel="icon" type="image/png" href="images/favicons/favicon-16x16.png" sizes="16x16" />
      <script type="text/javascript">
          function date_time(id) {
              date = new Date;
              year = date.getFullYear();
              month = date.getMonth();
              months = new Array('January', 'February', 'March', 'April', 'May', 'June', 'Jully', 'August', 'September', 'October', 'November', 'December');
              d = date.getDate();
              day = date.getDay();
              days = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
              h = date.getHours();
              if (h < 10) {
                  h = "0" + h;
              }
              m = date.getMinutes();
              if (m < 10) {
                  m = "0" + m;
              }
              s = date.getSeconds();
              if (s < 10) {
                  s = "0" + s;
              }
              result = '' + days[day] + ' ' + months[month] + ' ' + d + ' ' + year + ' ' + h + ':' + m + ':' + s;
              document.getElementById(id).innerHTML = result;
              setTimeout('date_time("' + id + '");', '1000');
              return true;
          }
      </script>
    <title>Savease Nigeria</title>
</head>
<body>
    <form id="form1" runat="server">
        
        <table class="boxed_wrapper">
            <tr><td>
                
<header class="header-area">
    <div class="top-bar">
        <div class="container">
            <div class="clearfix">
                <ul class="top-bar-text float_left">
                    <li><i class="fa fa-map-signs"></i>1C, Evo Crescent, GRA, Portharcourt, Rivers State, Nigeria.</li>
                    <li><i class="fa fa-clock-o"></i><span id="date_time"></span>
            <script type="text/javascript">window.onload = date_time('date_time');</script></li>
                </ul>
                <ul class="social float_right">
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                    <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                    <li><a href="#"><i class="fa fa-skype"></i></a></li>
                </ul>
            </div>
                

        </div>
    </div>
    <div class="header-bottom">
        <div class="container">
            <div class="header-bottom-bg clearfix">
                <div class="main-logo float_left">
                    <a href="Default.aspx"><img src="images/logo/logo.png" alt=""></a>
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
                        <li>
                            <a href="<% showLink(); %>" class="thm-btn"><% showLogin(); %></a>
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
                    <nav class="menuzord" id="main_menu">
                       <ul class="menuzord-menu">
                            <li class="home"><a href="Default.aspx"><span class="fa fa-home"></span></a></li>

                            <li><a href="#">About us</a>
                            <ul class="dropdown">
                                <li><a href="#">About Company</a></li>
                                <li><a href="#">Meet Our Team</a></li>
                                <li><a href="#">FAQ’s</a></li>
                                <li><a href="#">Testimonials</a></li>
                             </ul>
                            </li>

                            <li><a href="#">services</a>
                            <ul class="dropdown">
                                <li><a href="#">Savings</a></li>
                                <li><a href="#">Savease Sender</a></li>
                                <li><a href="#">USSD</a></li>
                             </ul>
                                
                            </li>
                           
                            <li style="<%loggedInUserLink();%>"><a href="#">Make Money With Us</a>
                            <ul class="dropdown">
                                <li><a href="#">Become a vendor</a></li>
                                <li><a href="#">Retailer Outlet</a></li>
                             </ul>
                                
                            </li>
                            <li><a href="accounts.aspx">My Savease</a> </li>

                            <li><a href="#">CONTACT US</a></li>


                        </ul><!-- End of .menuzord-menu -->
                    </nav> <!-- End of #main_menu -->
                </div>
                <div class="right-column">
                    <div class="right-area">
                        <div class="nav_side_content">
                            <div class="select-box" runat="server" id="cmdOptionDiv">
                                <asp:DropDownList Visible="false" ID="cmdOptions" runat="server" class="selectpicker" OnSelectedIndexChanged="cmdOptions_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                                <select name="branceh" class="selectpicker" onchange="location = this.value;">
                                    <option value="#"><asp:Label runat="server" ID="lblUsr" Text="" Width="100%"></asp:Label></option>
                                    <option value="profile.aspx">Profile</option>
                                </select>
                            </div>
                            <div class="search_option">
                                <button class="search tran3s dropdown-toggle color1_bg" id="searchDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-search" aria-hidden="true"></i></button>
                                <div class="dropdown-menu" aria-labelledby="searchDropdown">
                                    <input type="text" placeholder="Search...">
                                    <button><i class="fa fa-search" aria-hidden="true"></i></button>
                                </div>
                            </div>
                       </div>

                    </div>
                        
                </div>
            </div>
        </div>      
   </div> <!-- End of .conatiner -->
</section> <!-- End of .theme_menu -->


<!--Start rev slider wrapper-->     
<section>
    <div id="slider1" class="rev_slider"  data-version="5.0">
        <ul>
            <li data-transition="fade">
                <img src="images/slider/1.jpg"  alt="" width="1920" height="580" data-bgposition="top center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="1" >
                
                <div class="tp-caption tp-resizeme"
                    data-x="right" data-hoffset="15" 
                    data-y="center" data-voffset="-4" 
                    data-transform_idle="o:1;"         
                    data-transform_in="x:[-175%];y:0px;z:0;rX:0;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0.01;s:3000;e:Power3.easeOut;" 
                    data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;" 
                    data-mask_in="x:[100%];y:0;s:inherit;e:inherit;" 
                    data-splitin="none" 
                    data-splitout="none"  
                    data-responsive_offset="on"
                    data-start="500">
                    <div class="slide-content-box">
                        <h3>The Sucessfull Business</h3>
                        <h1>Customize Anything</h1>
                        <p>Universal business theme continues to grow ever day thanks to the <br>confidence our clients have in US.</p>
                    </div>
                </div>
                <div class="tp-caption tp-resizeme" 
                    data-x="left" data-hoffset="580" 
                    data-y="center" data-voffset="140" 
                    data-transform_idle="o:1;"                         
                    data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;" 
                    data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"                     
                    data-splitin="none" 
                    data-splitout="none" 
                    data-responsive_offset="on"
                    data-start="2300">
                    <div class="slide-content-box">
                        <div class="button">
                            <a class="thm-btn yellow-bg" href="">OUR COMPANY</a>     
                        </div>
                    </div>
                </div>
                <div class="tp-caption tp-resizeme" 
                    data-x="left" data-hoffset="755" 
                    data-y="center" data-voffset="140" 
                    data-transform_idle="o:1;"                         
                    data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;" 
                    data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"                     
                    data-splitin="none" 
                    data-splitout="none" 
                    data-responsive_offset="on"
                    data-start="2600">
                    <div class="slide-content-box">
                        <div class="button">
                            <a class="thm-btn our-solution" href="">contact us</a>     
                        </div>
                    </div>
                </div>
            </li>
            <li data-transition="fade">
                <img src="images/slider/2.jpg"  alt="" width="1920" height="550" data-bgposition="top center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="1" >
                
                <div class="tp-caption  tp-resizeme" 
                    data-x="left" data-hoffset="15" 
                    data-y="top" data-voffset="230" 
                    data-transform_idle="o:1;"         
                    data-transform_in="x:[-175%];y:0px;z:0;rX:0;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0.01;s:3000;e:Power3.easeOut;" 
                    data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;" 
                    data-mask_in="x:[100%];y:0;s:inherit;e:inherit;" 
                    data-splitin="none" 
                    data-splitout="none"
                    data-responsive_offset="on"
                    data-start="700">
                    <div class="slide-content-box">
                        <h3>Universal Finds Right</h3>
                        <h1>Solution for business</h1>
                        <p>Universal business theme continues to grow ever day thanks to the <br>confidence our clients have in US.</p>
                    </div>
                </div>
                <div class="tp-caption tp-resizeme" 
                    data-x="left" data-hoffset="15" 
                    data-y="top" data-voffset="440" 
                    data-transform_idle="o:1;"                         
                    data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;" 
                    data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"                     
                    data-splitin="none" 
                    data-splitout="none" 
                    data-responsive_offset="on"
                    data-start="2300">
                    <div class="slide-content-box">
                        <div class="button">
                            <a class="thm-btn yellow-bg" href="">OUR COMPANY</a>     
                        </div>
                    </div>
                </div>
                <div class="tp-caption tp-resizeme" 
                    data-x="left" data-hoffset="190" 
                    data-y="top" data-voffset="440" 
                    data-transform_idle="o:1;"                         
                    data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;" 
                    data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"                     
                    data-splitin="none" 
                    data-splitout="none" 
                    data-responsive_offset="on"
                    data-start="2600">
                    <div class="slide-content-box">
                        <div class="button">
                            <a class="thm-btn our-solution" href="">contact us</a>     
                        </div>
                    </div>
                </div>
            </li>
            <li data-transition="fade">
                <img src="images/slider/3.jpg"  alt="" width="1920" height="580" data-bgposition="top center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="1" >
                
                <div class="tp-caption tp-resizeme"
                    data-x="right" data-hoffset="15" 
                    data-y="center" data-voffset="-4" 
                    data-transform_idle="o:1;"         
                    data-transform_in="x:[-175%];y:0px;z:0;rX:0;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0.01;s:3000;e:Power3.easeOut;" 
                    data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;" 
                    data-mask_in="x:[100%];y:0;s:inherit;e:inherit;" 
                    data-splitin="none" 
                    data-splitout="none"  
                    data-responsive_offset="on"
                    data-start="500">
                    <div class="slide-content-box">
                        <h3>Feel good to with</h3>
                        <h1>Endless Possibilities</h1>
                        <p>Universal business theme continues to grow ever day thanks to <br>the confidence our clients have in US. </p>
                    </div>
                </div>
                <div class="tp-caption tp-resizeme" 
                    data-x="left" data-hoffset="600" 
                    data-y="center" data-voffset="140" 
                    data-transform_idle="o:1;"                         
                    data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;" 
                    data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"                     
                    data-splitin="none" 
                    data-splitout="none" 
                    data-responsive_offset="on"
                    data-start="2300">
                    <div class="slide-content-box">
                        <div class="button">
                            <a class="thm-btn yellow-bg" href="">OUR COMPANY</a>     
                        </div>
                    </div>
                </div>
                <div class="tp-caption tp-resizeme" 
                    data-x="left" data-hoffset="775" 
                    data-y="center" data-voffset="140" 
                    data-transform_idle="o:1;"                         
                    data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;" 
                    data-transform_out="s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"                     
                    data-splitin="none" 
                    data-splitout="none" 
                    data-responsive_offset="on"
                    data-start="2600">
                    <div class="slide-content-box">
                        <div class="button">
                            <a class="thm-btn our-solution" href="">contact us</a>     
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</section>
<!--End rev slider wrapper--> 
<!--Start About Savease wrapper--> 
            <section class="about-us sec-padd">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <div class="section-title">
                    <h2>About Savease</h2>
                </div>
                <div class="text">
                    <p>
Savease was created for you as Nigeria's premier leader in digital banking, 
designed to make savings attitude easy, effortless and convinient 
without barriers of distance, space and time.
</P>
                   <p>
SAVEASE was established to create simple solutions to complex savings problem. 
It was incorporated and trademarked to initiate honest strategies that will promote savings attitude among African - Nigerians. 
</P><p>
Thus, it has created the first ever fully digital banking hub and savings scratch card, 
offering its users: a simple and convenient way to make mini deposits into distinctive bank accounts across the nation. 
</P>
                    <p>SAVEASE recognizes that good savings habit is vital to capital development and financial independence; 
thus, we designed and provided a simple, yet; compelling approach to help every person 
in the society achieve this fundamental goal. 
</p><br><br>
                    <div class="link"><a href="#" class="thm-btn">know more</a></div>
                </div>
            </div>
            <div class="col-md-6 col-sm-12">
                <div class="img-box">
                    <img src="images/resource/graph.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</section>
<!--End About Savease wrapper--> 
<!--Start Why Savease wrapper--> 
            <section class="service sec-padd-top">
    <div class="container">
        <div class="section-title center">
            <h2>Why Choosing Savease</h2>
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="item">
                    <figure class="img-box">
                        <a href="#"><img src="images/service/1.jpg" alt=""></a>
                        <div class="bottom-content">
                            <div class="clearfix">
                                <div class="icon_box">
                                    <span class="icon-arrow"></span>
                                </div>
                                <h4>Business Growth</h4>
                            </div>
                                
                        </div>
                        <div class="overlay-box">
                            <div class="inner-box">
                                <div class="clearfix">
                                    <div class="icon_box">
                                        <span class="icon-arrow"></span>
                                    </div>
                                    <h4>Business Growth</h4>
                                </div>
                                    
                                <div class="text">
                                    <p>Priority interst for many organizations, when <br>comes to sustainbility & corporate responsiblity,  <br>we believe normal rules of busines apply.  </p>
                                </div>
                                <div class="link">
                                    <a href="#" class="default_link">READ MORE <i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                                
                        </div>
                        
                    </figure>  
                </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="item">
                    <figure class="img-box">
                        <a href="#"><img src="images/service/2.jpg" alt=""></a>
                        <div class="bottom-content">
                            <div class="clearfix">
                                <div class="icon_box">
                                    <span class="icon-travel"></span>
                                </div>
                                <h4>Sustainability</h4>
                            </div>
                                
                        </div>
                        <div class="overlay-box">
                            <div class="inner-box">
                                <div class="clearfix">
                                    <div class="icon_box">
                                        <span class="icon-travel"></span>
                                    </div>
                                    <h4>Sustainability</h4>
                                </div>
                                    
                                <div class="text">
                                    <p>Priority interst for many organizations, when <br>comes to sustainbility & corporate responsiblity,  <br>we believe normal rules of busines apply.  </p>
                                </div>
                                <div class="link">
                                    <a href="#" class="default_link">READ MORE <i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                                
                        </div>
                    </figure>  
                </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="item">
                    <figure class="img-box">
                        <a href="#"><img src="images/service/3.jpg" alt=""></a>
                        <div class="bottom-content">
                            <div class="clearfix">
                                <div class="icon_box">
                                    <span class="icon-search"></span>
                                </div>
                                <h4>Performance</h4>
                            </div>
                                
                        </div>
                        <div class="overlay-box">
                            <div class="inner-box">
                                <div class="clearfix">
                                    <div class="icon_box">
                                        <span class="icon-search"></span>
                                    </div>
                                    <h4>Performance</h4>
                                </div>
                                    
                                <div class="text">
                                    <p>Priority interst for many organizations, when <br>comes to sustainbility & corporate responsiblity,  <br>we believe normal rules of busines apply.  </p>
                                </div>
                                <div class="link">
                                    <a href="#" class="default_link">READ MORE <i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                                
                        </div>
                    </figure>  
                </div>
            </div>

        </div>
    </div>
</section>
<!--End Why Savease wrapper-->

<!--Start Services -->
            
<div class="growth-service style-2 sec-padd" style="background-image: url(images/background/6.jpg);">
    <div class="container">
        <div class="three-column-carousel">
            <div class="item center">
                <div class="icon_box">
                    <span class="icon-graphic"></span>
                </div>
                <div class="content">
                    <h4>Financial Service</h4>
                    <p>Our financial experts help analyze financial data, <br> to create steady financial foundation.</p>
                </div>
            </div>
            <div class="item center">
                <div class="icon_box">
                    <span class="icon-science"></span>
                </div>
                <div class="content">
                    <h4>Manufacturing</h4>
                    <p>Electronic Materials has servd the semicondctor <br>industry as a leading-edge materials.</p>
                </div>
            </div>
            <div class="item center">
                <div class="icon_box">
                    <span class="icon-science-1"></span>
                </div>
                <div class="content">
                    <h4>Medical & Health Care</h4>
                    <p>Electronic Materials has servd the semicondctor <br>industry as a leading-edge materials.</p>
                </div>
            </div>
            <div class="item center">
                <div class="icon_box">
                    <span class="icon-graphic"></span>
                </div>
                <div class="content">
                    <h4>Financial Service</h4>
                    <p>Our financial experts help analyze financial data, <br> to create steady financial foundation.</p>
                </div>
            </div>
            <div class="item center">
                <div class="icon_box">
                    <span class="icon-science"></span>
                </div>
                <div class="content">
                    <h4>Manufacturing</h4>
                    <p>Electronic Materials has servd the semicondctor <br>industry as a leading-edge materials.</p>
                </div>
            </div>
            <div class="item center">
                <div class="icon_box">
                    <span class="icon-science-1"></span>
                </div>
                <div class="content">
                    <h4>Medical & Health Care</h4>
                    <p>Electronic Materials has servd the semicondctor <br>industry as a leading-edge materials.</p>
                </div>
            </div>
            <div class="item center">
                <div class="icon_box">
                    <span class="icon-graphic"></span>
                </div>
                <div class="content">
                    <h4>Financial Service</h4>
                    <p>Our financial experts help analyze financial data, <br> to create steady financial foundation.</p>
                </div>
            </div>
            <div class="item center">
                <div class="icon_box">
                    <span class="icon-science"></span>
                </div>
                <div class="content">
                    <h4>Manufacturing</h4>
                    <p>Electronic Materials has servd the semicondctor <br>industry as a leading-edge materials.</p>
                </div>
            </div>
            <div class="item center">
                <div class="icon_box">
                    <span class="icon-science-1"></span>
                </div>
                <div class="content">
                    <h4>Medical & Health Care</h4>
                    <p>Electronic Materials has servd the semicondctor <br>industry as a leading-edge materials.</p>
                </div>
            </div>
            
        </div>
    </div>
</div>
<!--End Services -->

<!--Start Latest News -->
            
<section class="blog-section sec-padd-top">
    <div class="container">
        <div class="section-title center">
            <h2>latest news</h2>
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="default-blog-news wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
                    <div class="img-box">
                        <a href="blog-details.html"><img src="images/blog/1.jpg" alt="News"></a>
                    </div>
                    <div class="lower-content">
                        <div class="date center">21 <br> Aug</div>
                        <div class="text">
                            <h4><a href="blog-details.html">Retail banks wake up to digital</a></h4>
                            <p>Know how to pursue pleasure rationally seds our encounter consequences complete account of the system and expound works.</p>                            
                        </div>
                        <div class="post-meta"><a href="#" class="link_btn">Read More</a><span><i class="fa fa-user"></i>By Antony</span><span><i class="fa fa-comments"></i>22 Comments</span></div>
                        
                    </div>
                </div>
                
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="default-blog-news wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
                    <div class="img-box">
                        <a href="blog-details.html"><img src="images/blog/2.jpg" alt="News"></a>
                    </div>
                    <div class="lower-content">
                        <div class="date center">17 <br> May</div>
                        <div class="text">
                            <h4><a href="blog-details.html">Create great WordPress theme</a></h4>
                            <p>Which toil and pain can procure him some greater pleasure. To taken a trivial examples, which of us ever undertakes laborious.</p>                            
                        </div>
                        <div class="post-meta"><a href="#" class="link_btn">Read More</a><span><i class="fa fa-user"></i>By Antony</span><span><i class="fa fa-comments"></i>22 Comments</span></div>
                        
                    </div>
                </div>
                
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="default-blog-news wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
                    <div class="img-box">
                        <a href="blog-details.html"><img src="images/blog/3.jpg" alt="News"></a>
                    </div>
                    <div class="lower-content">
                        <div class="date center">24 <br> Apr</div>
                        <div class="text">
                            <h4><a href="blog-details.html">How to improve employees skills</a></h4>
                            <p>Expound the actual teachings of the great explorer of the truth, the master-builder rejects, dislikes, or pleasure of human happiness.</p>                            
                        </div>
                        <div class="post-meta"><a href="#" class="link_btn">Read More</a><span><i class="fa fa-user"></i>By Antony</span><span><i class="fa fa-comments"></i>22 Comments</span></div>
                        
                    </div>
                </div>
                
            </div>
            
        </div>
    </div>
</section>
<!--End Latest News -->

<!--Start Partners -->
            
<section class="clients-section sec-padd">
    <div class="container">
        <div class="section-title">
            <h2>our partners</h2>
        </div>
        <div class="client-carousel owl-carousel owl-theme">

            <div class="item tool_tip" title="Our Partners">
                <img src="images/clients/1.png" alt="Our Partners">
            </div>
            <div class="item tool_tip" title="Our Partners">
                <img src="images/clients/2.png" alt="Our Partners">
            </div>
            <div class="item tool_tip" title="Our Partners">
                <img src="images/clients/3.png" alt="Our Partners">
            </div>
            <div class="item tool_tip" title="Our Partners">
                <img src="images/clients/4.png" alt="Our Partners">
            </div>
            <div class="item tool_tip" title="Our Partners">
                <img src="images/clients/5.png" alt="Our Partners">
            </div>
            <div class="item tool_tip" title="Our Partners">
                <img src="images/clients/6.png" alt="Our Partners">
            </div>
            <div class="item tool_tip" title="Our Partners">
                <img src="images/clients/7.png" alt="Our Partners">
            </div>
            <div class="item tool_tip" title="Our Partners">
                <img src="images/clients/8.png" alt="Our Partners">
            </div>
            <div class="item tool_tip" title="Our Partners">
                <img src="images/clients/9.png" alt="Our Partners">
            </div>
            <div class="item tool_tip" title="Our Partners">
                <img src="images/clients/10.png" alt="Our Partners">
            </div>
            <div class="item tool_tip" title="Our Partners">
                <img src="images/clients/11.png" alt="Our Partners">
            </div>
            <div class="item tool_tip" title="Our Partners">
                <img src="images/clients/12.png" alt="Our Partners">
            </div>
            <div class="item tool_tip" title="Our Partners">
                <img src="images/clients/13.png" alt="Our Partners">
            </div>

        </div>
    </div>  
</section>
<!--End Partners -->
<!--Start Consultations -->
            
<section class="consultations sec-padd-top"> 
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <div class="section-title">
                    <h2>get a free consultation</h2>
                </div>
                <div class="text">
                    <p>Would you like to take free consultation from one of our business advisers <br>
                        over the phone? Just submit your details in given field and our experts we’ll be
                        in touch as soon as possible. You can ask any doubts about your business they
                        will guide you much better than what you expect.</p>
                </div>
            </div>
            <div class="col-md-5 col-md-offset-1 col-sm-12">
                <div class="default-form-area">
                    <div class="default-form" action="inc/sendmail.php" method="post">
                        <div class="row clearfix">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <h5>I would like to discuss </h5>
                                <div class="form-group">
                                    <select class="text-capitalize selectpicker" name="form_subject" class="form-control required" data-style="g-select" data-width="100%">
                                        <option value="0" selected="">Business Growth</option>
                                        <option value="1">Sustainability</option>
                                        <option value="2">Advanced Analytics</option>
                                        <option value="3">Organization</option>
                                        <option value="3">Customer Insights</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                
                                <div class="form-group">
                                    <input type="text" name="form_name" class="form-control" value="" placeholder="Name " required>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <input type="text" name="form_phone" class="form-control" value="" placeholder="Phone">
                                </div>
                            </div>
                            
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <input id="form_botcheck" name="form_botcheck" class="form-control" type="hidden" value="">
                                    <button class="thm-btn thm-color" type="submit" data-loading-text="Please wait...">submit</button>
                                </div>
                            </div>   

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--End Consultations -->



<footer class="main-footer sec-padd-top" style="background-image: url(images/background/4.jpg);">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="about-widget">
                    <figure class="footer-logo"><a href="index.html"><img src="images/logo/logo2.png" alt=""></a></figure>
                    
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
            <p>Copyrights © 2019 All Rights Reserved. Powered by  <a href="#">Savease.</a></p>
            
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
	<script src="js/jquery.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- jQuery ui js -->
	<script src="js/jquery-ui.js"></script>
	<!-- owl carousel js -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- jQuery validation -->
	<script src="js/jquery.validate.min.js"></script>
	<!-- google map -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRvBPo3-t31YFk588DpMYS6EqKf-oGBSI"></script> 
	<script src="js/gmap.js"></script>
	<!-- mixit up -->
	<script src="js/wow.js"></script>
	<script src="js/jquery.mixitup.min.js"></script>
	<script src="js/jquery.fitvids.js"></script>
    <script src="js/bootstrap-select.min.js"></script>
	<script src="js/menuzord.js"></script>

	<!-- revolution slider js -->
	<script src="assets/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script src="assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script src="assets/revolution/js/extensions/revolution.extension.video.min.js"></script>

	<!-- fancy box -->
	<script src="js/jquery.fancybox.pack.js"></script>
	<script src="js/jquery.polyglot.language.switcher.js"></script>
	<script src="js/nouislider.js"></script>
	<script src="js/jquery.bootstrap-touchspin.js"></script>
	<script src="js/SmoothScroll.js"></script>
	<script src="js/jquery.appear.js"></script>
	<script src="js/jquery.countTo.js"></script>
	<script src="js/jquery.flexslider.js"></script>
    <script src="js/imagezoom.js"></script> 
	<script src="js/Chart.js"></script>	
	<script id="map-script" src="js/default-map.js"></script>
	<script src="js/custom.js"></script>

                </td></tr>
</table>
    </form>
</body>
</html>
