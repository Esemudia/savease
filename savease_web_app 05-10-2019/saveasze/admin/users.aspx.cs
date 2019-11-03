using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze.admin
{
    public partial class users : System.Web.UI.Page
    {
        MailMgr mailMessenger = new MailMgr();
        procedurs dtProc = new procedurs();
        // navigations nav = new navigations();
        string hosts = "";
        DataTable dtBankDeposit = new DataTable();
        string usrQString = "";// Request.QueryString["i00"];
        readonly PagedDataSource _pgsource = new PagedDataSource();
        int _firstIndex, _lastIndex;
        private int _pageSize = 10;
        string usrID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            usrQString = Request.QueryString["utype"];
            usrID = Request.QueryString["i00"];
            switch (usrQString)
            {
                case "0":
                    lblUserType.Text = "System Admin Information";
                    lblGridHeader.Text = "System Admin Information";
                    break;
                case "1":
                    lblUserType.Text = "Users Information";
                    lblGridHeader.Text = "Users Information";
                    break;
                case "2":
                    lblUserType.Text = "Vendors Information";
                    lblGridHeader.Text = "Vendors Information";
                    break;
            }
            if (Session["txtUsr"] == null)
                Response.Redirect("Default.aspx");
            else
                hosts = Session["txtUsr"].ToString();

            //RadGrid1.Skin = "WebBlue";
            string userName = "";
            hosts = Request.Url.Host;
            string ipaddress;

            /* ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
             if (ipaddress == "" || ipaddress == null)
                 ipaddress = Request.ServerVariables["REMOTE_ADDR"];
             lblIP.Text = ipaddress;*/
            if (!Page.IsPostBack)
            {

                if (Session["txtUsr"].ToString() == null || Session["txtUsr"].ToString() == "")
                    userName = "";
                else
                    userName = Session["txtUsr"].ToString();
                if (string.IsNullOrEmpty(usrID))
                {
                    gridFrm.Visible = true;
                    editFrm.Visible = false;
                }
                else
                {
                    string expMessage = "";
                    DataTable dtFrm = dtProc.getUserByIDAdm(usrID, hosts, out expMessage);
                    foreach (DataRow dtrow in dtFrm.Rows)
                    {
                        txtFname.Value = dtrow["fname"].ToString();
                        txtLname.Value = dtrow["lname"].ToString();
                        txtPhone.Value = dtrow["phone"].ToString();
                        txtemail.Value = dtrow["email"].ToString();
                        txtuname.Value = dtrow["username"].ToString();
                        txtAddress.Value = dtrow["company address"].ToString();
                        lblBalance.Text = dtrow["balance"].ToString();
                        lblSaveaseid.Text = dtrow["saveasid"].ToString();
                        lblID.Value = dtrow["id"].ToString();
                    }
                    gridFrm.Visible = false;
                    editFrm.Visible = true;
                }

            }
        }

        protected void onclick_pwd(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            string strlblSaveaseID = (item.FindControl("lblSaveaseID") as Label).Text;
            string strlblsenderName = (item.FindControl("lblsenderName") as Label).Text;
            string strlblsubject = (item.FindControl("lblsubject") as Label).Text;
            string strlblsendDate = (item.FindControl("lblsendDate") as Label).Text;

            // data inside the
            string strlblNotID = (item.FindControl("lblNotID") as Label).Text;
            string strlblrecerverID = (item.FindControl("lblrecerverID") as Label).Text;
            string strlblorderNumber = (item.FindControl("lblorderNumber") as Label).Text;

            Session["sessNotID"] = strlblNotID;
            Session["sessRecerverID"] = strlblrecerverID;
            Session["sessOrderNumber"] = strlblorderNumber;

            if (strlblsubject.Contains("Credit"))
                Session["sessTtype"] = "C";
            else if (strlblsubject.Contains("Purchase") || strlblsubject.Contains("Buy"))
                Session["sessTtype"] = "P";
            else if (strlblsubject.Contains("Transfer"))
                Session["sessTtype"] = "T";
            Response.Redirect("compose.aspx");
        }
    }
}