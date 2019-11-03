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
using Telerik.Web.UI;

namespace saveasze
{
    public partial class transactionsTransferSavease : System.Web.UI.Page
    {
        MailMgr mailMessenger = new MailMgr();
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
        DataTable dtBankDeposit = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            // hosts = Session["hosts"].ToString();
            RadGrid1.ItemStyle.Height = 12;
            RadGrid1.AlternatingItemStyle.Height = 12;
            RadGrid1.ItemStyle.Font.Size = 10;
            RadGrid1.AlternatingItemStyle.Font.Size = 10;
            string userName = "";
            hosts = Request.Url.Host;
            string ipaddress;
           /* ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            lblIP.Text = ipaddress;*/
            if (!Page.IsPostBack)
            {
              //  getbankDeposit();
            if (Session["txtUsr"].ToString() == null || Session["txtUsr"].ToString() == "")
                userName = "";
            else
                userName = Session["txtUsr"].ToString();
                try
                {
                    /*
                    getBal(userName);
                    getAllBanks();
                    getSavedBeneficiary();
                    getAcctDetail3();*/
                 //   lblMessage.BorderColor = Color.Gray;
                }
                catch(Exception ex)
                {
                //    lblMessage.Text = ex.Message;
                 //   lblMessage.BorderColor = Color.OrangeRed;
                }
            }
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
            dtBankDeposit = dtProc.getTransfer(Session["txtUsr"].ToString(),  hosts, out expMessage);
           //RadSearchBox1.DataSource = dtBankDeposit;
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
        protected void RadSearchBox2_Search(object sender, SearchBoxEventArgs e)
        {
                //Label2.Text = "Text: " + e.Text;
            }
         /*public static SearchBoxData GetResults(SearchBoxContext context)
        {
            DataTable data = GetData(context.Text);

            List<SearchBoxItemData> result = new List<SearchBoxItemData>();

            for (int i = 0; i < data.Rows.Count; i++)
            {
                SearchBoxItemData itemData = new SearchBoxItemData();
                itemData.Text = data.Rows[i]["ProductName"].ToString();
                itemData.Value = data.Rows[i]["ProductId"].ToString();

                result.Add(itemData);
            }
            SearchBoxData res = new SearchBoxData();
            res.Items = result.ToArray();

            return res;
        }
       private static DataTable GetData(string filterString)
        {
            
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["NorthwindConnectionString"].ConnectionString);
            SqlCommand command = new SqlCommand("SELECT [ProductId], [ProductName] FROM [Products] WHERE [ProductName] LIKE '%' + @filterString + '%' ORDER BY [ProductId]");
            command.Parameters.AddWithValue("@filterString", filterString.Replace("%", "[%]").Replace("_", "[_]"));
            command.Connection = connection;
            SqlDataAdapter adapter = new SqlDataAdapter(command);

            DataTable data = new DataTable();
            adapter.Fill(data);
            return data;
        }*/
        /*
        public double getBal(string userName)
        {
            String bal = "";
            DataTable dtBal = dtProc.getBalance(userName, hosts, out string expMessage);
            foreach (DataRow dr in dtBal.Rows)
            {
                String saveaseID = dr["saveaseID"].ToString();
                String FName = dr["fname"].ToString();
                String lName = dr["lname"].ToString();
                 bal = dr["balance"].ToString();
                string strEmail =dr["email"].ToString();
                String strPhone = dr["phone"].ToString();

                lblBalh.Text = bal;
                lblBal.Text = bal;
                lblBal.Visible = true;
                lblBal.Text = saveaseID + " - " + FName + " " + lName + "( N" + bal + " )";
            }
            return double.Parse(bal);
        } */
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
            //confirmPin();
        }
        /*
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
*/
        protected void btnConfirmAccount_Click(object sender, EventArgs e)
        {
          //  ConfirmAccount();
        }

        protected void txtAccount_TextChanged(object sender, EventArgs e)
        {
          //  ConfirmAccount();
        }

