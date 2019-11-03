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
    public partial class deposit : System.Web.UI.Page
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
                getbankDeposit();
                if (Session["txtUsr"].ToString() == null || Session["txtUsr"].ToString() == "")
                userName = "";
            else
                userName = Session["txtUsr"].ToString();
                try
                {
                    tblSavedBen.Visible = false;
                    //clearf();
                    dblBal = getBal(userName);
                    if(dblBal<0)
                    {
                        lblMessage.Text = "Page not loading properly, please contact savease administrators";
                    }
                    getAllBanks();// load banks
                    getSavedBeneficiary();//
                    getAcctDetail3();
                    lblMessage.BorderColor = Color.Gray;
                }
                catch(Exception ex)
                {
                    lblMessage.Text = ex.Message;
                    lblMessage.BorderColor = Color.OrangeRed;
                }
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
                string strEmail =dr["email"].ToString();
                String strPhone = dr["phone"].ToString();

                lblBalh.Text = bal;
                lblBal.Text = bal;
                    lblBal.Font.Bold = true;
                    lblBal.ForeColor = Color.Blue;
                lblBal.Visible = true;
                lblBal.Text = saveaseID + " - " + FName + " " + lName + " ( N" + bal + " )";
                }
                catch(Exception expp)
                {
                    bal = "-1";
                }
            }
            return double.Parse(bal);
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
        protected void gridBatch_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string expMessage = "";
            // loadGrid("");
            dtBankDeposit = dtProc.getBankDeposit(Session["txtUsr"].ToString(), hosts, out expMessage);
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
            dtBankDeposit = dtProc.getBankDeposit(Session["txtUsr"].ToString(), hosts, out expMessage);
            //RadSearchBox1.DataSource = dtBankDeposit;
            // RadGrid1.DataSource = null;
            RadGrid1.DataSource = dtBankDeposit;
            RadGrid1.Skin = "WebBlue";
            
            
            GridBoundColumn boundColumn;
            boundColumn = new GridBoundColumn();
            RadGrid1.MasterTableView.Columns.Add(boundColumn);
            boundColumn.DataField = "depID";
            boundColumn.HeaderText = "ID";
            boundColumn.Display = false;
            RadGrid1.Columns.Add(boundColumn);
