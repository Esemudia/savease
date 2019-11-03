<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter.Master" AutoEventWireup="true" CodeBehind="Mailsent.aspx.cs" Inherits="saveasze.Mailsent" %>
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

               

    

                <div class="hold-transition skin-blue sidebar-mini" style="width:100%; padding-top:70px;">
                   
<div class="wrapper">
  <!-- Left side column. contains the logo and sidebar -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-3">
          <a href="compose.aspx" class="btn btn-primary btn-block margin-bottom">Compose</a>

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
                <li class="active"><a href="Mailsent.aspx"><i class="fa fa-envelope-o"></i> Sent
                    <span class="label label-primary pull-right"><asp:Label ID="lblCtrSent" runat="server" Text=""></asp:Label></span></a>
                </li></ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
         
          <!-- /.box -->
        </div>
        <!-- /.col -->
        
        <div class="col-md-9">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Inbox</h3>

              <div class="box-tools pull-right">
                <div class="has-feedback">
                  <input type="text" class="form-control input-sm" placeholder="Search Mail">
                  <span class="glyphicon glyphicon-search form-control-feedback"></span>
                </div>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <div class="btn-group">
<%--                  <button type="button" class="btn btn-default btn-sm" title="Reply"><i class="fa fa-reply"></i></button>
                  <button type="button" class="btn btn-default btn-sm" title="Forward"><i class="fa fa-share"></i></button>--%>
                </div>
                <!-- /.btn-group -->
                <button type="button" class="btn btn-default btn-sm" title="Refresh" runat="server" id="btnrefresh"><i class="fa fa-refresh"></i></button>
                <div class="pull-right">
                  1-50/200
                  <div class="btn-group">
                      <asp:LinkButton ID="lbPrevious" runat="server" OnClick="lbPrevious_Click"  class="btn btn-default btn-sm" ToolTip="Previous"><i class="fa fa-chevron-left"></i></asp:LinkButton>
                    
                      <asp:LinkButton ID="lbNext" runat="server" OnClick="lbNext_Click"  class="btn btn-default btn-sm" ToolTip="Next"><i class="fa fa-chevron-right"></i></asp:LinkButton>
                    
                  </div>
                  <!-- /.btn-group -->
                </div>
                <!-- /.pull-right -->
              </div>
              <div class="table-responsive mailbox-messages">
                   <asp:Repeater id="rptrInbox" runat="server">
                <HeaderTemplate>
                    <table class="table table-hover table-striped">
                        <tr align="left" style="font-weight:bolder;">
                            <td style="width:10px;display:none"></td>
                            <td style="text-align:left"><asp:Label ID="Label1" Text="Recievers ID" runat="server" Width="70px"></asp:Label></td>
                            <td style="text-align:left"><asp:Label ID="lblName" Text="Recievers Name" runat="server" Width="100px"></asp:Label> </td>
                            <td>Subject</td>
                            <td>Date</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr align="left">                            
                                <td style="width:10px;display:none"><input type="checkbox"></td>
                                <td style="width:40px" >
                              <a href="compose.aspx?i00=<%# Eval("notID") %>&i01=<%# Eval("recerverID") %>"><%#Eval("recerverID") %></a></td>
                                <td style="width:100px"><a href="compose.aspx?i00=<%# Eval("notID") %>&i01=<%# Eval("recerverID") %>"><%#Eval("recieverName") %></a></td>
                                <td><a href="compose.aspx?i00=<%# Eval("notID") %>&i01=<%# Eval("recerverID") %>"><%#Eval("subject") %></a></td>
                                <td><a href="compose.aspx?i00=<%# Eval("notID") %>&i01=<%# Eval("recerverID") %>"><%#Eval("sendDate") %></a></td>
                        </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
                  <asp:DataList ID="rptPaging" runat="server"

                                    OnItemCommand="rptPaging_ItemCommand"

                                    OnItemDataBound="rptPaging_ItemDataBound" 

					RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbPaging" runat="server" CommandArgument='<%# Eval("PageIndex") %>' CommandName="newPage" Text='<%# Eval("PageText") %> ' Width="20px">
                                            </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:DataList>
                <!-- /.table -->
              </div>
              <!-- /.mail-box-messages -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer no-padding">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <div class="btn-group">
<%--                  <button type="button" class="btn btn-default btn-sm" title="Reply"><i class="fa fa-reply"></i></button>
                  <button type="button" class="btn btn-default btn-sm" title="Forward"><i class="fa fa-share"></i></button>--%>
                </div>
                <!-- /.btn-group -->
                
                <div class="pull-right">
                  1-50/200
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-sm" runat="server" id="btnleft"><i class="fa fa-chevron-left"></i></button>
                    <button type="button" class="btn btn-default btn-sm" runat="server" id="btnright"><i class="fa fa-chevron-right"></i></button>
                  </div>
                  <!-- /.btn-group -->
                </div>
                <!-- /.pull-right -->
              </div>
            </div>
          </div>
          <!-- /. box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
    </div>
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
</asp:Content>
