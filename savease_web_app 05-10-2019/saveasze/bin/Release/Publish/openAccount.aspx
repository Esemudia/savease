<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="openAccount.aspx.cs" Inherits="saveasze.openAccount" %>

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
</head>
<body>

    <form id="form1" runat="server">
    <div class="boxed_wrapper">
<header class="header-area">
    <div class="top-bar" style="display:none">
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
    <div class="header-bottom">MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
        <div class="container">
            <div class="header-bottom-bg clearfix" style="display:none">
                <div class="main-logo float_left" style="display:none">
                    <a href="Default.aspx"><img src="images/logo/logo.png" alt=""></a>
                </div>
                <div class="top-info float_right"  style="display:none">
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
                    </ul>    
                </div> 
            </div>
                    
        </div>
    </div>  
        
</header>

<!-- Menu ******************************* -->
<section class="theme_menu stricky" style="display:none">
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
                           
                            <li><a href="#">Make Money With Us</a>
                            <ul class="dropdown">
                                <li><a href="#">Become a vendor</a></li>
                                <li><a href="#">Retailer Outlet</a></li>
                             </ul>
                                
                            </li>
                            <li><a href="#">Pay with savease</a> </li>

                            <li><a href="#">CONTACT US</a></li>




                        </ul><!-- End of .menuzord-menu -->
                    </nav> <!-- End of #main_menu -->
                </div>
                <div class="right-column">
                    <div class="right-area">
                        <div class="nav_side_content">
                            <div class="select-box" style="display:none">
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

    <div class="inner-banner has-base-color-overlay text-center" style="background: url(images/background/1.jpg);" style="display:none">
    
    <div class="breadcumb-wrapper">
        <div class="container" >
            <div class="pull-left">
                <ul class="list-inline link-list">
                    <li>
                        <a href="index.html">Home</a>
                    </li>
                    <li>
                        <a href="blog-default.html">blog</a>
                    </li>
                    <li>
                        Blog Single Post
                    </li>
                </ul>
            </div>
            <div class="pull-right">
                <a href="#" class="get-qoute"><i class="fa fa-share-alt"></i>share</a>
            </div>
        </div>
    </div>
</div>

