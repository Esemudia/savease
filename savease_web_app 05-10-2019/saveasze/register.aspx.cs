using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class register : System.Web.UI.Page
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

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            string regemail = txtemail.Value;
            string regfname = txtfname.Value;
            string reglname = txtlname.Value;
            string pin = txtpin.Value;
            string regpassword = sh1.GetSHA1HashData(txtpassword1.Value);
            string username = txtuid.Value;
            string strPhone = txtphone.Value;
            // String usertype = cmbType.SelectedValue;
            string expexpMessage = "";
            string strSaveMessage = "";
            string token = sh1.GetSHA1HashData(txtuid.Value);
            // string strAccessControl = Session["accesscontrol"].ToString();
            string strAccessControl = "1";
            Int32 intAccessControl = Int32.Parse(strAccessControl);
            int intEmail = dtProc.existEmail(regemail, hosts, out expexpMessage);
            if (intEmail <= 0)
            {
                int intExist = dtProc.existUser1(username, "", hosts, out expexpMessage);
                if (intExist <= 0)
                {
                    string filepaths = "http://savease.ng/activate.aspx?ud=" + username + "&token=" + token;
                    strSaveMessage = dtProc.RegisterUser(intAccessControl, regfname, reglname, strPhone, regemail, username, regpassword, "Guest", hosts, token, "0",pin);
                    /*  string body = this.PopulateBody(regfname + " " + reglname,
              "Customer registration", filepaths,
              "Savease New Customer Registration", "mailer/index.html", "Reg");
                      mailMessenger.SendHtmlFormattedEmail(txtEmail.Value, "Complete Your Registration", body);
                      */
                    ///----------------------------------
                    ///
                    /*
                    string msgBody = "Click <a href='http://savease.ng/activate.aspx?ud=" + username + "&token=" + token + "'> to confirm account</a>";
                    //  string msgBody = "Click <a href='activate.aspx?ud=" + username + "&token="+ token+"'> to activate</a>";
                    string msgSubjB = "Activate to Complete Registration";
                    mailMessenger.sendMail2Usr(txtEmail.Value, msgBody, msgSubjB); // Send notification to Beneficiary
                   */
                    lblregMessage.Visible = true;
                    //   lblDisplay.Text = "Account Register, please check email and activate account";
                    Session["useremail"] = regemail;
                    lblregMessage.Text = "REGISTRATION SUCCESSFUL. CHECK YOUR MAIL TO CONFIRM";
                    lblregMessage.ForeColor = Color.Green;
                    lblregMessage.BackColor = Color.WhiteSmoke;
                   // clear();
                    // Response.Redirect("Message.aspx");
                }
                else
                    strSaveMessage = "User Exist";
            }
            else
            {
                lblregMessage.ForeColor = Color.Red;
                lblregMessage.BackColor = Color.WhiteSmoke;
                lblregMessage.Text = "Email Already Exist";
                return;
            }


        }
        private string PopulateBody(string userName, string title, string url, string description, string filepath, string mailtype)
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
            body = body + " <a href='" + url + "'><input type= 'submit' name= '' value= 'Complete Registration' style= 'background: #fa9928;color: white;margin-left: 30px;margin-right: 30px;margin-top: 20px;border-radius: 4px;height:35px;width: 200px;' ></ a >";
            body = body + " </div ><br ><p style= 'color: #212435; text-align: center;font-family:calibri;font-size: 10px;'> or Copy Link</p>" + url;
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
        private  string checkPassword()
        { string mess = "";
            string pass1 = txtpassword1.Value;
            string pass2 = txtpassword2.Value;
            if (pass1 == pass2)
            {
                return pass1;
            }
            else
            {
                //string mess="":
                lblregMessage.ForeColor = Color.Red;
                lblregMessage.Text = "Password Do Not Match";
                mess = lblregMessage.Text;
            }
            return mess;
        }
    }
}