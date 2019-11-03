<%@ Page Title="" Language="C#" MasterPageFile="~/saveaze_no_cfooter.Master" AutoEventWireup="true" CodeBehind="buypin.aspx.cs" Inherits="saveasze.buypin" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <style>
    .ui-mobile fieldset,
.ui-page {
	padding: 0;
	margin: 0;
}
.ui-mobile a img,
.ui-mobile fieldset {
	border-width: 0;
}
/* Fixes for fieldset issues on IE10 and FF (see #6077) */
.ui-mobile fieldset {
	min-width: 0;
}
@-moz-document url-prefix() {
	.ui-mobile fieldset {
		display: table-column;
	}
}

/* Viewport */
.ui-mobile-viewport {
	margin: 0;
	overflow-x: visible;
	-webkit-text-size-adjust: 100%;
	-ms-text-size-adjust:none;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}
/* Issue #2066 */
body.ui-mobile-viewport,
div.ui-mobile-viewport {
	overflow-x: hidden;
}
/* "page" containers - full-screen views, one should always be in view post-pageload */
.ui-mobile [data-role=page],
.ui-mobile [data-role=dialog],
.ui-page {
	top: 0;
	left: 0;
	width: 100%;
	min-height: 100%;
	position: absolute;
	display: none;
	border: 0;
}
/* On ios4, setting focus on the page element causes flashing during transitions when there is an outline, so we turn off outlines */
.ui-page {
	outline: none;
}
.ui-mobile .ui-page-active {
	display: block;
	overflow: visible;
	overflow-x: hidden;
}
@media screen and (orientation: portrait) {
	.ui-mobile .ui-page {
		min-height: 420px;
	}
}
@media screen and (orientation: landscape) {
	.ui-mobile .ui-page {
		min-height: 300px;
	}
}

/* Fouc */
.ui-mobile-rendering > * {
	visibility: hidden;
}

/* Non-js content hiding */
.ui-nojs {
	position: absolute !important;
	height: 1px;
	width: 1px;
	overflow: hidden;
	clip: rect(1px,1px,1px,1px);
}

/* Loading screen */
.ui-loading .ui-loader {
	display: block;
}
.ui-loader {
	display: none;
	z-index: 9999999;
	position: fixed;
	top: 50%;
	left: 50%;
	border:0;
}
.ui-loader-default {
	background: none;
	filter: Alpha(Opacity=18);
	opacity: .18;
	width: 2.875em;
	height: 2.875em;
	margin-left: -1.4375em;
	margin-top: -1.4375em;
}
.ui-loader-verbose {
	width: 12.5em;
	filter: Alpha(Opacity=88);
	opacity: .88;
	box-shadow: 0 1px 1px -1px #fff;
	height: auto;
	margin-left: -6.875em;
	margin-top: -2.6875em;
	padding: .625em;
}
.ui-loader-default h1 {
	font-size: 0;
	width: 0;
	height: 0;
	overflow: hidden;
}
.ui-loader-verbose h1 {
	font-size: 1em;
	margin: 0;
	text-align: center;
}
.ui-loader .ui-icon-loading {
	background-color: #000;
	display: block;
	margin: 0;
	width: 2.75em;
	height: 2.75em;
	padding: .0625em;
	-webkit-border-radius: 2.25em;
	border-radius: 2.25em;
}
.ui-loader-verbose .ui-icon-loading {
	margin: 0 auto .625em;
	filter: Alpha(Opacity=75);
	opacity: .75;
}
.ui-loader-textonly {
	padding: .9375em;
	margin-left: -7.1875em;
}
.ui-loader-textonly .ui-icon-loading {
	display: none;
}
.ui-loader-fakefix {
	position: absolute;
}

