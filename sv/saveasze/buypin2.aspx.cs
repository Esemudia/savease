using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class buypin2 : System.Web.UI.Page
    {

        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
        /* */
        DataTable dt50 = new DataTable();
        DataTable dt100 = new DataTable();
        DataTable dt200 = new DataTable();
        DataTable dt500 = new DataTable();
        DataTable dt1000 = new DataTable();
        DataTable dt2000 = new DataTable();
        DataTable dt5000 = new DataTable();
        DataTable dtCard = new DataTable();
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
            hosts = Request.Url.Host; ;
            if(!Page.IsPostBack)
            {
                btnSubmit.Enabled = false;
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
             //rstSubTotal.Text = intrst.ToString();

            /*
             */
        }
        protected void btnAdd_Click(object sender, ImageClickEventArgs e)
        {
            string strCard = drpCardType.SelectedValue;// Get card type from dropdown
            if (String.IsNullOrEmpty(txtQtys.Text) || txtQtys.Text == "0")
            {
                txtQtys.BorderStyle = BorderStyle.Solid;
                txtQtys.BackColor=Color.Red;
                return;
            }
            addCards(strCard);
            // Int32 intTxt50 = Int32.Parse(txt50.Text);
        }
        public void addCards(string strCard)
        {

            Int32 lineAmount = Int32.Parse(txtQtys.Text) * Int32.Parse(strCard);// Line Amount for each selection
            dtCard = getTable(Int32.Parse(txtQtys.Text), strCard, snCounter, out intOut);
            rstLineAmount.Text = "N " + String.Format("{0:n}", lineAmount);
            hidRst.Value = lineAmount.ToString();

            DataColumn dc = new DataColumn("SN");
            dc.AutoIncrement = true;
            dc.AutoIncrementSeed = 1;
            dc.AutoIncrementStep = 1;
            dtCard.Columns.Add(dc);
            dc.SetOrdinal(0);

            //Set values for existing rows  
            for (int i = 0; i <= dtCard.Rows.Count - 1; i++)
            {
                dtCard.Rows[i]["SN"] = i + 1;
            }
            GridView1.DataSource = dtCard;
            GridView1.DataBind();
        }
        public DataTable getTable(Int32 pinQty,string cardType,Int32 snCounter, out Int32 intout)
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
        public string genPin()
        {
            Random rnd = new Random();
            string rands = "";
            for (int i = 0; i < 2; i++)
            {
                int myRandomNo = rnd.Next(100000, 999999);
                rands = rands + myRandomNo;
            }
            return rands;
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
        protected void btnOrder_click(object sender, EventArgs e)
        {
             Int32 insertStatus = 0;
                string in_orderNumber = getOrderNumber();
           // foreach (GridViewRow row in GridView1.Rows)
                for (int i=0;i<GridView1.Rows.Count;i++)
                {
                string expObj = "";
                string in_card_pin = genPin();
               // string in_card_pin =GridView1.Rows[i].Cells[2].Text.ToString();
                string in_cardpin_sn = genSN();
                //string in_cardpin_sn = GridView1.Rows[i].Cells[3].Text.ToString();
                string in_cardType = GridView1.Rows[i].Cells[1].Text.ToString();
                double in_cardAmount = Double.Parse(in_cardType);
                double in_chargeOnCard = 0;
                string in_orderby = "Admin";
                string in_computerName = "";
                string in_ipaddress = "";
                string strProcedure = "";
                if (Session["txtUsr"].ToString().Equals(null) || Session["txtUsr"].ToString().Equals(""))
                    strProcedure = "Pending";
                else
                    strProcedure = "Completed";
                    dtProc.saveOrder(strProcedure, in_card_pin, in_cardpin_sn, in_orderNumber, in_cardType, in_cardAmount, in_chargeOnCard, in_orderby, in_computerName, in_ipaddress, out expObj);
                lblDispError.Visible = true;
                if (expObj.Equals("") && strProcedure== "Pending")
                {
                    lblDispError.Text = "Scheduled Order ("+in_orderNumber+") Completed Successfully.";
                    lblDispError.ForeColor = Color.Green;
                }
                else if (expObj.Equals("") && strProcedure == "Completed")
                {
                    lblDispError.Text = " Order (" + in_orderNumber + ") Purchase Completed Successfully.";
                }
                else
                {
                    lblDispError.Text = " Error Purchasing PIN: "+ expObj;

                }
            }
            /*
        foreach (DataRow dtr in dttable.Rows)
        {
            string expObj = "";
            string in_card_pin = dtr["PIN"].ToString();
            string in_cardpin_sn = dtr["PIN"].ToString();
            string in_orderNumber = "";
            string in_cardType = dtr["PIN"].ToString();
            double in_cardAmount = Double.Parse(in_cardType);
            double in_chargeOnCard = 0;
            string in_orderby = "Admin";
            string in_computerName = "";
            string in_ipaddress = "";
            dtProc.saveOrder(in_card_pin, in_cardpin_sn, in_orderNumber, in_cardType, in_cardAmount, in_chargeOnCard, in_orderby, in_computerName, in_ipaddress, out expObj);

        }*/
        }

        protected void chkAgree_CheckedChanged(object sender, EventArgs e)
        {
            float n;
            string strRstTotal = rstTotal.Text;
            strRstTotal = (float.TryParse(strRstTotal, out n))?strRstTotal:strRstTotal.Substring(1);

            bool isNumeric = (strRstTotal.Equals("0.00"))?false:true;// ;
            n = float.Parse(strRstTotal);
            if (!isNumeric)
            {
                chkAgree.Checked = false;
                btnSubmit.Enabled = false;
                return;
            }
            else
                btnSubmit.Enabled = true;
        }
        public string getOrderNumber()
        {
            string getdates = DateTime.Now.ToString("d/M/yyyy");
            getdates = getdates.Replace("/", "");
            getdates = getdates.Trim();

            Random rnd = new Random();
            string rands = "";
            //for (int i = 0; i < 2; i++)
            //{
                int myRandomNo = rnd.Next(100000, 999999);
                rands = rands +myRandomNo;
            //}
            return rands+getdates;
        }

        protected void txtQtys_TextChanged(object sender, EventArgs e)
        {
            string strCard = drpCardType.SelectedValue;// Get card type from dropdown
            if (String.IsNullOrEmpty(txtQtys.Text) || txtQtys.Text == "0")
            {
                txtQtys.BorderStyle = BorderStyle.Solid;
                txtQtys.BackColor = Color.Red;
                return;
            }
            addCards(strCard);
        }

        protected void drpCardType_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            if (string.IsNullOrEmpty(txtQtys.Text) || txtQtys.Text=="0")
                txtQtys.Text = "1";
            string strCard = drpCardType.SelectedValue;// Get card type from dropdown
            if (String.IsNullOrEmpty(txtQtys.Text) || txtQtys.Text == "0")
            {
                txtQtys.BorderStyle = BorderStyle.Solid;
                txtQtys.BackColor = Color.Red;
                return;
            }
            addCards(strCard);
        }
    }
}