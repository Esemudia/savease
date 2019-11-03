using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace saveasze
{
    public partial class Message : System.Web.UI.Page
    {

        string strURL = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            strURL = Request.QueryString["strurl"];

        }
        public void dispMessage()
        {
            string dispmessage = "";
            switch (strURL)
            {

                case "profile.aspx":
                    dispmessage = "<p style='text-align:center;color:green;font-size:20px;font-weight: bolder;'>   Password change was sucessfull please click " + " " + "<a href='login.aspx'>Login</a>" + "</p>";
                    break;
                case "login.aspx":
                    dispmessage = "<p style='text-align:center;color:green;font-size:16px;font-weight: bolder;'>   A verification link has been sent to" + " " + Session["useremail"].ToString() + "</p>";
                    break;
                default:
                    dispmessage = "<p style='text-align:center;color:green;font-size:16px;font-weight: bolder;'>   A verification link has been sent to" + " " + Session["useremail"].ToString() + "</p>";
                    break;
            }

            Response.Write(dispmessage);
        }
    }
}