/* Headers, content panels */
.ui-bar,
.ui-body {
	position: relative;
	padding: .4em 1em;
	overflow: hidden;
	display: block;
	clear: both;
}
.ui-bar h1,
.ui-bar h2,
.ui-bar h3,
.ui-bar h4,
.ui-bar h5,
.ui-bar h6 {
	margin: 0;
	padding: 0;
	font-size: 1em;
	display: inline-block;
}
.ui-header,
.ui-footer {
	border-width: 1px 0;
	border-style: solid;
	position: relative;
}
.ui-header .ui-title,
.ui-footer .ui-title {
	font-size: 1em;
	min-height: 1.1em;
	text-align: center;
	display: block;
	margin: 0 30%;
	padding: .7em 0;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	outline: 0 !important;
}
.ui-footer .ui-title {
	margin: 0 1em;
}
.ui-content {
	border-width: 0;
	overflow: visible;
	overflow-x: hidden;
	padding: 1em;
}
/* Corner styling for dialogs and popups */
.ui-corner-all > .ui-header:first-child,
.ui-corner-all > .ui-content:first-child,
.ui-corner-all > .ui-footer:first-child {
	-webkit-border-top-left-radius: inherit;
	border-top-left-radius: inherit;
	-webkit-border-top-right-radius: inherit;
	border-top-right-radius: inherit;
}
.ui-corner-all > .ui-header:last-child,
.ui-corner-all > .ui-content:last-child,
.ui-corner-all > .ui-footer:last-child {
	-webkit-border-bottom-left-radius: inherit;
	border-bottom-left-radius: inherit;
	-webkit-border-bottom-right-radius: inherit;
	border-bottom-right-radius: inherit;
}

/* Buttons and icons */
.ui-btn {
	font-size: 16px;
	margin: .5em 0;
	padding: .7em 1em;
	display: block;
	position: relative;
	text-align: center;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}
.ui-btn-icon-notext {
	padding: 0;
	width: 1.75em;
	height: 1.75em;
	text-indent: -9999px;
	white-space: nowrap !important;
}
.ui-mini {
	font-size: 12.5px;
}
.ui-mini .ui-btn {
	font-size: inherit;
}
.ui-mini .ui-controlgroup-label {
	font-size: 16px;
}
/* Make buttons in toolbars default to mini and inline. */
.ui-header .ui-btn,
.ui-footer .ui-btn {
	font-size: 12.5px;
	display: inline-block;
	vertical-align: middle;
}
/* To ensure same top and left/right position when ui-btn-left/right are added to something other than buttons. */
.ui-header .ui-btn-left,
.ui-header .ui-btn-right {
	font-size: 12.5px;
}
.ui-mini.ui-btn-icon-notext,
.ui-mini .ui-btn-icon-notext,
.ui-header .ui-btn-icon-notext,
.ui-footer .ui-btn-icon-notext {
	font-size: 16px;	
	padding: 0;
}
.ui-btn-inline {
	display: inline-block;
	vertical-align: middle;
	margin-right: .625em;
}
.ui-btn-icon-left {
	padding-left: 2.5em;
}
.ui-btn-icon-right,
.ui-listview > li > .ui-btn[class*="ui-icon-"] {
	padding-right: 2.5em;
}
.ui-btn-icon-top {
	padding-top: 2.5em;
}
.ui-btn-icon-bottom {
	padding-bottom: 2.5em;
}
.ui-header .ui-btn-icon-top,
.ui-footer .ui-btn-icon-top,
.ui-header .ui-btn-icon-bottom,
.ui-footer .ui-btn-icon-bottom {
	padding-left: .3125em;
	padding-right: .3125em;
}
.ui-btn[class*="ui-icon-"]:after {
	content: "";
	position: absolute;
	display: block;
	width: 22px;
	height: 22px;
}
.ui-btn-icon-notext:after,
.ui-btn-icon-left:after,
.ui-btn-icon-right:after,
.ui-listview > li > .ui-btn[class*="ui-icon-"]:after {
	top: 50%;
	margin-top: -11px;
}
.ui-btn-icon-left:after {
	left: .5625em;
}
.ui-btn-icon-right:after,
.ui-listview > li > .ui-btn[class*="ui-icon-"]:after {
	right: .5625em;
}
.ui-mini.ui-btn-icon-left:after,
.ui-mini .ui-btn-icon-left:after,
.ui-header .ui-btn-icon-left:after,
.ui-footer .ui-btn-icon-left:after {
	left: .37em;
}
.ui-mini.ui-btn-icon-right:after,
.ui-mini .ui-btn-icon-right:after,
.ui-header .ui-btn-icon-right:after,
.ui-footer .ui-btn-icon-right:after {
	right: .37em;
}
.ui-btn-icon-notext:after,
.ui-btn-icon-top:after,
.ui-btn-icon-bottom:after {
	left: 50%;
	margin-left: -11px;
}
.ui-btn-icon-top:after {
	top: .5625em;
}
.ui-btn-icon-bottom:after {
	top: auto;
	bottom: .5625em;
}
/* Buttons in header position classes */
.ui-header .ui-btn-left,
.ui-header .ui-btn-right,
.ui-btn-left > [class*="ui-"],
.ui-btn-right > [class*="ui-"] {
	margin: 0;
}
.ui-btn-left,
.ui-btn-right {
	position: absolute;
	top: .24em;
}
.ui-btn-left {
	left: .4em;
}
.ui-btn-right {
	right: .4em;
}
.ui-btn-icon-notext.ui-btn-left {
	top: .3125em;
	left: .3125em;
}
.ui-btn-icon-notext.ui-btn-right {
	top: .3125em;
	right: .3125em;
}

