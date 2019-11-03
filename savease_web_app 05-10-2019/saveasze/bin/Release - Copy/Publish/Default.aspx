<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="saveasze.Contact" %>

<%@ Register Src="~/Testimonial.ascx" TagPrefix="uc1" TagName="Testimonial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<!--Start rev slider wrapper-->     
<section class="rev_slider_wrapper">
    <div id="slider1" class="rev_slider"  data-version="5.0">
          <ul>
            <li data-transition="fade">
                <img src="images/slider/2.jpg"  alt="" width="1920" height="580" data-bgposition="top center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="1" >
                
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
                        <h3>SAVEASE, created for you</h3>
                        <h1>as Nigeria's Digital Banking Hub</h1>
                        <p>Thus, it has created the first ever savings scratch card, <br />
offering its users: a simple and convenient way to make mini deposits<br /> into distinctive bank accounts across the nation.</p>
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
                            <a class="thm-btn yellow-bg" href="verifyPin.aspx">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Verify PIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>     
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
                            <a class="thm-btn our-solution" href="Deposit.aspx">Make Deposit</a>     
                        </div>
                    </div>
                </div>
            </li>
            <li data-transition="fade">
                <img src="images/slider/1.jpg"  alt="" width="1920" height="550" data-bgposition="top center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="1" >
                
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
                        <h3>Create a SAVEASE account or</h3>
                        <h1>Open account with any bank</h1>
                        <p>from this platform and start making instant deposits. 
No paper work required.</p>
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
                            <a class="thm-btn yellow-bg" href="verifyPin.aspx">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Verify PIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>     
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
                            <a class="thm-btn our-solution" href="deposit.aspx">Make Deposit</a>     
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
                        <h3>Get weekly bonuses</h3>
                        <h1>Save money for anything</h1>
                        <p>like rents, fees, utilities, shopping, entertainment and others<br />
with deals from our partnering institutions.</p>
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
                            <a class="thm-btn yellow-bg" href="VerifyPin.aspx">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Verify PIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>     
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
                            <a class="thm-btn our-solution" href="deposit.aspx">Make Deposit</a>     
                        </div>
                    </div>
                </div>
            </li>
              <li data-transition="fade">
                <img src="images/slider/4.jpg"  alt="" width="1920" height="580" data-bgposition="top center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="1" >
                
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
                        
                        <h3>Think Savings! Think Savease!!</h3>
                        <h1>Our priority is your security</h1>
                        <p>We use the highest level of internet security <br>as its secured 256bits SSL security encryption to ensure fraud protection.</p>
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
                            <a class="thm-btn yellow-bg" href="verifyPin.aspx">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Verify PIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>     
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
                            <a class="thm-btn our-solution" href="Deposit.aspx">Make Deposit</a>     
                        </div>
                    </div>
                </div>
            </li>
            
            
            <li data-transition="fade">
                <img src="images/slider/6.jpg"  alt="" width="1920" height="580" data-bgposition="top center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="1" >
                
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
                        <h3>Savings made easy</h3>
                        <h1>Savease Scratch Card/PIN in your hands</h1>
                        <p>your bank deposit alert is just a click away. <br />
No need going to the bank to make over the counter deposit payments.  <br />Just buy, scratch n' click... </p>
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
                            <a class="thm-btn yellow-bg" href="VerifyPin.aspx">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Verify PIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>     
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
                            <a class="thm-btn our-solution" href="deposit.aspx">Make Deposit</a>     
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</section>
<!--End rev slider wrapper--> 


<section class="about-us sec-padd" style="background-image: url(images/background/why6.png); background-position:center;">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <div class="section-title">
                    <h2>About Savease</h2><br />
                </div>
                <div class="text">
                      <p style="color:black;">SAVEASE was established to create simple solutions to complex savings problem. It was designed to initiate useful strategies that will promote effective savings culture among Africans.</p>
                 <p style="color:black;">It has created the first ever instant deposit scratch card, offering its users: a simple and convenient way to make deposits into distinctive bank accounts across the continent starting from Nigeria.</p>
                      <p style="color:black;">We recognize that good savings habit is vital to capital development and financial independence; thus, we have designed and provided a simple, yet compelling approach to help every person in the society achieve this fundamental goal.  
