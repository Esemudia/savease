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
    public partial class dashboard : System.Web.UI.Page
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
          
            if (!Page.IsPostBack)
            {
                
                if (Session["txtUsr"].ToString() == null || Session["txtUsr"].ToString() == "")
                    Response.Redirect("login.aspx");
                else
                    userName = Session["txtUsr"].ToString();
                try
                {
                    getTransaction();
                    
                    dblBal = getBal(userName);
                    getSavesaeID(userName);
                    if (dblBal < 0)
                    {
                        lblMessage.Text = "Page not loading properly, please contact savease administrators";
                    }
                    getAllBanks();
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
                    lblBalh.Visible = true;
                    //lblBalh.Text = saveaseID + " - " + FName + " " + lName + " ( N" + bal + " )";
                }
                catch (Exception expp)
                {
                    bal = "-1";
                }
            }
            return double.Parse(bal);
        }
        public double getSavesaeID(string userName)
        {
            String saveaseID = "";
            string expMessage;
            DataTable dtBal = dtProc.getBalance(userName, hosts, out expMessage);
            foreach (DataRow dr in dtBal.Rows)
            {
                try
                {
                    saveaseID = dr["saveaseID"].ToString();
                    String FName = dr["fname"].ToString();
                    String lName = dr["lname"].ToString();
                    string bal = dr["balance"].ToString();
                    string strEmail = dr["email"].ToString();
                    String strPhone = dr["phone"].ToString();

                    lblacc.Text = saveaseID;
                    // lblBalh.Text = bal;
                    lblacc.Font.Bold = true;
                    lblacc.Visible = true;
                    //lblBalh.Text = saveaseID + " - " + FName + " " + lName + " ( N" + bal + " )";
                }
                catch (Exception expp)
                {
                    saveaseID = "-1";
                }
            }
            return double.Parse(saveaseID);
        }
        protected void getTransaction()
        {
            string expMessage = "";
            dtBankDeposit = dtProc.getTranssactionDetails(Session["txtusr"].ToString(), hosts, out expMessage);
            gridTransaction.Visible = true;
            gridTransaction.DataSource = dtBankDeposit;
            gridTransaction.DataBind();
            gridTransaction.AllowPaging = true;
        }

        protected void gridTransaction_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridTransaction.PageIndex = e.NewPageIndex;
            this.getTransaction();

        }
    }
}