/*

            GridHyperLinkColumn linkColumn2 = new GridHyperLinkColumn();
            string[] fld = { "depID" };
            RadGrid1.MasterTableView.Columns.Add(linkColumn2);
            linkColumn2.DataNavigateUrlFields = fld;
            linkColumn2.DataNavigateUrlFormatString = "transactionVW.aspx?id={0}";
            linkColumn2.DataTextField = "acctNo";
            linkColumn2.FilterControlAltText = "acctNo";
            linkColumn2.HeaderText = "Account Number";
            linkColumn2.HeaderTooltip = "Account Number";

            boundColumn = new GridBoundColumn();
            RadGrid1.MasterTableView.Columns.Add(boundColumn);
            boundColumn.DataField = "acctName";
            boundColumn.HeaderText = "Account Name";
            boundColumn.HeaderTooltip = "Account Name";

            boundColumn = new GridBoundColumn();
            RadGrid1.MasterTableView.Columns.Add(boundColumn);
            boundColumn.DataField = "cardpin";
            boundColumn.HeaderText = "Voucher PIN";
            boundColumn.HeaderTooltip = "Voucher PIN";

            boundColumn = new GridBoundColumn();
            RadGrid1.MasterTableView.Columns.Add(boundColumn);
            boundColumn.DataField = "cardsn";
            boundColumn.HeaderText = "Voucher Serials";
            boundColumn.HeaderTooltip = "Voucher Serial Number";

            boundColumn = new GridBoundColumn();
            RadGrid1.MasterTableView.Columns.Add(boundColumn);
            boundColumn.DataField = "bankName";
            boundColumn.HeaderText = "Bank Name";
            boundColumn.HeaderTooltip = "Bank Name";

            boundColumn = new GridBoundColumn();
            RadGrid1.MasterTableView.Columns.Add(boundColumn);
            boundColumn.DataField = "amount";
            boundColumn.HeaderText = " Transaction Amount";
            boundColumn.HeaderTooltip = "Transaction Amount";
            
            boundColumn = new GridBoundColumn();
            RadGrid1.MasterTableView.Columns.Add(boundColumn);
            boundColumn.DataField = "depositor";
            boundColumn.HeaderText = "Depositor Name";
            boundColumn.HeaderTooltip = "Depositor Name";

            boundColumn = new GridBoundColumn();
            RadGrid1.MasterTableView.Columns.Add(boundColumn);
            boundColumn.DataField = "transactionDate";
            boundColumn.HeaderText = "Transaction Date";
            boundColumn.HeaderTooltip = "Transaction Date";
*/
            return;
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
            Int32 intPinStatus = 0;
            int ctr = 0;
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtCardDetaail = new DataTable();
           //DataTable dtCardDetailss = new DataTable();
            int ctr1 = 0;
            try
            {
                Int32 exitpin = dtProc.usedPin(txtPIN.Value.ToString(), hosts, out expMessage);
               
                if (exitpin < 1) {

                    dtCardDetaail = dtProc.getCardPin(txtPIN.Value.ToString(), hosts, out expMessage);
                    if(dtCardDetaail==null)
                    {

                        string mmsg = "Invalid Voucher details supplied!!!";

                        tdMessage.Visible = true;
                        lblMessage.Text = mmsg;
                        lblMessage.ForeColor = Color.Red;
                        return;
                    }
                    foreach (DataRow dr in dtCardDetaail.Rows)
                    {
                        ctr1 = dtCardDetaail.Rows.Count;
                        txtAmount.Value = float.Parse(dr["cardAmount"].ToString());
                        tdMessage.Visible = false;
                        //  lblAcctName.Text = dr[""].ToString();
                    }
                }
                else
                {
                    string mmsg = "Voucher details has been used!!!";

                    tdMessage.Visible = true;
                        lblMessage.Text = mmsg;
                        lblMessage.ForeColor = Color.Red;
                   // clearf();
                    return;
                }
            }
            
         catch(Exception ex)
            {
                string mmsg = ex.Message; 

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
            // get username
            //
            DataTable dtAcctDetaail = dtProc.getAcct2((cmdAcctType.SelectedIndex.Equals(1)) ? dtProc.getSaveaseID_By_Name(Session["txtUsr"].ToString(), hosts, out expMessage) : txtAccount.Value.ToString(), hosts, out expMessage);
            try { 
            int ctr = dtAcctDetaail.Rows.Count;
                txtAccount.Value = double.Parse(dtProc.getSaveaseID_By_Name(Session["txtUsr"].ToString(), hosts, out expMessage));
            foreach (DataRow dr in dtAcctDetaail.Rows)
            {
                //  txtAmount.Value = float.Parse(dr["cardAmount"].ToString());
                lblAcctName.Text = dr["names"].ToString();
                    HideBenBal.Text=dr["balance"].ToString();
                    HideBenUNAme.Text=dr["saveaseID"].ToString();
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
            if (cmdAcctType.SelectedIndex.Equals(0))
            {
                tblOtherAccounts.Visible = false;
                tblSaveaseAccounts.Visible = false;
                tblSavedBen.Visible = false;
                tblbtn.Visible = false;
            }
            else if (cmdAcctType.SelectedIndex.Equals(1))
            {
                tblOtherAccounts.Visible = false;
                tblSaveaseAccounts.Visible = true;
                tblSavedBen.Visible = false;
                tblbtn.Visible = true;
                trAccountNo.Visible = false;
                trAccountName.Visible = false;
                ConfirmAccount();
            }
            else if (cmdAcctType.SelectedIndex.Equals(2))
            {
                tblOtherAccounts.Visible = false;
                tblSaveaseAccounts.Visible = true;
                tblSavedBen.Visible = false;
                tblbtn.Visible = true;
                trAccountNo.Visible = true;
                trAccountName.Visible = true;
            }
            else if(cmdAcctType.SelectedIndex.Equals(3))
            {
            tblOtherAccounts.Visible = true;
            tblSaveaseAccounts.Visible = false;
                tblSavedBen.Visible = false;
                tblbtn.Visible = true;
            }
            else
            {
            tblOtherAccounts.Visible = false;
            tblSaveaseAccounts.Visible = false;
                tblSavedBen.Visible = true;
                tblbtn.Visible = true;
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
            DataTable dtBanks = dtProc.getBenBySenders1(Session["txtUsr"].ToString().Trim(), hosts, out expMessage);
            //Int32 intRowCtr = dtBanks.Rows.Count;
            if(dtBanks!=null)
            {
                if (dtBanks.Rows.Count!=0 ||dtBanks!=null )
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
              //  lblmes11.Visible = true;
                lblmes11.ForeColor = Color.Red;
                lblmes11.Text = "No beneficiary. Please add beneficiary.";
                return;
            }
         //   lbl
        }
        public void getAcctDetail3()
        {
            string expMessage = "";
            string accNo = cmdSavedBen.SelectedValue;
            DataTable dtBen = dtProc.getSavedBenDeatials(accNo,Session["txtUsr"].ToString().Trim(), hosts, out expMessage);
            //Int32 intRowCtr = dtBen.Rows.Count;
            if(dtBen.Rows.Count!=0 || dtBen!=null)
            foreach(DataRow dr in dtBen.Rows)
            {
                savedBenDetails.Text =  "Acct. No.: " + accNo + "  Bank Name: " + dr["bankName"].ToString();
                savedBenDetails.ForeColor = Color.Green;
                hidAccount3.Text = accNo;hidBankName.Text = dr["bankName"].ToString();hidAcctName.Text=dr["fullname"].ToString();
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
            //try
            //{
            //    
            //    //getCardPin(string pin, string connLocation, out string )
            //   
            //    int ctr = (dtCardDetaail.ToString().Equals(null))?0:dtCardDetaail.Rows.Count;
            //    foreach (DataRow dr in dtCardDetaail.Rows)
            //    {
            //        txtAmount2.Value = float.Parse(dr["cardAmount"].ToString());
            //        //  lblAcctName.Text = dr[""].ToString();
            //    }
            //    return "";
            //}
            //catch(Exception expobj)
            //{
            //    return ""+expobj;
            //}
            string expMessage = "";
            try
            {
                Int32 exitpin = dtProc.usedPin(txtPIN.Value.ToString(), hosts, out expMessage);

                if (exitpin < 1)
                {
                    DataTable dtCardDetaail = dtProc.getCardPin(txtPIN2.Value.ToString(), hosts, out expMessage);
           

                    dtCardDetaail = dtProc.getCardPin(txtPIN2.Value.ToString(), hosts, out expMessage);
                    if (dtCardDetaail == null)
                    {

                        string mmsg = "Invalid Voucher details supplied!!!";

                        // tdMessage.Visible = true;
                        ldlmes2.Text = mmsg;
                        ldlmes2.ForeColor = Color.Red;
                        return"";
                    }
                    foreach (DataRow dr in dtCardDetaail.Rows)
                {
                   txtAmount2.Value = float.Parse(dr["cardAmount"].ToString());
                    //  lblAcctName.Text = dr[""].ToString();
               }
                return "";
                }
                else
                {
                    string mmsg = "Voucher details has been used!!!";

                   // tdMessage.Visible = true;
                    ldlmes2.Text = mmsg;
                    ldlmes2.ForeColor = Color.Red;
                    clearf();
                    return "";
                }
            }

            catch (Exception ex)
            {
                string mmsg = ex.Message;

                tdMessage.Visible = true;
                ldlmes2.Text = mmsg;
                ldlmes2.BorderColor = Color.OrangeRed;
                return"";
            }

        }
        public void ConfirmAccount2()
        {
            string expMessage = "";
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtAcctDetaail = dtProc.getAcct2(txtAccount.Value.ToString(), hosts, out expMessage);
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
           /* getCardPin(string pin, string connLocation, out string )
           
            int ctr = dtCardDetaail.Rows.Count;*/
            
            try
            {
                Int32 exitpin = dtProc.usedPin(txtPIN3.Value.ToString(), hosts, out expMessage);

                if (exitpin < 1)
                {

                    DataTable dtCardDetaail = dtProc.getCardPin(txtPIN3.Value.ToString(), hosts, out expMessage);
                    if (dtCardDetaail == null)
                    {

                        string mmsg = "Invalid Voucher details supplied!!!";

                        tdMessage.Visible = true;
                        lblmes11.Text = mmsg;
                        lblmes11.ForeColor = Color.Red;
                        return;
                    }
                    foreach (DataRow dr in dtCardDetaail.Rows)
                    {
                        txtAmount3.Value = float.Parse(dr["cardAmount"].ToString());
                        //  lblAcctName.Text = dr[""].ToString();
                    }
                }
                else
                {
                    string mmsg = "Voucher details has been used!!!";

                    
                    lblmes11.Text = mmsg;
                    lblmes11.ForeColor = Color.Red;
                    clearf();
                    return;
                   
                }
            }

            catch (Exception ex)
            {
                string mmsg = ex.Message;

                tdMessage.Visible = true;
                lblmes11.Text = mmsg;
                lblmes11.BorderColor = Color.OrangeRed;
                return;
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

        protected void btnDiscardt_Click(object sender, EventArgs e)
        {
            cmdAcctType.Enabled = true;
            txtAccount.Enabled = true;
            txtAccount2.Enabled = true;
            txtAmount.Enabled = true;
            txtAmount2.Enabled = true;
            txtAmount3.Enabled = true;
            txtPIN.Enabled = true;
            txtPIN2.Enabled = true;
            txtPIN3.Enabled = true;
            cmdSavedBen.Enabled = true;
            btnDepozit.Text = "Make Deposit";
            btnCancel.Visible = false;
        }
        protected void btnMakeDepozit_Click(object sender, EventArgs e)
        {
            if(btnDepozit.Text=="Make Deposit")
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
                    string in_narative = "";
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
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Text = "Enter valid pin.";
                        return;
                    }
                    if (cmdAcctType.SelectedIndex.Equals(1) && dtProc.existObjectsy("orderDetails", "card_pin", txtPIN.Text, "and orderStatus='Completed'", hosts, out expObj) < 1)
                    {
                        txtPIN.BorderColor = Color.OrangeRed;
                        tdMessage.Visible = true;
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Text = "Enter valid pin.";
                        return;
                    }

                    if (cmdAcctType.SelectedIndex.Equals(1) && string.IsNullOrEmpty(txtAccount.Text))
                    {
                        txtAccount.BorderColor = Color.OrangeRed;
                        tdMessage.Visible = true;
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Text = "Enter valid Account.";
                        return;
                    }
                    if (cmdAcctType.SelectedIndex.Equals(1) && dtProc.existObjectsy("users", "SaveaseID", txtAccount.Text, "", hosts, out expObj) < 1)
                    {
                        txtAccount.BorderColor = Color.OrangeRed;
                        tdMessage.Visible = true;
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Text = "Enter valid Savease Account.";
                        return;
                    }

                    // Validate controls for other banks account owners
                    //to be created
                    if (cmdAcctType.SelectedIndex.Equals(2) && string.IsNullOrEmpty(txtPIN.Text))
                    {
                        txtPIN2.BorderColor = Color.OrangeRed;
                        tdMessage.Visible = true;
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Text = "Enter valid pin.";
                        return;
                    }
                    if (cmdAcctType.SelectedIndex.Equals(2) && dtProc.existObjectsy("orderDetails", "card_pin", txtPIN2.Text, "and orderStatus='Completed'", hosts, out expObj) < 1)
                    {
                        txtPIN2.BorderColor = Color.OrangeRed;
                        tdMessage.Visible = true;
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Text = "Enter valid pin.";
                        return;
                    }

                    if (cmdAcctType.SelectedIndex.Equals(2) && string.IsNullOrEmpty(txtAccount.Text))
                    {
                        txtAccount2.BorderColor = Color.OrangeRed;
                        tdMessage.Visible = true;
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Text = "Enter valid Account.";
                        return;
                    }


                    // Validate controls for savease saved transactions
                    //to be created
                    if (cmdAcctType.SelectedIndex.Equals(3) && string.IsNullOrEmpty(txtPIN3.Text))
                    {
                        txtPIN3.BorderColor = Color.OrangeRed;
                        tdMessage.Visible = true;
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Text = "Enter valid pin.";
                        return;
                    }
                    if (cmdAcctType.SelectedIndex.Equals(3) && dtProc.existObjectsy("orderDetails", "card_pin", txtPIN3.Text, "and orderStatus='Completed'", hosts, out expObj) < 1)
                    {
                        txtPIN2.BorderColor = Color.OrangeRed;
                        tdMessage.Visible = true;
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Text = "Enter valid pin.";
                        return;
                    }
                    if (cmdAcctType.SelectedIndex.Equals(3) && cmdSavedBen.Items.Count < 1)
                    {
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Text = "Select Account.";
                        return;
                    }
                    if (cmdAcctType.SelectedIndex.Equals(3) && cmdSavedBen.Items.Count < 1)
                    {
                        cmdSavedBen.BorderColor = Color.OrangeRed;
                        // lblmes11.Visible = true;
                        lblmes11.ForeColor = Color.Red;
                        lblmes11.Text = "No beneficiary. Please add beneficiary.";
                        return;
                    }
                    if (cmdAcctType.SelectedIndex.Equals(1))
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
                        in_tranRef = genPin();
                        in_narative = txtTransSumm.Text;
                    }
                    else if (cmdAcctType.SelectedIndex.Equals(2))
                    {
                        in_cardpin = txtPIN.Text;
                        in_cardsn = dtProc.getCardSerial(txtPIN.Text, hosts, out expObj);
                        in_acctNo = txtAccount.Text;
                        in_acctName = (string.IsNullOrEmpty(lblAcctName.Text)) ? "Savease Temp" : lblAcctName.Text;
                        in_amount = double.Parse(txtAmount.Value.ToString());
                        in_bankName = cmdBank.SelectedText;
                        in_depositor = Session["txtUsr"].ToString();
                        in_phoneNumber = "080";
                        in_emailID = "jo@g.com"; // get Email for sender, get email for reciever
                                                 //if transaction initiators saveaseid==accountno then skip sending mail to reciever
                        in_tranRef = genPin();
                        in_narative = txtnara.Text;
                    }
                    else
                    {

                        in_cardpin = txtPIN3.Text;
                        in_cardsn = dtProc.getCardSerial(txtPIN3.Text, hosts, out expObj);
                        in_acctNo = hidAccount3.Text;
                        in_acctName = hidAcctName.Text;
                        in_amount = double.Parse(txtAmount3.Value.ToString());
                        in_bankName = hidBankName.Text;
                        in_depositor = Session["txtUsr"].ToString();
                        in_phoneNumber = "080";
                        in_emailID = "jo@g.com";
                        in_tranRef = "SFD";
                        in_narative = txtbox.Text;
                    }
                    cmdAcctType.Enabled = false;
                    txtAccount.Enabled = false;
                    txtAccount2.Enabled = false;
                    txtAmount.Enabled = false;
                    txtAmount2.Enabled = false;
                    txtAmount3.Enabled = false;
                    txtPIN.Enabled = false;
                    txtPIN2.Enabled = false;
                    txtPIN3.Enabled = false;
                    btnDepozit.Text = "Confirm Deposit";
                    btnCancel.Visible = true;
                    cmdSavedBen.Visible = true;
                    txtbox.Enabled = false;
                    txtTransSumm.Enabled = false;
                    txtnara.Enabled = false;
                    confirmPin();
                } 
                catch(Exception ex)
                {

                }
            }
            else
            {
            string strQueryStrng = "";
                if (cmdAcctType.SelectedIndex == 1)
                    strQueryStrng = "SAC";
                if (cmdAcctType.SelectedIndex == 2)
                    strQueryStrng = "OBC";
                if (cmdAcctType.SelectedIndex == 3)
                    strQueryStrng = "SBC";
                Session["depositz"] = "depositz";

            try
            {
                    confirmPin();
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
                  string in_narative = "";
                  string userName = Session["txtUsr"].ToString();
                string expMessage = "";
                 string SveNAme = dtProc.getDName(Session["txtUsr"].ToString(), hosts, out expMessage);
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
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }
                if (cmdAcctType.SelectedIndex.Equals(1) && dtProc.existObjectsy("orderDetails", "card_pin", txtPIN.Text, "and orderStatus='Completed'", hosts, out expObj) < 1)
                {
                    txtPIN.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }

                if (cmdAcctType.SelectedIndex.Equals(1) && string.IsNullOrEmpty(txtAccount.Text))
                {
                    txtAccount.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid Account.";
                    return;
                }
                if (cmdAcctType.SelectedIndex.Equals(1) && dtProc.existObjectsy("users", "SaveaseID", txtAccount.Text, "", hosts, out expObj) < 1)
                {
                    txtAccount.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid Savease Account.";
                    return;
                }

                // Validate controls for other banks account owners
                //to be created
                if (cmdAcctType.SelectedIndex.Equals(2) && string.IsNullOrEmpty(txtPIN.Text))
                {
                    txtPIN2.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }
                if (cmdAcctType.SelectedIndex.Equals(2) && dtProc.existObjectsy("orderDetails", "card_pin", txtPIN2.Text, "and orderStatus='Completed'", hosts, out expObj) < 1)
                {
                    txtPIN2.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }

                if (cmdAcctType.SelectedIndex.Equals(2) && string.IsNullOrEmpty(txtAccount.Text))
                {
                    txtAccount2.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid Account.";
                    return;
                }


                // Validate controls for savease saved transactions
                //to be created
                if (cmdAcctType.SelectedIndex.Equals(3) && string.IsNullOrEmpty(txtPIN3.Text))
                {
                    txtPIN3.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }
                if (cmdAcctType.SelectedIndex.Equals(3) && dtProc.existObjectsy("orderDetails", "card_pin", txtPIN3.Text, "and orderStatus='Completed'", hosts, out expObj) < 1)
                {
                    txtPIN2.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }
                if (cmdAcctType.SelectedIndex.Equals(3) && cmdSavedBen.Items.Count < 1)
                {
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Select Account.";
                    return;
                }
                if(cmdAcctType.SelectedIndex.Equals(3) && cmdSavedBen.Items.Count<1)
                {
                    cmdSavedBen.BorderColor = Color.OrangeRed;
                   // lblmes11.Visible = true;
                    lblmes11.ForeColor = Color.Red;
                    lblmes11.Text = "No beneficiary. Please add beneficiary.";
                    return;
                }
                if (cmdAcctType.SelectedIndex.Equals(1))
                {
                    in_cardpin = txtPIN.Text;
                    in_cardsn = dtProc.getCardSerial(txtPIN.Text, hosts, out expObj);
                    in_acctNo = txtAccount.Text;
                    in_acctName = lblAcctName.Text;
                    in_amount = double.Parse(txtAmount.Value.ToString());
                    in_bankName = "Savease";
                        in_depositor = SveNAme;
                    in_phoneNumber = "080";
                    in_emailID = "jo@g.com";
                    in_tranRef = genPin();
                    in_narative = txtTransSumm.Text;
                    }
                else if (cmdAcctType.SelectedIndex.Equals(2))
                {
                    in_cardpin = txtPIN.Text;
                    in_cardsn = dtProc.getCardSerial(txtPIN.Text, hosts, out expObj);
                    in_acctNo = txtAccount.Text;
                    in_acctName = (string.IsNullOrEmpty(lblAcctName.Text)) ? "Savease Temp" : lblAcctName.Text;
                    in_amount = double.Parse(txtAmount.Value.ToString());
                    in_bankName = cmdBank.SelectedText;
                    in_depositor = SveNAme;
                    in_phoneNumber = "080";
                    in_emailID = "jo@g.com"; // get Email for sender, get email for reciever
                    //if transaction initiators saveaseid==accountno then skip sending mail to reciever
                    in_tranRef = genPin();
                        in_narative = txtnara.Text;
                }
                else
                {
                    in_cardpin = txtPIN3.Text;
                    in_cardsn = dtProc.getCardSerial(txtPIN3.Text, hosts, out expObj);
                    in_acctNo = hidAccount3.Text;
                    in_acctName = cmdSavedBen.SelectedText;
                    in_amount = double.Parse(txtAmount3.Value.ToString());
                    in_bankName = hidBankName.Text;
                    in_depositor = SveNAme;
                    in_phoneNumber = "080";
                    in_emailID = "jo@g.com";
                    in_tranRef = "SFD" + genPin();
                        in_narative = txtbox.Text;
                        
                }
                // double dblbal = double.Parse(lblBalh.Text) + double.Parse(txtPIN.Text);
                double dblbal = double.Parse(lblBalh.Text);// + in_amount;
                DateTime transDate = DateTime.Today;
                Int32 intDep = dtProc.saveDeposit(in_acctNo, in_cardpin, in_cardsn, in_bankName, in_acctName, in_amount, in_depositor, in_computerName, in_ipaddress, in_tranRef, out expObj,in_narative);
/**/
/*
                    string sveID = dtProc.getSaveaseID_By_Name(Session["txtUsr"].ToString(), hosts, out expMessage);
                   
                        double in_credit = in_amount;
                        double in_debit = 0;
                    if (in_acctNo == sveID)
                    {
                        Int32 intTrans = dtProc.saveTransactiondetails(in_tranRef, "Income(Self Deposit)", in_acctNo, in_acctName, sveID, SveNAme, in_amount, in_debit, in_credit,Session["txtUsr"].ToString(), out expObj);
                      //  Int32 intTran = dtProc.saveTransactiondetails(in_tranRef, "Income(Self Deposit)", in_acctNo, in_acctName, sveID,  in_amount, out expObj);
                    }
                    else if(in_acctNo!= sveID)
                    {
                        string uname = dtProc.getUserNam(txtAccount.Value.ToString(), hosts, out expMessage);
                        //Int32 intTran = dtProc.saveTransactiondetails(in_tranRef, "Income(Self Deposit)", in_acctNo, in_acctName, sveID, Session["txtUsr"].ToString(), in_amount, out expObj);
                        Int32 intTrans = dtProc.saveTransactiondetails(in_tranRef, "Income(ThirdParty Deposit)", in_acctNo, in_acctName, sveID, SveNAme, in_amount, in_debit, in_credit, uname, out expObj);
                    }
                    //Savease Account
                Session["in_acctNameSAC"] = in_acctName;
                Session["in_acctNoSAC"] = in_acctNo;
                Session["in_amountSAC"] = in_amount;
                Session["in_TransRefSAC"] = in_tranRef;
                Session["in_DisplayNameSAC"] = in_tranRef;
                Session["in_date"] = GetDateTime();
                    Session["in_narative"] = in_narative;
                    //Other Banks Account
                    Session["in_BankNameOBC"] = in_bankName;
                if (dtProc.existObjectsy("beneficiaryBank", "acctNo", txtAccount.Text, "and bankName='" + in_bankName + "'", hosts, out expObj) < 1)
                    {
                    dtProc.saveBenDetails(in_acctNo, in_acctName, in_bankName, in_depositor, in_cardpin, in_phoneNumber, in_emailID, out expObj);

                    }
                if (!cmdAcctType.SelectedIndex.Equals(1) && dtProc.existObjectsy("users", "SaveaseID", in_acctNo, "",  hosts, out expObj) > 0)
                {
                   // double newBal = dblbal + in_amount;
                   // dtProc.updateBalance(userName, newBal, out expObj);
                }

                   // confirmPin();
                    if (intDep>0)
                {
                    string expMsg = "";
                    string strUname = dtProc.getUserNam(in_acctNo, hosts, out expMsg);
                    double newBal = getBal(strUname) + in_amount;
                    dtProc.updateBalance(strUname, newBal, out expObj);
                }
                double bbal = getBal(userName);
                dtProc.updateCardpin(in_cardpin, out expObj);
                    */
                    //end comment section
                clearf();
                sendSMS();
                tdMessage.Visible = true;
                lblMessage.ForeColor = Color.Green;
                lblMessage.Text = "Deposit completed successfully.";

//start comment
/*
                    //System Log
                Int32 str_syslog = dtProc.SystemLog(sveID, "Deposit",in_computerName,in_ipaddress,"Deposit.aspx",out expMessage );
                    string strNarative = "";
                //(string strName,string strBank,string strAcctOwner,string strAcctNum,double transAmount, string tranDate,string strNarative,string strBalance)
                string msgBody = formatedSMS(in_acctName, in_bankName, in_depositor, in_acctNo, in_amount, transDate.ToString(), strNarative, bbal.ToString());
                string msgSubjB = "";
                string msgSubjS = "";
                msgSubjB = "Deposit of N" + in_amount + " to " + in_acctName + "<br/>";
                msgSubjS = "Deposit of N" + in_amount + " to " + in_acctName + "<br/>";
                mailMessenger.sendMail2Usr(hidEmailBeneficiary.Value, msgBody, msgSubjB); // Send notification to Beneficiary
                mailMessenger.sendMail2Usr(hidEmailSender.Value, msgBody, msgSubjS); // Send notification to Sender

                   // string expMessage = "";
                   // dtProc.composeMail(in_acctNo, "Credit Alert <Deposit>", " " , in_depositor, in_acctNo, in_depositor, "", out expMessage);
                    dtProc.composeMail("SV000111", "Deposit Notificatio", " " , in_depositor, in_acctNo, in_depositor, "", out expMessage);
*/
//End comment
                    Response.Redirect("successmessage.aspx?strurl="+ strQueryStrng);
            }
            catch (Exception ex)
            {
                tdMessage.Visible = true;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = ex.Message;
                lblMessage.BorderColor = Color.OrangeRed;
                return;
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
        protected void clearf()
        {

            txtAmount.Text = "";
            txtPIN.Text = "";
            txtAccount.Text = "";
            lblAcctName.Text = "";
            lblAcctName2.Text = "";
            txtPIN2.Text = "";
            txtPIN3.Text = "";


            //cmdAcctType.Enabled = true.Equals(string.Empty);
            txtAccount.Enabled = false.Equals(string.Empty);
            txtAccount2.Enabled = false.Equals(string.Empty);
            txtAmount.Enabled = false.Equals(string.Empty);
            txtAmount2.Enabled = false.Equals(string.Empty);
            txtAmount3.Enabled = false.Equals(string.Empty);
            txtPIN.Enabled = false.Equals(string.Empty);
            txtPIN2.Enabled = false.Equals(string.Empty);
            txtPIN3.Enabled = false.Equals(string.Empty);
            cmdSavedBen.Enabled = false.Equals(string.Empty);
            btnDepozit.Text = "Make Deposit";
            btnCancel.Visible = false;
        }
        protected void btnMakeDepozit_Click1(object sender, EventArgs e)
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
                string in_naration = "";

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
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }
                if (cmdAcctType.SelectedIndex.Equals(0) && dtProc.existObjectsy("orderDetails", "card_pin", txtPIN.Text, "and orderStatus='Completed'", hosts, out expObj) < 1)
                {
                    txtPIN.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }

                if (cmdAcctType.SelectedIndex.Equals(0) && string.IsNullOrEmpty(txtAccount.Text))
                {
                    txtAccount.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid Account.";
                    return;
                }
                if (cmdAcctType.SelectedIndex.Equals(0) && dtProc.existObjectsy("users", "SaveaseID", txtAccount.Text, "", hosts, out expObj) < 1)
                {
                    txtAccount.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid Savease Account.";
                    return;
                }

                // Validate controls for other banks account owners
                //to be created
                if (cmdAcctType.SelectedIndex.Equals(1) && string.IsNullOrEmpty(txtPIN.Text))
                {
                    txtPIN2.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }
                if (cmdAcctType.SelectedIndex.Equals(1) && dtProc.existObjectsy("orderDetails", "card_pin", txtPIN2.Text, "and orderStatus='Completed'", hosts, out expObj) < 1)
                {
                    txtPIN2.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }

                if (cmdAcctType.SelectedIndex.Equals(1) && string.IsNullOrEmpty(txtAccount.Text))
                {
                    txtAccount2.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid Account.";
                    return;
                }


                // Validate controls for savease saved transactions
                //to be created
                if (cmdAcctType.SelectedIndex.Equals(2) && string.IsNullOrEmpty(txtPIN3.Text))
                {
                    txtPIN3.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }
                if (cmdAcctType.SelectedIndex.Equals(2) && dtProc.existObjectsy("orderDetails", "card_pin", txtPIN3.Text, "and orderStatus='Completed'", hosts, out expObj) < 1)
                {
                    txtPIN2.BorderColor = Color.OrangeRed;
                    tdMessage.Visible = true;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "Enter valid pin.";
                    return;
                }
                if (cmdAcctType.SelectedIndex.Equals(2) && cmdSavedBen.Items.Count < 1)
                {
                    lblMessage.ForeColor = Color.Red;
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
                    in_tranRef = genPin();
                }
                else if (cmdAcctType.SelectedIndex.Equals(1))
                {
                    in_cardpin = txtPIN.Text;
                    in_cardsn = dtProc.getCardSerial(txtPIN.Text, hosts, out expObj);
                    in_acctNo = txtAccount.Text;
                    in_acctName = (string.IsNullOrEmpty(lblAcctName.Text)) ? "Savease Temp" : lblAcctName.Text;
                    in_amount = double.Parse(txtAmount.Value.ToString());
                    in_bankName = cmdBank.SelectedText;
                    in_depositor = Session["txtUsr"].ToString();
                    in_phoneNumber = "080";
                    in_emailID = "jo@g.com"; // get Email for sender, get email for reciever
                    //if transaction initiators saveaseid==accountno then skip sending mail to reciever
                    in_tranRef =  genPin();
                }
                else
                {
                    in_cardpin = txtPIN3.Text;
                    in_cardsn = dtProc.getCardSerial(txtPIN3.Text, hosts, out expObj);
                    in_acctNo = hidAccount3.Text;
                    in_acctName = hidAcctName.Text;
                    in_amount = double.Parse(txtAmount3.Value.ToString());
                    in_bankName = hidBankName.Text;
                    in_depositor = Session["txtUsr"].ToString();
                    in_phoneNumber = "080";
                    in_emailID = "jo@g.com";
                    in_tranRef = "SFD" + genPin();
                }
                // double dblbal = double.Parse(lblBalh.Text) + double.Parse(txtPIN.Text);
                double dblbal = double.Parse(lblBalh.Text);// + in_amount;
                DateTime transDate = DateTime.Today;
                Int32 intDep = dtProc.saveDeposit(in_acctNo, in_cardpin, in_cardsn, in_bankName, in_acctName, in_amount, in_depositor, in_computerName, in_ipaddress, in_tranRef, out expObj,in_naration);
                Session["in_acctNameSAC"] = in_acctName;
                Session["in_acctNoSAC"] = in_acctNo;
                Session["in_amountSAC"] = in_amount;
                if (dtProc.existObjectsy("beneficiaryBank", "acctNo", txtAccount.Text, "and bankName='" + in_bankName + "'", hosts, out expObj) < 1)
                    dtProc.saveBenDetails(in_acctNo, in_acctName, in_bankName, in_depositor, in_cardpin, in_phoneNumber, in_emailID, out expObj);

                if (!cmdAcctType.SelectedIndex.Equals(1) && dtProc.existObjectsy("users", "SaveaseID", txtAccount.Text, "", hosts, out expObj) > 0)
                {
                    double newBal = dblbal + in_amount;
                    dtProc.updateBalance(userName, newBal, out expObj);
                }
                mailHelper mh = new mailHelper();
                double bbal = getBal(userName);
                sendSMS();
                Response.Redirect("successmessage.aspx");
                tdMessage.Visible = true;
                lblMessage.Text = "Deposit completed successfully.";
                lblMessage.ForeColor = Color.Green;
               string strNarative = "";
                DateTime TransDate = DateTime.Today;
                //(string strName,string strBank,string strAcctOwner,string strAcctNum,double transAmount, string tranDate,string strNarative,string strBalance)
                // string msgBody = formatedSMS(in_acctName, in_bankName, in_depositor, in_acctNo, in_amount, transDate.ToString(), strNarative, bbal.ToString());
                string msgBody = mh.populateBody2(in_bankName, in_depositor, in_acctNo, TransDate.ToString());
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
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = ex.Message;
                lblMessage.BorderColor = Color.OrangeRed;
                return;
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


        //
        // End Saved Beneficiary
        //
    }
}