.</p><br><br>
                    <div class="link"><a href="about.aspx" class="thm-btn">know more</a></div>
                </div>
            </div>
            <div class="col-md-6 col-sm-12">
                <div class="img-box">
                    <img src="images/resource/about1.jpeg" alt="">
                </div>
            </div>
        </div>
    </div>
</section>
    
    <!-- start-->
    
<div class="growth-service style-2 sec-padd" style="background-image: url(images/background/6.jpg); background-position:center;">
    <div class="container">
        <div class="three-column-carousel">
            <div class="item center">
                <div class="icon_box">
                    <span class="icon-graphic"></span>
                </div>
                <div class="content">
                    <h4>Make Bank Deposit</h4>
                    <p>The SAVEASE SCRATCHCARD is designed to facilitate deposit transactions<br /> from the comfort of anywhere, without having to walk into a banking hall.</p>
                </div>
            </div>
            <div class="item center">
                <div class="icon_box">
                    <span class="icon-graphic"></span>
                </div>
                <div class="content">
                    <h4>Savings & Goals</h4>
                    <p>A contemporary and innovation approach to the production, promotion, <br />and marketing of savings habit. Just Buy, Scratch n’ Click.</p>
                </div>
            </div>
            <div class="item center">
                <div class="icon_box">
                    <span class="icon-graphic"></span>
                </div>
                <div class="content">
                    <h4>Request for ATM</h4>
                    <p>The Nigerian banking system is now good, but the only way to be excellent is to do it shortly: <br />With SAVEASE NIGERIA everything is done shortly</p>
                </div>
            </div>
            <div class="item center">
                <div class="icon_box">
                    <span class="icon-graphic"></span>
                </div>
                <div class="content">
                    <h4>Instant Loan</h4>
                    <p>Get quick loan with no collateral</p>
                </div>
            </div>
            <div class="item center">
                <div class="icon_box">
                    <span class="icon-graphic"></span>
                </div>
                <div class="content">
                    <h4>Request for Savease Debit Card</h4>
                    <p>To get your savease debit card, no paper work is needed just register <a href="#">here</a> and request.</p>
                </div>
            </div>
            <div class="item center">
                <div class="icon_box">
                    <span class="icon-graphic"></span>
                </div>
                <div class="content">
                    <h4>Become an Authorized Vendor</h4>
                    <p>Electronic Materials has servd the semicondctor <br>industry as a leading-edge materials.</p>
                </div>
            </div>
            
        </div>
    </div>
</div>
    <!-- End-->
<section class="service sec-padd-top" style="background-image:url(images/background/test1.png)">
    <div class="container">
        <div class="section-title center">
            <h2>Why Choosing Savease</h2>
        </div>
        <br style="align-items:left;">
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="item">
                    <figure class="img-box">
                        <a href="#"><img src="images/Advert3.png" alt=""></a>
                        <div class="bottom-content">
                            <div class="clearfix">
                                <h4>Strengthening Savings Habit</h4>
                            </div>
                                
                        </div>
                        <div class="overlay-box">
                            <div class="inner-box">
                                <div class="clearfix">
                                    <div class="icon_box">
                                        <span class="icon-arrow"></span>
                                    </div>
                                    <h4>Strengthening Savings Habit</h4>
                                </div>
                                    
                                <div class="text">
                                    <p>Savings habit among Nigerians is very low. This is because attention and the provision of a structured system to help manage the petty finances of most low income earners is not in place. It is a myth among Nigerians that funds less than N500 should not be made for lodgment.  </p>
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
                        <a href="#"><img src="images/Advert1.png" alt=""></a>
                        <div class="bottom-content">
                            <div class="clearfix">
                                <h4>Instant Deposit Confirmation</h4>
                            </div>
                                
                        </div>
                        <div class="overlay-box">
                            <div class="inner-box">
                                <div class="clearfix">
                                    <div class="icon_box">
                                        <span class="icon-travel"></span>
                                    </div>
                                    <h4>Instant Deposit Confirmation</h4>
                                </div>
                                    
                                <div class="text">
                                    <p>Once a transaction is done with the SAVEASE platform, an instant confirmation will be received on the mobile phone used for the transaction, followed by a credit alert from the crediting bank to the recipient telephone. This super-fast experience makes banking impressive and excellent.  </p>
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
                        <a href="#"><img src="images/Advert2.png" alt=""></a>
                        <div class="bottom-content">
                            <div class="clearfix">
                                  <h4>Destroy Impulsive Expenditure</h4>
                            </div>
                                
                        </div>
                        <div class="overlay-box">
                            <div class="inner-box">
                                <div class="clearfix">
                                    <div class="icon_box">
                                        <span class="icon-search"></span>
                                    </div>
                                       <h4>Destroy Impulsive Expenditure</h4>
                                </div>
                                    
                                <div class="text">
                                   Most expenditures are done on impulses. This breakthrough in banking will reduce such unplanned expenditures. It will encourage the proper budgeting technique needed to develop good financial habits, as there will no longer be idle physical cash.</p>
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

    <%--start our product--%>
