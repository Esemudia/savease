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
using System.Windows.Forms;
using Microsoft.VisualBasic;
using Telerik.Web.UI;

namespace saveasze
{
    public partial class transfer : System.Web.UI.Page
    {
        MailMgr mailMessenger = new MailMgr();
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
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
                    getAllBanks();
                    getSavedBeneficiary();
                  //  getAcctDetail3();
                    lblMessage.BorderColor = Color.Gray;
                }
                catch(Exception ex)
                {
                    lblMessage.Text = ex.Message;
                    lblMessage.BorderColor = Color.OrangeRed;
                }
            }
        }
        public void getBal(string userName)
        {
            DataTable dtBal = dtProc.getBalance(userName, hosts, out string expMessage);
            foreach (DataRow dr in dtBal.Rows)
            {
                String saveaseID = dr["saveaseID"].ToString();
                hideSEID.Value = saveaseID;
                String FName = dr["fname"].ToString();
                String lName = dr["lname"].ToString();
                String bal = dr["balance"].ToString();
                //string strEmail =dr["email"].ToString();
                //String strPhone = dr["phone"].ToString();

                lblBalh.Text = bal;
                lblBal.Font.Bold = true;
                lblBal.ForeColor = Color.Blue;
                lblBal.Text = bal;
                lblBal.Visible = true;
                lblBal.Text = saveaseID + " - Account Balance:   N" + bal+".00" ;
            }
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
        public void leftNavigation()
        {
            if (Session["accesscontrol"] == "" || Session["accesscontrol"] == null)
            {
                Response.Redirect("login.aspx");
            }
            string accesscontrol = Session["accesscontrol"].ToString();
            //
            string expMessage = "";
            DataTable dtNav = dtProc.getLeftNavigation(Int32.Parse(accesscontrol), hosts, out expMessage);
            foreach (DataRow row in dtNav.Rows)
            {
                string link = row["link"].ToString() + ".aspx";
                string strText = row["text"].ToString();
                string leftNav = "<li class='active'><a href='" + link + "'>" + strText + "</a></li>";
                Response.Write(leftNav);
            }
        }
        protected void btnAddDeposit_Click(object sender, EventArgs e)
        {
        }
        protected void btnImgDeposit_click(object sender, ImageClickEventArgs e)
        {

        }

        protected void gridBatch_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string expMessage = "";
            // loadGrid("");
            dtBankDeposit = dtProc.getTransfer(Session["txtUsr"].ToString(), hosts, out expMessage);
            if (dtBankDeposit == null)
            {
                return;
            }
            RadGrid1.Visible = true;
            RadGrid1.DataSource = dtBankDeposit;
            // gridBatch.DataBind();
            (sender as RadGrid).DataSource = dtBankDeposit;
            RadGrid1.Skin = "WebBlue";
        }

        public void getbankDeposit()
        {
            string expMessage = "";
            //getTransfer(string in_depositor, string connLocation, out string expMessage)
            dtBankDeposit = dtProc.getTransfer(Session["txtUsr"].ToString(), hosts, out expMessage);
           // RadSearchBox1.DataSource = dtBankDeposit;
            // RadGrid1.DataSource = null;
            RadGrid1.DataSource = dtBankDeposit;
            /*

            GridBoundColumn boundColumn;
            boundColumn = new GridBoundColumn();
            RadGrid1.MasterTableView.Columns.Add(boundColumn);
            boundColumn.DataField = "tid";
            boundColumn.HeaderText = "ID";
            boundColumn.Display = false;
            RadGrid1.Columns.Add(boundColumn);


            GridHyperLinkColumn linkColumn2 = new GridHyperLinkColumn();
            string[] fld = { "tid" };
            RadGrid1.MasterTableView.Columns.Add(linkColumn2);
            linkColumn2.DataNavigateUrlFields = fld;
            linkColumn2.DataNavigateUrlFormatString = "transactionVW.aspx?id={0}";
            linkColumn2.DataTextField = "transferCode";
            linkColumn2.FilterControlAltText = "transferCode";
            linkColumn2.HeaderText = "Transfer Code";
            linkColumn2.HeaderTooltip = "Transfer Code";

            boundColumn = new GridBoundColumn();
            RadGrid1.MasterTableView.Columns.Add(boundColumn);
            boundColumn.DataField = "amountTransfered";
            boundColumn.HeaderText = "Amount Transfered";
            boundColumn.HeaderTooltip = "Amount Transfered";

            boundColumn = new GridBoundColumn();
            RadGrid1.MasterTableView.Columns.Add(boundColumn);
            boundColumn.DataField = "beneficiaryAccount";
            boundColumn.HeaderText = "Beneficiary Account";
            boundColumn.HeaderTooltip = "Beneficiary Account";

            boundColumn = new GridBoundColumn();
            RadGrid1.MasterTableView.Columns.Add(boundColumn);
            boundColumn.DataField = "beneficaryName";
            boundColumn.HeaderText = "Recipient";
            boundColumn.HeaderTooltip = "Reciever Name";

            boundColumn = new GridBoundColumn();
            RadGrid1.MasterTableView.Columns.Add(boundColumn);
            boundColumn.DataField = "transactionDate";
            boundColumn.HeaderText = "Transaction Date";
            boundColumn.HeaderTooltip = "Transaction Date";*/


        }
        protected void btnConfirmPIN_Click(object sender, EventArgs e)
        {
            confirmPin();
        }
        public void confirmPin()
        {
            string expMessage = "";
            int ctr = 0;
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtCardDetaail = new DataTable();
            int ctr1 = 0;
            try
            {
           //  dtCardDetaail = dtProc.getCardPin(txtPIN.Value.ToString(),hosts,out expMessage);
            foreach(DataRow dr in dtCardDetaail.Rows)
            {
                 ctr1 = dtCardDetaail.Rows.Count;
                txtAmount.Value = float.Parse(dr["cardAmount"].ToString());
                    tdMessage.Visible = false;
                    //  lblAcctName.Text = dr[""].ToString();
                }
            }
         catch(Exception ex)
            {
                string mmsg = "Card Detial not valid";

                tdMessage.Visible = true;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = mmsg;
                lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
        }
        public void ConfirmAccount()
        {
            string expMessage = "";
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtAcctDetaail = dtProc.getAcct2(txtAccount.Value.ToString(), hosts, out expMessage);
            try { 
            int ctr = dtAcctDetaail.Rows.Count;
            foreach (DataRow dr in dtAcctDetaail.Rows)
            {
                //  txtAmount.Value = float.Parse(dr["cardAmount"].ToString());
                lblAcctName.Text = dr["names"].ToString();
                    hideBenBal.Value= dr["balance"].ToString();
                    //txtAcctBal.Text = dr["balance"].ToString();
                tdMessage.Visible = false;
                //string mmsg = "Account Detail  valid";

                //tdMessage.Visible = true;
                //lblMessage.ForeColor = Color.Green;
                //lblMessage.Text = mmsg;
                //lblMessage.BorderColor = Color.Orange;
                return;
                }
                
            }
            catch (Exception ex)
            {
                string mmsg = "Account Detail not valid" + ex;

                tdMessage.Visible = true;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = mmsg;
                lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
        }

        protected void btnConfirmAccount_Click(object sender, EventArgs e)
        {
            ConfirmAccount();
        }

        protected void txtAccount_TextChanged(object sender, EventArgs e)
        {
            ConfirmAccount();
        }

        protected void txtPIN_TextChanged(object sender, EventArgs e)
        {
            confirmPin();
        }

        protected void cmdAcctType_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            if(cmdAcctType.SelectedIndex.Equals(0))
            {
            tblSaveaseAccounts.Visible = false;
                trother.Visible = false;
                btnDepozit.Visible = false;

            }
           else if(cmdAcctType.SelectedIndex.Equals(1))
            {
            tblSaveaseAccounts.Visible = true;
                btnDepozit.Visible = true;
                trother.Visible = false;
                clear();
            }
            else
            {
            tblSaveaseAccounts.Visible = true;
                trother.Visible = true;
                btnDepozit.Visible = true;
                clear();
            }
            
            
        }
        public void getAllBanks()
        {
            string expMessage = "";
          DataTable dtBanks =dtProc.getAllBankNames(hosts, out expMessage);
           Int32 intRowCtr = dtBanks.Rows.Count;
        }

        public void getSavedBeneficiary()
        {
            string expMessage = "";
            DataTable dtBanks = dtProc.getBenBySenders(Session["txtUsr"].ToString().Trim(), hosts, out expMessage);
            Int32 intRowCtr = dtBanks.Rows.Count;
           

         //   lbl
        }

        protected void btnDeposit_Click(object sender, EventArgs e)
        {

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
        protected void btnMakeDepozit_Click(object sender, EventArgs e)
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
                if(txtAccount.Text.Equals(hideSEID.Value))
                {
                    txtAccount.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Transanction Impossible.";
                    return;
                }
                if (string.IsNullOrEmpty(txtAccount.Text))
                {
                    txtAccount.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid Account.";
                    return;
                }
                if ( dtProc.existObjectsy("users", "SaveaseID", txtAccount.Text, "", hosts, out expObj) < 1)
                {
                    txtAccount.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid Savease Account.";
                    return;
                }

             
                     // in_cardpin = txtPIN.Text;
                   // in_cardsn = dtProc.getCardSerial(txtPIN.Text, hosts, out expObj);
                    in_acctNo = txtAccount.Text;
                    in_acctName = lblAcctName.Text;
                    in_amount = double.Parse(txtAmount.Value.ToString());
                    in_bankName = "Savease";
                    in_depositor = SveNAme;
                    in_phoneNumber = "08035529398";
                    in_emailID = "jo@g.com";
                     in_tranRef = genPin();
                Session["in_TransRefSAC"] = in_tranRef;

                //else
                //{
                //    in_acctNo = txtAccount.Text;
                //    in_acctName = lblAcctName.Text;
                //    in_amount = double.Parse(txtAmount.Value.ToString());
                //    in_bankName = RadBnks.SelectedText;

                //    in_depositor = Session["txtUsr"].ToString();
                //    in_phoneNumber = "08035529398";
                //    in_emailID = "jo@g.com";
                //    in_tranRef = genPin();
                //}
                // double dblbal = double.Parse(lblBalh.Text) + double.Parse(txtPIN.Text);
                double dblbal = double.Parse(lblBalh.Text);// + in_amount;
                double upDateBenBalance = double.Parse(hideBenBal.Value);
                if(in_amount > dblbal)
                {
                    txtAccount.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Insufficient Fund.";
                    return;
                }
                if(btnDepozit.Text.Equals("Transfer Fund"))
                {
                    tbltranstype.Visible = false;
                    tblSaveaseAccounts.Visible = false;
                    tblConfirmTransfer.Visible = true;
                    btnCancel.Visible = true;
                    btnDepozit.Text = "Confirm Deposit";
                    Session["in_transSac"] = in_tranRef;
                    Session["in_acctNameSAC"] = in_acctName;
                    Session["in_acctNoSAC"] = in_acctNo;
                    Session["in_bankSAC"] = in_bankName;
                    Session["in_amountSAC"] = in_amount;
                    Session["in_date"] = GetDateTime();
                    string trans, transs, trnsss;
                    //I JONATHAN ATAISI , initiate the following transaction: amount NGN40,000.00 is to be debited from account: 0000590234 at this bank on 11 / 12 / 2018.Amount NGN40,000.00 is to be credited to account: 0002153837(OROMA IBIFUBARA ALLAPUTA) 
                    string strTransfer = "I, " + Session["displayName"].ToString() + " initiate the following transaction of "+ in_amount;
                    trans = strTransfer + " to be debited from account: " +hideSEID.Value;
                    trnsss = trans + " and credited to account number: " + in_acctNo;
                    transs = trnsss + " on "+ GetDateTime();
                    txtTransSumm.Text = transs;
                    txtTransSumm.Enabled = false;
                    return;
                   // GetDateTime();
        
                    }
                else
                {
                    string expMessage = "";
                    Int32 intDep = dtProc.transferFund(in_tranRef, dblbal, in_amount, dblbal-in_amount, in_acctNo, in_acctName, hideSEID.Value, in_depositor, in_computerName, out expObj, "", userName);
                    
                    //Start Comment
                    
                    // dtProc.composeMail(userName, "Debit Alert <Transfer>", txtTransSumm.Text+" "+ in_tranRef, in_depositor, in_acctNo, lblAcctName.Text,"", out expMessage);
                    // composeMail(string in_sender, string in_subject, string in_content, string in_senderName, string in_reciverId, string in_reciverName, string in_orderNumber, out string expObj)
                }
                string expmessage = "";
                /*
                if (dtProc.existObjectsy("users", "SaveaseID", txtAccount.Text, "", hosts, out expObj) > 0)
                {
                    string strUname = dtProc.getUserNam(hideSEID.Value, hosts, out expmessage);
                    double newBal = getBal4Update(strUname) - in_amount;
                    dtProc.updateBalance(strUname, newBal, out expObj);//deduct from sender

                    string strUname2 = dtProc.getUserNam(txtAccount.Value.ToString(), hosts, out expmessage);
                    double newBaleBen = getBal4Update(strUname2) + in_amount;
                    dtProc.updateBalance(strUname2, newBaleBen, out expObj);// add to beneficiary
                }                 
                 */
                getBal(userName);
                sendSMS();
                tdMessage.Visible = true;
                lblMessage.ForeColor = Color.Green;
                lblMessage.Text = "";
                lblMessage.BorderColor = Color.Gray;
                mailHelper mh = new mailHelper();
                DateTime TransDate = DateTime.Today;
                //string msgBody = "Transfer of "+ in_amount+" Completed...";
                string msgBody = mh.populateBody2(in_bankName, in_depositor, in_acctNo, TransDate.ToString());

                string msgSubjB = "";
                string msgSubjS = "";
                 msgSubjB = "Transfer of N" + in_amount + " to " + in_acctName + "<br/>";
                 msgSubjS = "Transfer of N" + in_amount + " to " + in_acctName + "<br/>";
                mailMessenger.sendMail2Usr(hidEmailBeneficiary.Value, msgBody, msgSubjB); // Send notification to Beneficiary
                mailMessenger.sendMail2Usr(hidEmailSender.Value, msgBody, msgSubjS); // Send notification to Sender
                //End Comment

              // MessageBox.Show("Transfer completed successfully! To"+" "+ in_acctName+" "+in_amount);
                clear();
                //composeMail(string in_sender,string in_subject, string in_content, string in_senderName, string in_reciverId, string in_reciverName,string in_orderNumber, out string expObj)
               // dtProc.composeMail(hideSaveaseID.Value, "Credit Alert <Order>", " Order Number: " + in_orderNumber, hideDispName.Value, hideSaveaseID.Value, hideDispName.Value, in_orderNumber, out expMessage);
                Response.Redirect("successmessage.aspx?strurl=Transfer");
                //Response.Redirect("transfer.aspx");
            }
            catch (Exception ex)
            {
                tdMessage.Visible = true;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = ex.Message;
                lblMessage.BorderColor = Color.OrangeRed;
            }
        }

        protected void btnDiscardt_Click(object sender, EventArgs e)
        {
            tblConfirmTransfer.Visible = false;
            tblSaveaseAccounts.Visible = true;
            btnDepozit.Text = "Make Deposit";
            btnCancel.Visible = false;
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
        public void clear()
        {
            txtAccount.Text = string.Empty;
            lblAcctName.Text = string.Empty;
            txtAmount.Text = string.Empty;

        }
        

            public void sendSMS()
            {
            /*
            // Dim wbClient As New System.Net.WebClient()
            WebClient wbClient = new WebClient();
            Sms ts = new Sms();
            ts.ServerName = "Server";
            //Dim ds As Data.DataTable = ts.GetUser()
            DataTable ds = ts.getUser(Session["txtUsr"].ToString());
            if (ds.Rows.Count > 0)
            {
                foreach(DataRow rs in ds.Rows)
                {
                    //Stream str = wbClient.OpenRead("http://sms.elsoftnig.com/api/?username=" + rs!username + "&password=" + rs!password + "&action=balance");
                    Stream str = wbClient.OpenRead("http://sms.elsoftnig.com/api/?username=" + rs["username"].ToString() + "&password=" + rs["password"].ToString() + "&action=balance");
                    StreamReader sR = new StreamReader(str);
                    string content = sR.ReadToEnd();

                    //===========elsoft api code================
                    string statusID =  content.Substring(12, 2);
                    string count =  content.Substring(12, 2);
                    string Status = "";
                    if (statusID.Equals("OK")) Status = "SUBMITTED";
                    else  Status = "SUBMITTED";
                   // string balance = content.Substring(13, content.Length - 14); // ;Mid(content, 13, content.Length - 14);
                   // ts.UpdateUser(rs["username"].ToString(), balance);
                    ts.UpdateSMS(rs["id"].ToString(),"", Status, content);


                }
            }
*/
        }


        //
        // End Saved Beneficiary
        //
    }
}