using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze.admin
{
    public partial class transactions : System.Web.UI.Page
    {
        MailMgr mailMessenger = new MailMgr();
        procedurs dtProc = new procedurs();
        // navigations nav = new navigations();
        string hosts = "";
        string usrQString = "";// Request.QueryString["i00"];
        DataTable dtBankDeposit = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            usrQString = Request.QueryString["utype"];
            switch (usrQString)
            {
                case "0":
                    lblUserType.Text = "System Admin Transaction";
                    lblGridHeader.Text = "System Admin Transaction";
                    break;
                case "1":
                    lblUserType.Text = "Users Transaction";
                    lblGridHeader.Text = "Users Transaction";
                    break;
                case "2":
                    lblUserType.Text = "Vendors Transaction";
                    lblGridHeader.Text = "Vendors Transaction";
                    break;
            }
            if (Session["txtUsr"] == null)
                Response.Redirect("Default.aspx");
            else
                hosts = Session["txtUsr"].ToString();

            //RadGrid1.Skin = "WebBlue";
            string userName = "";
            hosts = Request.Url.Host;
            string ipaddress;
            /* ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
             if (ipaddress == "" || ipaddress == null)
                 ipaddress = Request.ServerVariables["REMOTE_ADDR"];
             lblIP.Text = ipaddress;*/
            if (!Page.IsPostBack)
            {

                if (Session["txtUsr"].ToString() == null || Session["txtUsr"].ToString() == "")
                    userName = "";
                else
                    userName = Session["txtUsr"].ToString();

            }
        }
    }
}