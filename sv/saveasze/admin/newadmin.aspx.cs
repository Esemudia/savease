using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze.admin
{
    public partial class newadmin : System.Web.UI.Page
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
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string regfname = txtfname.Value;
            string reglname = txtlname.Value;
            string strPhone = txtphone.Value;
            string regemail = txtmail.Value;
            if (!checkPassword())
            {
                lblmes.Text = "Password did not match!!!";
                return;
            }
            string regpassword = sh1.GetSHA1HashData(txtpass.Value);
            string username = txtuname.Value;
            //string strPhone = Txtphone.Value;
            // String usertype = cmbType.SelectedValue;
            string expexpMessage = "";
            string strSaveMessage = "";
            //string token = sh1.GetSHA1HashData(txtUserName.Value);
            // string strAccessControl = Session["accesscontrol"].ToString();
            string strAccessControl = "-1";
            Int32 intAccessControl = Int32.Parse(strAccessControl);
            int intExist = dtProc.existUser1(username, "", hosts, out expexpMessage);
            if (intExist <= 0)
            {

                strSaveMessage = dtProc.RegisterAdmin(intAccessControl, regfname, reglname, strPhone, regemail, username, regpassword, "superadmin", hosts, "0");
                lblmes.Text = "Account Register";

            }
            else
                strSaveMessage = "User Exist";
        }

        private bool checkPassword()
        {
            return (txtpass.Value.Equals(txtcompass.Value)) ? true : false;
        }

        private void clear()
        {
            txtfname.Value = "";
        }
    }
}