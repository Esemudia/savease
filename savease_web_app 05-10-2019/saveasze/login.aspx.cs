using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace saveasze
{
    public partial class login : System.Web.UI.Page
    {

        string hosts = "";// Session["host"].ToString();
        procedurs dtProc = new procedurs();
        SH1Encryption sh1 = new SH1Encryption();
        RandomPassword temPassword = new RandomPassword();
        MailMgr mailMessenger = new MailMgr();
        string strUser = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            hosts = Session["host"].ToString(); strUser = Session["host"].ToString();
            if (!Page.IsPostBack)
            {
               // btnRegister.Enabled = false;
               // contentController(0);
            }
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
          //  contentController(0);
        }

        protected void lnkRegister_Click(object sender, EventArgs e)
        {
            //contentController(1);
        }
        protected void lnkForget_Click(object sender, EventArgs e)
        {
           // contentController(2);
        }
        protected void lnkVendor_Click(object sender, EventArgs e)
        {
          //  contentController(3);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string expMessage = "", displayName = "", strEmail = "", strPhone = "";
            string uname = txtUserName.Value;
            /*    if(string.IsNullOrEmpty(uname))
                {
                    Session["txtUsr"] = null;
                    dvLoginMessage.Visible = true;
                    lblLoginMessage.ForeColor = Color.Red;
                    lblLoginMessage.Text="Enter password";
                    return;
                }*/
            string pword = txtPassword1.Value;
            Int32 intExist = dtProc.existUser(uname, sh1.GetSHA1HashData(pword), hosts, out expMessage);
            if (intExist <= 0)
            {
                Session["txtUsr"] = null;
                lblMessage.Visible = true;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Invalid User Account";
                // tbMessage.Visible = true;
                // lblMessage.Text = "Invalid User Account";
                return;
            }
            else
            {
                lblMessage.Visible = false;
                Session["txtUsr"] = uname;
                string straccessControl = dtProc.accessControl(uname, out displayName, hosts, out strEmail, out strPhone, out expMessage).ToString();
                Session["accesscontrol"] = straccessControl;
                Session["displayName"] = displayName;
                Session["txtEmail"] = strEmail;
                Session["txtPhone"] = strPhone;

                string in_computerName = Dns.GetHostName();
                string in_ipaddress = Dns.GetHostByName(Dns.GetHostName()).AddressList[0].ToString();
                  string str_saveaseID = dtProc.getSaveaseID_By_Name(uname, hosts,out expMessage );
                //  =================== Logs ==========================
                // Login
                Int32 intLoggedIn = dtProc.LoginLog(str_saveaseID,"Logged In","","Online", in_computerName,in_ipaddress,"c",out expMessage );
                //System Log
                //SystemLog(string in_saveaseID, string in_actionPerformed,  string in_computerName, string in_ipaddress, string in_actionPage, out string expObj)
                Int32 str_syslog = dtProc.SystemLog(str_saveaseID,"Logged In",in_computerName,in_ipaddress,"Login.aspx",out expMessage );
                Response.Redirect("make-deposit.aspx");
            }
        }

        //protected void btnRegister_Click(object sender, EventArgs e)
        //{
        //    string regemail = txtEmail.Value;
        //    string regfname = txtFName.Value;
        //    string reglname = txtLName.Value;
        //    if (!checkPassword())
        //    {
        //        lblregMessage.Text = "Password did not match!!!";
        //        return;
        //    }
        //    string regpassword = sh1.GetSHA1HashData(txtPassword.Value);
        //    string username = txtUserNameR.Value;
        //    string strPhone = Txtphone.Value;
        //    // String usertype = cmbType.SelectedValue;
        //    string expexpMessage = "";
        //    string strSaveMessage = "";
        //    string token = sh1.GetSHA1HashData(txtUserName.Value);
        //    // string strAccessControl = Session["accesscontrol"].ToString();
        //    string strAccessControl = "1";
        //    Int32 intAccessControl = Int32.Parse(strAccessControl);
        //    int intEmail =dtProc.existEmail(regemail,hosts, out expexpMessage);
        //    if (intEmail <= 0) {
        //        int intExist = dtProc.existUser1(username, "", hosts, out expexpMessage);
        //        if (intExist <= 0)
        //        {
        //            string filepaths = "http://savease.ng/activate.aspx?ud=" + username + "&token=" + token;
        //            strSaveMessage = dtProc.RegisterUser(intAccessControl, regfname, reglname, strPhone, regemail, username, regpassword, "Guest", hosts, token, "0", TxtTransPIN.Value);
        //          /*  string body = this.PopulateBody(regfname + " " + reglname,
        //    "Customer registration", filepaths,
        //    "Savease New Customer Registration", "mailer/index.html", "Reg");
        //            mailMessenger.SendHtmlFormattedEmail(txtEmail.Value, "Complete Your Registration", body);
        //            */
        //            ///----------------------------------
        //            ///
        //            /*
        //            string msgBody = "Click <a href='http://savease.ng/activate.aspx?ud=" + username + "&token=" + token + "'> to confirm account</a>";
        //            //  string msgBody = "Click <a href='activate.aspx?ud=" + username + "&token="+ token+"'> to activate</a>";
        //            string msgSubjB = "Activate to Complete Registration";
        //            mailMessenger.sendMail2Usr(txtEmail.Value, msgBody, msgSubjB); // Send notification to Beneficiary
        //           */
        //            lblregMessage.Visible = true;
        //            //   lblDisplay.Text = "Account Register, please check email and activate account";
        //            Session["useremail"] = regemail;
        //            lblregMessage.Text = "REGISTRATION SUCCESSFUL. CHECK YOUR MAIL TO CONFIRM";
        //            lblregMessage.ForeColor = Color.Green;
        //            lblregMessage.BackColor = Color.WhiteSmoke;
        //            clear();
        //            // Response.Redirect("Message.aspx");
        //        }
        //        else
        //            strSaveMessage = "User Exist";
        //    }
        //    else
        //    {
        //        lblregMessage.ForeColor = Color.Red;
        //        lblregMessage.BackColor = Color.WhiteSmoke;
        //        lblregMessage.Text = "Email Already Exist";
        //        return;
        //    }
           
           
        //}
     

        private string PopulateBody(string userName, string title, string url, string description,string filepath,string mailtype)
        {
            string body = string.Empty;
            //using (StreamReader reader = new StreamReader(Server.MapPath("~/EmailTemplate.htm")))
            /*
            using (StreamReader reader = new StreamReader(Server.MapPath("~/"+filepath)))
            {
                body = reader.ReadToEnd();
            }
            if(mailtype.Equals("Reg"))
            {
            body = body.Replace("{Url}", url);
            }
            else if(mailtype.Equals("createUser"))
            {
            body = body.Replace("{UserName}", userName);
            body = body.Replace("{Title}", title);
            body = body.Replace("{Url}", url);
            body = body.Replace("{Description}", description);

            }*/
            //
            body = body + " <div style = 'width: 500px; background: whitesmoke; margin-right: auto; margin-left: auto;' >";
            body = body + " <div  style = 'margin-left: auto;margin-right: auto;width: 350px;background: white;' >";
            body = body + "<div  style='height: 70px; background:whitesmoke;'>";
            body = body + "</div>";
            body = body + "<div style = 'width: 195px;margin-left: auto;margin-right: auto;'>";
            body = body + " <img src = 'http://www.savease.ng/logo/logo.png' style = 'margin-top: 20px' >";
            body = body + "</div><br><br>";
            body = body + "<div>";
            body = body + "<h3 style = 'text-align: center;font-family:calibri;font-size: 18px;' > Complete your Registration</h3><br><br>";
            body = body + "<p style = 'margin-left: 15px; font-family:calibri;font-size: 11px' > Please click the  button below to complete your registration</p>";
            body = body + "</div><br><br>";
            body = body + " <div style = ' width: 250px;height: 70px;margin-right: auto;margin-left: auto;' >";
            body = body + " <a href='"+ url +"'><input type= 'submit' name= '' value= 'Complete Registration' style= 'background: #fa9928;color: white;margin-left: 30px;margin-right: 30px;margin-top: 20px;border-radius: 4px;height:35px;width: 200px;' ></ a >";
            body = body + " </div ><br ><p style= 'color: #212435; text-align: center;font-family:calibri;font-size: 10px;'> or Copy Link</p>"+ url;
            body = body + " <br><br><hr><br><br><br>";
            body = body + "  <div>";
            body = body + "<h4 style = 'color: #fa9928;text-align: center;font-family:calibri; font-size: 12px;' > Questions ? Get your answer here:&nbsp;<a href = 'faq.aspx' style='color: blue; font-size: smaller;font-family:calibri; font-size: 9px;'>Help Center</a></h4>";
            body = body + "</div><br><br><br>";
            body = body + "<div>";
            body = body + "<h5 style = 'color: #212435; text-align: center;font-family:calibri;font-size: 10px;' > You may contact us through any of the option:</h5>";
            body = body + "</div>";
            body = body + "<div>";
            body = body + " <p style = 'color: #212435; text-align: center;font-family:calibri;font-size: 10px;' > Phone: 0700SAVEASE, 07032599897,08056161069</p>";
            body = body + "</div>";
            body = body + " <div style = 'text-align: center;font-size: 10px;' >";
            body = body + "<p style= 'color: #212435; text-align: center;font-family:calibri;' > care@savease.ng, enquiry @savease.ng";
            body = body + "</div>";
            body = body + "  <div style = 'text-align: center;color: #212435;font-family:calibri;font-size: 10px;font-weight: bold;' >";
            body = body + " &copy; 2018 Savease.All Rights Reserved.";
            body = body + "</div>";
            body = body + "<div style = 'text-align: center; font-family: calibri;color:#212435;font-size: 10px;font-weight: bolder; '>";
            body = body + "|<a href='doc/TnC.pdf' target='_blank'>Privacy Policy</a> | <a href = 'doc/TnC.pdf' target= '_blank' > General Terms and Condition</a>";
            body = body + " </div>";
            body = body + " </div>";
            body = body + "</div>";
            return body;
        }
        //protected void btnvend_Click(object sender, EventArgs e)
        //{
        //    string regemail = Email.Value;
        //    string regfname = txtfrstname.Value;
        //    string reglname = txtlstname.Value;
        //    if (!checkPassword())
        //    {
        //        lblvenMessage.ForeColor = Color.Red;
        //       lblvenMessage.Text = "Password did not match!!!";

        //        return;
        //    }
        //    string displaySuccess = "Registration Sucessfull,Please check your mail";
        //    string regpassword = sh1.GetSHA1HashData(txtPassword.Value);
        //    string username = txtuname.Value;
        //    string Phone = textphone.Value;
        //    string companyname = txtcomname.Value;
        //    //string passport = txtpassport.Value;
        //    //string caccert = txtcac.Value;
        //    //string vatreg = txtvatreg.Value;
        //    //string cacdoc = txtcacothers.Value;
        //    //string taxid = txtTax.Value;
        //    //string address = txtaddress.Value;
        //    //string identitfication = txtidtype.Value;
        //    // String usertype = cmbType.SelectedValue;
        //    string expexpMessage = "";
        //    string strSaveMessage = "";
        //    string token = sh1.GetSHA1HashData(txtUserName.Value);
        //    // string strAccessControl = Session["accesscontrol"].ToString();
        //    string strAccessControl = "2";
        //    Int32 intAccessControl = Int32.Parse(strAccessControl);
        //    int intExist = dtProc.existUser1(username, "", hosts, out expexpMessage);
        //    /**/
        //    if (intExist <= 0)
        //    {
        //        /*
        //         registerVendor( string fname, string lname, string phone, string email, string username, string password, string createdBy, 
        //    string companyname, string passport, string caccert, string identitfication , string vatreg, string cacdoc, 
        //    string address, string taxid, string connLocation, string token, string status)
        //         */
        //        try
        //        {
                    
        //            string saveaseid =dtProc.genSaveaseID();
        //            saveaseid = saveaseid.Remove(saveaseid.Length - 6);
        //            saveaseid = "SV" + saveaseid;

        //            string strDate = DateTime.Now.ToString("dd/MM/yyyy");
        //            strDate = strDate.Replace("/", "_");
        //            string pathname = saveaseid + "_" + strDate+"_";



        //                    strSaveMessage = dtProc.registerVendor2(regfname, reglname, Phone, regemail, username, regpassword, "guest", companyname,
        //     txtaddress.Value, hosts, token, "0", saveaseid, txtbvn.Value,txtcacregnumber.Value);
        //                    string msgBody = "Click <a href='http://savease.ng/activate.aspx?ud=" + username + "&token=" + token + "'> to confirm account</a>";
        //                    //  string msgBody = "Click <a href='activate.aspx?ud=" + username + "&token="+ token+"'> to activate</a>";
        //                    string msgSubjB = "Activate to Complete Vendors Registration";
        //                    mailMessenger.sendMail2Usr(regemail, msgBody, msgSubjB); // Send notification to Beneficiary
        //                    msgDisplay.Visible = true;
        //                    //   lblDisplay.Text = "Account Register, please check email and activate account";
        //                    Session["useremail"] = regemail;
        //                    // Response.Redirect("Message.aspx?strurl='login.aspx'");
        //                    lblvenMessage.Text = displaySuccess;
        //                    lblvenMessage.ForeColor = Color.Green;
        //            lblvenMessage.Visible = true;
                    
        //        }
        //        catch(Exception exp)
        //        {
        //            lblvenMessage.Text = "Error" + exp;
        //            lblvenMessage.ForeColor = Color.Red;
        //        }
        //    }
        //    else
        //    {
        //        lblvenMessage.ForeColor= Color.Red;
        //        lblvenMessage.Text = "Details are not complete";
        //    }
        //}

//        protected void btnForgot_Click(object sender, EventArgs e)
//        {
//            string expMessage = "", displayName = "", strEmail = "", strPhone = "";
//            //string uname = resetID.Value;
//            //get email
//            DataTable dtEmail = dtProc.getEmail(uname, hosts, out expMessage);
//            string email = "";
//            if (dtEmail.Rows.Count < 1)
//            {
//                return;
//            }
//            else
//            {
//                foreach (DataRow dr in dtEmail.Rows)
//                    email = dr["email"].ToString();
//            }
//            /**
//            DateTime today = DateTime.Now;
//            Int32 intDate = DateTime.
//*/





//            string pword = txtPassword1.Value;
//            Int32 intExist = dtProc.existUser(uname, sh1.GetSHA1HashData(pword), hosts, out expMessage);
//            if (intExist <= 0)
//            {
//                Session["txtUsr"] = null;
//                lblMessage.Visible = true;
//                lblMessage.ForeColor = Color.Red;
//                lblMessage.Text = "Invalid User Account";
//                return;
//            }
//            else
//            {
//                lblMessage.Visible = false;
//                Session["txtUsr"] = uname;
//                string straccessControl = dtProc.accessControl(uname, out displayName, hosts, out strEmail, out strPhone, out expMessage).ToString();
//                Session["accesscontrol"] = straccessControl;
//                Session["displayName"] = displayName;
//                Session["txtEmail"] = strEmail;
//                Session["txtPhone"] = strPhone;

//                Response.Redirect("Default.aspx");
//            }
//        }
      

       
        protected void chkTC_CheckedChanged(object sender, EventArgs e)
        {
          //  if (chkTCv.Checked == true)
                //btnRegister.Enabled = true;
           // else
               // btnRegister.Enabled = false;
        }

        protected void chkTC2_CheckedChanged(object sender, EventArgs e)
        {
           // if (chkTC2.Checked == true)
                //btnRegister.Enabled = true;
            //else
              //  btnRegister.Enabled = false;


        }

        protected void lnkRegister2_ServerClick(object sender, EventArgs e)
        {
           // contentController(1);
        }
    }
}