<section class="clients-section sec-padd" style="background:url(images/background/why4.png)">
    <div class="container">
        <div class="section-title">
            <h2><font color="#212435">Our Products</font></h2>
        </div>
        <div class="client-carousel owl-carousel owl-theme">

<%--            <div class="item tool_tip" title="Our Partners">
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
            </div>--%>
            <div class="item tool_tip" title="Savease Card">
                <img src="images/clients/14.jpg" alt="Savease  Card">
            </div>
            <div class="item tool_tip" title="Savease Card">
                <img src="images/clients/15.png" alt="Savease  Card">
            </div>
            <div class="item tool_tip" title="Savease Card">
                <img src="images/clients/16.png" alt="Savease  Card">
            </div>
            <div class="item tool_tip" title="Savease Card">
                <img src="images/clients/17.png" alt="Savease  Card">
            </div>
            <div class="item tool_tip" title="Savease Card">
                <img src="images/clients/18.png" alt="Savease  Card">
            </div>
            <div class="item tool_tip" title="Savease Card">
                <img src="images/clients/19.png" alt="Savease  Card">
            </div>
            <div class="item tool_tip" title="Savease Card">
                <img src="images/clients/20.png" alt="Savease  Card">
            </div>

        </div>
    </div>  
</section>

    <%--End our Product--%>


    <!--Start Vendor and Customer of the month-->
 


 <section class="testimonials sec-padd-top" style="background-image:url(images/background/test1.png)">
    <div class="container"> 
        <div class="section-title">
            <h2><font color="#212435">Testimonials</font></h2>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-6">
                <div class="item">
                    <div class="text">
                        <p style="color:black;">Savease has really imparted so much on my family teaching my kids how to save their snack money into thier savease account .</p>
                        <div class="quot"><i class="fa fa-quote-left"></i></div>
                    </div>
                    
                    <div class="author-info">
                        <ul class="list-inline">
                            <li>
                                <img src="images/resource/thumb1.jpg" alt="">
                            </li>
                            <li>
                                <h2 class="author">Mary Okoye</h2>
                                <p class="author-title">School Teacher</p>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-6">
                <div class="item">
                    <div class="text">
                        <p style="color:black;">As a busy business owner, i need 21st century technology, backed by human touch. With savease i have both.</p>
                        <div class="quot"><i class="fa fa-quote-left"></i></div>
                    </div>
                    
                    <div class="author-info">
                        <ul class="list-inline">
                            <li>
                                <img src="images/resource/thumb2.jpg" alt="">
                            </li>
                            <li>
                                <h2 class="author">James Asama</h2>
                                <p class="author-title">Entrepreneur</p>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
            <div class="col-md-4 col-sm-6 col-xs-6">
                <div class="item">
                    <div class="text">
                        <p style="color:black;">My pikin help me download the thing, now i dey put money for my bank. My money dey plenty everyday.</p>
                        <div class="quot"><i class="fa fa-quote-left"></i></div>
                    </div>
                    
                    <div class="author-info">
                        <ul class="list-inline">
                            <li>
                                <img src="images/resource/thumb3.jpg" alt="">
                            </li>
                            <li>
                                <h2 class="author">Titilayo Ashafa</h2>
                                <p class="author-title">Farmer</p>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
             <div class="col-md-4 col-sm-6 col-xs-6">
                <div class="item">
                    <div class="text">
                        <p style="color:black;">Make Una help me thank this people oh, now i dey send money give my pikin for school from this village i dey so.</p>
                        <div class="quot"><i class="fa fa-quote-left"></i></div>
                    </div>
                    
                    <div class="author-info">
                        <ul class="list-inline">
                            <li>
                                <img src="images/resource/thumb2.jpg" alt="">
                            </li>
                            <li>
                                <h2 class="author">Ukamaka Nwankwo</h2>
                                <p class="author-title">Petty Trader</p>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
           <div class="col-md-4 col-sm-6 col-xs-6">
                <div class="item">
                    <div class="text">
                        <p style="color:black;">My country people this thing na better thing wey don come for our country so.
                            Now i go send money from market to my account.</p>
                        <div class="quot"><i class="fa fa-quote-left"></i></div>
                    </div>
                    
                    <div class="author-info">
                        <ul class="list-inline">
                            <li>
                                <img src="images/resource/thumb3.jpg" alt="">
                            </li>
                            <li>
                                <h2 class="author">Okey Nwagbo</h2>
                                <p class="author-title">Trader</p>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
             <div class="col-md-4 col-sm-6 col-xs-6">
                <div class="item">
                    <div class="text">
                        <p style="color:black;">With savease i don't need to go ask for loan from any bank to grow my business. My business grew because i saved.</p>
                        <div class="quot"><i class="fa fa-quote-left"></i></div>
                    </div>
                    
                    <div class="author-info">
                        <ul class="list-inline">
                            <li>
                                <img src="images/resource/thumb3.jpg" alt="">
                            </li>
                            <li>
                                <h2 class="author">Olaoluwa Ojo</h2>
                                <p class="author-title">Trader</p>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
