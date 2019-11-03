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
    public partial class VerifyPin : System.Web.UI.Page
    {
        MailMgr mailMessenger = new MailMgr();
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
        string expMessage = "";
        // DataTable dtBankDeposit = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVeriy_Click(object sender, EventArgs e)
        {
           string pin = txtPIN1.Value ;
            string txtam = "";
            float Txtamount;
            try
            {
                Int32 exitpin = dtProc.usedPin(txtPIN1.Value.ToString(), hosts, out expMessage);

                if (exitpin < 1)
                {
                    DataTable dtCardDetaail = dtProc.getCardPin(pin, hosts, out expMessage);


                    dtCardDetaail = dtProc.getCardPin(pin, hosts, out expMessage);
                    if (dtCardDetaail == null)
                    {

                        string mmsg = "Invalid Voucher details supplied!!!";

                        // tdMessage.Visible = true;
                        lblerror.Text = mmsg;
                        lblerror.ForeColor = Color.Red;
                        return;
                    }
                    foreach (DataRow dr in dtCardDetaail.Rows)
                    {
                        
                        Txtamount= float.Parse(dr["cardAmount"].ToString());
                        //  lblAcctName.Text = dr[""].ToString();
                         txtam = Txtamount.ToString();
                    }
                    lblerror.Text = "Card Valid. Amount: " + txtam;
                    lblerror.ForeColor = Color.Green;
                    lblerror.Font.Bold = true;
                    return ;
                }
                else
                {
                    string mmsg = "Voucher details has been used!!!";

                    // tdMessage.Visible = true;
                    lblerror.Text = mmsg;
                    lblerror.ForeColor = Color.Red;
                   // clearf();
                    return;
                }
            }

            catch (Exception ex)
            {
                string mmsg = ex.Message;

                lblerror.Visible = true;
                lblerror.Text = mmsg;
                lblerror.BorderColor = Color.OrangeRed;
                return;
            }
        }
    }
}