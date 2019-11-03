<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="saveasze.admin.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
		 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Savease Admin</title>
    <link rel="stylesheet" href="../assets/css/slick-theme.css">
    <link rel="stylesheet" href="../assets/css/slick.css">
    <link rel="stylesheet" href="../assets/css/fontawesome.min.css">
    <link rel="stylesheet" href="../assets/css/all.css">
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <link rel="icon" href="assets/images/fav_icon.ico" type="image/ico">

    <style>
        .container-fluid {
            background: url('../assets/images/form-background.png');
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center top;
            -webkit-filter: blur(7px) brightness(10px);
            height: 100vh;
        }
        
        .container-fluid::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #fff;
            opacity: 0.8;
            filter: blur(7px) brightness(10px);
        }
        
        .wrapper-div {
            height: 80vh;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #FFFFFF;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.5);
            /* inset 0px 4px 4px rgba(0, 0, 0, 0.25) */
            border-radius: 14px;
        }
        
        .wrapper-div .row {
            height: 100%;
        }
        
        .inner-div,
        .inner-form-div {
            height: 100%;
        }
        
        .inner-div {
            background-image: url('dashboard/assets/images/dashboard-bg.png');
            background-repeat: no-repeat;
            background-position: center bottom;
            background-size: cover;
            border-radius: 14px 0 0 14px;
        }
        
        form {
            font-size: 14px;
            margin: auto;
        }
        
        form h4 {
            margin-top: 30px;
            font-weight: bold;
            font-size: 24px;
            line-height: 42px;
            color: #131D33;
        }
        
        form h4 span {
            font-size: 16px;
            line-height: 10px;
            color: #546E7A;
        }
        
        form .form-control {
            width: 100%;
            border: unset;
            position: relative;
            margin-bottom: 27px;
        }
        /* .form-control label {
            position: absolute;
            top: 50%;
            left: 16.5%;
            font-size: 20px;
            font-weight: 400;
            color: #131D33;
        } */
        
        .form-control input {
            width: 100%;
            height: 45px;
            font-size: 16px;
            font-weight: 400;
            color: #131D33;
            outline: unset;
            background-color: #E6E8EC;
            background-repeat: no-repeat;
            /* background-size: 6%; */
            background-position: 15.5px;
            padding: 19px 19px 19px 55px;
            border: 1px solid #546E7A;
            border-radius: 10px;
        }
        /* .form-control input:active label {
            transform: translateY(0%);
        } */
        
        .form-control a,
        form p a,
        .form-control a:focus,
        form p a:focus,
        .form-control a:hover,
        form p a:hover,
        .form-control a:active,
        form p a:active {
            text-decoration: none;
            color: #131D33;
        }
        
        .form-control .button-blue {
            height: 45px;
            background-color: #131D33;
            border-radius: 9px;
            font-weight: bold;
            font-size: 16px;
            line-height: 21px;
            color: #FFFFFF;
        }
        
        form p {
            font-size: 14px;
            color: #607D8B;
        }
        
        @media screen and (max-width: 991px) {
            .wrapper-div {
                height: 100vh;
            }
            .inner-div {
                display: none;
            }
            .inner-form-div {
                width: 100%;
                height: 100vh;
            }
            .inner-form-div form {
                margin-top: 0px;
            }
        }
    </style>
  </head>    
<body>
    
   <div class="container-fluid">
        <div class="row">
            <div class="col-lg-4 col-md-8 col-12 wrapper-div">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-12 inner-form-div d-flex pt-3 pb-3">
                            <form id="form1" runat="server"  class="col-12 col-md-11 my-auto">
                            <a href="index.html" class="col-12 mt-5"><img src="../assets/images/logo.png" alt="savease logo" style="width: 120px;"></a>
                            <h4 class="col-12">Welcome back, <br><span>please login to contine</span></h4>
                                <asp:Label runat="server" ID="lbl"></asp:Label>
                            <div class="form-control">
                                <!-- <label for="text">User Id</label> -->
                                <input type="text" id="txtusr1" runat="server" placeholder="User Id" required style="background-image: url('assets/images/user.png');background-size: 20px;">
                            </div>
                            <div class="form-control">
                                <!-- <label for="text">User Id</label> -->
                                <input type="password" id="usrPass" runat="server" placeholder="Password" required style="background-image: url('assets/images/padlock.png');background-size: 17px;">
                            </div>
                            <div class="form-control">
                                <div class="row">
                                    <div class="col-md-6 col-12 mb-1">
                                        <div class="custom-control custom-checkbox mr-sm-2">
                                            <input type="checkbox" class="custom-control-input" id="customControlAutosizing">
                                            <label class="custom-control-label" for="customControlAutosizing">Remember me</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-12 row mb-1">
                                        <a href="reset-password.html" class="col-12 text-md-right">Forget Password?</a>
                                    </div>
                                </div>
                            </div>
                            <div class="form-control col-12 text-center">
                               
                                <asp:Button  runat="server" ID="btnLogin" CssClass="btn orange-button" Text="Login" OnClick="btnLogin_Click" Width="170"/>
                            </div>
                            <p class="col-12 mt-5 text-center">New to Savease? <a href="register.html">Sign Up</a></p>
                        </form>
                    </div>
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