</section>

    <!--End Vendor and Customer of the month-->
<!--Fact Counter-->
<section class="fact-counter sec-padd" style="display:none">
    <div class="container">
        <div class="title center">
            <h2>We have 25 years of experience</h2>
            <p>We are the leading provider of client solutions with over 10 years of experience helping businesses to findcomprehensive <br>solutions and high growth for your business.    </p>
        </div>
        <div class="row clearfix">
            <div class="counter-outer clearfix">
                <!--Column-->
                <article class="column counter-column col-md-3 col-sm-6 col-xs-12 wow fadeIn" data-wow-duration="0ms">
                    <div class="item">
                        <div class="count-outer"><span class="count-text" data-speed="3000" data-stop="2456">0</span></div>
                        <h4 class="counter-title">Projects Completed</h4>
                    </div>
                        
                </article>
                
                <!--Column-->
                <article class="column counter-column col-md-3 col-sm-6 col-xs-12 wow fadeIn" data-wow-duration="0ms">
                    <div class="item">
                        <div class="count-outer"><span class="count-text" data-speed="3000" data-stop="146">0</span>+</div>
                        <h4 class="counter-title">Expert Technicians</h4>
                    </div>
                </article>
                
                <!--Column-->
                <article class="column counter-column col-md-3 col-sm-6 col-xs-12 wow fadeIn" data-wow-duration="0ms">
                    <div class="item">
                        <div class="count-outer"><span class="count-text" data-speed="3000" data-stop="853">0</span>+</div>
                        <h4 class="counter-title">Happy Customers</h4>
                    </div>
                </article>
                
                <!--Column-->
                <article class="column counter-column col-md-3 col-sm-6 col-xs-12 wow fadeIn" data-wow-duration="0ms">
                    <div class="item">
                        <div class="count-outer"><span class="count-text" data-speed="3000" data-stop="2381">0</span></div>
                        <h4 class="counter-title">Cups of Coffee</h4>
                    </div>
                </article>
            </div>
        </div>
    </div>
</section>



<section class="clients-section sec-padd" style="background:url(images/background/our2.jpg)">
    <div class="container">
        <div class="section-title">
            <h2 style="color:black;">Our Partners</h2>
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

