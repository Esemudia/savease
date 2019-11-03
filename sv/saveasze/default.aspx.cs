using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        
        }
        public void login()
        {
          //  Response.Write(" <div class='tp-caption tp-resizeme' data-x='left' data-hoffset='15' data-y='top' data-voffset='440' data-transform_idle='o:1;' data-transform_in='y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;' data-transform_out='s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;' data-splitin='none' data-splitout='none' data-responsive_offset='on' data-start='2300'> <div class='slide-content-box'> <div class='button'>");
                 if (Session["txtUsr"] != null)
                {
                    //<a class="thm-btn yellow-bg" href="<%loginregLink(); %>"><% login();%></a>  
                    Response.Write("Logout");
                }
                else
                {
                    Response.Write("Login");
                    // btnLogin.Visible = true;
                    // btnLogout.Visible = false;

                }
        }

        public void showMDLink()
        {
                Response.Write("Deposit.aspx");
        }
        public void showMD()
        {
                Response.Write("Make Deposit");
        }
        public void loginregLink()
        {
            if (Session["txtUsr"] != null)
            {
                Response.Write("Logout.aspx");
            }
            else
            {
                Response.Write("login.aspx");

                // btnLogin.Visible = true;
                // btnLogout.Visible = false;

            }
        }
        public void showhide()
        {
             if (Session["txtUsr"] != null)
                {
                   Response.Write("display:none");
                }
                else
                {
                   Response.Write("display:block");
             }
        }
    }
}