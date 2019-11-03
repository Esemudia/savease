using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze.admin
{
    public partial class AddAdmin : System.Web.UI.Page
    {
        string hosts = "";
        procedurs dtpro = new procedurs();
        SH1Encryption sh1 = new SH1Encryption();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnreg_Click(object sender, EventArgs e)
        {
            string regfname = txtfname.Value;
            string reglname = txtlname.Value;
            string strPhone = txtphone.Value;
            string regemail = txtemail.Value;
            if (!checkPassword())
            {
                lblmes.Text = "Password did not match!!!";
                lblmes.ForeColor = System.Drawing.Color.Red;
                return;
            }
            string regpassword = sh1.GetSHA1HashData(txtpword.Value);
            
            
            String usertype = adlevel.InnerText;
            string expexpMessage = "";
            string strSaveMessage = "";
            //string token = sh1.GetSHA1HashData(txtUserName.Value);
            // string strAccessControl = Session["accesscontrol"].ToString();
            string strAccessControl = "0";
            Int32 intAccessControl = Int32.Parse(strAccessControl);
           int intExist = dtpro.existAdminEmail(regemail, hosts, out expexpMessage);
           if (intExist <= 0)
            {

              // strSaveMessage = dtpro.RegisterAdmin(intAccessControl, regfname, reglname, strPhone, regemail, regpassword, "superadmin", hosts, "1");
                lblmes.Text = "Account Register";

            }
            else
                lblmes.Text = "User Exist";
        }
        private bool checkPassword()
        {
            return (txtpword.Value.Equals(txtpword2.Value)) ? true : false;
        }

    }
}