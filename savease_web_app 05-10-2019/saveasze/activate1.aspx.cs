using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class activate1 : System.Web.UI.Page
    {
        string hosts = "";// Session["host"].ToString();
        procedurs dtProc = new procedurs();
        SH1Encryption sh1 = new SH1Encryption();
        string expMessage = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string token = Request.QueryString["token"];
            //string token = "132412186162412272911411038207177130166224173199184161";
            string uid= Request.QueryString["ud"];

            //exisToken(string token, string connLocation, out string expMessage)
            Int32 intExistToken = dtProc.exisToken1(token, hosts, out  expMessage);
            if(intExistToken>0)
            {
            DataTable dtTokenDetails = dtProc.getUserbyToken(token, hosts, out  expMessage);
                string strEmail = "";
                string strFullName = "";
                foreach(DataRow dr in dtTokenDetails.Rows)
                {
                    strEmail = dr["email"].ToString();
                    strFullName = dr["dName"].ToString();
                }
                MailMgr mailMessenger = new MailMgr();
                string msgBody = PopulateBody(strFullName);
                //  dtProc.updateStatus(token, hosts);
                dtProc.updateStatus(token, out expMessage);
                rowValid.Visible = false;
                rowInvalid.Visible = true;
                mailMessenger.sendMail2Usr(strEmail, msgBody, "Welcome to savease"); // Send notification to Beneficiary
            }
            else
            {
                rowValid.Visible = true;
                rowInvalid.Visible = false;


            }
        }
        private string PopulateBody(string dispName)
        {
            string body = string.Empty;

            body = body + " <div style = 'width: 500px; background: whitesmoke; margin-right: auto; margin-left: auto;'>";
            body = body + " <div  style = 'margin-left: auto;margin-right: auto;width: 350px;background: white;'>";
           // body = body + "<div  style='height: 70px; background:whitesmoke;'>";
           // body = body + "</div>";
            body = body + "<div style = 'width: 195px;margin-left: auto;margin-right: auto;'>";
            body = body + " <img src = 'http://www.savease.ng/logo/logo.png' style = 'margin-top: 20px'>";
            body = body + "</div><br><br>";
            body = body + "<div>";
            body = body + "<h3 style = 'font - family:calibri; '>Dear "+ dispName + ",</h3><br><br>";
            body = body + "<p style='font - size: 13px; font - family:calibri;'>Savease welcomes you to her instant deposit and saving platform.</p></div><br>";
            body = body + "</div><br><br>";
            body = body + " <p style='font - family:calibri; font - size: 13px; '>Our aim is to make saving habit simple and effortless, while we make deposit payment instant.</p>";
            body = body + "  <p style='font - family:calibri; font - size: 13px; '>We have help you destroy the banking and constraint of distance,time and structure.You can now make deposits into distintive bank accounts without the need to walk into a banking hall.</p><br>";
            body = body + "<p style='font - family:calibri; font - size: 13px; >You have successfully registered Savease.</p><br>";
            body = body + " <p style='font - family:calibri; font - size: 13px; font - style: italic; '>Save with ease!</p>";
            body = body + " <p style='font - family:calibri; font - size: 13px; font - style: italic; '>Make Instant Deposit!</p>";
            body = body + "  <br>";
            body = body + "  <div>";
            body = body + "<h4 style='color: #fa9928;font-family:calibri;'><a href='' style='color: blue; font-size:10px;font-family:calibri;'>Please click here to provide freedback on your experience</a></h4>";
             body = body + "<h4 style='color: #fa9928;font-family:calibri; font-weight: bolder;'><a href='' style='color: blue; font-size:10px;font-family:calibri;'>Thank you for using Savease.</a></h4>";
             body = body + "<h4 style='color: #fa9928;font-family:calibri;'><a href='' style='color: blue; font-size:10px;font-family:calibri;'>This is an automated email. Please do not reply.</a></h4>";
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
    }
}