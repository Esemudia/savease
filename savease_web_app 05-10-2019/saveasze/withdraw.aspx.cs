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
using Microsoft.VisualBasic;

namespace saveasze
{
    public partial class withdraw : System.Web.UI.Page
    {
        MailMgr mailMessenger = new MailMgr();
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
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
                String FName = dr["fname"].ToString();
                String lName = dr["lname"].ToString();
                String bal = dr["balance"].ToString();
                string strEmail =dr["email"].ToString();
                String strPhone = dr["phone"].ToString();

                lblBalh.Text = bal;
                lblBal.Text = bal;
                lblBal.Visible = true;
                lblBal.Text = saveaseID + " - " + FName + " " + lName + "( N" + bal + " )";
            }
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
             dtCardDetaail = dtProc.getCardPin(txtPIN.Value.ToString(),hosts,out expMessage);
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
                    txtAcctBal.Text = dr["balance"].ToString();
                tdMessage.Visible = false;
                }
            }
            catch (Exception ex)
            {
                string mmsg = "Account Detail not valid";

                tdMessage.Visible = true;
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
            tblSaveaseAccounts.Visible = true;
                tblSavedBen.Visible = false;
            }
            else if(cmdAcctType.SelectedIndex.Equals(1))
            {
            tblSaveaseAccounts.Visible = false;
                tblSavedBen.Visible = false;
            }
            else
            {
            tblSaveaseAccounts.Visible = false;
                tblSavedBen.Visible = true;
                getSavedBeneficiary();
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

                in_computerName = Dns.GetHostName();
                in_ipaddress = Dns.GetHostByName(Dns.GetHostName()).AddressList[0].ToString();
                string ipaddress;
                ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
                if (ipaddress == "" || ipaddress == null)
                    ipaddress = Request.ServerVariables["REMOTE_ADDR"];
                // Validate controls for savease account owners
                /*
                if (cmdAcctType.SelectedIndex.Equals(0) && string.IsNullOrEmpty(txtPIN.Text))
                {
                    txtPIN.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }
                if (cmdAcctType.SelectedIndex.Equals(0) && dtProc.existObjectsy("orderDetails", "card_pin", txtPIN.Text, "and orderStatus='Completed'", hosts, out expObj) < 1)
                {
                    txtPIN.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }*/

                if (string.IsNullOrEmpty(txtAccount.Text))
                {
                    txtAccount.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.Text = "Enter valid Account.";
                    return;
                }
                if ( dtProc.existObjectsy("users", "SaveaseID", txtAccount.Text, "", hosts, out expObj) < 1)
                {
                    txtAccount.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.Text = "Enter valid Savease Account.";
                    return;
                }

             
                      in_cardpin = txtPIN.Text;
                    in_cardsn = dtProc.getCardSerial(txtPIN.Text, hosts, out expObj);
                    in_acctNo = txtAccount.Text;
                    in_acctName = lblAcctName.Text;
                    in_amount = double.Parse(txtAmount.Value.ToString());
                    in_bankName = "Savease";
                    in_depositor = Session["txtUsr"].ToString();
                    in_phoneNumber = "08035529398";
                    in_emailID = "jo@g.com";
                     in_tranRef = "SFT" + genPin();
                
                // double dblbal = double.Parse(lblBalh.Text) + double.Parse(txtPIN.Text);
                double dblbal = double.Parse(lblBalh.Text);// + in_amount;
                double upDateBenBalance = double.Parse(txtAcctBal.Text);
                if(in_amount > dblbal)
                {
                    txtAccount.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.Text = "Insurficient Fund.";
                    return;
                }
                Int32 intDep = dtProc.saveDeposit(in_acctNo, in_cardpin, in_cardsn, in_bankName, in_acctName, in_amount, in_depositor, in_computerName, in_ipaddress, in_tranRef, out expObj,"");

                if (dtProc.existObjectsy("beneficiaryBank", "acctNo", txtAccount.Text, "and bankName='" + in_bankName + "'", hosts, out expObj) < 1)
                    dtProc.saveBenDetails(in_acctNo, in_acctName, in_bankName, in_depositor, in_cardpin, in_phoneNumber, in_emailID, out expObj);

                if (dtProc.existObjectsy("users", "SaveaseID", txtAccount.Text, "", hosts, out expObj) > 0)
                {
                    double newBal = dblbal - in_amount;
                    dtProc.updateBalance(userName, newBal, out expObj);
                    double newBaleBen = upDateBenBalance + in_amount;
                    dtProc.updateBalance(txtAccount.Text, upDateBenBalance, out expObj);
                }

                getBal(userName);
                sendSMS();
                tdMessage.Visible = true;
                lblMessage.Text = "Transfer completed successfully.";
                lblMessage.BorderColor = Color.Gray;
                string msgBody = "Transfer of "+ in_amount+" Completed...";
                string msgSubjB = "";
                string msgSubjS = "";
                 msgSubjB = "Transfer of N" + in_amount + " to " + in_acctName + "<br/>";
                 msgSubjS = "Transfer of N" + in_amount + " to " + in_acctName + "<br/>";
                mailMessenger.sendMail2Usr(hidEmailBeneficiary.Value, msgBody, msgSubjB); // Send notification to Beneficiary
                mailMessenger.sendMail2Usr(hidEmailSender.Value, msgBody, msgSubjS); // Send notification to Sender
            }
            catch (Exception ex)
            {
                tdMessage.Visible = true;
                lblMessage.Text = ex.Message;
                lblMessage.BorderColor = Color.OrangeRed;
            }
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