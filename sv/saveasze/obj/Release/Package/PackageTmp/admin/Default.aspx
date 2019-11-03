<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="saveasze.admin.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="msapplication-TileColor" content="#0061da">
		<meta name="theme-color" content="#1643a3">
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="mobile-web-app-capable" content="yes">
		<meta name="HandheldFriendly" content="True">
		<meta name="MobileOptimized" content="320">
		<link rel="icon" href="favicon.ico" type="image/x-icon"/>
		<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />

		<!-- Title -->
		<title>Sav</title>

        <!--Font Awesome-->
		<link href="assets/plugins/fontawesome-free/css/all.css" rel="stylesheet">

		<!-- Font Family -->
		<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500" rel="stylesheet">

		<!-- Custom scroll bar css-->
		<link href="assets/plugins/scroll-bar/jquery.mCustomScrollbar.css" rel="stylesheet" />

		<!-- Dashboard Css -->
		<link href="assets/css/dashboard.css" rel="stylesheet" />

		<!-- c3.js Charts Plugin -->
		<link href="assets/plugins/charts-c3/c3-chart.css" rel="stylesheet" />

		<!---Font icons-->
		<link href="assets/plugins/iconfonts/plugin.css" rel="stylesheet" />

  </head>    
<body>
    <form id="form1" runat="server">
    <div>
    	<div id="canvas" class="gradient"></div>
		<div id="global-loader" ><div class="showbox"><div class="lds-ring"><div></div><div></div><div></div><div></div></div></div></div>
		<div class="page">
			<div class="page-single">
				<div class="container">
					<div class="row">
						<div class="col col-login mx-auto"  style="margin-top:20px;">
							<div class="text-center mb-6">
								<img src="assets/images/brand/logo.png" class="h-6" alt="">
							</div>
							
								<div class="card-body p-6">
									<div class="card-title text-center" style="color:white;">Login to your Account</div>
									<div class="form-group">
                                        <asp:Label runat="server" ID="lbl"></asp:Label>
										<label class="form-label" style="color:white;">Username</label>
										<input type="text" runat="server" class="form-control" id="txtusr"  placeholder="username"/>     
									</div>
									<div class="form-group">
										
										<input type="password" runat="server" class="form-control" id="usrPass" placeholder="Password"/>
									</div>
									
									<div class="form-footer">
                                        <asp:Button runat="server" class="btn btn-primary btn-block" Text="Login" OnClick="btnLogin_Click" />
									</div>
									
								</div>

						    
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- Dashboard js -->
		<script src="assets/js/vendors/jquery-3.2.1.min.js"></script>
		<script src="assets/js/vendors/bootstrap.bundle.min.js"></script>
		<script src="assets/js/vendors/jquery.sparkline.min.js"></script>
		<script src="assets/js/vendors/selectize.min.js"></script>
		<script src="assets/js/vendors/jquery.tablesorter.min.js"></script>
		<script src="assets/js/vendors/circle-progress.min.js"></script>
		<script src="assets/plugins/rating/jquery.rating-stars.js"></script>

		<!-- Custom scroll bar Js-->
		<script src="assets/plugins/scroll-bar/jquery.mCustomScrollbar.concat.min.js"></script>

		<!-- 3Dlines-animation -->
        <script src="assets/plugins/3Dlines-animation/three.min.js"></script>
        <script src="assets/plugins/3Dlines-animation/projector.js"></script>
        <script src="assets/plugins/3Dlines-animation/canvas-renderer.js"></script>
        <script src="assets/plugins/3Dlines-animation/3d-lines-animation.js"></script>
        <script src="assets/plugins/3Dlines-animation/color.js"></script>

		<!--Counters -->
		<script src="assets/plugins/counters/counterup.min.js"></script>
		<script src="assets/plugins/counters/waypoints.min.js"></script>

		<!-- custom js -->
		<script src="assets/js/custom.js"></script>
				<script>
                    var colors = new Array(
            [94, 114, 228],
			[130,94,228],
			[45,206,137],
			[45,206,204],
			[17,205,239],
			[17,113,239],
			[245,54,92],
			[245,96,54]);
		</script>
    </form>
</body>
</html>
