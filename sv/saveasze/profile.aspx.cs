using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class profile : System.Web.UI.Page
    {


        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        SH1Encryption sh1 = new SH1Encryption();
        RandomPassword temPassword = new RandomPassword();
        MailMgr mailMessenger = new MailMgr();
        string hosts = "";
        string strURL = "";
        protected void Page_Load(object sender, EventArgs e)
        {
           // hosts = Session["hosts"].ToString();
            hosts = Request.Url.Host;

            getUserdetails(Session["txtUsr"].ToString());

        }
        public void leftNavigation()
        {
            if (Session["accesscontrol"]=="" || Session["accesscontrol"] == null)
            {
                Response.Redirect("login.aspx");
            }
            string accesscontrol = Session["accesscontrol"].ToString();
            //
            string expMessage = "";
            DataTable dtNav = dtProc.getLeftNavigation(Int32.Parse(accesscontrol),hosts,out expMessage);
            foreach (DataRow row in dtNav.Rows)
            {
                string link = row["link"].ToString()+".aspx";
                string strText = row["text"].ToString();
            string leftNav=  "<li class='active'><a href='"+link+"'>"+strText+"</a></li>";
            Response.Write(leftNav);
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }
        protected void passchng_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txtpassold.Text))
            {
                lblDisplay.Text = "Old password cannot be empty";
                return;
            }
            if(string.IsNullOrEmpty(txtpass1.Text))
            {
                lblDisplay.Text = "New password cannot be empty";
                return;
            }
            if(string.IsNullOrEmpty(txtpass2.Text))
            {
                lblDisplay.Text = "Confirm password cannot be empty";
                return;
            }

            if (!txtpass1.Text.Equals(txtpass2.Text))
            {
                lblDisplay.Text = "The Password are not thesame. please check";
                return;
            }

            string uname = Session["txtUsr"].ToString();
                string expMessage = "";
                string mail = "";
                string pword = sh1.GetSHA1HashData(txtpassold.Text);
                string pwordnew = sh1.GetSHA1HashData(txtpass1.Text);
                string outPsword = dtProc.getPawword( uname, pword, out mail, hosts, out expMessage);
           
            if(!pword.Equals(outPsword))
            {
                lblDisplay.Text = "Old password entered is not recognized";
                return;
            }
            if(txtpassold.Text.Equals(txtpass1.Text))
            {
                lblDisplay.Text = "New password cannot be same as old password";
                return;
            }

            //start update password
              string strSaveMessage = dtProc.Updatepassword(uname,  pwordnew, hosts);
            //end update password
            //start mail sender
           
            ///----------------------------------
            ///
             Response.Redirect("Message.aspx?strurl=profile.aspx");
            string msgBody = "Hello "+ uname+", Password change was successful" ;
            //  string msgBody = "Click <a href='activate.aspx?ud=" + username + "&token="+ token+"'> to activate</a>";
            string msgSubjB = "Savease Change Password";
            mailMessenger.sendMail2Usr(mail, msgBody, msgSubjB); // Send notification to Beneficiary
            //msgDisplay.Visible = true;
            //   lblDisplay.Text = "Account Register, please check email and activate account";
            Session["Profile"] = "profile.aspx";
            Session["useremail"] = mail;
            //end mail sender

        }

        public void getUserdetails(string struname)
        {
            //getUserDetails(string in_uname, string connLocation, out string expMessage)
            string expMessage = "";
            DataTable dtUsers = dtProc.getUserDetails(struname,hosts,out expMessage);
            foreach(DataRow dr in dtUsers.Rows)
            {
                lblUname.Text = struname;
                lblFullName.Text = dr["fName"].ToString() + " " + dr["lName"].ToString();
                lblAcctNo.Text = dr["saveaseID"].ToString();
                lblEmail.Text = dr["email"].ToString();
                lblPhone.Text = dr["phone"].ToString();
            }
        }
    }
}