<section class="blog-section sec-padd-top" style="background-image:url(images/background/new11.png); background-position:center; background-size:cover">
    <div class="container">
        <div class="section-title center">
            <h2>latest news</h2>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="default-blog-news wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
                    <div class="img-box">
                        <a href="blog-details.html"><img src="images/blog/6.jpg" alt="News"></a>
                    </div>
                    <div class="lower-content">
                        <div class="date center">04 <br> Jun</div>
                        <div class="text">
                            <h4><a href="#">Wealth Fund in infrastructure </a></h4>
                            <p>President of the bank, Dr. Akinwumi Adesina, spoke with EVEREST AMAEFULE on various issues hampering development on the continent and the lessons from South Korea’s giant strides.</p>                            
                        </div>
                        <div class="post-meta"><a href="http://punchng.com/africa-should-deploy-sovereign-wealth-fund-in-infrastructure-adesina/" target="_blank" class="link_btn">Read More</a><span><i class="fa fa-user"></i>By Adesina</span><span><i class="fa fa-comments"></i>22 Comments</span></div>
                        
                    </div>
                </div>
                
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="default-blog-news wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
                    <div class="img-box">
                        <a href="blog-details.html"><img src="images/blog/5.jpg" alt="News"></a>
                    </div>
                    <div class="lower-content">
                        <div class="date center">17 <br> May</div>
                        <div class="text">
                            <h4><a href="#">Knowing when to quit a business</a></h4>
                            <p>It is important to fight against all odds but there are times when giving up is the right option. Follow the tips below to know the right time to give up.</p>                            
                        </div>
                        <div class="post-meta"><a href="http://punchng.com/knowing-when-to-quit-a-business/" target="_blank" class="link_btn">Read More</a><span><i class="fa fa-user"></i>By PUNCH</span><span><i class="fa fa-comments"></i>22 Comments</span></div>
                        
                    </div>
                </div>
                
            </div>
            <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="default-blog-news wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
                    <div class="img-box">
                        <a href="blog-details.html"><img src="images/blog/4.jpg" alt="News"></a>
                    </div>
                    <div class="lower-content">
                        <div class="date center">24 <br> Apr</div>
                        <div class="text">
                            <h4><a href="blog-details.html">Nigeria records $24.7bn forex inflow</a></h4>
                            <p>The Nigerian economy recorded a total foreign exchange inflow of $24.71bn, figures obtained from the Central Bank of Nigeria have revealed.</p>                            
                        </div>
                        <div class="post-meta"><a href="http://punchng.com/nigeria-records-24-7bn-forex-inflow-in-three-months/" target="_blank" class="link_btn">Read More</a><span><i class="fa fa-user"></i>By Ifeanyi </span><span><i class="fa fa-comments"></i>22 Comments</span></div>
                        
                    </div>
                </div>
                
            </div>
            
        </div>
    </div>
</section>

<section class="consultations sec-padd-top"> 
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <div class="section-title">
                    <h2>Feedback from you</h2><br />
                </div>
                <div class="text">
                    <p style="color:white;">Would you like to take free introduction/survey of the solution from an independent business adviser 
over the phone, email or even a tour to our office? Just submit your details in given field and our experts we’ll be in touch as soon as possible. You can ask about any doubts and they will guide you much better than what you expect. We want to help you better. Talk to us today.
</p>
                </div>
            </div>
            <div class="col-md-5 col-md-offset-1 col-sm-12">
                <div class="default-form-area">
                    <div class="default-form">
                        <div class="row clearfix">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <h5>I would like to discuss </h5>
                                <div class="form-group">
                                    <select class="text-capitalize selectpicker" name="form_subject" class="form-control required" data-style="g-select" data-width="100%">
                                        <option value="0" selected="">Make Bank Deposit</option>
                                        <option value="1">Savings & Goals</option>
                                        <option value="2">Wealth & Investments</option>
                                        <option value="3">Open A Bank Account</option>
                                        <option value="4">Request for ATM</option>
                                        <option value="5">Instant Loan</option>
                                        <option value="6">Request Savease Debit Card</option>
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
                                    <input type="text" name="form_email" class="form-control" value="" placeholder="Email">
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <textarea name="form_message" class="form-control" value="" placeholder="Message"></textarea>
                                   
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



</asp:Content>


