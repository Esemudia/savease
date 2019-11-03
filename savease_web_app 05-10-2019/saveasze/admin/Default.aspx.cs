using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze.admin
{
    public partial class Default : System.Web.UI.Page
    {

        string hosts = "";// Session["host"].ToString();
        procedurs dtProc = new procedurs();
        SH1Encryption sh1 = new SH1Encryption();
        RandomPassword temPassword = new RandomPassword();
        MailMgr mailMessenger = new MailMgr();
        string strUser = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string expMessage = "", displayName = "", strEmail = "", strPhone = "", pword;
            string uname = txtusr1.Value;
            /*    if(string.IsNullOrEmpty(uname))
                {
                    Session["txtUsr;"] = null;
                    dvLoginMessage.Visible = true;
                    lblLoginMessage.ForeColor = Color.Red;
                    lblLoginMessage.Text="Enter password";
                    return;
                }*/
            pword = usrPass.Value;
            Int32 intExist = dtProc.existAdmin(uname, sh1.GetSHA1HashData(pword), hosts, out expMessage);
            if (intExist <= 0)
            {
                Session["txtUsr"] = null;
                lbl.ForeColor = Color.Red;
                lbl.BackColor = Color.WhiteSmoke;
                lbl.Text = "Invalid User Account";
                // tbMessage.Visible = true;
                // lblMessage.Text = "Invalid User Account";
                return;
            }
            else
            {
                //int32 int
                //tbMessage.Visible = false;
                Session["txtUsr"] = uname;
                string straccessControl = dtProc.accessControl(uname, out displayName, hosts, out strEmail, out strPhone, out expMessage).ToString();
                Session["accesscontrol"] = straccessControl;
                Session["displayName"] = displayName;
                Session["txtEmail"] = strEmail;
                Session["txtPhone"] = strPhone;

                Response.Redirect("board.aspx");
            }
        }


    }
}