<div class="sidebar-page-container sec-padd">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <section class="blog-section">
                    <div class="default-blog-news single-blog-post single-blog wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
                       <br /> <div class="img-box">
                           <table style="width:770px;height:385px;">
                               
                               <tr>
                                   <td><img src="images/blog/8.jpg" usemap="#Map" /></td>
                               </tr>
                           </table>
                        </div>
                        <div class="lower-content" style="display:none">
                            <h3><a href="blog-details.html">Seminar for improve your business profit & loss</a></h3>
                            <div class="date center">21 <br> Aug</div>
                            <div class="post-meta"><span><i class="fa fa-user"></i>By Fletcher</span><span><i class="fa fa-tag"></i>Consulting</span><span><i class="fa fa-comments"></i>22 Comments</span><span><i class="fa fa-heart"></i>84 Like</span></div>
                            <div class="text">
                                
                                <p>The great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, avoids seds pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pursue pleasure.  </p>     

                                <p>Who loves or pursues or desires to obtain pain of itself, because it is painbecause occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it right to find fault.</p>                       
                            </div>
                            <div class="author">
                                <!-- Image -->
                                <img src="images/blog/12.jpg" alt="">
                                <div class="author-comment">
                                    <div class="quote">
                                        <i class="fa fa-quote-left"></i>
                                    </div>
                                    <p>They have got my project on time with competition seds with a highly skilled, well-organized and denouncing of pleasures experienced team of professional.</p>
                                    <h5>Dohn Gaskel</h5>
                                    <p class="a-title">Manager</p>
                                </div>                                              
                            </div><br>
                            <div class="text">
                                <p>Know how to pursue pleasure rationally encounter consequences that are extremely painful seds or again is there anyone who loves or pursues or desires to obtain pain of itself, because seds our it pain, but because occasionally circumstances occur which toil and pain can  undertakes laborious physical exercise.</p>
                            </div>
                            <div class="border-bottom"></div>
                            <div class="share-box clearfix">
                                <ul class="tag-box pull-left">
                                    <li>Tags:</li>
                                    <li><a href="#">Consulting,</a></li>
                                    <li><a href="#">Business,</a></li>
                                    <li><a href="#">Seminar,</a></li>
                                </ul>
                                <div class="social-box pull-right">
                                <span>Share <i class="fa fa-share-alt"></i></span>
                                <ul class="list-inline social">
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                        <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        
                    </div>
                        
                    <div class="post-author"  style="display:none">

                        <div class="inner-box">
                            <figure class="author-thumb"><img src="images/blog/author.jpg" alt=""></figure>
                            <h4>Mark Richardson</h4>
                                <div class=""><p>We will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness.</p> 
                                <ul class="list-inline social">
                                    <li>
                                        <a href="#"><i class="fa fa-facebook"></i></a>                              
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa-twitter"></i></a>                               
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa-google-plus"></i></a>                               
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa-youtube"></i></a>                               
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                        
                    <div class="product-review-tab"  style="display:none">
                            
                        <div class="section-title">
                            <h3>read Comments</h3>
                        </div>
                        <div class="review-box">


                            <div class="single-review-box">
                                <div class="img-holder">
                                    <img src="images/shop/thumb1.jpg" alt="Awesome Image">
                                </div>
                                <div class="text-holder">
                                    <div class="top">
                                        <div class="name pull-left">
                                            <h4>Steven Rich – Sep 17, 2016:</h4>
                                        </div>
                                        <div class="review-box pull-right">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="text">
                                        <p>How all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings.</p>
                                    </div>
                                </div>
                            </div>
                            <!--End single review box-->
                            <!--Start single review box-->
                            <div class="single-review-box">
                                <div class="img-holder">
                                    <img src="images/shop/thumb2.jpg" alt="Awesome Image">
                                </div>
                                <div class="text-holder">
                                    <div class="top">
                                        <div class="name pull-left">
                                            <h4>William Cobus – Aug 21, 2016:</h4>
                                        </div>
                                        <div class="review-box pull-right">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="text">
                                        <p>there anyone who loves or pursues or desires to obtain pain itself, because it is pain, but because occasionally circumstances occur some great pleasure.</p>
                                    </div>
                                </div>
                            </div>
                            <!--End single review box-->   
                        </div>
                        <div class="add_your_review">
                            <div class="section-title">
                                <h3>Add Your comments</h3>
                            </div>

                            <span>Your Rating</span>
                            <ul class="rating">
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                            </ul>
                            <ul class="active rating">
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                            </ul>
                            <ul class="rating">
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                            </ul>
                            <ul class="rating">
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                            </ul>
                            <ul class="fix_border rating">
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                                <li><i class="fa fa-star" aria-hidden="true"></i></li>
                            </ul>

                            <form action="#">
                                <div class="row">
                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <label>First Name*</label>
                                        <input type="text" placeholder="">
                                    </div>
                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <label>Last Name*</label>
                                        <input type="text" placeholder="">
                                    </div>

                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <label>Email*</label>
                                        <input type="email" placeholder="">
                                    </div>
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <label>Your Comments*</label>
                                        <textarea placeholder=""></textarea>
                                    </div>
                                    
                                </div>
                                <button class="thm-btn thm-tran-bg tran3s">submit now</button>
                            </form>

                        </div> <!-- End of .add_your_review -->
                    </div>
                        

                </section>



            </div>
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                <div class="blog-sidebar">

                    <div class="category-style-one">
                        <div class="inner-title">
                            <h4>Login</h4>
                        </div>
                        <table>
                            <tr id="trUname" runat="server">
                                <td style="text-align:right"><asp:Label runat="server" ID="lblUname" Text="User Name:" Width="100px"></asp:Label></td>
                            <td style="text-align:left"><asp:TextBox ID="txtUser" runat="server" Width="300px"></asp:TextBox></td>

                            </tr>
                            <tr id="trUPwd" runat="server">
                                <td style="text-align:right"><asp:Label runat="server" ID="lblPwd" Text="Password:" Width="100px"></asp:Label></td>
                            <td style="text-align:left"><asp:TextBox ID="txtPwd" runat="server" Width="300px" TextMode="Password"></asp:TextBox></td>

                            </tr>
                            <tr>
                                <td><br /><asp:Button runat="server" ID="btnBack" class="thm-btn" Text="Back" Width="80%" OnClick="btnBack_Click"/>
                            </td>
                                 <td >
                                     <br />
                                    <asp:Button runat="server" ID="btnLogin1" class="thm-btn" Text="Login" Width="80%" OnClick="btnLogin1_Click"/>
                                    <asp:Button runat="server" ID="btnLogin2" class="thm-btn" Text="Login" Width="80%" OnClick="btnLogin2_Click" Visible="false"/>
                                     </td>

                            </tr>
                            <tr>
                                <td colspan="2"><asp:Label runat="server" ID="lblMessage" Text="" Width="100%"></asp:Label>
                            </td>

                            </tr>
                        </table>
                    </div> <!-- End of .sidebar_categories -->

                    <div class="popular_news" style="display:none">
                        <div class="inner-title">
                            <h4>latest news</h4>
                        </div>

                        <div class="popular-post">
                            <div class="item">
                                <div class="post-thumb"><a href="#"><img src="images/blog/post-1.jpg" alt=""></a></div>
                                <h4><a href="#">6 ways to keep in control <br>your debtors</a></h4>
                                <div class="post-info">October 21, 2016 </div>
                            </div>
                            <div class="item">
                                <div class="post-thumb"><a href="#"><img src="images/blog/post-2.jpg" alt=""></a></div>
                                <h4><a href="#">What a finance director  <br>could add business </a></h4>
                                <div class="post-info">January 14, 2016</div>
                            </div>
                            <div class="item">
                                <div class="post-thumb"><a href="#"><img src="images/blog/post-3.jpg" alt=""></a></div>
                                <h4><a href="#">Tips for sucess in 2016: Ways <br>to grow your business</a></h4>
                                <div class="post-info">December 17, 2015 </div>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar-intsgram" style="display:none">
                        <div class="inner-title">
                            <h4>Instagram</h4>
                        </div>
                        <ul class="list-inline clearfix">
                            <li>
                                <div class="inner-box">
                                    <img src="images/blog/i1.jpg" alt="Awesome Image">
                                    <div class="overlay">
                                        <div class="box">
                                            <div class="content">
                                                <a href="#"><i class="fa fa-link"></i></a>
                                            </div><!-- /.content -->
                                        </div><!-- /.box -->
                                    </div><!-- /.overlay -->
                                </div>
                            </li>
                            <li>
                                <div class="inner-box">
                                    <img src="images/blog/i2.jpg" alt="Awesome Image">
                                    <div class="overlay">
                                        <div class="box">
                                            <div class="content">
                                                <a href="#"><i class="fa fa-link"></i></a>
                                            </div><!-- /.content -->
                                        </div><!-- /.box -->
                                    </div><!-- /.overlay -->
                                </div>
                            </li>
                            <li>
                                <div class="inner-box">
                                    <img src="images/blog/i3.jpg" alt="Awesome Image">
                                    <div class="overlay">
                                        <div class="box">
                                            <div class="content">
                                                <a href="#"><i class="fa fa-link"></i></a>
                                            </div><!-- /.content -->
                                        </div><!-- /.box -->
                                    </div><!-- /.overlay -->
                                </div>
                            </li>
                            <li>
                                <div class="inner-box">
                                    <img src="images/blog/i4.jpg" alt="Awesome Image">
                                    <div class="overlay">
                                        <div class="box">
                                            <div class="content">
                                                <a href="#"><i class="fa fa-link"></i></a>
                                            </div><!-- /.content -->
                                        </div><!-- /.box -->
                                    </div><!-- /.overlay -->
                                </div>
                            </li>
                            <li>
                                <div class="inner-box">
                                    <img src="images/blog/i5.jpg" alt="Awesome Image">
                                    <div class="overlay">
                                        <div class="box">
                                            <div class="content">
                                                <a href="#"><i class="fa fa-link"></i></a>
                                            </div><!-- /.content -->
                                        </div><!-- /.box -->
                                    </div><!-- /.overlay -->
                                </div>
                            </li>
                            <li>
                                <div class="inner-box">
                                    <img src="images/blog/i6.jpg" alt="Awesome Image">
                                    <div class="overlay">
                                        <div class="box">
                                            <div class="content">
                                                <a href="#"><i class="fa fa-link"></i></a>
                                            </div><!-- /.content -->
                                        </div><!-- /.box -->
                                    </div><!-- /.overlay -->
                                </div>
                            </li>


                        </ul>
                    </div>
                    <div class="sidebar-archive" style="display:none">
                        <div class="inner-title">
                            <h4>Blog Archives</h4>
                        </div>
                        <select class="text-capitalize selectpicker" name="form_subject" class="form-control required" data-style="g-select" data-width="100%">
                            <option value="0" selected="">September</option>
                            <option value="1">August</option>
                            <option value="2">November</option>
                            <option value="3">December</option>
                        </select>
                    </div>
<!-- End of .sidebar_tags -->

                </div> <!-- End of .wrapper -->   
            </div>
        </div>
    </div>
</div>
<map name="Map">
  <area shape="rect" coords="228, 309, 506, 384" href="Default.aspx">
</map>

<footer class="main-footer sec-padd-top" style="background-image: url(images/background/4.jpg);display:none;" >
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

</div>
    <div>

    </div>
    </form>
</body>
</html>