/* Form labels */
.ui-mobile label,
.ui-controlgroup-label {
	display: block;
	margin: 0 0 .4em;
}

/* Accessible content hiding */
.ui-hide-label > label,
.ui-hide-label .ui-controlgroup-label,
.ui-hide-label .ui-rangeslider label,
.ui-hidden-accessible {
	position: absolute !important;
	height: 1px;
	width: 1px;
	overflow: hidden;
	clip: rect(1px,1px,1px,1px);
}


/* content configurations. */
.ui-grid-a,
.ui-grid-b,
.ui-grid-c,
.ui-grid-d,
.ui-grid-solo {
	overflow: hidden;
}
.ui-block-a,
.ui-block-b,
.ui-block-c,
.ui-block-d,
.ui-block-e {
	margin: 0;
	padding: 0;
	border: 0;
	float: left;
	min-height: 1px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}
/* force new row */
.ui-block-a {
	clear: left;
}
ul.ui-grid-a,
ul.ui-grid-b,
ul.ui-grid-c,
ul.ui-grid-d,
ul.ui-grid-solo,
li.ui-block-a,
li.ui-block-b,
li.ui-block-c,
li.ui-block-d,
li.ui-block-e {
	margin-left: 0;
	margin-right: 0;
	padding: 0;
	list-style: none;
}
[class*="ui-grid-"] .ui-btn,
[class*="ui-grid-"] button.ui-btn-inline,
[class*="ui-grid-"] button.ui-btn-icon-notext {
	margin-right: .3125em;
	margin-left: .3125em;
}

.ui-grid-a > .ui-block-a,
.ui-grid-a > .ui-block-b {
	/* width: 49.95%; IE7 */
	/* margin-right: -.5px; BB5 */
	width: 50%;
}
.ui-grid-b > .ui-block-a,
.ui-grid-b > .ui-block-b,
.ui-grid-b > .ui-block-c {
	/* width: 33.25%; IE7 */
	/* margin-right: -.5px; BB5 */
	width: 33.333%;
}
.ui-grid-c > .ui-block-a,
.ui-grid-c > .ui-block-b,
.ui-grid-c > .ui-block-c,
.ui-grid-c > .ui-block-d {
	/* width: 24.925%; IE7 */
	/* margin-right: -.5px; BB5 */
	width: 25%;
}
.ui-grid-d > .ui-block-a,
.ui-grid-d > .ui-block-b,
.ui-grid-d > .ui-block-c,
.ui-grid-d > .ui-block-d,
.ui-grid-d > .ui-block-e {
	/* width: 19.925%; IE7 */
	width: 20%;
}
.ui-grid-solo > .ui-block-a {
	width: 100%;
	float: none; 
}

/* preset breakpoint to switch to stacked grid styles below 35em (560px) */
@media (max-width: 35em) {
	.ui-responsive > .ui-block-a,
	.ui-responsive > .ui-block-b,
	.ui-responsive > .ui-block-c,
	.ui-responsive > .ui-block-d,
	.ui-responsive > .ui-block-e {
		width: 100%; 
		float: none; 
	}
}


