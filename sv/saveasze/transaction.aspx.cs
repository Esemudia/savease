using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class transaction : System.Web.UI.Page
    {
        MailMgr mailMessenger = new MailMgr();
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
        DataTable dtgetpin = new DataTable();
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
                //getbankDeposit();
                if (Session["txtUsr"].ToString() == null || Session["txtUsr"].ToString() == "")
                    Response.Redirect("login.aspx");
                else
                    userName = Session["txtUsr"].ToString();
                try
                {
                    getTransaction();
                   
                }
                catch (Exception ex)
                {
                    //lblMessage.Text = ex.Message;
                    // lblMessage.BorderColor = Color.OrangeRed;
                }
            }
        }

        protected void transfertab_Click(object sender, EventArgs e)
        {
            getTransaction();
            deposit.Visible = true;
           
            withdraw.Visible = false;
            fund.Visible = false;
        }

        protected void deposittab_Click(object sender, EventArgs e)
        {
            getTransaction();
            deposit.Visible = true;
            transdIv.Visible = false;
            withdraw.Visible = false;
            fund.Visible = false;
        }

        protected void withdrawtab_Click(object sender, EventArgs e)
        {
            deposit.Visible = false;
            transdIv.Visible = false;
            withdraw.Visible = true;
            fund.Visible = false;
        }

        protected void fundtab_Click(object sender, EventArgs e)
        {
            deposit.Visible = false;
            transdIv.Visible = false;
            withdraw.Visible = false;
            fund.Visible = true;
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