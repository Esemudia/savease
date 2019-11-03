using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Drawing;

namespace saveasze
{
    public partial class beneficiary : System.Web.UI.Page
    {
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
        protected void Page_Load(object sender, EventArgs e)
        {
           // hosts = Session["hosts"].ToString();
            hosts = Request.Url.Host;
            if(!Page.IsPostBack)
            {
                getBank();
                //clear();
            }
        }
        public void getBank()
        {
            string expMessage = "";
            DataTable dtBanks = dtProc.getAllBankNames(hosts, out expMessage);

            Int32 intRowCtr = dtBanks.Rows.Count;
            cmdBank.DataSource = dtBanks;
            cmdBank.DataTextField = "BankName";
            cmdBank.DataValueField = "BankRef";
            cmdBank.DataBind();
        }
        public void leftNavigation()
        {
            if (Session["accesscontrol"]=="" || Session["accesscontrol"] == null)
            {
                Response.Redirect("login.aspx");
            }
            string accesscontrol = Session["accesscontrol"].ToString();
            //
            string expMessage = "";
            DataTable dtNav = dtProc.getLeftNavigation(Int32.Parse(accesscontrol),hosts,out expMessage);
            foreach (DataRow row in dtNav.Rows)
            {
                string link = row["link"].ToString()+".aspx";
                string strText = row["text"].ToString();
            string leftNav=  "<li class='active'><a href='"+link+"'>"+strText+"</a></li>";
            Response.Write(leftNav);
            }
        }
        protected void RadGrid4_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string expobj = "";
            (sender as RadGrid).DataSource = dtProc.getBeneficiaryBank(Session["txtUsr"].ToString(), hosts, out expobj); 
        }
        protected void Raddrp_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            /*
            if (Raddrp.SelectedIndex.Equals(0))
            {
                lblBlank.Text = "Savease ID";
                txtval1.Text = "";
            }
            if (Raddrp.SelectedIndex.Equals(1))
            {
                lblBlank.Text = "Username";
                txtval1.Text = "";
            }
            */

        }
        
    public void clear()
        {
            txtval1.Text = "";
            //lblerr.Text = "";
        }
        protected void btnSaveBeneficiary1_Click(object sender, EventArgs e)
        {
            if (txtval1.Text.Equals(""))
            {
                lblerr.Text = "Enter a valid Account number";
                lblerr.ForeColor = Color.OrangeRed;
                txtval1.Focus();
                return;
            }

            if (cmdBank.SelectedIndex.Equals(0))
            {
                lblerr.Text = "Select Valid Bank";
                lblerr.ForeColor = Color.OrangeRed;
                txtval1.Focus();
                return;
            }

            string expObj = "", expobj1 = "";
            string expMessage;
            if (dtProc.existSaveaseId(txtval1.Text, hosts, out expMessage) <= 0)
            {

                lblerr.ForeColor = Color.Red;
                lblerr.Text = "Invalid SaveaseID";
                clear();
                // tbMessage.Visible = true;
                // lblMessage.Text = "Invalid User Account";
                return;
            }

            if (dtProc.existBeneficiary(txtval1.Text, Session["txtUsr"].ToString(), hosts, out expobj1) > 0)
            {
                lblerr.Text = "Cannot Add Existing Beneficiary";
                lblerr.ForeColor = Color.OrangeRed;
                clear();
                return;
            }
            Int32 intSaveBen = 0;
            if (cmdBank.SelectedIndex.Equals(1))
                intSaveBen = dtProc.saveBeneficiary(txtval1.Text, Session["txtUsr"].ToString(), cmdBank.SelectedItem.Text, out expObj);
            else
            {
                lblerr.Text = "Host bank Network unavailable... try again later";
                lblerr.ForeColor = Color.OrangeRed;
                txtval1.Focus();
                clear();
                return;
            }
            if (intSaveBen > 0)
            {
                lblerr.Text = "Beneficiary created successfully";
                lblerr.ForeColor = Color.Green;
                clear();
                return;
            }
            else
            {
                lblerr.Text = "Beneficiary creation is invalid";
                lblerr.ForeColor = Color.OrangeRed;
                clear();
                return;
            }
            /**/
        }
        protected void btnSaveBeneficiary_Click(object sender, Telerik.Web.UI.ImageButtonClickEventArgs e)
        {
            if(txtval1.Text.Equals(""))
            {
                lblerr.Text = "Enter Savease ID/Account #";
                lblerr.ForeColor = Color.OrangeRed;
                txtval1.Focus();
                return;
            }

            if (cmdBank.SelectedIndex.Equals(0))
            {
                lblerr.Text = "Select Valid Bank";
                lblerr.ForeColor = Color.OrangeRed;
                txtval1.Focus();
                return;
            }

            string expObj = "", expobj1 = "";
            string expMessage;
            if (dtProc.existSaveaseId(txtval1.Text, hosts,   out expMessage) <= 0)
            {

                lblerr.ForeColor = Color.Red;
                lblerr.Text = "Invalid SaveaseID";
                clear();
                // tbMessage.Visible = true;
                // lblMessage.Text = "Invalid User Account";
                return;
            }
           
            if(dtProc.existBeneficiary(txtval1.Text, Session["txtUsr"].ToString(), hosts, out expobj1)>0)
            {
                lblerr.Text = "Cannot Add Existing Beneficiary";
                lblerr.ForeColor = Color.OrangeRed;
                clear();
                return;
            }
            Int32 intSaveBen = 0;
            if(cmdBank.SelectedIndex.Equals(1))
               intSaveBen = dtProc.saveBeneficiary(txtval1.Text, Session["txtUsr"].ToString(),cmdBank.SelectedItem.Text, out expObj);
            else
            {
                lblerr.Text = "Host bank Network unavailable... try again later";
                lblerr.ForeColor = Color.OrangeRed;
                txtval1.Focus();
                clear();
                return;
            }
            if (intSaveBen>0)
            {
                lblerr.Text = "Beneficiary created successfully";
                lblerr.ForeColor = Color.Green;
                clear();
                return;
            }
            else
            {
                lblerr.Text = "Beneficiary creation is invalid";
                lblerr.ForeColor = Color.OrangeRed;
                clear();
                return;
            }
            /**/
        }
        public void getBeneficiary(string fromSave)
        {
            string expobj = "";
            //getBeneficiary(string inputParam, string connLocation, out string expMessage)
            //RadGrid4.
            RadGrid4.DataSource = null;

            RadGrid4.DataSource = dtProc.getBeneficiaryBank(Session["txtUsr"].ToString(),hosts, out expobj);
           
            if (!fromSave.Equals(""))
                RadGrid4.DataBind();
        }
        /*public void getBeneficiary2(string fromSave)
       {
           string expobj = "";
           //getBeneficiary(string inputParam, string connLocation, out string expMessage)
           RadGrid4.DataSource = dtProc.getBeneficiaryBank(Session["txtUsr"].ToString(), hosts, out expobj);
          GridBoundColumn boundColumn;

           if (RadFilter.SelectedIndex == 0)
           {
               boundColumn = new GridBoundColumn();
               RadGrid1.MasterTableView.Columns.Add(boundColumn);
               boundColumn.DataFormatString = "{0:dd/MM/yyyy}";
               boundColumn.DataField = "PRODUCTIONDATE";
               boundColumn.HeaderText = "Date";
           }
           boundColumn = new GridBoundColumn();
           RadGrid1.MasterTableView.Columns.Add(boundColumn);
           boundColumn.DataField = "saveaseID";
           boundColumn.HeaderText = "Beneficiary ID";
           boundColumn = new GridBoundColumn();
           RadGrid1.MasterTableView.Columns.Add(boundColumn);
           boundColumn.DataField = "fullname";
           boundColumn.HeaderText = "Benficiary Name";
           boundColumn = new GridBoundColumn();
           RadGrid1.MasterTableView.Columns.Add(boundColumn);
           boundColumn.DataField = "email";
           boundColumn.HeaderText = "Contact Email";
           boundColumn = new GridBoundColumn();
           RadGrid1.MasterTableView.Columns.Add(boundColumn);
           boundColumn.DataField = "dateAdded";
           boundColumn.HeaderText = "Date Created";
           boundColumn.DataFormatString = "{0:dd/MM/yyyy}";
           if (fromSave == "")
               RadGrid4.DataBind();
           else
               RadGrid4.Rebind();
       }*/
        protected void radverify_Click(object sender, Telerik.Web.UI.ImageButtonClickEventArgs e)
        {
            string expMessage = "";
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtAcctDetaail = dtProc.getAcct2(txtval1.Value.ToString(), hosts, out expMessage);
            try
            {
                int ctr = dtAcctDetaail.Rows.Count;
                foreach (DataRow dr in dtAcctDetaail.Rows)
                {
                    //  txtAmount.Value = float.Parse(dr["cardAmount"].ToString());
                    lbldetails.Text = dr["names"].ToString();
                   // HideBenBal.Text = dr["balance"].ToString();
                    //HideBenUNAme.Text = dr["saveaseID"].ToString();
                   // tdMessage.Visible = false;
                }
            }
            catch (Exception ex)
            {
                string mmsg = "Account Detail not valid";

                lblerr.Visible = true;
                lblerr.Text = mmsg;
                lblerr.BorderColor = Color.OrangeRed;
                return;
            }
        }
        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            //To add row number
            if (e.Item is GridDataItem)
            {
                int rowCounter = new int();
                Label lbl = e.Item.FindControl("sn") as Label;
                rowCounter = RadGrid4.MasterTableView.PageSize * RadGrid4.MasterTableView.CurrentPageIndex;
                lbl.Text = (e.Item.ItemIndex + 1 + rowCounter).ToString();
            }
        }
    }
}