.ui-table {
    
	border: 0;
	border-collapse: collapse;
	padding: 0;
	width: 58%;
}
.ui-table th,
.ui-table td {
	line-height: 1.5em;
	text-align: left;
	padding: .4em .6em;
	vertical-align:top;
}
.ui-table th .ui-btn,
.ui-table td .ui-btn {
	line-height: normal;
}
.ui-table th {
	font-weight: bold;
}
.ui-table caption {
	text-align: left;
	margin-bottom: 1.4em;
	opacity: .5;
}

/* Add strokes between each row */
.table-stroke thead th {
	border-bottom: 1px solid #d6d6d6; /* non-RGBA fallback */
	border-bottom: 1px solid rgba(0, 0, 0, .1);
}
.table-stroke tbody th,
.table-stroke tbody td {
	border-bottom: 1px solid #e6e6e6; /* non-RGBA fallback  */
	border-bottom: 1px solid rgba(0, 0, 0, .05);
}


/* Add alternating row stripes */
.table-stripe tbody tr:nth-child(odd) td,
.table-stripe tbody tr:nth-child(odd) th {
  background-color: #eeeeee; /* non-RGBA fallback  */
  background-color: rgba(0,0,0,0.04);
}
/* Add stroke to the header and last item */
.table-stripe thead th,
.table-stripe tbody tr:last-child {
  border-bottom: 1px solid #d6d6d6; /* non-RGBA fallback  */
  border-bottom: 1px solid rgba(0, 0, 0, .1);
}



/*
 Styles for the table columntoggle mode
*/
.ui-table-reflow td .ui-table-cell-label,
.ui-table-reflow th .ui-table-cell-label { 
	display: none;
}

/* Mobile first styles: Begin with the stacked presentation at narrow widths */ 
@media only all {
	/* Hide the table headers */ 
	.ui-table-reflow thead td, 
	.ui-table-reflow thead th {
		display: none;
	}
	/* Show the table cells as a block level element */ 
	.ui-table-reflow td,
	.ui-table-reflow th { 
		text-align: left;
		display: block;
	}
	/* Add a fair amount of top margin to visually separate each row when stacked */  
	.ui-table-reflow tbody th {
		margin-top: 3em;
	}
	/* Make the label elements a percentage width */ 
	.ui-table-reflow td .ui-table-cell-label,
	.ui-table-reflow th .ui-table-cell-label { 
		padding: .4em; 
		min-width: 30%; 
		display: inline-block;
		margin: -.4em 1em -.4em -.4em;
	}
	/* For grouped headers, have a different style to visually separate the levels by classing the first label in each col group */ 
	.ui-table-reflow th .ui-table-cell-label-top,
	.ui-table-reflow td .ui-table-cell-label-top {
		display: block;
		padding: .4em 0;
		margin: .4em 0;
		text-transform: uppercase;
		font-size: .9em;
		font-weight: normal;
	}
}


/* Breakpoint to show as a standard table at 560px (35em x 16px) or wider */ 
@media ( min-width: 35em ) {

	/* Fixes table rendering when switching between breakpoints in Safari <= 5. See https://github.com/jquery/jquery-mobile/issues/5380 */
	.ui-table-reflow.ui-responsive {
		/*display: table-row-group;*/
	}

	/* Show the table header rows */ 
	.ui-table-reflow.ui-responsive td,
	.ui-table-reflow.ui-responsive th,
	.ui-table-reflow.ui-responsive tbody th,
	.ui-table-reflow.ui-responsive tbody td,
	.ui-table-reflow.ui-responsive thead td,
	.ui-table-reflow.ui-responsive thead th {
		display: table-cell;
		margin: 0;
	}

	/* Hide the labels in each cell */ 
	.ui-table-reflow.ui-responsive td .ui-table-cell-label,
	.ui-table-reflow.ui-responsive th .ui-table-cell-label { 
		display: none;
	}
}


