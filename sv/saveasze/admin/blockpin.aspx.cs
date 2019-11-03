using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze.admin
{
    public partial class blockpin : System.Web.UI.Page
    {
        MailMgr mailMessenger = new MailMgr();
        procedurs dtProc = new procedurs();
        // navigations nav = new navigations();
        string hosts = "";
        DataTable dtBankDeposit = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["txtUsr"] == null)
                Response.Redirect("Default.aspx");
            else
                hosts = Session["txtUsr"].ToString();
            RadGrid1.ItemStyle.Height = 12;
            RadGrid1.AlternatingItemStyle.Height = 12;
            RadGrid1.ItemStyle.Font.Size = 10;
            RadGrid1.AlternatingItemStyle.Font.Size = 10;
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
        public void getbankDeposit()
        {
            string expMessage = "";
            dtBankDeposit = dtProc.getBlockpinrequest(hosts, out expMessage);

            //RadSearchBox1.DataSource = dtBankDeposit;
            RadGrid1.DataSource = null;
            RadGrid1.DataSource = dtBankDeposit;
            RadGrid1.Skin = "WebBlue";

        }

        protected void btnblck_Click(object sender, EventArgs e)
        {
            string pintype = txtby.SelectedValue;
            string value = txtpin.Text;
            string expObj = "";
            Int32 Dtblock = dtProc.AdminBlockpin(pintype, value, out expObj);
            if (Dtblock > 0)
            {
                lblmes.ForeColor = Color.Green;
                lblmes.Font.Bold = true;
                // lblmes.Font.Size = ;
                lblmes.Text = "PIN BLOCKED SUCESSFULLY";
            }
            else
            {
                lblmes.ForeColor = Color.Green;
                lblmes.Font.Bold = true;
                // lblmes.Font.Size = ;
                lblmes.Text = "PIN HAS BEEEN BLOCK";
            }
        }
    }
}