using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class transfers : System.Web.UI.Page
    {
        MailMgr mailMessenger = new MailMgr();
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        SH1Encryption sh1 = new SH1Encryption();
        string hosts = "";
        DataTable dtBankDeposit = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            // hosts = Session["hosts"].ToString();

            string userName = "";
            hosts = Request.Url.Host;
            string ipaddress;
            /* ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
             if (ipaddress == "" || ipaddress == null)
                 ipaddress = Request.ServerVariables["REMOTE_ADDR"];
             lblIP.Text = ipaddress;*/
            if (!Page.IsPostBack)
            {
                // getbankDeposit();
                if (Session["txtUsr"].ToString() == null || Session["txtUsr"].ToString() == "")
                    userName = "";
                else
                    userName = Session["txtUsr"].ToString();
                try
                {
                    getBal(userName);
                   // getAllBanks();
                   // getSavedBeneficiary();
                    //  getAcctDetail3();
                    lblMessage.BorderColor = Color.Gray;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message;
                    lblMessage.BorderColor = Color.OrangeRed;
                }
            }
        }

        protected void txtaccount_TextChanged(object sender, EventArgs e)
        {
            ConfirmAccount();
            btnTransfer.Enabled = true;
            lblMessage.Text = "";
        }
        public void ConfirmAccount()
        {
            string expMessage = "";
            DataTable dtAcctDetaail = dtProc.getAcct2(txtaccount.Text, hosts, out expMessage);
            try
            {
                int ctr = dtAcctDetaail.Rows.Count;
                foreach (DataRow dr in dtAcctDetaail.Rows)
                {
                  
                    txtAccname.Text = dr["names"].ToString();
                    hideBenBal.Value = dr["balance"].ToString();
                    return;
                }
               
            }
            catch (Exception ex)
            {
                string mmsg = "Account Detail not valid" + ex;

                //tdMessage.Visible = true;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = mmsg;
                lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
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

                    txtbalace.Text = "N "+bal;
                    txtbalace.Text = bal;
                    txtbalace.Font.Bold = true;
                    txtbalace.Visible = true;
                    lblBalh.Text = " "+FName + " " + lName +" - " + saveaseID +  " ( N" + txtbalace.Text + " )";
                }
                catch (Exception expp)
                {
                    bal = "-1";
                }
            }
            return double.Parse(bal);
        }

        protected void btnTransfer_Click(object sender, EventArgs e)
        {
            btnTransfer.Enabled = false;
            string expmess = "";
            Int32 getPin = dtProc.existUserPin(Session["txtUsr"].ToString(), sh1.GetSHA1HashData(txtpin.Text), hosts, out expmess);
            if (getPin > 0)
            {
                try
                {
                    ;
                    string in_acctNo = "";
                    string in_cardpin = "";
                    string in_cardsn = "";
                    string in_bankName = "";
                    string in_acctName = "";
                    double in_amount = 0;
                    string in_depositor = "";
                    string in_computerName = "";
                    string in_ipaddress = "";
                    string in_phoneNumber = "";
                    string in_emailID = "";
                    string in_tranRef = "";
                    string expObj = "";
                    string userName = Session["txtUsr"].ToString();
                    string SveNAme = dtProc.getDName(Session["txtUsr"].ToString(), hosts, out expObj);
                    in_computerName = Dns.GetHostName();
                    in_ipaddress = Dns.GetHostByName(Dns.GetHostName()).AddressList[0].ToString();
                    string ipaddress;
                    ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                    if (ipaddress == "" || ipaddress == null)
                        ipaddress = Request.ServerVariables["REMOTE_ADDR"];
                    if (txtaccount.Text.Equals(hideSEID.Value))
                    {
                        txtaccount.BorderColor = Color.OrangeRed;
                       // tdMessage.Visible = true;
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Text = "Transanction Impossible.";
                        return;
                    }
                    if (string.IsNullOrEmpty(txtaccount.Text))
                    {
                        txtaccount.BorderColor = Color.OrangeRed;
                        //tdMessage.Visible = true;
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Text = "Enter valid Account.";
                        return;
                    }
                    if (dtProc.existObjectsy("users", "SaveaseID", txtaccount.Text, "", hosts, out expObj) < 1)
                    {
                        txtaccount.BorderColor = Color.OrangeRed;
                        //tdMessage.Visible = true;
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Text = "Enter valid Savease Account.";
                        return;
                    }

                  
                    in_acctNo = txtaccount.Text;
                    in_acctName = txtAccname.Text;
                    in_amount = double.Parse(txtamount.Text.ToString());
                    in_bankName = "Savease";
                    in_depositor = SveNAme;
                    in_phoneNumber = "08035529398";
                    in_emailID = "jo@g.com";
                    in_tranRef = genPin();
                    Session["in_TransRefSAC"] = in_tranRef;

                    
                    double dblbal = double.Parse(txtbalace.Text);// + in_amount;
                    double upDateBenBalance = double.Parse(hideBenBal.Value);
                    if (in_amount > dblbal)
                    {
                        txtaccount.BorderColor = Color.OrangeRed;
                       // tdMessage.Visible = true;
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Text = "Insufficient Fund.";
                        return;
                    }
                    if (btnTransfer.Text.Equals("Make Transfer"))
                    {
                       
                        Session["in_transSac"] = in_tranRef;
                        Session["in_acctNameSAC"] = in_acctName;
                        Session["in_acctNoSAC"] = in_acctNo;
                        Session["in_bankSAC"] = in_bankName;
                        Session["in_amountSAC"] = in_amount;
                        Session["in_date"] = GetDateTime();
                        string trans, transs, trnsss;
                        string strTransfer = "I, " + Session["displayName"].ToString() + " initiate the following transaction of " + in_amount;
                        trans = strTransfer + " to be debited from account: " + hideSEID.Value;
                        trnsss = trans + " and credited to account number: " + in_acctNo;
                        transs = trnsss + " on " + GetDateTime();
                        string expMessage = "";
                        Int32 intDep = dtProc.transferFund(in_tranRef, dblbal, in_amount, dblbal - in_amount, in_acctNo, in_acctName, hideSEID.Value, in_depositor, in_computerName, out expObj, "", userName);
                        if(intDep > 0) { 
                        getBal(userName);
                        lblMessage.ForeColor = Color.Green;
                        lblMessage.Text = "Transfer Was successfull...Thanks";
                            mailHelper mh = new mailHelper();
                            DateTime TransDate = DateTime.Today;
                            //string msgBody = "Transfer of "+ in_amount+" Completed...";
                            string msgBody = mh.populateBody2(in_bankName, in_depositor, in_acctNo, TransDate.ToString());

                            string msgSubjB = "";
                            string msgSubjS = "";
                            msgSubjB = "Transfer of N" + in_amount + " to " + in_acctName + "<br/>";
                            msgSubjS = "Transfer of N" + in_amount + " to " + in_acctName + "<br/>";
                            return;
                        }
                        else
                        {
                            getBal(userName);
                            lblMessage.ForeColor = Color.Red;
                            lblMessage.Text = "Error initiating Transaction";
                        }
                    }
                   
                  
                }
                catch (Exception ex)
                {
                   // tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = ex.Message;
                    lblMessage.BorderColor = Color.OrangeRed;
                }

            }
            
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
        public Double getBal4Update(string userName)
        {
            DataTable dtBal = dtProc.getBalance(userName, hosts, out string expMessage);
            String bal = "0";
            foreach (DataRow dr in dtBal.Rows)
            {
                String saveaseID = dr["saveaseID"].ToString();
                hideSEID.Value = saveaseID;
                String FName = dr["fname"].ToString();
                String lName = dr["lname"].ToString();
                bal = dr["balance"].ToString();
                //string strEmail =dr["email"].ToString();
                //String strPhone = dr["phone"].ToString();
            }
            return Double.Parse(bal);
        }

        public void clear()
        {
            txtAccname.Text = "";
            txtaccount.Text = "";
            txtamount.Text = "";
            txtnarration.Text = "";
        }

    }
}