/* Hack to make IE9 and WP7.5 treat cells like block level elements, scoped to ui-responsive class */ 
/* Applied in a max-width media query up to the table layout breakpoint so we don't need to negate this*/ 
@media ( max-width: 35em ) {
	.ui-table-reflow.ui-responsive td,
	.ui-table-reflow.ui-responsive th {
		width: 100%;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		float: left;
		clear: left;
	}
}
    </style>
    <script>
        (function ($, window, document, undefined) {

    var pluginName = "responsiveTables",
        defaults = {
            classes: {
				table: "ui-table",
                reflowTable: "ui-table-reflow",
		        cellLabels: "ui-table-cell-label"
			},
			initSelector: '[data-role="table"]',
            mode: "reflow"
        };

    function Plugin(element, options) {
        this.element = $(element);
        this.options = $.extend({}, defaults, options);
        this._defaults = defaults;
        this._name = pluginName;
        this.init();
    }

    Plugin.prototype = {

        init: function () {
            var self = this;
			self.refresh(true);
        },

        refresh: function (create) {

            var self = this,
				trs = this.element.find( "thead tr" ),
                options = this.options;

			if ( create ) {
				this.element.addClass( options.classes.table );
			}

            self.headers = this.element.find( "tr:eq(0)" ).children();

            self.allHeaders = self.headers.add( trs.children() );

            trs.each(function(){

				var coltally = 0;

				$( this ).children().each(function( i ){
                    
					var span = parseInt( $( this ).attr( "colspan" ), 10 ),
						sel = ":nth-child(" + ( coltally + 1 ) + ")";
					$( this )
						.data( "colstart", coltally + 1 );

					if( span ){
						for( var j = 0; j < span - 1; j++ ){
							coltally++;
							sel += ", :nth-child(" + ( coltally + 1 ) + ")";
						}
					}

					if ( create === undefined ) {
						$(this).data("cells", "");
					}
					// Store "cells" data on header as a reference to all cells in the same column as this TH
					$( this )
						.data( "cells", self.element.find( "tr" ).not( trs.eq(0) ).not( this ).children( sel ) );

					coltally++;

				});

                // update table modes
			    if ( create === undefined ) {
				    this.refresh();
			    }

			});

	        // If it's not reflow mode, return here.
	        if( options.mode !== "reflow" ){
		        return;
	        }

	        if ( create ) {
		        this.element.addClass( options.classes.reflowTable );
	        }

	        // get headers in reverse order so that top-level headers are appended last
	        var reverseHeaders =  $( self.allHeaders.get().reverse() );

	        // create the hide/show toggles
	        reverseHeaders.each(function( i ){
		        var $cells = $( this ).data( "cells" ),
			        colstart = $( this ).data( "colstart" ),
			        hierarchyClass = $cells.not( this ).filter( "thead th" ).length && " ui-table-cell-label-top",
			        text = $(this).text();

			        if( text !== ""  ){

				        if( hierarchyClass ){
					        var iteration = parseInt( $( this ).attr( "colspan" ), 10 ),
						        filter = "";

					        if( iteration ){
						        filter = "td:nth-child("+ iteration +"n + " + ( colstart ) +")";
					        }
					        $cells.filter( filter ).prepend( "<b class='" + options.classes.cellLabels + hierarchyClass + "'>" + text + "</b>"  );
				        }
				        else {
					        $cells.prepend( "<b class='" + options.classes.cellLabels + "'>" + text + "</b>"  );
				        }

			        }
	        });
            
        }
    };

    // Plugin wrapper
    $.fn[pluginName] = function (options) {
        return this.each(function () {
            if (!$.data(this, "mdgov_" + pluginName)) {
                $.data(this, "mdgov_" + pluginName,
                new Plugin(this, options));
            }
        });
    }

})(jQuery, window, document);

$(document).ready(function () {
    $('[data-role="table"]').responsiveTables();
});
    </script>
    
    <section class="service-single sec-padd">
    <div class="container">
        <div class="row">   
            <div class="col-md-3">
            
               
                <div class="service-sidebar">
                    <ul class="service-catergory">
                        <%leftNavigation(); %>
                    </ul>
                         <br>
                </div>
            </div>