        protected void txtPIN_TextChanged(object sender, EventArgs e)
        {
            //confirmPin();
        }
        /*
        protected void cmdAcctType_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            if(cmdAcctType.SelectedIndex.Equals(0))
            {
            tblOtherAccounts.Visible = false;
            tblSaveaseAccounts.Visible = true;
                tblSavedBen.Visible = false;
            }
            else if(cmdAcctType.SelectedIndex.Equals(1))
            {
            tblOtherAccounts.Visible = true;
            tblSaveaseAccounts.Visible = false;
                tblSavedBen.Visible = false;
            }
            else
            {
            tblOtherAccounts.Visible = false;
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
          cmdBank.DataSource = dtBanks;
            cmdBank.DataTextField = "BankName";
            cmdBank.DataValueField = "BankName";
            cmdBank.DataBind();
        }

        public void getSavedBeneficiary()
        {
            string expMessage = "";
            DataTable dtBanks = dtProc.getBenBySenders(Session["txtUsr"].ToString().Trim(), hosts, out expMessage);
            Int32 intRowCtr = dtBanks.Rows.Count;
            cmdSavedBen.DataSource = dtBanks;
            cmdSavedBen.DataTextField = "acctOwner";
            cmdSavedBen.DataValueField = "acctNo";
            cmdSavedBen.DataBind();
            cmdSavedBen.SelectedIndex = 0;

         //   lbl
        }
        public void getAcctDetail3()
        {
            string expMessage = "";
            string accNo = cmdSavedBen.SelectedValue;
            DataTable dtBen = dtProc.getSavedBenDeatials(accNo,Session["txtUsr"].ToString().Trim(), hosts, out expMessage);
            Int32 intRowCtr = dtBen.Rows.Count;

            foreach(DataRow dr in dtBen.Rows)
            {
                savedBenDetails.Text = "Account No: " + accNo + "  Bank Name: " + dr["bankName"].ToString();
                hidAccount3.Value = accNo;hidBankName.Value = dr["bankName"].ToString();hidAcctName.Value=dr["acctOwner"].ToString();
            }
        }
        protected void txtPIN2_TextChanged(object sender, EventArgs e)
        {
            string confPin = confirmPin2();
            if(string.IsNullOrEmpty(confPin))
            { }
           else
            {
                tdMessage.Visible = true;
                lblMessage.Text = confPin;
                lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
        }
*/

