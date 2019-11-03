using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace saveasze.admin
{
    public partial class board : System.Web.UI.Page
    {
        MailMgr mailMessenger = new MailMgr();
        procedurs dtProc = new procedurs();
        // navigations nav = new navigations();
        string hosts = "";
        //DataTable dtBankDeposit = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

            //RadGrid1.Skin = "WebBlue";
            string userName = "";
            hosts = Request.Url.Host;
            string ipaddress;
            confirmPin();
            confirmusers();
            getcardNu();
            getTotaAMount();
            getOnlineUsers();
            getusersonline();
            getvendorsonline();
            /* ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
             if (ipaddress == "" || ipaddress == null)
                 ipaddress = Request.ServerVariables["REMOTE_ADDR"];
             lblIP.Text = ipaddress;*/
            if (!Page.IsPostBack)
            {

                if (Session["txtUsr"] == null || Session["txtUsr"].ToString() == "")
                    Response.Redirect("Default.aspx");
                else
                    userName = Session["txtUsr"].ToString();

            }
        }

        protected void getcount(object sender, EventArgs e)
        {
            //int control ="1";


        }
        // public double getBal(int count)
        // {
        //     string expMessage="";
        //     String no = "";
        //     DataTable dtBal = dtProc.countVendors(hosts, out expMessage);
        //     foreach (DataRow dr in dtBal.Rows)
        //     {
        //         String saveaseID = dr["saveaseID"].ToString();
        //         String FName = dr["fname"].ToString();
        //         String lName = dr["lname"].ToString();
        //         no = dr["count"].ToString();
        //         string strEmail = dr["email"].ToString();
        //         String strPhone = dr["phone"].ToString();

        //         bcountVendors.InnerText = no;
        //     }
        //     return double.Parse(no);
        // }
        protected void RadGrid1_DeleteCommand(object source, GridCommandEventArgs e)
        {
            var productId = (int)((GridDataItem)e.Item).GetDataKeyValue("ID");

            //retrive entity form the Db
            // var product = DbContext.Products.Where(n => n.ProductID == productId).FirstOrDefault();
            string uid = productId.ToString();
            if (!string.IsNullOrEmpty(uid))//productId != null)
            {
                //add the product for deletion
                // DbContext.Products.DeleteObject(product);
                try
                {
                    //save chanages to Db
                    // write deletFunction(var)
                }
                catch (System.Exception)
                {
                    // ShowErrorMessage();
                }
            }
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
                dtCardDetaail = dtProc.getVendorCount(hosts, out expMessage);
                foreach (DataRow dr in dtCardDetaail.Rows)
                {
                    string vent = "";
                    ctr1 = dtCardDetaail.Rows.Count;
                    vent = dr["Counts"].ToString();
                    // tdMessage.Visible = false;
                    //  lblAcctName.Text = dr[""].ToString();
                    bcountVendors.InnerText = vent;
                }
            }
            catch (Exception ex)
            {
                string mmsg = "Card Detial not valid";

                //tdMessage.Visible = true;
                // lblMessage.Text = mmsg;
                //lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
        }


        public void confirmusers()
        {
            string expMessage = "";
            int ctr = 0;
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtCardDetaail = new DataTable();
            int ctr1 = 0;
            try
            {
                dtCardDetaail = dtProc.getUserCount(hosts, out expMessage);
                foreach (DataRow dr in dtCardDetaail.Rows)
                {
                    string vent = "";
                    ctr1 = dtCardDetaail.Rows.Count;
                    vent = dr["Counts"].ToString();
                    // tdMessage.Visible = false;
                    //  lblAcctName.Text = dr[""].ToString();
                    bcountusers.InnerText = vent;
                }
            }
            catch (Exception ex)
            {
                // string mmsg = "Card Detial not valid";

                //tdMessage.Visible = true;
                // lblMessage.Text = mmsg;
                //lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
        }

        public void getcardNu()
        {
            string expMessage = "";
            int ctr = 0;
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtCardDetaail = new DataTable();
            int ctr1 = 0;
            try
            {
                dtCardDetaail = dtProc.getCardCount(hosts, out expMessage);
                foreach (DataRow dr in dtCardDetaail.Rows)
                {
                    string vent = "";
                    ctr1 = dtCardDetaail.Rows.Count;
                    vent = dr["Counts"].ToString();
                    // tdMessage.Visible = false;
                    //  lblAcctName.Text = dr[""].ToString();
                    bcountgen.InnerText = vent;
                }
            }
            catch (Exception ex)
            {
                string mmsg = "Card Detial not valid";

                //tdMessage.Visible = true;
                // lblMessage.Text = mmsg;
                //lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
        }

        public void getTotaAMount()
        {
            string expMessage = "";
            int ctr = 0;
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtCardDetaail = new DataTable();
            int ctr1 = 0;
            try
            {
                dtCardDetaail = dtProc.getTotalAmount(hosts, out expMessage);
                foreach (DataRow dr in dtCardDetaail.Rows)
                {
                    string vent = "";
                    ctr1 = dtCardDetaail.Rows.Count;
                    vent = dr["Total Income"].ToString();
                    // tdMessage.Visible = false;
                    //  lblAcctName.Text = dr[""].ToString();
                    bIncome.InnerText = vent;
                }
            }
            catch (Exception ex)
            {
                string mmsg = "Card Detial not valid";

                //tdMessage.Visible = true;
                // lblMessage.Text = mmsg;
                //lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
        }

        public void getOnlineUsers()
        {
            string expMessage = "";
            int ctr = 0;
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtCardDetaail = new DataTable();
            int ctr1 = 0;
            try
            {
                dtCardDetaail = dtProc.getOnlineUsers(hosts, out expMessage);
                foreach (DataRow dr in dtCardDetaail.Rows)
                {
                    string vent = "";
                    ctr1 = dtCardDetaail.Rows.Count;
                    vent = dr["count"].ToString();
                    // tdMessage.Visible = false;
                    //  lblAcctName.Text = dr[""].ToString();
                    lblonline.InnerText = vent;
                }
            }
            catch (Exception ex)
            {
                string mmsg = "Card Detial not valid";

                //tdMessage.Visible = true;
                // lblMessage.Text = mmsg;
                //lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
        }

        public void getvendorsonline()
        {
            string expMessage = "";
            int ctr = 0;
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtCardDetaail = new DataTable();
            int ctr1 = 0;
            try
            {
                dtCardDetaail = dtProc.getOnlineVendors(hosts, out expMessage);
                foreach (DataRow dr in dtCardDetaail.Rows)
                {
                    string vent = "";
                    ctr1 = dtCardDetaail.Rows.Count;
                    vent = dr["count"].ToString();
                    // tdMessage.Visible = false;
                    //  lblAcctName.Text = dr[""].ToString();
                    bven.InnerText = vent;
                }
            }
            catch (Exception ex)
            {
                string mmsg = "Card Detial not valid";

                //tdMessage.Visible = true;
                // lblMessage.Text = mmsg;
                //lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
        }

        public void getusersonline()
        {
            string expMessage = "";
            int ctr = 0;
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtCardDetaail = new DataTable();
            int ctr1 = 0;
            try
            {
                dtCardDetaail = dtProc.getusersOnline(hosts, out expMessage);
                foreach (DataRow dr in dtCardDetaail.Rows)
                {
                    string vent = "";
                    ctr1 = dtCardDetaail.Rows.Count;
                    vent = dr["count"].ToString();
                    // tdMessage.Visible = false;
                    //  lblAcctName.Text = dr[""].ToString();
                    tusr.InnerText = vent;
                }
            }
            catch (Exception ex)
            {
                //string mmsg = "Card Detial not valid";

                //tdMessage.Visible = true;
                // lblMessage.Text = mmsg;
                //lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
        }
    }
}