<div class="mdgov_OverflowTable mdgov_Overf" >
    
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                     <table style="margin-left:20px;">
                        
                <tr style="">
                                <td style=" color:#212435;padding-left:18px; font-size:13px; font-weight:bolder;">
                                 To do a Buy Voucher transaction make sure to have adequate funds in your account else<br />
                                    fund your account before initiating this process by clicking the fund account tab. <br />
                                    If account is adequately funded for a Potential transaction. Kindly fill in the quantity <br />
                                    of voucher to be purchased into the quantity box beside the respective cads. Proceed to<br />
                                    check the check box to agree and accept the terms and conditions. Proceed by clicking the<br />
                                    place order button. A voucher purchase transaction alert will be generated with a reference number.<br />
                                    The ordered voucher will be sent to  your savease inbox and will appear on the voucher Table. </td>
                            </tr>
            </table>
                    <asp:Label ID="lblDispError" runat="server" Text=""></asp:Label>
    <table class="ui-table table-stripe" style="width: 55%">
        <tbody>
            
            <tr>
                <td style="text-align:left">
                    <table class="ui-table table-stripe" align="Left" style="width: 64%">
                        <tr>
                <th scope="col">Products</th>
                <th scope="col">Quantity</th>
                <th scope="col">Total</th>
                <%--<th>&nbsp;</th>--%>
                <th style="text-align:left;"><asp:Label ID="lblBalh" Text="0" runat="server"></asp:Label><asp:Label ID="lblBal" Text="" runat="server" style="font-size:17px;font-weight:bold"></asp:Label>
                    <asp:HiddenField ID="hideDispName" runat="server" />   <asp:HiddenField ID="hideSaveaseID" runat="server" />  <asp:HiddenField ID="hideTransSumm" runat="server" />
                            <asp:HiddenField ID="hideCharge" runat="server" /> <asp:HiddenField ID="hideChargeCum" runat="server" />
                            </th>
            </tr>
                        <tr>
                            <td style="text-align:left">
                                 <a href="#"><img src="images/shop/50.jpg" alt=""></a> <asp:Label ID="lbl50" Text="50" Visible="false" runat="server"></asp:Label>
                                </td>
                            <td style="text-align:left">
 <%--<asp:TextBox ID="txt504"runat="server"  CausesValidation="True" OnTextChanged="TextBoxPrice_TextChanged" AutoPostBack="true" Text="0"></asp:TextBox>--%>
                                <telerik:RadNumericTextBox ID="txt50"  Width="40px" Height="40px" runat="server" OnTextChanged="TextBoxPrice_TextChanged" AutoPostBack="true" MaxValue="100" MinValue="0" Value="0">
                                    <NegativeStyle Resize="None" />
                                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadNumericTextBox>
                    <asp:CompareValidator ID="CompareValidator50" runat="server" ControlToValidate="txt50" Type="Integer" ErrorMessage="CompareValidator" ForeColor="Red" Operator="DataTypeCheck">*</asp:CompareValidator>
                            </td>
                            <td style="text-align:left">
