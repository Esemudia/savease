<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mailnotification.aspx.cs" Inherits="saveasze.mailnotification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       
    <style>
@import url('https://fonts.googleapis.com/css?family=Roboto:300,400,500');
body {
    font-family: 'Roboto', sans-serif;
    font-size: .9em;
    font-weight: 400;
    color: #797979;}
.btn { border-radius: 0px;}
ul.mail-list  { margin: 20px 0px; padding: 0; list-style-type: none; }
ul.mail-list li { line-height: 40px; margin: 5px 0px; padding: 0px 8px; border-radius: 4px; cursor: pointer;}
ul.mail-list li span { float: right; margin-top: 12px; }
ul.mail-list li:hover { background: #fff; }
ul.mail-inbox { margin: 0; padding: 0;}
ul.mail-inbox li { border-bottom: solid 1px #eee; display: block; float: left;  width: 100%; border-left: solid 3px #ccc;
    margin-top: 5px;  padding: 8px 0px 0px 8px; }
    ul.mail-inbox li svg    { color:#b5b5b5;}
ul.mail-inbox li:last-child { border-bottom: none;}
.check-box{display:block;position:relative;padding-left:25px;   cursor:pointer;font-size:18px;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;display:inline;top:-4px}.check-box input{position:absolute;opacity:0;cursor:pointer}.check-box-style{position:absolute;top:5px;left:0;height:20px;width:20px;background-color:#fff;border:solid 1px #999}.check-box:hover input~.check-box-style{background-color:#f1f1f1}.check-box input:checked~.check-box-style{background-color:#fff}.check-box-style:after{content:"";position:absolute;display:none}.check-box input:checked~.check-box-style:after{display:block}.check-box .check-box-style:after{top:3px;left:3px;width:12px;height:12px;background:#f1556c}
ul.mail-inbox .sort { float:left; }
ul.mail-inbox .summary .name { color: #222; font-weight: 500; position: relative; top: -10px; }
.summary img { width: 45px; }  
.img-sort { float: left;}
.img-sort img { width: 45px;  margin-right: 8px; } 
.flx { display: flex;}
ul.mail-inbox li:nth-child(1) { border-left-color: #ffc107;}
ul.mail-inbox li:nth-child(2) { border-left-color: #e91e63;}
ul.mail-inbox li:nth-child(3) { border-left-color: #00bcd4;}
ul.mail-inbox li:nth-child(4) { border-left-color: #673ab7;}
ul.mail-inbox li:nth-child(5) { border-left-color: #2196f3;}
ul.mail-inbox li:nth-child(6) { border-left-color: #03a9f4;}
ul.mail-inbox li:nth-child(7) { border-left-color:#9c27b0 ;}
ul.mail-inbox li:nth-child(8) { border-left-color: #009688;}
ul.mail-inbox li:nth-child(9) { border-left-color: #8bc34a;}
ul.mail-inbox li:nth-child(10) { border-left-color: #f44336;} 
.flx small {  margin-left: 10px; background: #efefef;  height: 15px;  padding: 0px 4px;  border-radius: 3px; }
li.unread {  background: #f4f5f7; }
.flx h6 {  font-weight: 400; color: #000;  font-size: 1em; }
.name-u { width: 45px; height: 45px; margin-right: 8px; border-radius: 45px; text-align: center; color: #fff; line-height: 45px; text-transform: uppercase; font-size: 1.5em;}
ul.mail-inbox li .img-sort .name-u:nth-child(1) { background: #f44336;}
 
@media (max-width:767px) {
    .hidden-tab { display: none;}
}
    </style>
<!------ Include the above in your HEAD tag ---------->
</head>
<body>
    <form id="form1" runat="server">

<h2 class="text-center mt-5">Mail Inbox</h2>
        <div class="container-fluid">
            <div class="row"> 
                <div class="col-xl-10 col-lg-9">
                    <div class="row col-sm-12 m-0 ">
                        <div class="col  pl-0">
                        <div class="row short-btn">
                        <button class="btn btn-light"><i class="fa fa-trash"></i></button> 
                        <button class="btn btn-light dropdown-toggle" data-toggle="dropdown">
                        <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Move to</a>
                        <a class="dropdown-item" href="#">Social</a>
                        <a class="dropdown-item" href="#">Promotions</a>
                        <a class="dropdown-item" href="#">Forums</a>
                        </div>
                        <i class="far fa-folder"></i>
                        </button> 
                        <button class="btn btn-light"><i class="fa fa-trash"></i></button> 
                        <button class="btn btn-light">...more </button> 
                        </div>
                        </div>
                        <div class="col  pr-0">
                        <div class="row short-btn float-right">
                        <button class="btn btn-light"><i class="fas fa-arrow-left"></i></button> 
                        <button class="btn btn-light"><i class="fas fa-arrow-right"></i></button> 
                        </div>
                        </div>
                </div>
                <ul class="mail-inbox">
                    <li class="unread">
                        <div class="sort">
                            <label class="check-box"><input type="checkbox" name="list" value="" > <em class="check-box-style"></em></label>
                            <div><i class="fa fa-star"></i></div>
                        </div> 
                        <div class="img-sort">
                            <div class="name-u">  V </div>
                        </div> 
                        <div class="flx">
                            <h6>Vishvjeet Patel</h6>
                            <small>28-mar-2018</small>                     
                        </div> 
                        <p  class="flx">It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged</p> 
                     </li>
                     <li class="unread">
                            <div class="sort">
                                <label class="check-box"><input type="checkbox" name="list" value="" > <em class="check-box-style"></em></label>
                                <div><i class="far fa-star"></i></div>
                            </div> 
                            <div class="img-sort">
                                <div><img src="http://www.tolmatol.com/wp-content/uploads/2018/03/man.png" alt=""></div>
                            </div> 
                            <div class="flx">
                                <h6>Anjali</h6>
                                <small>25-mar-2018</small>                        
                            </div> 
                            <p  class="flx">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p> 
                         </li>
                         <li class="read">
                                <div class="sort">
                                    <label class="check-box"><input type="checkbox" name="list" value="" > <em class="check-box-style"></em></label>
                                    <div><i class="far fa-star"></i></div>
                                </div> 
                                <div class="img-sort">
                                    <div><img src="http://www.tolmatol.com/wp-content/uploads/2018/03/man.png" alt=""></div>
                                </div> 
                                <div class="flx">
                                    <h6>Mary Grace</h6>
                                    <small>22-mar-2018</small>                        
                                </div> 
                                <p  class="flx">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged</p> 
                             </li>
                             <li class="unread">
                                    <div class="sort">
                                        <label class="check-box"><input type="checkbox" name="list" value="" > <em class="check-box-style"></em></label>
                                        <div><i class="fa fa-star"></i></div>
                                    </div> 
                                    <div class="img-sort">
                                            <div class="name-u">  r </div>
                                    </div> 
                                    <div class="flx">
                                        <h6>Richard</h6>
                                        <small>21-mar-2018</small>                     
                                    </div> 
                                    <p  class="flx">It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged</p> 
                                 </li>
                                 <li class="read">
                                        <div class="sort">
                                            <label class="check-box"><input type="checkbox" name="list" value="" > <em class="check-box-style"></em></label>
                                            <div><i class="fa fa-star"></i></div>
                                        </div> 
                                        <div class="img-sort">
                                            <div><img src="http://www.tolmatol.com/wp-content/uploads/2018/03/man.png" alt=""></div>
                                        </div> 
                                        <div class="flx">
                                            <h6>Richard</h6>
                                            <small>21-mar-2018</small>                     
                                        </div> 
                                        <p  class="flx">It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged</p> 
                                     </li>
                                     
                                     <li class="read">
                                            <div class="sort">
                                                <label class="check-box"><input type="checkbox" name="list" value="" > <em class="check-box-style"></em></label>
                                                <div><i class="far fa-star"></i></div>
                                            </div> 
                                            <div class="img-sort">
                                                <div><img src="http://www.tolmatol.com/wp-content/uploads/2018/03/man.png" alt=""></div>
                                            </div> 
                                            <div class="flx">
                                                <h6>Mary Grace</h6>
                                                <small>22-mar-2018</small>                        
                                            </div> 
                                            <p  class="flx">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged</p> 
                                         </li>
                                         <li class="unread">
                                                <div class="sort">
                                                    <label class="check-box"><input type="checkbox" name="list" value="" > <em class="check-box-style"></em></label>
                                                    <div><i class="fa fa-star"></i></div>
                                                </div> 
                                                <div class="img-sort">
                                                    <div><img src="http://www.tolmatol.com/wp-content/uploads/2018/03/man.png" alt=""></div>
                                                </div> 
                                                <div class="flx">
                                                    <h6>Richard</h6>
                                                    <small>21-mar-2018</small>                     
                                                </div> 
                                                <p  class="flx">It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged</p> 
                                             </li>
                                 
                     
                </ul>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
