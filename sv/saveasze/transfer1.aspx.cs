using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace saveasze
{
    public partial class transfer1 : System.Web.UI.Page
    {
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
        protected void Page_Load(object sender, EventArgs e)
        {
           // hosts = Session["hosts"].ToString();
            hosts = Request.Url.Host;
            
            if (!Page.IsPostBack)
            {
                string expMessage = "";
                DataTable dt0 = dtProc.getAcct(Session["txtUsr"].ToString().Trim(), hosts, out expMessage);
                Int32 intRowCtr = dt0.Rows.Count;
                rcvAcct.DataSource = dt0;
                rcvAcct.DataTextField = "fullname";
                rcvAcct.DataValueField = "saveaseID";
                rcvAcct.DataBind();
                rcvAcct.SelectedIndex = 0;
                getBeneficiary("");

            }
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

        protected void btnSaveBeneficiary_Click(object sender, Telerik.Web.UI.ImageButtonClickEventArgs e)
        {
            string expObj = "";
            Int32 intSaveBen =dtProc.saveBeneficiary(txtSaveaseID.Text, Session["txtUsr"].ToString(),"", out expObj);
            getBeneficiary("0");
        }
        public void getBeneficiary(string fromSave)
        {
            string expobj = "";
            //getBeneficiary(string inputParam, string connLocation, out string expMessage)
            RadGrid1.DataSource = dtProc.getBeneficiary(Session["txtUsr"].ToString(),hosts, out expobj);
            GridBoundColumn boundColumn;
            /*
            if (RadFilter.SelectedIndex == 0)
            {
                boundColumn = new GridBoundColumn();
                RadGrid1.MasterTableView.Columns.Add(boundColumn);
                boundColumn.DataFormatString = "{0:dd/MM/yyyy}";
                boundColumn.DataField = "PRODUCTIONDATE";
                boundColumn.HeaderText = "Date";
            }*/
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
                RadGrid1.DataBind();
            else
                RadGrid1.Rebind();
        }

        protected void cmdAcctType_SelectedIndexChanged(object sender, DropDownListEventArgs e)
        {

        }
    }
}