<asp:Label ID="rst50" runat="server" Text="0"></asp:Label>
                            </td>
                            <td colspan="2" rowspan="7">
                                
                                          <asp:Label ID="rstSubTotalh" runat="server" Text="0" Visible="false"> </asp:Label> <asp:Label ID="rstSubTotal"  runat="server" Text="Sub-Total:     N0.00" Width="400px"></asp:Label><br />
                                          <asp:Label ID="rstCommisionh" runat="server" Text="0" Visible="false"> </asp:Label> <asp:Label ID="rstCommission"  runat="server" Text="Commission:     N0.00" Width="400px"></asp:Label><br />
                                           <asp:Label ID="rstTotalh" runat="server" Text="0" Visible="false"></asp:Label> <asp:Label ID="rstTotal" runat="server" Text="Order Total:     N0.00" Width="400px"></asp:Label><br />
                                
                                   <table style="display:none"><tr><td style="text-align:right"><asp:CheckBox ID="chkAgree" runat="server" AutoPostBack="true" OnCheckedChanged="chkAgree_CheckedChanged" Text="" TextAlign="Left"/></td>
                                       <td style="text-align:left">Agree to T&C</a></td></tr></table>
                                  
                    <div class="payment-options">
                        <div class="option-block">
                            <div class="checkbox">
                                <label>
                                    <input name="t_c_new" type="checkbox" runat="server" id="t_c_new" >
                                    <span>Agree to terms and conditions. <a href='doc/TnC.pdf' target="_blank">Read...</a></span>
                                </label>
                            </div>
                        </div>

                        <div class="option-block">
                            <div class="radio-block">
                                <div class="checkbox">
                                    <label>
                                        <input name="pay-us" type="checkbox">
                                        <span>Paypal <b>What is Paypal</b></span>
                                    </label>
                                </div>
                            </div>
                        </div>   
                    </div>  
                                            <asp:Button ID="btnSubmit" runat="server" class="thm-btn" OnClick="btnOrder_click" Text="Place Order" /><br />
                                      
                                            <br />
                                            <asp:GridView ID="GridView1" runat="server" CellPadding="4" Font-Names="Arial" Font-Size="0.75em" ForeColor="#333" GridLines="Both" Height="200px" Visible="False" Width="100%">
                                                <HeaderStyle BackColor="#EDEDED" Height="26px" />
                                            </asp:GridView>
                            </td>
                            </tr>
                        <tr>
                            <td style="text-align:left">
                          <a href="#"><img src="images/shop/100.jpg" alt=""></a> <asp:Label ID="lbl100" Text="100" Visible="false" runat="server"></asp:Label>
                                </td>
                            <td style="text-align:left">
                                <telerik:RadNumericTextBox ID="txt100"  Width="40px" Height="40px" runat="server" OnTextChanged="TextBoxPrice_TextChanged" AutoPostBack="true" MaxValue="100" MinValue="0" Value="0">
                                    <NegativeStyle Resize="None" />
                                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadNumericTextBox>
                                <asp:CompareValidator ID="CompareValidator100" runat="server" ControlToValidate="txt100" Type="Integer" ErrorMessage="CompareValidator" ForeColor="Red" Operator="DataTypeCheck">*</asp:CompareValidator> 

                            </td>
                            <td style="text-align:left">
