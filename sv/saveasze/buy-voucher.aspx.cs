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
    public partial class buy_voucher : System.Web.UI.Page
    {
        MailMgr mailMessenger = new MailMgr();
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
        DataTable dtBankDeposit = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            string userName = "";
            hosts = Request.Url.Host;
            if (!Page.IsPostBack)
            {
                if (Session["txtUsr"].ToString() == null || Session["txtUsr"].ToString() == "")
                Response.Redirect("login.aspx");
            else
                userName = Session["txtUsr"].ToString();
            DataTable dtBal = dtProc.getBalance(userName, hosts, out string expMessage);

            foreach (DataRow dr in dtBal.Rows)
            {
                String saveaseID = dr["saveaseID"].ToString();
                String FName = dr["fname"].ToString();
                String lName = dr["lname"].ToString();
                String bal = dr["balance"].ToString();

              //  lblBalh.Text = bal;
             //   lblBalh.Visible = false;
                // lblBal.Text = FName + " " + lName + "( N" + bal + " )";
                double dblBal = Double.Parse(bal);
               // lblBal.Font.Bold = true;
               // lblBal.Text = "Balance:  N" + dblBal + ".00";
              //  lblBal.ForeColor = System.Drawing.Color.Blue;
                // lblBal.Font = new Font(lblBal.Font, FontStyle.Bold);
                //lblBal.Text = saveaseID + " - " + FName + " " + lName + "( N" + bal + " )";
              //  hideDispName.Value = FName + " " + lName;
              //  hideSaveaseID.Value = saveaseID;
            }
           

            }
        }
        public string genSN()
        {
            Random rnd = new Random();
            string rands = "";
            for (int i = 0; i < 2; i++)
            {
                int myRandomNo = rnd.Next(10000000, 99999999);
                rands = rands + myRandomNo;
            }
            return rands;
        }
        public string genPin()
        {
            Random rnd = new Random();
            string rands = "", rands1 = "";
            for (int i = 0; i < 2; i++)
            {
                int myRandomNo = rnd.Next(100000, 999999);
                rands = rands + myRandomNo;
            }
            return rands;
        }
        protected void txtqty_TextChanged(object sender, EventArgs e)
        {
            if (rdbtn.SelectedValue == "0.5")
            {
                double incardty = Convert.ToDouble(drplist.SelectedValue);
                double qty = Convert.ToDouble(txtqty.Text);
                double perctage = 0.5;
                double subt = incardty * qty;
                double sum = ((subt * perctage) / 100);
                lblamout.Text = (subt-sum).ToString();
                lblamout.ForeColor = Color.Green;
                return;
            }
            if (rdbtn.SelectedValue == "1.5")
            {
                double incardty = Convert.ToDouble(drplist.SelectedValue);
                double qty = Convert.ToDouble(txtqty.Text);
                double perctage = 0.5;
                double subt = incardty * qty;
                double sum = ((subt * perctage) / 100);
                lblamout.Text = sum.ToString();
                lblamout.ForeColor = Color.Green;
            }
            if (rdbtn.SelectedValue == "1.0")
            {
                double incardty = Convert.ToDouble(drplist.SelectedValue);
                double qty = Convert.ToDouble(txtqty.Text);
                double perctage = 1.0;
                double subt = incardty * qty;
                double sum = ((subt * perctage) / 100);
                lblamout.Text = sum.ToString();
                lblamout.ForeColor = Color.Green;
            }
            if (rdbtn.SelectedValue == "1.5")
            {
                double incardty = Convert.ToDouble(drplist.SelectedValue);
                double qty = Convert.ToDouble(txtqty.Text);
                double perctage = 1.5;
                double subt = incardty * qty;
                double sum = ((subt * perctage) / 100);
                lblamout.Text = sum.ToString();
                lblamout.ForeColor = Color.Green;
            }
            if (rdbtn.SelectedValue == "2.0")
            {
                double incardty = Convert.ToDouble(drplist.SelectedValue);
                double qty = Convert.ToDouble(txtqty.Text);
                double perctage = 2.0;
                double subt = incardty * qty;
                double sum = ((subt * perctage) / 100);
                lblamout.Text = sum.ToString();
                lblamout.ForeColor = Color.Green;
            }
            else
            {
               
                lblamout.Text = "Please Select a Percentage Charge!!!";
                lblamout.ForeColor = Color.Red;
            }
        }
        public string getOrderNumber()
        {
            string getdates = DateTime.Now.ToString("d/M/yyyy");
            getdates = getdates.Replace("/", "");
            getdates = getdates.Trim();
            // if(getdates.Length<)
            Random rnd = new Random();
            string rands = "";
            //for (int i = 0; i < 2; i++)
            // {
            int myRandomNo = rnd.Next(100000, 999999);
            rands = rands + myRandomNo;
            // }
            return rands + getdates;
        }
        public double getBal()
        {
            String bal = "";
            string expMessage;
            DataTable dtBal = dtProc.getBalance(Session["txtUsr"].ToString(), hosts, out expMessage);
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

                    //lblBalh.Text = bal;
                    //lblBalh.Text = bal;
                    //lblBalh.Font.Bold = true;
                    //lblBalh.ForeColor = Color.Blue;
                    //lblBalh.Visible = true;
                    //lblBalh.Text = saveaseID + " - " + FName + " " + lName + " ( N" + bal + " )";
                }
                catch (Exception expp)
                {
                    bal = "-1";
                }
            }
            return double.Parse(bal);
        }

        protected void btnBuypin_Click(object sender, EventArgs e)
        {
            string cardtype = drplist.SelectedValue;
            double price = Double.Parse(lblamout.Text);
            double in_cardamount = getincard();
            double perctage = Double.Parse(rdbtn.SelectedValue);
            Int32 qty = Int32.Parse(txtqty.Text);
            string expMessage = "";
            string sveIDs = dtProc.getSaveaseID_By_Name(Session["txtUsr"].ToString(), hosts, out expMessage);
            string bal = Convert.ToString(getBal());
           
            string usr = Session["txtUsr"].ToString();
            if (getBal() < price)
            {
                string message = "Insufficient balance!!! Please credit savease account.";
                lblDispError.Text = message;
                lblDispError.ForeColor = Color.Red;
                return;
            }
            else
            {
                Int32 saveorder = dtProc.saveOrder2(sveIDs, "Completed", cardtype, in_cardamount, price, perctage, usr, computerName(), ipaddress1(), out expMessage,qty, bal);
                if (saveorder == 1)
                {
                    string message = "Your Card Purcharse was successful";
                    lblDispError.Text = message;
                    lblDispError.ForeColor = Color.Red;
                    return;
                }
                else
                {
                    string message = "Error in Purcharse";
                    lblDispError.Text = message;
                    lblDispError.ForeColor = Color.Red;
                    return;
                }
            }
           

        }
        public double getincard()
        {
            double price = Double.Parse(lblamout.Text);
            double qty = Convert.ToDouble(txtqty.Text);
            //d cardty = "";
            double cardtpy = price / qty;
           
            return cardtpy;
        }
        public string computerName()
        {
            return Dns.GetHostByName(Dns.GetHostName()).AddressList[0].ToString();
        }
        public string ipaddress1()
        {
            return HttpContext.Current.Request.UserHostAddress;
        }
    }
}