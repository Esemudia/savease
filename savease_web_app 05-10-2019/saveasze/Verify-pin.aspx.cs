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
    public partial class Verify_pin : System.Web.UI.Page
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
                //getbankDeposit();
                if (Session["txtUsr"].ToString() == null || Session["txtUsr"].ToString() == "")
                    Response.Redirect("login.aspx");
                else
                    userName = Session["txtUsr"].ToString();
                try
                {
                    //tblSavedBen.Visible = false;
                    //clearf();
                    //dblBal = getBal(userName);
                    if (dblBal < 0)
                    {
                        lblMessage.Text = "Page not loading properly, please contact savease administrators";
                    }
                   // getAllBanks();// load banks
                   // getSavedBeneficiary();//
                                          // getAcctDetail3();
                    lblMessage.BorderColor = Color.Gray;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message;
                    lblMessage.BorderColor = Color.OrangeRed;
                }
            }
        }



        protected void btnVerify_Click(object sender, EventArgs e)
        {
            confirmPin();
        }

        protected void txtpin_TextChanged(object sender, EventArgs e)
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
                Int32 exitpin = dtProc.usedPin(txtpin.Text.ToString(), hosts, out expMessage);

                if (exitpin < 1)
                {

                    dtCardDetaail = dtProc.getCardPin(txtpin.Text.ToString(), hosts, out expMessage);
                    if (dtCardDetaail == null)
                    {

                        string mmsg = "Invalid Voucher details supplied!!!";

                        // tdMessage.Visible = true;
                        lblMessage.Text = mmsg;
                        lblMessage.ForeColor = Color.Red;
                        return;
                    }
                    foreach (DataRow dr in dtCardDetaail.Rows)
                    {
                        ctr1 = dtCardDetaail.Rows.Count;
                        lblMessage.Text = dr["cardAmount"].ToString();
                        lblMessage.ForeColor = Color.Green;

                    }
                }
                else
                {
                    string mmsg = "Voucher details has been used!!!";

                    lblMessage.Visible = true;
                    lblMessage.Text = mmsg;
                    lblMessage.ForeColor = Color.Red;
                    // clearf();
                    return;
                }

            }

            catch (Exception ex)
            {
                string mmsg = ex.Message;

                lblMessage.Visible = true;
                lblMessage.Text = mmsg;
                lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
        }

    }
}