<asp:Label ID="rst100" runat="server" Text="0"></asp:Label>
                            </td>
                            </tr>
                        <tr>
                            <td>
                                <a href="#"><img src="images/shop/200.jpg" alt=""></a> <asp:Label ID="lbl200" Text="200" Visible="false" runat="server"></asp:Label>
                            </td>
                            <td>
                    <%--<asp:TextBox ID="txt200"  Width="50px" runat="server"  CausesValidation="True" OnTextChanged="TextBoxPrice_TextChanged" AutoPostBack="true" Text="0"></asp:TextBox>--%>
                                <telerik:RadNumericTextBox ID="txt200"  Width="40px" Height="40px" runat="server" OnTextChanged="TextBoxPrice_TextChanged" AutoPostBack="true" MaxValue="100" MinValue="0" Value="0">
                                    <NegativeStyle Resize="None" />
                                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadNumericTextBox>
                    <asp:CompareValidator ID="CompareValidator200" runat="server" ControlToValidate="txt200" Type="Integer" ErrorMessage="CompareValidator" ForeColor="Red" Operator="DataTypeCheck">*</asp:CompareValidator>
                            </td>
                            <td>
                                <asp:Label ID="rst200" runat="server" Text="0"></asp:Label>
                            </td>
                            </tr>
                        <tr>
                            <td>
                                            <a href="#"><img src="images/shop/500.jpg" alt=""></a> <asp:Label ID="lbl500" Text="500" Visible="false" runat="server"></asp:Label>
                            </td>
                            <td>
                                   <%--<asp:TextBox ID="txt500"  Width="50px" runat="server"  CausesValidation="True" OnTextChanged="TextBoxPrice_TextChanged" AutoPostBack="true" Text="0"></asp:TextBox>--%>
                                 <telerik:RadNumericTextBox ID="txt500"  Width="40px" CausesValidation="True" Height="40px" runat="server" OnTextChanged="TextBoxPrice_TextChanged" AutoPostBack="true" MaxValue="100" MinValue="0" Value="0">
                                    <NegativeStyle Resize="None" />
                                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadNumericTextBox>
                    <asp:CompareValidator ID="CompareValidator500" runat="server" ControlToValidate="txt500" Type="Integer" ErrorMessage="CompareValidator" ForeColor="Red" Operator="DataTypeCheck">*</asp:CompareValidator>
                            </td>
                            <td>
                                <asp:Label ID="rst500" runat="server" Text="0"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                            <a href="#"><img src="images/shop/1000.jpg" alt=""></a>
                            </td>
                            <td>
     <%--<asp:TextBox ID="txt1000"  Width="50px" runat="server"  CausesValidation="True" OnTextChanged="TextBoxPrice_TextChanged" AutoPostBack="true" Text="0"></asp:TextBox>--%>
                                <telerik:RadNumericTextBox ID="txt1000"  Width="40px" CausesValidation="True" Height="40px" runat="server" OnTextChanged="TextBoxPrice_TextChanged" AutoPostBack="true" MaxValue="100" MinValue="0" Value="0">
                                    <NegativeStyle Resize="None" />
                                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadNumericTextBox>   
                    <asp:CompareValidator ID="CompareValidator1000" runat="server" ControlToValidate="txt1000" Type="Integer" ErrorMessage="CompareValidator" ForeColor="Red" Operator="DataTypeCheck">*</asp:CompareValidator>
                            </td>
                            <td>
                                <asp:Label ID="rst1000" runat="server" Text="0"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td> 
                                <a href="#"><img src="images/shop/2000.jpg" alt=""></a>
                            </td>
                            <td>
    <%-- <asp:TextBox ID="txt2000"  Width="50px" runat="server"  CausesValidation="True" OnTextChanged="TextBoxPrice_TextChanged" AutoPostBack="true" Text="0"></asp:TextBox>--%>
                                 <telerik:RadNumericTextBox ID="txt2000"  Width="40px" CausesValidation="True" Height="40px" runat="server" OnTextChanged="TextBoxPrice_TextChanged" AutoPostBack="true" MaxValue="100" MinValue="0" Value="0">
                                    <NegativeStyle Resize="None" />
                                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadNumericTextBox>   
                    <asp:CompareValidator ID="CompareValidator2000" runat="server" ControlToValidate="txt2000" Type="Integer" ErrorMessage="CompareValidator" ForeColor="Red" Operator="DataTypeCheck">*</asp:CompareValidator>
                            </td>
                            <td>
                                <asp:Label ID="rst2000" runat="server" Text="0"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                        <a href="#"><img src="images/shop/5000.jpg" alt=""></a>
                            </td>
                            <td>
     <%--<asp:TextBox ID="txt5000"  runat="server"  CausesValidation="True" OnTextChanged="TextBoxPrice_TextChanged" AutoPostBack="true" Text="0" Width="50px"></asp:TextBox>--%>
                                 <telerik:RadNumericTextBox ID="txt5000"  Width="40px" CausesValidation="True" Height="40px" runat="server" OnTextChanged="TextBoxPrice_TextChanged" AutoPostBack="true" MaxValue="100" MinValue="0" Value="0">
                                    <NegativeStyle Resize="None" />
                                    <NumberFormat DecimalDigits="0" ZeroPattern="n" />
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadNumericTextBox>   
                    <asp:CompareValidator ID="CompareValidator5000" runat="server" ControlToValidate="txt5000" Type="Integer" ErrorMessage="CompareValidator" ForeColor="Red" Operator="DataTypeCheck">*</asp:CompareValidator>
                            </td>
                            <td>
                                <asp:Label ID="rst5000" runat="server" Text="0"></asp:Label>
                            </td>
                        </tr>
                        </table>
                </td>
            </tr>
        </tbody>
    </table>
                   </ContentTemplate>
            </asp:UpdatePanel>
</div>
        </div>
    </div>
</section>
</asp:Content>
