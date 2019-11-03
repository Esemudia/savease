using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace saveasze
{
    public partial class buypin : System.Web.UI.Page
    {
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
        MailMgr mailMessenger = new MailMgr();
        /* */
        DataTable dt50 = new DataTable();
        DataTable dt100 = new DataTable();
        DataTable dt200 = new DataTable();
        DataTable dt500 = new DataTable();
        DataTable dt1000 = new DataTable();
        DataTable dt2000 = new DataTable();
        DataTable dt5000 = new DataTable();
        Int32 intOut = 0;
        Int32 snCounter = 0;
        DataTable dttable = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            // hosts = Session["hosts"].ToString();
            /*      GridView1.HeaderStyle.Height = 12;
                  GridView1.RowStyle.Height = 12;
                  GridView1.AlternatingRowStyle.Height = 12;
                  GridView1.RowStyle.Font.Size = 10;
                  GridView1.AlternatingRowStyle.Font.Size = 10;*/
            string userName = "";
            hosts = Request.Url.Host;
            if (Session["txtUsr"].ToString() == null || Session["txtUsr"].ToString() == "")
                userName = "";
            else
                userName = Session["txtUsr"].ToString();
            DataTable dtBal = dtProc.getBalance(userName, hosts, out string expMessage);

            foreach (DataRow dr in dtBal.Rows)
            {
                String saveaseID = dr["saveaseID"].ToString();
                String FName = dr["fname"].ToString();
                String lName = dr["lname"].ToString();
                String bal = dr["balance"].ToString();

                lblBalh.Text = bal;
                lblBalh.Visible = false;
                // lblBal.Text = FName + " " + lName + "( N" + bal + " )";
                double dblBal = Double.Parse(bal);
                lblBal.Font.Bold = true;
                lblBal.Text ="Balance:  N" + dblBal+".00";
                lblBal.ForeColor = System.Drawing.Color.Blue;
                // lblBal.Font = new Font(lblBal.Font, FontStyle.Bold);
                //lblBal.Text = saveaseID + " - " + FName + " " + lName + "( N" + bal + " )";
                hideDispName.Value = FName + " " + lName;
                hideSaveaseID.Value = saveaseID;
            }
            if (!Page.IsPostBack)
            {
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
        protected void TextBoxPrice_TextChanged(object sender, EventArgs e)
        {
            //intOut is no more used for anything anymore
            // DataTable dttable = new DataTable();
            
            string str50 = (string.IsNullOrEmpty(txt50.Text)) ? "0" : txt50.Text;
            Int32 int50 = Int32.Parse(str50) * 50;
            rst50.Text = "N" + String.Format("{0:n}", int50);
            Int32 intTxt50 = Int32.Parse(txt50.Text);
            if (intTxt50 > 0)
                //dt50 =getTable(intTxt50,out intOut);
                dt50 = getTable(intTxt50, "50", snCounter, out intOut);
            if (dt50.Rows.Count > 0)
                dttable = dt50;
            /**/
            // rst50.Text = int500.ToString(); 

            string str100 = (string.IsNullOrEmpty(txt100.Text)) ? "0" : txt100.Text;
            Int32 int100 = Int32.Parse(str100) * 100;
            rst100.Text = "N" + String.Format("{0:n}", int100);
            Int32 intTxt100 = Int32.Parse(txt100.Text);
            if (intTxt100 > 0)
                //dt100 =getTable(intTxt100);
                dt100 = getTable(intTxt100, "100", snCounter, out intOut);

            if (dttable.Rows.Count > 0 && dt100.Rows.Count > 0)
                dttable.Merge(dt100);
            else if (dttable.Rows.Count <= 0 && dt100.Rows.Count > 0)
                dttable = dt100;/**/
            // rst100.Text = int500.ToString();

            string str200 = (string.IsNullOrEmpty(txt200.Text)) ? "0" : txt200.Text;
            Int32 int200 = Int32.Parse(str200) * 200;
            rst200.Text = "N" + String.Format("{0:n}", int200);
            Int32 intTxt200 = Int32.Parse(txt200.Text);
            if (intTxt200 > 0)
                //(Int32 pinQty,string cardType,Int32 snCounter, out Int32 intout)
                dt200 = getTable(intTxt200, "200", snCounter, out intOut);
            if (dttable.Rows.Count > 0 && dt200.Rows.Count > 0)
                dttable.Merge(dt200);
            else if (dttable.Rows.Count <= 0 && dt200.Rows.Count > 0)
                dttable = dt200;/**/
            // rst200.Text = int500.ToString();

            string str500 = (string.IsNullOrEmpty(txt500.Text)) ? "0" : txt500.Text;
            Int32 int500 = Int32.Parse(str500) * 500;
            rst500.Text = "N" + String.Format("{0:n}", int500);
            Int32 intTxt500 = Int32.Parse(txt500.Text);
            if (intTxt500 > 0)
                //dt500 =getTable(intTxt500);
                dt500 = getTable(intTxt500, "500", snCounter, out intOut);
            if (dttable.Rows.Count > 0 && dt500.Rows.Count > 0)
                dttable.Merge(dt500);
            else if (dttable.Rows.Count <= 0 && dt500.Rows.Count > 0)
                dttable = dt500;/**/
            // rst500.Text = int500.ToString();

            string str1000 = (string.IsNullOrEmpty(txt1000.Text)) ? "0" : txt1000.Text;
            Int32 int1000 = Int32.Parse(str1000) * 1000;
            rst1000.Text = "N" + String.Format("{0:n}", int1000);
            Int32 intTxt1000 = Int32.Parse(txt1000.Text);
            if (intTxt1000 > 0)
                //dt1000 =getTable(intTxt1000);
                dt1000 = getTable(intTxt1000, "1000", snCounter, out intOut);
            if (dttable.Rows.Count > 0 && dt1000.Rows.Count > 0)
                dttable.Merge(dt1000);
            else if (dttable.Rows.Count <= 0 && dt1000.Rows.Count > 0)
                dttable = dt1000;/* */
            // rst1000.Text = int1000.ToString();

            string str2000 = (string.IsNullOrEmpty(txt2000.Text)) ? "0" : txt2000.Text;
            Int32 int2000 = Int32.Parse(str2000) * 2000;
            rst2000.Text = "N" + String.Format("{0:n}", int2000);
            Int32 intTxt2000 = Int32.Parse(txt2000.Text);
            if (intTxt2000 > 0)
                //dt2000 =getTable(intTxt2000);
                dt2000 = getTable(intTxt2000, "2000", snCounter, out intOut);
            if (dttable.Rows.Count > 0 && dt2000.Rows.Count > 0)
                dttable.Merge(dt2000);
            else if (dttable.Rows.Count <= 0 && dt2000.Rows.Count > 0)
                dttable = dt2000;/**/
            // rst2000.Text = int2000.ToString();

            string str5000 = (string.IsNullOrEmpty(txt5000.Text)) ? "0" : txt5000.Text;
            Int32 int5000 = Int32.Parse(str5000) * 5000;
            rst5000.Text = "N" + String.Format("{0:n}", int5000);
            Int32 intTxt5000 = Int32.Parse(txt5000.Text);
            if (intTxt5000 > 0)
                //dt5000 =getTable(intTxt5000);
                dt5000 = getTable(intTxt5000, "5000", snCounter, out intOut);
            if (dttable.Rows.Count > 0 && dt5000.Rows.Count > 0)
                dttable.Merge(dt5000);
            else if (dttable.Rows.Count <= 0 && dt5000.Rows.Count > 0)
                dttable = dt5000;
            //rst1000.Text = int1000.ToString();

            Int32 intrst = int50 + int100 + int200 + int500 + int1000 + int2000 + int5000;

            string expMessage = "";
            string  strCharge= dtProc.getCommision("Purchase Pin", hosts, out expMessage);
            if (string.IsNullOrEmpty(strCharge))
                strCharge = "0";
            double dblCharge = double.Parse(strCharge);
            double chargePercentage = (dblCharge * intrst) /100 ;
           // double dblGrandTotal = intrst + chargePercentage;
            double dblGrandTotal = intrst - chargePercentage;
            hideCharge.Value = chargePercentage.ToString();
            hideChargeCum.Value = dblGrandTotal.ToString();
            rstSubTotalh.Text = intrst.ToString();
            rstSubTotal.Text = "Sub-Total: N" + String.Format("{0:n}", intrst);
            
            rstCommission.Text="Commission: N" + String.Format("{0:n}", chargePercentage);
            rstTotalh.Text = dblGrandTotal.ToString();
            rstTotal.Text = "Order Total: N" + String.Format("{0:n}", dblGrandTotal);
            /* 
             double total = 5000;
            double chargePercentage = (dblPerc * total) /100 ;
            double totalz = total - chargePercentage;
            */
            Int32 dtCount = dttable.Rows.Count;
            DataColumn dc = new DataColumn("SN");
            dc.AutoIncrement = true;
            dc.AutoIncrementSeed = 1;
            dc.AutoIncrementStep = 1;
            dttable.Columns.Add(dc);
            dc.SetOrdinal(0);

            //Set values for existing rows  
            for (int i = 0; i <= dttable.Rows.Count - 1; i++)
            {
                dttable.Rows[i]["SN"] = i + 1;
            }
            GridView1.DataSource = dttable;
            GridView1.DataBind();
            //rstSubTotal.Text = intrst.ToString();

            /*
             */
        }
        public DataTable getTable(Int32 pinQty, string cardType, Int32 snCounter, out Int32 intout)
        {
            // Here we create a DataTable with four columns.
            DataTable table = new DataTable();
            table.Columns.Add("CardType", typeof(string));
            table.Columns.Add("PIN", typeof(string));
            table.Columns.Add("PinSerial", typeof(string));
            table.Columns.Add("CreatedDate", typeof(DateTime));
            intout = 0;
            DataRow row;
            // Here we add five DataRows.
            /*
            for (int i = 1; i <= pinQty; i++)
            {
                DataRow row = table.NewRow();

                table.Rows.Add(row);
                table.Rows.Add(, genPin(), genSN(), DateTime.Now);
            }*/
            for (int i = 1; i <= pinQty; i++)
            {
                row = table.NewRow();
                row["CardType"] = cardType;
                row["PIN"] = genPin();
                row["PinSerial"] = genSN();
                row["CreatedDate"] = DateTime.Now;
                table.Rows.Add(row);
            }
            int counttr = table.Rows.Count;
            return table;
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
        protected void btnOrder_click(object sender, EventArgs e)
        {    string expMessage ="" ;
            string sveIDs = dtProc.getSaveaseID_By_Name(Session["txtUsr"].ToString(), hosts, out expMessage);
            if (t_c_new.Checked!=true)
            {

                string message = "Read and accept our terms and condition.";
               
                lblDispError.Text = message;
                lblDispError.ForeColor = System.Drawing.Color.Red;
                return;
            }
            float flBal = float.Parse(lblBalh.Text);
            float flTotal = float.Parse(rstTotalh.Text);
            string usr = Session["txtUsr"].ToString();
            if (!string.IsNullOrEmpty(usr) && flBal < flTotal)
            {
                string message = "Insufficient balance!!! Please credit savease account.";
                lblDispError.Text = message;
                lblDispError.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Int32 insertStatus = 0;
            string in_orderNumber = getOrderNumber();
            // foreach (GridViewRow row in GridView1.Rows)
            string tblOrder = "<strong>Order Number: "+ in_orderNumber;
            string tblTR = "";
           // tblOrder = tblOrder + "<table><tr>";
            tblOrder = tblOrder + "<table><tr><td>";
            string tblBody = "";
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                string expObj = "";
                string in_card_pin = genPin();
                // string in_card_pin =GridView1.Rows[i].Cells[2].Text.ToString();
                string in_cardpin_sn = genSN();
                //string in_cardpin_sn = GridView1.Rows[i].Cells[3].Text.ToString();
                string in_cardType = GridView1.Rows[i].Cells[1].Text.ToString();
                double in_cardAmount = Double.Parse(in_cardType);
                double in_chargeOnCard = double.Parse(hideChargeCum.Value);
                double in_percentageCharg = double.Parse(hideCharge.Value);
                //string in_orderby = "Admin";
                string in_orderby = Session["txtUsr"].ToString();
                string in_computerName = "";
                string in_ipaddress = "";
                string strProcedure = "";
              
                // if (Session["txtUsr"].ToString().Equals(null) || Session["txtUsr"].ToString().Equals(""))
                //    strProcedure = "Pending";
                //  else
              //  string SveNAme = dtProc.getDName(Session["txtUsr"].ToString(), hosts, out expMessage);
                strProcedure = "Completed";
                dtProc.saveOrder(strProcedure, in_card_pin, in_cardpin_sn, in_orderNumber, in_cardType, in_cardAmount, in_chargeOnCard, in_percentageCharg, in_orderby, in_computerName, in_ipaddress, out expObj);
               // string sveID = dtProc.getSaveaseID_By_Name(Session["txtUsr"].ToString(), hosts, out expMessage);
                //string in_tranRef = getref();
                //double in_credit = in_amount;
               

                 
                tblTR = tblTR + "<table border='1'>";
                tblTR = tblTR + "< tr><td> PIN: '" + in_card_pin + "'</td></tr>";
                tblTR = tblTR + "< tr><td> S/N: '" + in_cardpin_sn + "'</td></tr>";
                tblTR = tblTR + "< tr><td> Amount: '" + in_cardAmount + "'</td></tr>";
                tblTR = tblTR +"</table>";
                 if (expObj.Equals("") && strProcedure == "Completed")
                {

                    Session["in_orderSAC"] = in_orderNumber;
                }
                else
                {
                    lblDispError.Text = " Error Purchasing PIN: " + expObj;
                    lblDispError.ForeColor = System.Drawing.Color.Red;

                }
            }
            string expObj1 = "";
           // string in_card_pin = genPin();
            // string in_card_pin =GridView1.Rows[i].Cells[2].Text.ToString();
            //string in_cardpin_sn = genSN();
            //string in_cardpin_sn = GridView1.Rows[i].Cells[3].Text.ToString();
            //string in_cardType = GridView1.Rows[i].Cells[1].Text.ToString();
           // double in_cardAmount = Double.Parse(in_cardType);
            double in_chargeOnCard1 = double.Parse(hideChargeCum.Value);
            //double in_percentageCharg = double.Parse(hideCharge.Value);
            //string in_orderby = "Admin";
            string in_orderby1 = Session["txtUsr"].ToString();
            //string in_computerName = "";
           // string in_ipaddress = "";
           // string strProcedure = "";

            // if (Session["txtUsr"].ToString().Equals(null) || Session["txtUsr"].ToString().Equals(""))
            //    strProcedure = "Pending";
            //  else
            /*
            string SveNAme = dtProc.getDName(Session["txtUsr"].ToString(), hosts, out expMessage);
            //strProcedure = "Completed";
            //dtProc.saveOrder(strProcedure, in_card_pin, in_cardpin_sn, in_orderNumber, in_cardType, in_cardAmount, in_chargeOnCard, in_percentageCharg, in_orderby, in_computerName, in_ipaddress, out expObj);
            string sveID = dtProc.getSaveaseID_By_Name(Session["txtUsr"].ToString(), hosts, out expMessage);
            string in_tranRef =dtProc.getref();
            double in_debit = in_chargeOnCard1;
            if (sveIDs == sveID)
            {
                Int32 intTrans = dtProc.saveTransactiondetails(in_orderNumber, "Expenses(Buy Voucher)", sveID, SveNAme, sveID, SveNAme, in_chargeOnCard1, in_debit, 0, Session["txtUsr"].ToString(), out expObj1);
                //  Int32 intTran = dtProc.saveTransactiondetails(in_tranRef, "Income(Self Deposit)", in_acctNo, in_acctName, sveID,  in_amount, out expObj);
            }
            else
            {
                return;
            }
*/
            tblOrder = tblOrder +tblBody+ tblTR + "</td></tr></table>";

           // string expMessage = "";
            double newBal = flBal - flTotal;
            //string strUname = dtProc.getUserNam(, hosts, out expMessage);
            lblBal.Text = "Balance:  N" + newBal;


            mailHelper mh = new mailHelper();
            DateTime TransDate = DateTime.Today;
            string strUsr = getBal();
            string msgBody = mh.populatBuyPin(TransDate.ToString(), tblOrder);
          
           string msgSubjS = "Voucher purchase of N" + rstTotalh.Text + "<br/>";
            mailMessenger.sendMail2Usr(strUsr, msgBody, msgSubjS);
            Response.Redirect("successmessage.aspx?strurl=BUY");
        }
        public string getBal()
        {
            string userName = Session["txtUsr"].ToString();
            string expMessage;
            DataTable dtBal = dtProc.getBalance(userName, hosts, out expMessage);
            foreach (DataRow dr in dtBal.Rows)
            {
                try
                {
                    String saveaseID = dr["saveaseID"].ToString();
                    return saveaseID;
                }
                catch (Exception expp)
                {
                    //bal = "-1";
                }
            }
            return ToString();

        }
        protected void chkAgree_CheckedChanged(object sender, EventArgs e)
        {
            float n;
            string strRstTotal = rstTotalh.Text;
            strRstTotal = (float.TryParse(strRstTotal, out n)) ? strRstTotal : strRstTotal.Substring(1);

            bool isNumeric = (strRstTotal.Equals("0.00")) ? false : true;// ;
            n = float.Parse(strRstTotal);
            if (!isNumeric)
            {
                chkAgree.Checked = false;
                btnSubmit.Enabled = false;
                return;
            }
            else
                btnSubmit.Enabled = true;
            if (chkAgree.Checked == false)
                btnSubmit.Enabled = false;
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
    }
}