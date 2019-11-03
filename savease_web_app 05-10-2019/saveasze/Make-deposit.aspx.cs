using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class Make_deposit : System.Web.UI.Page
    {
        MailMgr mailMessenger = new MailMgr();
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
        DataTable dtBankDeposit = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            // hosts = Session["hosts"].ToString();


            hosts = Request.Url.Host;

            string userName = "";
            hosts = Request.Url.Host;
            string ipaddress;
            double dblBal = 0;
            /* ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
             if (ipaddress == "" || ipaddress == null)
                 ipaddress = Request.ServerVariables["REMOTE_ADDR"];
             lblIP.Text = ipaddress;*/
            if (!Page.IsPostBack)
            {
                //clearf();
                //getbankDeposit();
                if (Session["txtUsr"].ToString() == null || Session["txtUsr"].ToString() == "")
                    Response.Redirect("login.aspx");
                else
                    userName = Session["txtUsr"].ToString();
                try
                {
                    //tblSavedBen.Visible = false;
                    //clearf();
                    dblBal = getBal(userName);
                    if (dblBal < 0)
                    {
                        lblMessage.Text = "Page not loading properly, please contact savease administrators";
                    }
                    getAllBanks();// load banks
                    getSavedBeneficiary1();//
                                          // getAcctDetail3();
                    lblMessage.BorderColor = Color.Gray;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message;
                    lblMessage.BorderColor = Color.OrangeRed;
                }
            }
        }
        public void getAllBanks()
        {
            string expMessage = "";
            DataTable dtBanks = dtProc.getAllBankNames(hosts, out expMessage);

            Int32 intRowCtr = dtBanks.Rows.Count;
            //cmdBank.DataSource = dtBanks;
            //cmdBank.DataTextField = "BankName";
            //cmdBank.DataValueField = "BankName";
            //cmdBank.DataBind();
        }
        public void getSavedBeneficiary1()
        {
            string expMessage = "";
            DataTable dtBanks = dtProc.getBenBySenders1(Session["txtUsr"].ToString().Trim(), hosts, out expMessage);
            //Int32 intRowCtr = dtBanks.Rows.Count;
            if (dtBanks != null)
            {
                if (dtBanks.Rows.Count != 0 || dtBanks != null)
                {
                    cmdSavedBen.DataSource = dtBanks;
                    cmdSavedBen.DataTextField = "fullname";
                    cmdSavedBen.DataValueField = "saveaseid";
                    cmdSavedBen.DataBind();
                    cmdSavedBen.SelectedIndex = 0;
                }
            }
            else
            {
                cmdSavedBen.BorderColor = Color.OrangeRed;
                ////  lblmes11.Visible = true;
                //lblmes11.ForeColor = Color.Red;
                cmdSavedBen.Text = "No beneficiary. Please add beneficiary.";
                return;
            }
            //   lbl
        }

        protected void txtpin1_TextChanged(object sender, EventArgs e)
        {
            confirmPin();
        }
        public double getBal(string userName)
        {
            String bal = "";
            string expMessage;
            DataTable dtBal = dtProc.getBalance(userName, hosts, out expMessage);
            foreach (DataRow dr in dtBal.Rows)
            {
                try
                {
                    String saveaseID = dr["saveaseID"].ToString();
                    String FName = dr["fname"].ToString();
                    String lName = dr["lname"].ToString();
                    bal = dr["balance"].ToString();
                    string strEmail = dr["email"].ToString();
                    String strPhone = dr["phone"].ToString();

                    lblBalh.Text = bal;
                    lblBalh.Text = bal;
                    lblBalh.Font.Bold = true;
                    lblBalh.ForeColor = Color.Blue;
                    lblBalh.Visible = true;
                    lblBalh.Text =  FName + " " + lName +" - " + saveaseID + " ( N" + bal + " )";
                }
                catch (Exception expp)
                {
                    bal = "-1";
                }
            }
            return double.Parse(bal);
        }

        public string getaccount()
        {
            String saveaseID = "";
            string expMessage;
            DataTable dtBal = dtProc.getBalance(Session["txtUsr"].ToString(), hosts, out expMessage);
            foreach (DataRow dr in dtBal.Rows)
            {
                try
                {
                     saveaseID = dr["saveaseID"].ToString();
                    String FName = dr["fname"].ToString();
                    String lName = dr["lname"].ToString();
                   // bal = dr["balance"].ToString();
                    string strEmail = dr["email"].ToString();
                    String strPhone = dr["phone"].ToString();

                    
                }
                catch (Exception expp)
                {
                    saveaseID = "-1";
                }
            }
            return saveaseID;
        }
        public void confirmPin()
        {
            string expMessage = "";
            Int32 intPinStatus = 0;
            int ctr = 0;
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtCardDetaail = new DataTable();
            //DataTable dtCardDetailss = new DataTable();
            int ctr1 = 0;
            try
            {
                Int32 exitpin = dtProc.usedPin(txtpin1.Text.ToString(), hosts, out expMessage);

                if (exitpin < 1)
                {

                    dtCardDetaail = dtProc.getCardPin(txtpin1.Text.ToString(), hosts, out expMessage);
                    if (dtCardDetaail == null)
                    {

                        string mmsg = "Invalid Voucher details supplied!!!";

                        // tdMessage.Visible = true;
                        lblMessage.Text = mmsg;
                        lblMessage.ForeColor = Color.Red;
                        return;
                    }
                    foreach (DataRow dr in dtCardDetaail.Rows)
                    {
                        ctr1 = dtCardDetaail.Rows.Count;
                        txtamount1.Text = dr["cardAmount"].ToString();
                        btnDeposit.Enabled = true;
                    }
                }
                else
                {
                    string mmsg = "Voucher details has been used!!!";

                    lblMessage.Visible = true;
                    lblMessage.Text = mmsg;
                    lblMessage.ForeColor = Color.Red;
                    // clearf();
                    return;
                }

            }

            catch (Exception ex)
            {
                string mmsg = ex.Message;

                lblMessage.Visible = true;
                lblMessage.Text = mmsg;
                lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
        }

        protected void btnDeposit_Click(object sender, EventArgs e)
        {
            btnDeposit.Enabled = false;
            confirmPin();
            try
            {
                string expObj = "";
                string in_cardpin = txtpin1.Text;
                string in_cardsn = dtProc.getCardSerial(in_cardpin, hosts, out expObj);
                string in_acctNo = getaccount();
                string in_acctName = getACName();
                double in_amount = Convert.ToDouble(txtamount1.Text);
                string in_bankName = "Savease";
                string in_depositor = Session["txtUsr"].ToString();
                string in_phoneNumber = "080";
                string in_emailID = "jo@g.com";
                string in_tranRef = genPin();
                string in_narative = txtNarration1.Text;
                string userName = Session["txtUsr"].ToString();
                string expMessage = "";
                string SveNAme = dtProc.getDName(Session["txtUsr"].ToString(), hosts, out expMessage);
                string in_computerName = Dns.GetHostName();
                string in_ipaddress = Dns.GetHostByName(Dns.GetHostName()).AddressList[0].ToString();
                string ipaddress;
                ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (ipaddress == "" || ipaddress == null)
                    ipaddress = Request.ServerVariables["REMOTE_ADDR"];

                if (in_amount < 0)
                {
                    txtpin1.BorderColor = Color.OrangeRed;
                    lblMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }


                DateTime transDate = DateTime.Today;
                Int32 intDep = dtProc.saveDeposit(in_acctNo, in_cardpin, in_cardsn, in_bankName, in_acctName, in_amount, in_depositor, in_computerName, in_ipaddress, in_tranRef, out expObj, in_narative);
                if (intDep > 0)
                {
                    sendSMS();
                    lblMessage.Visible = true;
                    lblMessage.ForeColor = Color.Green;
                    lblMessage.Text = "Deposit completed successfully.";
                    clear();
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.ForeColor = Color.Green;
                    lblMessage.Text = "Error While initiating Transaction";
                    clear();
                }


            }
            catch (Exception ex)
            {
                lblMessage.Visible = true;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = ex.Message;
                lblMessage.BorderColor = Color.OrangeRed;
                return;
            }

        }
        public void clear()
        {
            txtNarration1.Text = "";
            txtpin1.Text = "";
            txtamount1.Text = "";
            txtamount2.Text = "";
            txtPIN2.Text = "";
            txtnarration2.Value = "";
            txtvamount.Text = "";
            txtvpin.Text = "";
            txtvnarration.Value="";
            savedBenDetails.Text = "";
        }
        public string getACName()
        {
            string dname = "";
            String bal = "";
            string expMessage;
            DataTable dtBal = dtProc.getBalance(Session["txtUsr"].ToString(), hosts, out expMessage);
            foreach (DataRow dr in dtBal.Rows)
            {
                try
                {
                    String saveaseID = dr["saveaseID"].ToString();
                    string FName = dr["fname"].ToString();
                    string lName = dr["lname"].ToString();
                    bal = dr["balance"].ToString();
                    string strEmail = dr["email"].ToString();
                    String strPhone = dr["phone"].ToString();

                    dname = FName + " " + lName;
                }
                catch (Exception ex)
                {
                    bal = "-1";
                }
            }

            return dname;
        }
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
        public static DateTime GetDateTime()
        {
            DateTime dateTime = DateTime.MinValue;
            System.Net.HttpWebRequest request = (System.Net.HttpWebRequest)System.Net.WebRequest.Create("http://www.google.com.ng");
            request.Method = "GET";
            request.Accept = "text/html, application/xhtml+xml, */*";
            request.UserAgent = "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)";
            request.ContentType = "application/x-www-form-urlencoded";
            request.CachePolicy = new System.Net.Cache.RequestCachePolicy(System.Net.Cache.RequestCacheLevel.NoCacheNoStore);
            System.Net.HttpWebResponse response = (System.Net.HttpWebResponse)request.GetResponse();
            if (response.StatusCode == System.Net.HttpStatusCode.OK)
            {
                string todaysDates = response.Headers["date"];

                dateTime = DateTime.ParseExact(todaysDates, "ddd, dd MMM yyyy HH:mm:ss 'GMT'",
                    System.Globalization.CultureInfo.InvariantCulture.DateTimeFormat, System.Globalization.DateTimeStyles.AssumeUniversal);
            }

            return dateTime;
        }

        public void sendSMS()
        {
            // Dim wbClient As New System.Net.WebClient()
            WebClient wbClient = new WebClient();
            Sms ts = new Sms();
            ts.ServerName = "Server";
            //Dim ds As Data.DataTable = ts.GetUser()
            DataTable ds = ts.getUser(Session["txtUsr"].ToString());
            if (ds.Rows.Count > 0)
            {
                foreach (DataRow rs in ds.Rows)
                {
                    //Stream str = wbClient.OpenRead("http://sms.elsoftnig.com/api/?username=" + rs!username + "&password=" + rs!password + "&action=balance");
                    Stream str = wbClient.OpenRead("http://sms.elsoftnig.com/api/?username=" + rs["username"].ToString() + "&password=" + rs["password"].ToString() + "&action=balance");
                    StreamReader sR = new StreamReader(str);
                    string content = sR.ReadToEnd();

                    //===========elsoft api code================
                    string statusID = content.Substring(12, 2);
                    string count = content.Substring(12, 2);
                    string Status = "";
                    if (statusID.Equals("OK")) Status = "SUBMITTED";
                    else Status = "SUBMITTED";
                    // string balance = content.Substring(13, content.Length - 14); // ;Mid(content, 13, content.Length - 14);
                    // ts.UpdateUser(rs["username"].ToString(), balance);
                    ts.UpdateSMS(rs["id"].ToString(), "", Status, content);


                }
            }
        }
        public string formatedSMS(string strName, string strBank, string strAcctOwner, string strAcctNum, double transAmount, string tranDate, string strNarative, string strBalance)
        {
            string msgBody = "<img ImageUrl='~/images/logo/logo.png' runat='server' Height='18px' Width='152px' /> < br />  < br />" +
                " &nbsp; Hello " + strName + "<br /> &nbsp;< br /> &nbsp;" +
                "< table cellpadding = '5' class='auto-style1'> <tr> <td class='auto-style2'>" +
                "Beneficiary Bank:</td> <td>&nbsp;</td> </tr>" +
                "<tr> <td class='auto-style2'>Beneficiary Name:</td> <td>&nbsp;" + strAcctOwner + "</td> </tr> " +
                "<tr> <td class='auto-style2'>Beneficiary Bank:</td> <td>&nbsp;" + strBank + "</td> </tr> " +
                "<tr> <td class='auto-style2'>Beneficiary Account:</td> <td>&nbsp;" + strAcctNum + " </td> </tr> " +
                " <tr> <td class='auto-style2'>Transaction Amount:</td><td>&nbsp;" + transAmount + " </td> </tr> " +
                "<tr><td class='auto-style2'>Transaction Date:</td><td>&nbsp;" + tranDate + "</td>  </tr> " +
                "<tr> <td class='auto-style2'>Narative:</td> <td>&nbsp;" + strNarative + "</td> " +
                "</tr> <tr> <td class='auto-style3'>Balance:</td> <td><b>" + strBalance + "</b></td></tr>" +
                " </table><b><i><u><span style = 'font-size: 10.0pt; line-height: 115%; font-family: &quot;Arial&quot;,sans-serif; " +
                "mso-fareast-font-family: &quot;Times New Roman&quot;; color: #003399; background: white; mso-ansi-language: EN-US; mso-fareast-language:" +
                " EN-US; mso-bidi-language: AR-SA' > Please click here to provide feedback on your experience<br /> </span></u></i></b> <br />  <br />" +
                " <span style = 'font-size:10.0pt;line-height:115%; font-family:&quot; Arial&quot;,sans-serif;mso-fareast-font-family:&quot;Times New Roman&quot;;" +
                " color:#003399;mso-ansi-language:EN-US;mso-fareast-language:EN-US;mso-bidi-language:AR-SA'>Thank you for using Savease Nigeria</span></div>";

            return msgBody;

        }

        protected void conpin_Click(object sender, ImageClickEventArgs e)
        {
            confirmPin();
        }

        protected void txtPIN_TextChanged(object sender, EventArgs e)
        {
            confirmPin2();
        }
        public void confirmPin2()
        {
            string expMessage = "";
            Int32 intPinStatus = 0;
            int ctr = 0;
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtCardDetaail = new DataTable();
            //DataTable dtCardDetailss = new DataTable();
            int ctr1 = 0;
            try
            {
                Int32 exitpin = dtProc.usedPin(txtPIN2.Text.ToString(), hosts, out expMessage);

                if (exitpin < 1)
                {

                    dtCardDetaail = dtProc.getCardPin(txtPIN2.Text.ToString(), hosts, out expMessage);
                    if (dtCardDetaail == null)
                    {

                        string mmsg = "Invalid Voucher details supplied!!!";

                        // tdMessage.Visible = true;
                        lblMessage.Text = mmsg;
                        lblMessage.ForeColor = Color.Red;
                        txtamount2.Text = "";
                        return;
                    }
                    foreach (DataRow dr in dtCardDetaail.Rows)
                    {
                        ctr1 = dtCardDetaail.Rows.Count;
                        txtamount2.Text = dr["cardAmount"].ToString();
                        self.Visible = false;
                        Saveaseaccount1.Visible = true;
                        SavedBeneficiary1.Visible = false;
                    }
                }
                else
                {
                    string mmsg = "Voucher details has been used!!!";

                    lblMessage.Visible = true;
                    lblMessage.Text = mmsg;
                    lblMessage.ForeColor = Color.Red;
                    // clearf();
                    return;
                }
                self.Visible = false;
                Saveaseaccount1.Visible = true;
                SavedBeneficiary1.Visible = false;

            }

            catch (Exception ex)
            {
                string mmsg = ex.Message;

                lblMessage.Visible = true;
                lblMessage.Text = mmsg;
                lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
        }

        protected void btnsacConPin_Click(object sender, ImageClickEventArgs e)
        {
            confirmPin2();
        }

        protected void txtaccName_TextChanged(object sender, EventArgs e)
        {
            ConfirmAccount2();
        }
        public void ConfirmAccount2()
        {
            string expMessage = "";
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtAcctDetaail = dtProc.getAcct2(txtaccNum.Text.ToString(), hosts, out expMessage);
            int ctr = dtAcctDetaail.Rows.Count;
            foreach (DataRow dr in dtAcctDetaail.Rows)
            {
                //  txtAmount.Value = float.Parse(dr["cardAmount"].ToString());
                txtAccname.Text = dr["names"].ToString();
                btnDepozit.Enabled = true;
            }
        }
        public void getAcctDetail3()
        {
            string expMessage = "";
            string accNo = cmdSavedBen.SelectedValue;
            DataTable dtBen = dtProc.getSavedBenDeatials(accNo, Session["txtUsr"].ToString().Trim(), hosts, out expMessage);
            //Int32 intRowCtr = dtBen.Rows.Count;
            if (dtBen.Rows.Count != 0 || dtBen != null)
                foreach (DataRow dr in dtBen.Rows)
                {
                    savedBenDetails.Text = "Acct. No.: " + accNo + "  Bank Name: " + dr["bankName"].ToString();
                    savedBenDetails.ForeColor = Color.Green;
                    hidAccount3.Value = accNo; hidBankName.Value = dr["bankName"].ToString(); //hidAcctName.Value = dr["dname"].ToString();
                }
        }

        protected void btnDepozit_Click(object sender, EventArgs e)
        {
            btnDeposit.Enabled = false;
            try
            {
                confirmPin2();
                string expObj = "";
                string in_cardpin = txtPIN2.Text;
                string in_cardsn = dtProc.getCardSerial(in_cardpin, hosts, out expObj);
                string in_acctNo = txtaccNum.Text;
                string in_acctName = txtAccname.Text;
                double in_amount = Convert.ToDouble(txtamount2.Text);
                string in_bankName = "Savease";
                string in_depositor = Session["txtUsr"].ToString();
                string in_phoneNumber = "080";
                string in_emailID = "jo@g.com";
                string in_tranRef = genPin();
                string in_narative = txtnarration2.Value;
                string userName = Session["txtUsr"].ToString();
                string expMessage = "";
                string SveNAme = dtProc.getDName(Session["txtUsr"].ToString(), hosts, out expMessage);
                string in_computerName = Dns.GetHostName();
                string in_ipaddress = Dns.GetHostByName(Dns.GetHostName()).AddressList[0].ToString();
                string ipaddress;
                ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (ipaddress == "" || ipaddress == null)
                    ipaddress = Request.ServerVariables["REMOTE_ADDR"];

                if (in_amount < 0)
                {
                    txtpin1.BorderColor = Color.OrangeRed;
                    lblMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }
                DateTime transDate = DateTime.Today;
                Int32 intDep = dtProc.saveDeposit(in_acctNo, in_cardpin, in_cardsn, in_bankName, in_acctName, in_amount, in_depositor, in_computerName, in_ipaddress, in_tranRef, out expObj, in_narative);
                if (intDep>0) { 
                    sendSMS();
                lblMessage.Visible = true;
                lblMessage.ForeColor = Color.Green;
                lblMessage.Text = "Deposit completed successfully.";
                clear();
                     }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.ForeColor = Color.Green;
                    lblMessage.Text = "Error While initiating Transaction";
                    clear();
                }

            }
            catch (Exception ex)
            {
                lblMessage.Visible = true;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = ex.Message;
                lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
        }
        public void confirmPin3()
        {
            string expMessage = "";
            Int32 intPinStatus = 0;
            int ctr = 0;
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtCardDetaail = new DataTable();
            //DataTable dtCardDetailss = new DataTable();
            int ctr1 = 0;
            try
            {
                Int32 exitpin = dtProc.usedPin(txtvpin.Text.ToString(), hosts, out expMessage);

                if (exitpin < 1)
                {

                    dtCardDetaail = dtProc.getCardPin(txtvpin.Text.ToString(), hosts, out expMessage);
                    if (dtCardDetaail == null)
                    {

                        string mmsg = "Invalid Voucher details supplied!!!";

                        // tdMessage.Visible = true;
                        lblMessage.Text = mmsg;
                        lblMessage.ForeColor = Color.Red;
                        txtvamount.Text = "";
                        return;
                    }
                    foreach (DataRow dr in dtCardDetaail.Rows)
                    {
                        ctr1 = dtCardDetaail.Rows.Count;
                        txtvamount.Text = dr["cardAmount"].ToString();
                        self.Visible = false;
                        Saveaseaccount1.Visible = false;
                        SavedBeneficiary1.Visible = true;
                        btnBen.Enabled = true;
                    }
                }
                else
                {
                    string mmsg = "Voucher details has been used!!!";

                    lblMessage.Visible = true;
                    lblMessage.Text = mmsg;
                    lblMessage.ForeColor = Color.Red;
                    // clearf();
                    return;
                }

            }

            catch (Exception ex)
            {
                string mmsg = ex.Message;

                lblMessage.Visible = true;
                lblMessage.Text = mmsg;
                lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
            self.Visible = false;
            Saveaseaccount1.Visible = false;
            SavedBeneficiary1.Visible = true;
        }
        protected void txtvpin_TextChanged(object sender, EventArgs e)
        {
            confirmPin3();
        }

        protected void selfTab_Click(object sender, EventArgs e)
        {
            self.Visible = true;
           Saveaseaccount1.Visible = false;
            SavedBeneficiary1.Visible = false;
        }

        protected void SaccTab_Click(object sender, EventArgs e)
        {
            self.Visible = false;
           Saveaseaccount1.Visible = true;
           SavedBeneficiary1.Visible = false;
        }

        protected void SbenTab_Click(object sender, EventArgs e)
        {
            self.Visible = false;
           Saveaseaccount1.Visible = false;
            SavedBeneficiary1.Visible =true;
        }

        protected void btnBen_Click(object sender, EventArgs e)
        {
            btnBen.Enabled = false;
            confirmPin3();
            try
            {
                string expObj = "";
                string in_cardpin = txtvpin.Text;
                string in_cardsn = dtProc.getCardSerial(in_cardpin, hosts, out expObj);
                string in_acctNo = hidAccount3.Value;
                string in_acctName = cmdSavedBen.SelectedItem.ToString();
                double in_amount = Convert.ToDouble(txtvamount.Text);
                string in_bankName = hidBankName.Value;
                string in_depositor = Session["txtUsr"].ToString();
                string in_phoneNumber = "080";
                string in_emailID = "jo@g.com";
                string in_tranRef = genPin();
                string in_narative = txtvnarration.Value;
                string userName = Session["txtUsr"].ToString();
                string expMessage = "";
                string SveNAme = dtProc.getDName(Session["txtUsr"].ToString(), hosts, out expMessage);
                string in_computerName = Dns.GetHostName();
                string in_ipaddress = Dns.GetHostByName(Dns.GetHostName()).AddressList[0].ToString();
                string ipaddress;
                ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (ipaddress == "" || ipaddress == null)
                    ipaddress = Request.ServerVariables["REMOTE_ADDR"];

                if (in_amount == null || in_amount == 0)
                {
                    txtpin1.BorderColor = Color.OrangeRed;
                    lblMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }


                DateTime transDate = DateTime.Today;
                Int32 intDep = dtProc.saveDeposit(in_acctNo, in_cardpin, in_cardsn, in_bankName, in_acctName, in_amount, in_depositor, in_computerName, in_ipaddress, in_tranRef, out expObj, in_narative);

                if (intDep > 0)
                {
                    sendSMS();
                    lblMessage.Visible = true;
                    lblMessage.ForeColor = Color.Green;
                    lblMessage.Text = "Deposit completed successfully.";
                    clear();
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.ForeColor = Color.Green;
                    lblMessage.Text = "Error While initiating Transaction";
                    clear();
                }

            }
            catch (Exception ex)
            {
                lblMessage.Visible = true;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = ex.Message;
                lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
        }

        protected void cmdSavedBen_SelectedIndexChanged(object sender, EventArgs e)
        {
            getAcctDetail3();
        }
    }
}