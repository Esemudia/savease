using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Newtonsoft.Json;
using System.Xml;
using System.Net;
using System.Text;
using Org.BouncyCastle.Asn1.Ocsp;
using System.Collections.Specialized;

namespace saveasze
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://savease.ng/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class USSD_Service : System.Web.Services.WebService
    {

        MailMgr mailMessenger = new MailMgr();
        procedurs dtproc = new procedurs();
        string hosts = HttpContext.Current.Request.Url.Host;
        SH1Encryption sh1 = new SH1Encryption();
        RandomPassword temPassword = new RandomPassword();
        
        public string existUser(string email)
        {
            string expMessage = "";
            string retValue = "";
            int intEmail = dtproc.existEmail(email, hosts, out expMessage);
            return retValue;
        }
        //existTransPIN(string in_username,string pin, string connLocation, out string expMessage)
        public int existTransPIN(string in_username,string transPIN)
        {
            string expMessage = "";
            string retValue = "";
            int intEmail = dtproc.existTransPIN(in_username,transPIN, hosts, out expMessage);
            return intEmail;
        }
        public Int32 sendMailNotificationToUser(string regfname,string reglname,string email,string username)
        {
            Int32 retValue = 0;
            try { 
            string token = sh1.GetSHA1HashData(username);//SH1Encryption
            string filepaths = "http://savease.ng/activate.aspx?ud=" + username + "&token=" + token;
           // string strSaveMessage = dtproc.RegisterUser(intAccessControl, regfname, reglname, strPhone, regemail, username, regpassword, "Guest", hosts, token, "0", TxtBVN2.Value);
            string body = this.PopulateBody(regfname + " " + reglname,"Customer registration", filepaths,
    "Savease New Customer Registration", "mailer/index.html", "Reg");
            mailMessenger.SendHtmlFormattedEmail(email, "Complete Your Registration", body);
                retValue = 1;
           } 
            catch(Exception exp)
            { retValue = 0; }
            return retValue;
        }
        
        public string getBalance(string straccountNo)
        {
            string expMessage = "";
            DataTable value = dtproc.getBalance(straccountNo, hosts, out expMessage);
            //return JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(value);
            return JSONString;
            //return value.Rows[0]["balance"].ToString();
        }


        public float getBalance2(string straccountNo)
        {
            string expMessage = "";
            DataTable value = dtproc.getBalance(straccountNo, hosts, out expMessage);
            //return JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(value);
            string strBal = "";
            foreach(DataRow dr in value.Rows)
            {
                strBal = dr["balance"].ToString();
            }
            return float.Parse(strBal);
            //return value.Rows[0]["balance"].ToString();
        }
        

        public float getBalanceTest(string straccountNo)
        {
            string expMessage = "";
            DataTable value = dtproc.getBalance(straccountNo, hosts, out expMessage);
            //return JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(value);
            string strBal = "";
            foreach (DataRow dr in value.Rows)
            {
                strBal = dr["balance"].ToString();
            }
            return float.Parse(strBal);
            //return value.Rows[0]["balance"].ToString();
        }
        
        public string getBeneficiary(string inputParame)
        {
            string expMessage = "";
            DataTable value = dtproc.getBeneficiary(inputParame, hosts, out expMessage);
            //return JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
            return JsonConvert.SerializeObject(value);
        }

        public Int32 saveDeposit(string in_acctNo, string in_cardpin, string in_cardsn, string in_bankName, string in_acctName, string in_amount,
            string in_depositor, string in_naration)
        {
            string expMessage = "";
            Int32 value = dtproc.saveDeposit(in_acctNo, in_cardpin, in_cardsn, in_bankName, in_acctName, Double.Parse(in_amount),
             in_depositor, computerName(), ipaddress1(), references(), out expMessage, in_naration);
          // return JsonConvert.SerializeObject(value);
           return value;
            // JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
        }
        
        public void updateBalance(string inuser, string App_amt)
        {
            string expMessage = "";
            String strDBbal = "";
            //updateBalance(string inuser, double in_bal, out string expObj)
            DataTable dtBal = dtproc.getBalance(inuser, hosts, out expMessage);
            foreach(DataRow dr in dtBal.Rows)
            {
             strDBbal = dr["balance"].ToString();
            }
            double dbBal = Double.Parse(strDBbal);
            double appAmt = Double.Parse(App_amt);
            double currentBal = dbBal - appAmt;
            Int32 value = dtproc.updateBalance(inuser, currentBal, out expMessage);
            JsonConvert.SerializeObject(value);
            // JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
        }
        //Paystack update balance

        
        public Int32 FundAcct(string inuser, string App_amt)
        {
            string expMessage = "";
            String strDBbal = "";
            //updateBalance(string inuser, double in_bal, out string expObj)
            DataTable dtBal = dtproc.getBalance(inuser, hosts, out expMessage);
            foreach (DataRow dr in dtBal.Rows)
            {
                strDBbal = dr["balance"].ToString();
              //  value = 0;
            }
            double dbBal = Double.Parse(strDBbal);
            double appAmt = Double.Parse(App_amt);
            double currentBal = dbBal + appAmt;
             Int32 value = dtproc.updateBalance(inuser, currentBal, out expMessage);
           return  value;
            // JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
        }
        
        public Int32 transferFund(string amountTransfered, string balance, string beneficiaryAccount,
             string saveaseid, string transferedBy, string in_naration,string username)
        {
            string expMessage = "";
            string beneficaryName = "";
            DataTable dtname = dtproc.getName(beneficiaryAccount, hosts, out expMessage);
            foreach(DataRow dr in dtname.Rows)
            {
                beneficaryName = dr["dname"].ToString();
            }
             // Int32 value = dtproc.transferFund(float.Parse(getBalance(saveaseid)), amountTransfered, balance, beneficiaryAccount, beneficaryName,
          Int32 value = dtproc.transferFund(genPin(),getBalance2(saveaseid), Double.Parse(amountTransfered), Double.Parse(balance), beneficiaryAccount, beneficaryName,
             saveaseid, transferedBy, computerName(), out expMessage, in_naration,username);
           // JsonConvert.SerializeObject(value);
           return value;
            //JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
        }
        //Int32 saveBeneficiary(string in_saveaseID, string savedFor,string bankname, out string expObj)
        public string genPin()
        {
            Random rnd = new Random();
            string rands = "";
            for (int i = 0; i < 2; i++)
            {
                int myRandomNo = rnd.Next(1000, 9999);
                rands = rands + myRandomNo;
            }
            return rands;
        }
        public string references()
        {
            Random rnd = new Random();
            string rands = "";
            for (int i = 0; i < 2; i++)
            {
                int myRandomNo = rnd.Next(1000, 9999);
                rands = rands + myRandomNo;
            }
            return rands;
        }
        public Int32 saveBenDetails(string in_acctNo, string in_acctName, string in_bankName, string in_depositor, string in_cardpin,
            string in_phoneNumber, string in_emailID)
        {
            string expMessage = "";
            Int32 value = dtproc.saveBenDetails(in_acctNo, in_acctName, in_bankName, in_depositor, in_cardpin,
             in_phoneNumber, in_emailID, out expMessage);
           return value;
            //JsonConvert.SerializeObject(value);
            //JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
        }
        
        public string VerifyPin(string inputParame)
        { 
            string expMessage = "";
            Int32 exitpin = dtproc.usedPin(inputParame, hosts, out expMessage);
            string value = "";
            if (exitpin < 1)
            {
                DataTable dtCardDetaail = dtproc.getCardPin(inputParame, hosts, out expMessage);
                if (dtCardDetaail == null)
                {

                    value = "Invalid Voucher details supplied!!!";
                }
                else
                {
                    foreach (DataRow dr in dtCardDetaail.Rows)
                    {

                        value = "Card Valid. Amount: " + dr["cardAmount"].ToString();
                        //  lblAcctName.Text = dr[""].ToString();
                    }
                }

            }
            else
            {
                value = "Voucher details has been used!!!";
            }
            // doc.LoadXml(value);
            // string jsonText = JsonConvert.SerializeXmlNode(doc);
            // return JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
            return value;
        }


        
        public Int32 getlogin(string uname, string pword)
        {
            string expMessage = "", displayName = "", strEmail = "", strPhone = "";
            Int32 intExist = dtproc.existUser(uname, sh1.GetSHA1HashData(pword), hosts, out expMessage);
            string value = "";
            if (intExist <= 0)
            {

                value = "100";
                return Int32.Parse(value);
            }
            else
            {
                //Session["txtUsr"] = uname;
                Int32 straccessControl = dtproc.accessControl(uname, out displayName, hosts, out strEmail, out strPhone, out expMessage);
                //Session["accesscontrol"] = straccessControl;
                // Session["displayName"] = displayName;
                //Session["txtEmail"] = strEmail;
                // Session["txtPhone"] = strPhone;

                string in_computerName = Dns.GetHostName();
                string in_ipaddress = Dns.GetHostByName(Dns.GetHostName()).AddressList[0].ToString();
                string str_saveaseID = dtproc.getSaveaseID_By_Name(uname, hosts, out expMessage);
                string str_userlevel = dtproc.getUserLevel(uname, hosts, out expMessage);
                Int32 intLoggedIn = dtproc.LoginLog(str_saveaseID, "Logged In", "", "Online", computerName(), ipaddress1(), "c", out expMessage);
                Int32 str_syslog = dtproc.SystemLog(str_saveaseID, "Logged In", computerName(), ipaddress1(), "Login.aspx", out expMessage);

                value = str_userlevel;
            }
            var numv = Int32.Parse(value);
            return numv;
            //return JsonConvert.SerializeObject(numv );
        }

        
        public string getlogin2(string uname, string pword)
        {
            string expMessage = "", displayName = "", strEmail = "", strPhone = "";
            Int32 intExist = dtproc.existUser(uname, sh1.GetSHA1HashData(pword), hosts, out expMessage);
            string value = "";
            if (intExist <= 0)
            {

                value = "100";
                return value;
            }
            else
            {
                //Session["txtUsr"] = uname;
                Int32 straccessControl = dtproc.accessControl(uname, out displayName, hosts, out strEmail, out strPhone, out expMessage);
                //Session["accesscontrol"] = straccessControl;
                // Session["displayName"] = displayName;
                //Session["txtEmail"] = strEmail;
                // Session["txtPhone"] = strPhone;

                string in_computerName = Dns.GetHostName();
                string in_ipaddress = Dns.GetHostByName(Dns.GetHostName()).AddressList[0].ToString();
                string str_saveaseID = dtproc.getSaveaseID_By_Name(uname, hosts, out expMessage);
                string str_userlevel = dtproc.getUserLevel(uname, hosts, out expMessage);
                Int32 intLoggedIn = dtproc.LoginLog(str_saveaseID, "Logged In", "", "Online", computerName(), ipaddress1(), "c", out expMessage);
                Int32 str_syslog = dtproc.SystemLog(str_saveaseID, "Logged In", computerName(), ipaddress1(), "Login.aspx", out expMessage);

                value = str_userlevel;
            }
            //return value;
            return JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
        }
        /*
        [WebMethod]
        public string completedorders(string sveIDs, string ordernumber, string totalh)
        {
            string expMessage = "";
            Int32 value = dtproc.completedorders( sveIDs,  ordernumber,  totalh, hosts);
            return JsonConvert.SerializeObject(Int32.Parse(value.ToString()));
        }
       */

        
        public string saveToTble(string orderby, string in_orderNumber)
        {
            string expMessage = "";
            try { 
            string str_saveaseID = dtproc.getSaveaseID_By_Name(orderby, hosts, out expMessage);
            string SveNAme = dtproc.getDName(orderby, hosts, out expMessage);
            dtproc.composeMail("SV000333", "Purchase Notification ", " Order Number: " + in_orderNumber, SveNAme, str_saveaseID, SveNAme, in_orderNumber, out expMessage);
                return "ok";
                }
            catch(Exception ex)
            {
                return "Error." + ex.Message;
            }
        }
        
        
        public Int32 saveOrder2(string saveaseIDz, string in_cardType, string in_cardAmount, string in_orderby, Int32 qty, string lblBa)
        {
            string expMessage = "";
            Int32 value = dtproc.saveOrder2(saveaseIDz, "Completed", in_cardType,
             double.Parse(in_cardAmount), 0, 0.25, in_orderby, computerName(), ipaddress1(), out expMessage, qty, lblBa);
            //string msgBody = mh.populatBuyPin(DateTime.Today.ToString(), tblOrder);
            return value;
            // JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);

        }

        
        public string getCardAmount(string in_card_pin)
        {
            string expMessage = "", displayName = "", strEmail = "", strPhone = "";
            DataTable tbAmt = dtproc.getCardPin(in_card_pin, hosts, out expMessage);
            //getCardPin(string pin, string connLocation, out string expMessage)
            string value = "";
            foreach (DataRow dr in tbAmt.Rows)
            {
                //ctr1 = dtCardDetaail.Rows.Count;
                value = dr["cardAmount"].ToString();
            }
            return JsonConvert.SerializeObject(Int32.Parse(value));
        }

        private string PopulateBody(string userName, string title, string url, string description, string filepath, string mailtype)
        {
            string body = string.Empty;
          
            body = body + " <div style = 'width: 500px; background: whitesmoke; margin-right: auto; margin-left: auto;' >";
            body = body + " <div  style = 'margin-left: auto;margin-right: auto;width: 350px;background: white;' >";
            body = body + "<div  style='height: 70px; background:whitesmoke;'>";
            body = body + "</div>";
            body = body + "<div style = 'width: 195px;margin-left: auto;margin-right: auto;'>";
            body = body + " <img src = 'http://www.savease.ng/logo/logo.png' style = 'margin-top: 20px' >";
            body = body + "</div><br><br>";
            body = body + "<div>";
            body = body + "<h3 style = 'text-align: center;font-family:calibri;font-size: 18px;' > Complete your Registration</h3><br><br>";
            body = body + "<p style = 'margin-left: 15px; font-family:calibri;font-size: 11px' > Please click the  button below to reset password</p>";
            body = body + "</div><br><br>";
            body = body + " <div style = ' width: 250px;height: 70px;margin-right: auto;margin-left: auto;' >";
            body = body + " <a href='" + url + "'><input type= 'submit' name= '' value= 'Reset Password' style= 'background: #fa9928;color: white;margin-left: 30px;margin-right: 30px;margin-top: 20px;border-radius: 4px;height:35px;width: 200px;' ></ a >";
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
        
        public string getCardSerial(string in_card_pin)
        {
            string expMessage = "", displayName = "", strEmail = "", strPhone = "";
          string value = dtproc.getCardSerialOnly(in_card_pin, hosts, out expMessage);
            //getCardPin(string pin, string connLocation, out string expMessage)
           //  = "";
            /*
            foreach (DataRow dr in tbAmt.Rows)
            {
                //ctr1 = dtCardDetaail.Rows.Count;
                value = dr["cardAmount"].ToString();
            }*/
            return JsonConvert.SerializeObject(value);
            //return JsonConvert.SerializeObject(value);
        }

        
        public string getNameOnDeposit(string in_saveaseid)
        {
            //getName(string saveaseid, string connLocation, out string expMessage)
            string expMessage = "", displayName = "", strEmail = "", strPhone = "";
            DataTable tbName = dtproc.getName(in_saveaseid, hosts, out expMessage);
            //getCardPin(string pin, string connLocation, out string expMessage)
            string value = "";
            foreach (DataRow dr in tbName.Rows)
            {
                //ctr1 = dtCardDetaail.Rows.Count;
                value = dr["dname"].ToString();
            }
            return JsonConvert.SerializeObject(value);
        }
        public string genSaveaseID()
        {
            Random rnd = new Random();
            string rands = "";
            for (int i = 0; i < 2; i++)
            {
                int myRandomNo = rnd.Next(10000, 99999);
                rands = rands + myRandomNo;
            }
            return rands;
        }
        
        public string getTransactionUsers(string uname)
        {
            //getTranssactionDetails(string in_bankname, string connLocation, out string expMessage)
            string exMessage = "";
            DataTable table = dtproc.getTranssactionDetails(uname, hosts, out exMessage);
            var JSONString = new StringBuilder();
            if (table.Rows.Count > 0)
            {
                JSONString.Append("[");
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    JSONString.Append("{");
                    for (int j = 0; j < table.Columns.Count; j++)
                    {
                        if (j < table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\",");
                        }
                        else if (j == table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == table.Rows.Count - 1)
                    {
                        JSONString.Append("}");
                    }
                    else
                    {
                        JSONString.Append("},");
                    }
                }
                JSONString.Append("]");
            }
            return JSONString.ToString();
        }

        
        public string DataTableToJSONWithJSONNet(string uname)
        {
            string exMessage = "";
            DataTable table = dtproc.getTranssactionDetails(uname, hosts, out exMessage);
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(table);
            return JSONString;
        }
        
        public string getTransMessageNotification(string uname)
        {
            string exMessage = "";
            DataTable table = dtproc.getTransMessage(uname, hosts, out exMessage);
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(table);
            return JSONString;
        }
        
        public string displayTblUsed(string uname)
        {
            string expMessage = "";
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(dtproc.SortPinby(uname, "", "1", "", "", hosts, out expMessage));
            return JSONString;
        }
        
        public string displayTblUnused(string uname)
        {
            string expMessage = "";
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(dtproc.SortPinby(uname, "", "2", "", "", hosts, out expMessage));
            return JSONString;
        }
        
        public string displayTblDaterange(string uname,string startDate, string endDate)
        {
            string expMessage = "";
            DateTime dt1 = Convert.ToDateTime(startDate);
            DateTime dt2 = Convert.ToDateTime(endDate);
            string JSONString = string.Empty;
            string strDtFrom = String.Format("{0:yyyy/MM/dd}", dt1); //dtfrom.SelectedDate.ToString("dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);//time.ToString("dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            string strDtTo = String.Format("{0:yyyy/MM/dd}", dt2);// dtTo.SelectedDate.ToString("dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            
            JSONString = JsonConvert.SerializeObject(dtproc.SortPinby(uname, "", "5", strDtFrom, strDtTo, hosts, out expMessage));
            return JSONString;
        }
        /*public string getTransactionUsers(string uname)
        {
            string expMessage = "", displayName = "", strEmail = "", strPhone = "";
            string value = "";
                //Session["txtUsr"] = uname;
                Int32 straccessControl = dtproc.accessControl(uname, out displayName, hosts, out strEmail, out strPhone, out expMessage);
                //Session["accesscontrol"] = straccessControl;
                // Session["displayName"] = displayName;
                //Session["txtEmail"] = strEmail;
                // Session["txtPhone"] = strPhone;

                string in_computerName = Dns.GetHostName();
                string in_ipaddress = Dns.GetHostByName(Dns.GetHostName()).AddressList[0].ToString();
                string str_saveaseID = dtproc.getSaveaseID_By_Name(uname, hosts, out expMessage);
                string str_userlevel = dtproc.getUserLevel(uname, hosts, out expMessage);
                Int32 intLoggedIn = dtproc.LoginLog(str_saveaseID, "Logged In", "", "Online", in_computerName, in_ipaddress, "c", out expMessage);
                Int32 str_syslog = dtproc.SystemLog(str_saveaseID, "Logged In", in_computerName, in_ipaddress, "Login.aspx", out expMessage);

                value = str_userlevel;
            //return value;
            return JsonConvert.SerializeObject(, Newtonsoft.Json.Formatting.Indented);
        }*/
        public string computerName()
        {
            return Dns.GetHostByName(Dns.GetHostName()).AddressList[0].ToString();
        }
        public string ipaddress1()
        {
            return HttpContext.Current.Request.UserHostAddress;
        }
        //USSD
        [WebMethod]
        public string USSDInput(string uname)
        {
            string exMessage = "";
            DataTable table = dtproc.getTranssactionDetails(uname, hosts, out exMessage);
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(table);
            return JSONString;
        }
        [WebMethod]
        public string USSDPost()
        {
            string text="",strPhone = "", strpin="", stramount="", strBenAcct="", strQty="";
           /* string URL = "http://localhost/test.php";
            WebClient webClient = new WebClient();
            NameValueCollection formData = new NameValueCollection();
            formData["url"] = "url";
            formData["user"] = "user";
            formData["user"] = "pass";
           
            byte[] responseBytes = webClient.UploadValues(URL, "POST", formData);
            string responsefromserver = Encoding.UTF8.GetString(responseBytes);
            */
            string exMessage = "";
            string respondss = "";
            string strSaveaseID = "";
            if(text=="")
            {
                // This is the first request. Note how we start the response with CON
                respondss = respondss+"CON What would you want to check \n";
                respondss = respondss+ "1. Verify pin \n";
                respondss = respondss+ "2. Register \n";
                respondss = respondss+ "3. Check account balance \n";
                respondss = respondss+ "4. Make deposit \n";
                respondss = respondss+ "5. Transfer \n";
                respondss = respondss+ "6. Withdraw funds \n";
                respondss = respondss+ "7. Buy pin";
            }
            else if (text == "1")
            {
                // Business logic for first level response
                respondss = respondss+ "CON Enter Pin To Verify \n";
                WebClient webClient = new WebClient();
                NameValueCollection formData = new NameValueCollection();
                formData["url"] = "url";
                formData["user"] = "user";
                formData["user"] = "pass";

              //  byte[] responseBytes = webClient.UploadValues(URL, "POST", formData);
               // string responsefromserver = Encoding.UTF8.GetString(responseBytes);
            }
            else if (text == "2")
            {
                // Business logic for first level response
                // This is a terminal request. Note how we start the response with END
                respondss = "CON Register with savease \n";
               // respondss = "END Your phone number is "+ strPhone;
            }
            else if (text == "3")
            {
                // Business logic for first level response
                // This is a second level response where the user selected 1 in the first instance
                //Account Number
                respondss = "END Your balance is " + dtproc.getSaveaseID_By_phone(strPhone);
            }
            else if (text == "4")
            {
                // Business logic for first level response
                // This is a second level response where the user selected 1 in the first instance
                //Make Deposit
                // string in_depositor, string in_naration)
                string strSeral = "";
                if (string.IsNullOrEmpty(strpin)) respondss = "";
                else
                {
                    strSeral = getCardSerial(strpin);
                    string strDispName = getNameOnDeposit(strPhone.Substring(1));
                Int32 intDep = dtproc.saveDeposit(strPhone.Substring(1),strpin, strSeral,"Savease", strDispName,double.Parse(stramount), strPhone.Substring(1), strPhone.Substring(1),
                    "USSD","USSD",out exMessage,"USSD");
                   // if(intDep>0)
                   // {
                    //    string usernam = dtproc.getUserNam(strPhone.Substring(1), "", out exMessage);
                     //   updateBalance(usernam, stramount);
                   // }
                //respondss = "END Your balance is " + dtproc.getSaveaseID_By_phone(strPhone);
                respondss = "END Deposit of " + stramount+" is successful";
                }
            }
            else if (text == "5")
            {
                // Business logic for first level response
                // This is a second level response where the user selected 1 in the first instance
                //Transfer
                // transferFund(string amountTransfered, string balance, string beneficiaryAccount,
                //string saveaseid, string transferedBy, string in_naration,string username)
                string strBal = getBalance(strPhone.Substring(1));
                string strDispName = getNameOnDeposit(strPhone.Substring(1));
                string usernam = dtproc.getUserNam(strPhone.Substring(1), "", out exMessage);
                Int32 intTrans =  transferFund(stramount, strBal, strBenAcct, strPhone.Substring(1),
                    strDispName,"", usernam);
                    //if(intTrans > 0)
                    //{
                    //    updateBalance(usernam, stramount);
                    //}
                //respondss = "END Your balance is " + dtproc.getSaveaseID_By_phone(strPhone);
                respondss = "END Transfer of " + stramount+" is successful";
            }
            else if (text == "6")
            {
                // Business logic for first level response
                // This is a second level response where the user selected 1 in the first instance
                //Transfer
                // transferFund(string amountTransfered, string balance, string beneficiaryAccount,
                //string saveaseid, string transferedBy, string in_naration,string username)
                
            }
            else if (text == "7")
            {
                // Business logic for first level response
                // This is a second level response where the user selected 1 in the first instance
                //Buy PIN
                //saveOrder2(string saveaseIDz, string in_cardType, string in_cardAmount, string in_orderby, Int32 qty, string lblBa)
                
                string strBal = getBalance(strPhone.Substring(1));
                string strDispName = getNameOnDeposit(strPhone.Substring(1));
                string usernam = dtproc.getUserNam(strPhone.Substring(1), "", out exMessage);
                Int32 intBuyPin = saveOrder2(strPhone.Substring(1),stramount, stramount, usernam,Int32.Parse(strQty),strBal);
                    //if(intTrans > 0)
                    //{
                    //    updateBalance(usernam, stramount);
                    //}
                //respondss = "END Your balance is " + dtproc.getSaveaseID_By_phone(strPhone);
                respondss = "END Pin Order is successful";
            }
 /*
            else if (text == "1*1")
            {
                // This is a second level response where the user selected 1 in the first instance
                //Account Number
                respondss = "END Your balance is " + dtproc.getSaveaseID_By_phone(strPhone);
            }
            else if (text == "1*2")
            {
                // This is a second level response where the user selected 1 in the first instance
                respondss = "END Your balance is " + getBalance(strPhone.Substring(1));
            }
           
            else if (text == "1*2")
            {
                // This is a second level response where the user selected 1 in the first instance
                respondss = respondss+ strSaveaseID;
            }*/

               // DataTable table = dtproc.getTranssactionDetails(uname, hosts, out exMessage);
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(respondss);
            return JSONString;
        }
        /*
        public string sendmessage(string batchcode)
        {
            // get details from order table based on the batch number
            // send mail to buyer
           // string msgBody = mh.populatBuyPin(DateTime.Today.ToString(), tblOrder);
            dtProc.composeMail("SV000333", "Purchase Notification ", " Order Number: " + in_orderNumber, hideDispName.Value, hideSaveaseID.Value, hideDispName.Value, in_orderNumber, out expMessage);

            string msgSubjS = "Voucher purchase of N" + rstTotalh.Text + "<br/>";
            mailMessenger.sendMail2Usr(strUsr, msgBody, msgSubjS);
        }*/
    }
}
