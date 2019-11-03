using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace saveasze
{
    public partial class adm_create_user : System.Web.UI.Page
    {
        saveupdate sveUpd = new saveupdate();
        procedurs dtProc = new procedurs();
        SH1Encryption sh1 = new SH1Encryption();
        RandomPassword temPassword = new RandomPassword();
        string struname = "";
        string stremail = "";
        string strPassword = "";
        Int32 intUserLvl = 0;
        string expMessage = "";
        string hosts = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            hosts = Session["hosts"].ToString();
            if(!Page.IsPostBack)
            {
  loadLevels();
            }
          
        }
        public void loadLevels()
        {
            cmdLevels.Items.Add(new ListItem("Admin","0" ));
            cmdLevels.Items.Add(new ListItem( "Customer","1"));
            cmdLevels.Items.Add(new ListItem( "Vendor","2"));
            //    Response.Write("<option value='0' selected>Admin</option>");
            //    Response.Write("<option value='1'>Customer</option>");
             //   Response.Write("<option value='2'>Vendor</option>");
                cmdLevels.SelectedIndex = 0;
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            struname = username.Value;
            stremail = txtEmail.Value;
            strPassword = userpassword.Value;
            Int32 intExist = dtProc.existUser(struname, "",hosts, out expMessage); // check if user exist
//            Int32 intExist = dtProc.existUser(struname, sh1.GetSHA1HashData(txtPwd.Text), out expMessage);

            EmailManager emailSender = new EmailManager();
            string upwd = sh1.GetSHA1HashData(struname);
            Int32 retResult = 0;
            if (intExist <= 0)
            {
                retResult = sveUpd.saveuserz(struname, upwd, stremail, Session["txtUsr"].ToString(), cmdLevels.Value,hosts, out expMessage);
                try
                {
                    string messgeBodyHtml = "<html><body><br/>";
                    messgeBodyHtml = messgeBodyHtml + " Username: <strong>" + struname + "</strong> <br/>";
                    messgeBodyHtml = messgeBodyHtml + "<table border='1' bordercolor='black'><tr><td> Password: </td><td><b><i>" + strPassword + "</i></b></td></tr></table>";
                    messgeBodyHtml = messgeBodyHtml + "Login to Savease system as a user ";
                    messgeBodyHtml = messgeBodyHtml + "</body></html>";
                    emailSender.sendEmail2("Savease New User", messgeBodyHtml, stremail);
                    // emailSender.sendEmail2(" New Well", messgeBodyHtml, "jonathan.ataisi@gmail.com", "tundearansiola@ngdelta.com");

                    //  tbl_username.Visible = true;
                    // tbl_userpassword.Visible = false;
                    //   tbl_userEmail.Visible = false;
                    //   tbl_Changepassword.Visible = false;
                    lblDisplay.Text = "New Savease User Created!";
                    lblDisplay.ForeColor = Color.Green;

                }
                catch (Exception exp)
                {
                    lblDisplay.Text = exp.Message;
                    lblDisplay.ForeColor = Color.Red;
                    return;
                }
            }
            else
            {
                lblDisplay.Text = "User already exist";
                    lblDisplay.ForeColor = Color.Red;
                    return;
            }
        }

    }
}