        /*
         protected void btnConfirmAccount2_Click(object sender, EventArgs e)
        {
            ConfirmAccount2();
        }

        protected void btnConfirmPIN2_Click(object sender, EventArgs e)
        {
            confirmPin2();
        }
        public string confirmPin2()
        {
            try
            {
                string expMessage = "";
                //getCardPin(string pin, string connLocation, out string )
                DataTable dtCardDetaail = dtProc.getCardPin(txtPIN2.Value.ToString(), hosts, out expMessage);
                int ctr = (dtCardDetaail.ToString().Equals(null))?0:dtCardDetaail.Rows.Count;
                foreach (DataRow dr in dtCardDetaail.Rows)
                {
                    txtAmount2.Value = float.Parse(dr["cardAmount"].ToString());
                    //  lblAcctName.Text = dr[""].ToString();
                }
                return "";
            }
            catch(Exception expobj)
            {
                return ""+expobj;
            }

        }
        public void ConfirmAccount2()
        {
            string expMessage = "";
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtAcctDetaail =leftNavigation dtProc.getAcct2(txtAccount.Value.ToString(), hosts, out expMessage);
            int ctr = dtAcctDetaail.Rows.Count;
            foreach (DataRow dr in dtAcctDetaail.Rows)
            {
                //  txtAmount.Value = float.Parse(dr["cardAmount"].ToString());
                lblAcctName2.Text = dr["names"].ToString();
            }
        }

        protected void txtAccount2_TextChanged(object sender, EventArgs e)
        {
            ConfirmAccount2();
        }

        //
        // start Saved Beneficiary
        //

        protected void txtPIN3_TextChanged(object sender, EventArgs e)
        {
            confirmPin3();
        }

        protected void btnConfirmAccount3_Click(object sender, EventArgs e)
        {
            ConfirmAccount3();
        }

        protected void btnConfirmPIN3_Click(object sender, EventArgs e)
        {
            confirmPin3();
        }

        public void confirmPin3()
        {
            string expMessage = "";
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtCardDetaail = dtProc.getCardPin(txtPIN3.Value.ToString(), hosts, out expMessage);
            int ctr = dtCardDetaail.Rows.Count;
            foreach (DataRow dr in dtCardDetaail.Rows)
            {
                txtAmount3.Value = float.Parse(dr["cardAmount"].ToString());
                //  lblAcctName.Text = dr[""].ToString();
            }
        }
        public void ConfirmAccount3()
        {
        //    existBeneficiary(string in_acctNo, string in_acctOwner, string in_bankName, string in_sender, string connLocation, out string expMessage)
        }

        protected void cmdSavedBen_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            getAcctDetail3();
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
                }

                if (cmdAcctType.SelectedIndex.Equals(0) && string.IsNullOrEmpty(txtAccount.Text))
                {
                    txtAccount.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.Text = "Enter valid Account.";
                    return;
                }
                if (cmdAcctType.SelectedIndex.Equals(0) && dtProc.existObjectsy("users", "SaveaseID", txtAccount.Text, "", hosts, out expObj) < 1)
                {
                    txtAccount.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.Text = "Enter valid Savease Account.";
                    return;
                }

                // Validate controls for other banks account owners
                //to be created
                if (cmdAcctType.SelectedIndex.Equals(1) && string.IsNullOrEmpty(txtPIN2.Text))
                {
                    txtPIN2.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }
                if (cmdAcctType.SelectedIndex.Equals(1) && dtProc.existObjectsy("orderDetails", "card_pin", txtPIN2.Text, "and orderStatus='Completed'", hosts, out expObj) < 1)
                {
                    txtPIN2.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }

                if (cmdAcctType.SelectedIndex.Equals(1) && string.IsNullOrEmpty(txtAccount2.Text))
                {
                    txtAccount2.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.Text = "Enter valid Account.";
                    return;
                }


                // Validate controls for savease saved transactions
                //to be created
                if (cmdAcctType.SelectedIndex.Equals(2) && string.IsNullOrEmpty(txtPIN3.Text))
                {
                    txtPIN3.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }
                if (cmdAcctType.SelectedIndex.Equals(2) && dtProc.existObjectsy("orderDetails", "card_pin", txtPIN3.Text, "and orderStatus='Completed'", hosts, out expObj) < 1)
                {
                    txtPIN2.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }
                if (cmdAcctType.SelectedIndex.Equals(2) && cmdSavedBen.Items.Count < 1)
                {
                    lblMessage.Text = "Select Account.";
                    return;
                }

                if (cmdAcctType.SelectedIndex.Equals(0))
                {
                    in_cardpin = txtPIN.Text;
                    in_cardsn = dtProc.getCardSerial(txtPIN.Text, hosts, out expObj);
                    in_acctNo = txtAccount.Text;
                    in_acctName = lblAcctName.Text;
                    in_amount = double.Parse(txtAmount.Value.ToString());
                    in_bankName = "Savease";
                    in_depositor = Session["txtUsr"].ToString();
                    in_phoneNumber = "080";
                    in_emailID = "jo@g.com";
                     in_tranRef = "SFD" + genPin();
                }
                else if (cmdAcctType.SelectedIndex.Equals(1))
                {
                    in_cardpin = txtPIN2.Text;
                    in_cardsn = dtProc.getCardSerial(txtPIN2.Text, hosts, out expObj);
                    in_acctNo = txtAccount2.Text;
                    in_acctName = (string.IsNullOrEmpty(lblAcctName2.Text)) ? "Savease Temp" : lblAcctName2.Text;
                    in_amount = double.Parse(txtAmount2.Value.ToString());
                    in_bankName = cmdBank.SelectedText;
                    in_depositor = Session["txtUsr"].ToString();
                    in_phoneNumber = "080";
                    in_emailID = "jo@g.com";
                    in_tranRef = "SFD" + genPin();
                }
                else
                {
                    in_cardpin = txtPIN3.Text;
                    in_cardsn = dtProc.getCardSerial(txtPIN3.Text, hosts, out expObj);
                    in_acctNo = hidAccount3.Value;
                    in_acctName = hidAcctName.Value;
                    in_amount = double.Parse(txtAmount3.Value.ToString());
                    in_bankName = hidBankName.Value;
                    in_depositor = Session["txtUsr"].ToString();
                    in_phoneNumber = "080";
                    in_emailID = "jo@g.com";
                    in_tranRef = "SFD" + genPin();
                }
                // double dblbal = double.Parse(lblBalh.Text) + double.Parse(txtPIN.Text);
                double dblbal = double.Parse(lblBalh.Text);// + in_amount;
                DateTime transDate = DateTime.Today;
                Int32 intDep = dtProc.saveDeposit(in_acctNo, in_cardpin, in_cardsn, in_bankName, in_acctName, in_amount, in_depositor, in_computerName, in_ipaddress, in_tranRef, out expObj);

                if (dtProc.existObjectsy("beneficiaryBank", "acctNo", txtAccount.Text, "and bankName='" + in_bankName + "'", hosts, out expObj) < 1)
                    dtProc.saveBenDetails(in_acctNo, in_acctName, in_bankName, in_depositor, in_cardpin, in_phoneNumber, in_emailID, out expObj);

                if (!cmdAcctType.SelectedIndex.Equals(1) && dtProc.existObjectsy("users", "SaveaseID", txtAccount.Text, "", hosts, out expObj) > 0)
                {
                    double newBal = dblbal + in_amount;
                    dtProc.updateBalance(userName, newBal, out expObj);
                }

                double bbal = getBal(userName);
                sendSMS();
                tdMessage.Visible = true;
                lblMessage.Text = "Deposit completed successfully.";
                lblMessage.BorderColor = Color.Gray;
               string strNarative = "";
                //(string strName,string strBank,string strAcctOwner,string strAcctNum,double transAmount, string tranDate,string strNarative,string strBalance)
                string msgBody = formatedSMS(in_acctName, in_bankName, in_depositor, in_acctNo, in_amount, transDate.ToString(), strNarative, bbal.ToString());
                string msgSubjB = "";
                string msgSubjS = "";
                 msgSubjB = "Deposit of N" + in_amount + " to " + in_acctName + "<br/>";
                 msgSubjS = "Deposit of N" + in_amount + " to " + in_acctName + "<br/>";
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
        }*/

