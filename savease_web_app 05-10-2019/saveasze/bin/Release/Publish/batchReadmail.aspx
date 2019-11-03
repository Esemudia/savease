<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter.Master" AutoEventWireup="true" CodeBehind="batchReadmail.aspx.cs" Inherits="saveasze.batchReadmail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css" />
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css" />
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css" />
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css" />
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css" />
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/flat/blue.css" />
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic" />
   
        <asp:ScriptManager ID="MainScriptManager" runat="server" />
     <asp:UpdatePanel ID="pnlHelloWorld" runat="server">
            <ContentTemplate>
                 
    <div class="container">
        <div class="row">   
            <div class="col-md-3" style="padding-top:70px;">
            
               
                <div class="service-sidebar">
                    <ul class="service-catergory">
                        <%leftNavigation(); %>
                    </ul>
                         <br><br>
                    <div class="brochures"> 
                        <h4>Terms & Conditions</h4>
                        <p>Download our Terms & Condition.</p>

                        <ul class="brochures-lists">
                            <li>
                                <a href="doc/TnC.pdf" target="_blank"><span class="fa fa-file-pdf-o"></span></a>
                            </li>
                            <li>
                                <a href="#"><span class="fa fa-file-text-o"></span></a>
                            </li>
                        </ul>
                        <i class="icon icon-sheet"></i>
                    </div>
                    <br><br>
                    <div class="getin-tuch">
                        <h4>Enquiries & Support</h4>
                        <p>You can also send us an <a href="#">email</a>  and we’ll get in touch shortly, or call <b>- (+234) 080Savease.</b></p>
                        <div class="link">
                            <a href="contactus.aspx" class="default_link">LOCATE US<i class="fa fa-angle-right"></i></a>
                        </div>
                        <i class="icon icon-multimedia-1"></i>
                    </div>

                </div>
            </div>

               

    

               
    <div class="hold-transition skin-blue sidebar-mini" style="padding-top:70px;">
        <div class="wrapper">

 
  <!-- Left side column. contains the logo and sidebar -->
 

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
   
      <asp:Label runat="server" ID="lbldeliMess"></asp:Label>
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-3">
          <a href="MailBox.aspx" class="btn btn-primary btn-block margin-bottom">Back to Inbox</a>

          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Folders</h3>

              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="box-body no-padding">
             <ul class="nav nav-pills nav-stacked">
                <li><a href="MailBox.aspx"><i class="fa fa-inbox"></i> Inbox
                  <span class="label label-primary pull-right"><asp:Label ID="lblCtrInbox" runat="server" Text=""></asp:Label></span></a>
                </li>
                <li><a href="Mailsent.aspx"><i class="fa fa-envelope-o"></i> Sent
                    <span class="label label-primary pull-right"><asp:Label ID="lblCtrSent" runat="server" Text=""></asp:Label></span></a>
                </li></ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
          <div class="box box-solid">
           
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="box box-primary">
              
              <!-- /.mailbox-read-info -->
              <div class="mailbox-controls with-border text-center">
                <div class="btn-group">

                </div>
                <!-- /.btn-group -->
                </div>
            <div class="box-header with-border">
              <table width="100%" runat="server" id="tblCompose1"><tr>
                  <td style="text-align:left"><h3 class="box-title"><asp:Label runat="server" ID="lblCompose" Text=""></asp:Label> </h3></td>
                  <td style="text-align:right"><h3 class="box-title"><asp:Label runat="server" ID="lblDate" Text=""></asp:Label> </h3></td>
                     </tr></table>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <%if (Session["sessTtype"]!="" && Session["sessTtype"].ToString().Equals("P")) %>
                <%{ %>
                <%displayBatchRecord(); %>
                <asp:Panel ID="pnlCard" runat="server" Visible="false">
                    <div style='display: grid;grid-template-columns: auto auto auto auto;'>
                        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div>
                    <table border="3" width="255px" style="margin:0 auto; border-collapse:collapse; border-color:#212435;font-color:#fff;">
                   <tr style="color:#000;font-family:Courier New;">
                       <td rowspan="3" style="padding:1px; border:3px solid #212435;"><img src="images/shop/<%returnCardImage(); %>"></td>
                       <td  Colspan="2"  style="padding:1px; border:3px solid #212435;font-weight:bold;"> PIN: <%# Eval("CardPin") %></td>
                   </tr>    
                        <tr style="color:#000;font-family:Courier;">
                            <td  Colspan="2" style="padding:1px; border:3px solid #212435;font-weight:bold;"> S/N: <%# Eval("SerialNumber") %></td>
                      </tr>
                        <tr style="color:#000;font-family:Courier New;">
                            <td bordercolor="#fa9928" style="padding:1px; border:3px solid #212435;font-weight:bold;"> Amount: <%# Eval("Amount") %></td>
                            <td style="padding:1px; border:3px solid #212435;"> <img src="images/shop/logo111.png" style="margin-left:18px;margin-right:auto;">
                        </td>
                            </td>
                        </tr>
                    </table>
                    <br /><br />
                </div><br />
                </ItemTemplate>

                        </asp:Repeater>
                        </div>

                    </asp:Panel>
                <%} %>
                <%else if (Session["sessTtype"] !="" ||  Session["sessTtype"].ToString().Equals("C"))
                    { %>
                <asp:Panel ID="pnlTransfer" runat="server" Visible="false">
                <%displayTransferRecord(); %>
                    </asp:Panel>
                <%} %>
              
            </div>
              
                
            <!-- /.box-body -->
            <div class="box-footer">
              <div class="pull-right">
                 <button type="button" class="thm-btn" data-toggle="tooltip" title="Print" style="height:50px;margin-right:21px;" runat="server" onserverclick="btnPrint_click" id="btnClick" name="btnClick">
                  <i class="fa fa-print"></i>  Convert To Pdf and Print</button></div>
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /. box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
 
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
</div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Slimscroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- iCheck -->
<script src="plugins/iCheck/icheck.min.js"></script>
<!-- Page Script -->
<script>
  $(function () {
    //Enable iCheck plugin for checkboxes
    //iCheck for checkbox and radio inputs
    $('.mailbox-messages input[type="checkbox"]').iCheck({
      checkboxClass: 'icheckbox_flat-blue',
      radioClass: 'iradio_flat-blue'
    });

    //Enable check and uncheck all functionality
    $(".checkbox-toggle").click(function () {
      var clicks = $(this).data('clicks');
      if (clicks) {
        //Uncheck all checkboxes
        $(".mailbox-messages input[type='checkbox']").iCheck("uncheck");
        $(".fa", this).removeClass("fa-check-square-o").addClass('fa-square-o');
      } else {
        //Check all checkboxes
        $(".mailbox-messages input[type='checkbox']").iCheck("check");
        $(".fa", this).removeClass("fa-square-o").addClass('fa-check-square-o');
      }
      $(this).data("clicks", !clicks);
    });

    //Handle starring for glyphicon and font awesome
    $(".mailbox-star").click(function (e) {
      e.preventDefault();
      //detect type
      var $this = $(this).find("a > i");
      var glyph = $this.hasClass("glyphicon");
      var fa = $this.hasClass("fa");

      //Switch states
      if (glyph) {
        $this.toggleClass("glyphicon-star");
        $this.toggleClass("glyphicon-star-empty");
      }

      if (fa) {
        $this.toggleClass("fa-star");
        $this.toggleClass("fa-star-o");
      }
    });
  });
</script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
                </div>
           </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
