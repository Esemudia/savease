<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze.Master" AutoEventWireup="true" CodeBehind="faq.aspx.cs" Inherits="saveasze.faq" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="inner-banner has-base-color-overlay text-center" style="background: url(images/background/1.jpg);">
    <div class="container">
        <div class="box">
            <h3>FAQ's</h3>
        </div>
    </div>
    <div class="breadcumb-wrapper">
        <div class="container">
            <div class="pull-left">
                <ul class="list-inline link-list">
                    <li>
                        <a href="Default.aspx">Home</a>
                    </li>
                    <li>
                        <a href="about.aspx"
>about us</a>
                    </li>
                    <li>
                        FAQ's
                    </li>
                </ul>
            </div>
            <div class="pull-right">
                <a class="get-qoute" href="#"><i class="fa fa-share-alt"></i>share</a>
            </div>
        </div>
    </div>
</div>
    <section class="about-faq">
    <div class="container">
        <div class="row">
            
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="sec-padd">
                    <div class="accordion-box style-one">
                        <!--Start single accordion box-->
                        <div class="accordion animated out" data-animation="fadeInUp" data-delay="0">
                            <div class="acc-btn">
                                <p class="title">What is the procedure to join with your company?</p>
                                <div class="toggle-icon">
                                    <span class="plus fa fa-angle-right"></span><span class="minus fa fa-angle-down"></span>
                                </div>
                            </div>
                            <div class="acc-content">
                                <div class="text"><p>
                                    The master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure. 
                                </p></div>
                            </div>
                        </div>
                        <!--Start single accordion box-->
                        <div class="accordion animated out" data-animation="fadeInUp" data-delay="0">
                            <div class="acc-btn active">
                                <p class="title">Do you give any offer for premium customer?</p>
                                <div class="toggle-icon">
                                    <i class="plus fa fa-angle-right"></i><i class="minus fa fa-angle-down"></i>
                                </div>
                            </div>
                            <div class="acc-content collapsed">
                                <div class="text"><p>
                                    The master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure. 
                                </p></div>
                            </div>
                        </div>
                        <!--Start single accordion box-->
                        <div class="accordion animated out" data-animation="fadeInUp" data-delay="0">
                            <div class="acc-btn">
                                <p class="title">What makes you special from others?</p>
                                <div class="toggle-icon">
                                    <i class="plus fa fa-angle-right"></i><i class="minus fa fa-angle-down"></i>
                                </div>
                            </div>
                            <div class="acc-content">
                                <div class="text"><p>
                                    The master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure. 
                                </p></div>
                            </div>
                        </div>
                        <!--Start single accordion box-->
                        <div class="accordion animated out" data-animation="fadeInUp" data-delay="0">
                            <div class="acc-btn">
                                <p class="title">Why Would a Successful Entrepreneur Hire a Coach?</p>
                                <div class="toggle-icon">
                                    <i class="plus fa fa-angle-right"></i><i class="minus fa fa-angle-down"></i>
                                </div>
                            </div>
                            <div class="acc-content">
                                <div class="text"><p>
                                    The master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure. 
                                </p></div>
                            </div>
                        </div>
                        <!--Start single accordion box-->
                        <div class="accordion animated out" data-animation="fadeInUp" data-delay="0">
                            <div class="acc-btn">
                                <p class="title">Waht makes your financial projects special?</p>
                                <div class="toggle-icon">
                                    <i class="plus fa fa-angle-right"></i><i class="minus fa fa-angle-down"></i>
                                </div>
                            </div>
                            <div class="acc-content">
                                <div class="text"><p>
                                    The master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure. 
                                </p></div>
                            </div>
                        </div>
                        <!--Start single accordion box-->
                        <div class="accordion animated out" data-animation="fadeInUp" data-delay="0">
                            <div class="acc-btn">
                                <p class="title">How long will take us to raise capital?</p>
                                <div class="toggle-icon">
                                    <i class="plus fa fa-angle-right"></i><i class="minus fa fa-angle-down"></i>
                                </div>
                            </div>
                            <div class="acc-content">
                                <div class="text"><p>
                                    The master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure. 
                                </p></div>
                            </div>
                        </div>
                        <!--Start single accordion box-->
                        <div class="accordion animated out" data-animation="fadeInUp" data-delay="0">
                            <div class="acc-btn">
                                <p class="title">Can I offer my items for free on a promotional basis?</p>
                                <div class="toggle-icon">
                                    <i class="plus fa fa-angle-right"></i><i class="minus fa fa-angle-down"></i>
                                </div>
                            </div>
                            <div class="acc-content">
                                <div class="text"><p>
                                    The master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure. 
                                </p></div>
                            </div>
                        </div>



                    </div>
                </div>
                    
            </div>
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="default-form-area sec-padd-top single-faq-bg">
                    <h3>Asq Your Questions</h3>
                    <form name="contact_form" class="default-form" id="contact_form" action="inc/sendmail.php" method="post">
                        <div class="row clearfix">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                
                                <div class="form-group">
                                    <input name="form_name" class="form-control" required="" type="text" placeholder="Name *" value="">
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <input name="form_email" class="form-control required email" required="" type="email" placeholder="Mail *" value="">
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <input name="form_subject" class="form-control" type="text" placeholder="Subject" value="">
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <textarea name="form_message" class="form-control textarea required" placeholder="Your questions...."></textarea>
                                </div>
                            </div>   
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <input name="form_botcheck" class="form-control" id="form_botcheck" type="hidden" value="">
                                    <button class="thm-btn thm-color" type="submit" data-loading-text="Please wait...">submit now</button>
                                </div>
                            </div>   

                        </div>
                    </form>
                    <br><br>
                </div>

            </div>

        </div>
    </div>
</section>
</asp:Content>
