using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class Message1 : System.Web.UI.Page
    {

        string strURL= "";
        protected void Page_Load(object sender, EventArgs e)
        {
         strURL= Request.QueryString["strurl"];

        }
        public void dispMessage()
        {
            string dispmessage = "";
            switch (strURL)
            {
          
                case "profile.aspx":
                 dispmessage = "<p style='text-align:center;color:green;'>   Password change was sucessfull please click " + " " + "<a href='login.aspx'>Login</a>"+ "</p>";
                break;
                case "login.aspx":
                    dispmessage = "<p style='text-align:center;color:green;'>   A verification link has been sent to" + " " + Session["useremail"].ToString() + "</p>";
                    break;
                default:
             dispmessage = "<p style='text-align:center;color:green;'>   A verification link has been sent to" + " "+ Session["useremail"].ToString() + "</p>";
                    break;
            }

            Response.Write(dispmessage);
        }
    }
}