        protected void cmdAcctType_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            if (cmdAcctType.SelectedIndex.Equals(0))
            {
                Response.Redirect("transactions.aspx");

            }
            else if (cmdAcctType.SelectedIndex.Equals(1))
            {
                Response.Redirect("transactionsOrder.aspx");
            }
            else if (cmdAcctType.SelectedIndex.Equals(2))
            {
                Response.Redirect("transactionsMyDeposit.aspx");
            }
            else
            {
                Response.Redirect("transactionsTransferSavease.aspx");
            }

        }
        public string formatedSMS(string strName,string strBank,string strAcctOwner,string strAcctNum,double transAmount, string tranDate,string strNarative,string strBalance)
        {
            string msgBody = "<img ImageUrl='~/images/logo/logo.png' runat='server' Height='18px' Width='152px' /> < br />  < br />" +
                " &nbsp; Hello " + strName + "<br /> &nbsp;< br /> &nbsp;" +
                "< table cellpadding = '5' class='auto-style1'> <tr> <td class='auto-style2'>" +
                "Beneficiary Bank:</td> <td>&nbsp;</td> </tr>" +
                "<tr> <td class='auto-style2'>Beneficiary Name:</td> <td>&nbsp;"+ strAcctOwner + "</td> </tr> " +
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

        protected void transfer_savease_Click(object sender, EventArgs e)
        {
            Response.Redirect("transactionsTransferSavease.aspx");
        }

        protected void Link3rdParty_Click(object sender, EventArgs e)
        {
            Response.Redirect("transactions3rdparty.aspx");
        }

        protected void LinkMyDeposit_Click(object sender, EventArgs e)
        {
            Response.Redirect("transactionsMyDeposit.aspx");
        }

        protected void lnkOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("transactionsOrder.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void LinkDeposit_Click(object sender, EventArgs e)
        {
            Response.Redirect("transactionsMyDeposit.aspx");
        }

        protected void lnkWithdraw_Click(object sender, EventArgs e)
        {
            Response.Redirect("transactions.aspx");
        }


        //
        // End Saved Beneficiary
        //
    }
}