using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class openAccount : System.Web.UI.Page
    {

        procedurs dtProc = new procedurs();
        SH1Encryption sh1 = new SH1Encryption();
        RandomPassword temPassword = new RandomPassword();
        string hosts = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            hosts = Session["hosts"].ToString();
            if (!Page.IsPostBack)
            {
                trUPwd.Visible = false;
                trUname.Visible = true;
                btnBack.Visible = false;
            }
        }
        protected void btnLogin1_Click(object sender, EventArgs e)
        {

            if (String.IsNullOrEmpty(txtUser.Text))
            {
                lblMessage.Text = "User Name is empty!"; txtUser.Focus();
                trUname.Visible = true;
                trUPwd.Visible = false;
                lblMessage.ForeColor = Color.OrangeRed;
                btnLogin1.Visible = true;
                btnLogin2.Visible = false;
                btnBack.Visible = false;
                return;
            }
            string expMessage = "";
            //check if user exist
            // Int32 intExist = dtProc.existUser(txtUser.Text, txtPwd.Text, out expMessage);
            Int32 intExist = dtProc.existUser(txtUser.Text, "", hosts,out expMessage);
            if (intExist <= 0)
            {
                Session["txtUsr"] = null;
                return;
            }
            else
            {
                lblMessage.Text = "";
                trUname.Visible = false;
                trUPwd.Visible = true;
                btnLogin1.Visible = false;
                btnLogin2.Visible = true;
                btnBack.Visible = true;
            //    return;
                
            }
           /* if (String.IsNullOrEmpty(txtPwd.Text))
            {
                lblMessage.Text = "Password is empty!"; txtPwd.Focus();
                lblMessage.ForeColor = Color.OrangeRed;
                return;
            }
            if (trUname.Visible.Equals(true))
            {
                trUname.Visible = false;
                trUPwd.Visible = true;
            }*/

        }
        protected void btnLogin2_Click(object sender, EventArgs e)
        {
             if (String.IsNullOrEmpty(txtPwd.Text))
            {
                lblMessage.Text = "Password is empty!"; txtPwd.Focus();
                lblMessage.ForeColor = Color.OrangeRed;
                return;
            }
                 string expMessage="";
            string displayName="";
                 //check if user exist
                // Int32 intExist = dtProc.existUser(txtUser.Text, txtPwd.Text, out expMessage);
                 Int32 intExist = dtProc.existUser(txtUser.Text, sh1.GetSHA1HashData(txtPwd.Text),hosts, out expMessage);
                 //Int32 intExist = dtProc.existUser(txtUser.Text, txtPwd.Text, out expMessage);
                 if(intExist>0)
                 {
                     Session["txtUsr"] = txtUser.Text;
                     string straccessControl= dtProc.accessControl(txtUser.Text,out displayName, hosts,out string strEmail,out string strPhone,out expMessage).ToString();
                     Session["accesscontrol"] =straccessControl;
                     Session["displayName"] = displayName;
                     Response.Redirect("Default.aspx");
                 }
                 else
                 {
                lblMessage.Text = "User Name or Password not valid";// txtPwd.Focus();
                lblMessage.ForeColor = Color.OrangeRed;
                return;
                 }

        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (trUname.Visible.Equals(false))
            {
                trUname.Visible = true;
                trUPwd.Visible = false;
            }

        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            if (trUname.Visible.Equals(false))
            {
                trUname.Visible = true;
                trUPwd.Visible = false;
            }

        }
    }
}