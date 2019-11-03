using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.IO;

namespace saveasze
{
    public partial class MailBox : System.Web.UI.Page
    {
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
        DataTable dttable = new DataTable();
        readonly PagedDataSource _pgsource = new PagedDataSource();
        int _firstIndex, _lastIndex;
        private int _pageSize = 10;
        string userName = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["txtUsr"].ToString() == null || Session["txtUsr"].ToString() == "")
                userName = "";
            else
                userName = Session["txtUsr"].ToString();

            hosts = Request.Url.Host;
            if (Page.IsPostBack) return;
            BindDataIntoRepeater();
        }
        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                {
                    return 0;
                }
                return ((int)ViewState["CurrentPage"]);
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }
        //GetDataFromDb(out ctrInbox,out ctrUnread,out ctrRead,out ctrSent);
        public DataTable GetDataFromDb(out string ctrInbox, out string ctrUnread, out string ctrRead, out string ctrSent)
        {
            string expMessage = "";
            var dt = new DataTable();
            // call the procedure to return data to datatable for table content
            //getSaveaseID_By_Name(string in_username, string connLocation, out string expMessage)
            string sveID = dtProc.getSaveaseID_By_Name(Session["txtUsr"].ToString(), hosts, out expMessage);
            if (sveID.Length < 5) { dt = null; ctrInbox = "0"; ctrUnread = "0"; ctrRead = "0"; ctrSent = "0"; }
            else
            {
                dt = dtProc.getMailInbox(sveID, 'r', hosts, out expMessage);
                Int32 intCtr = dt.Rows.Count;
                dtProc.getMailCounters(sveID, out ctrInbox, out ctrUnread, out ctrRead, out ctrSent, hosts, out expMessage);
                
            }
            return dt;
        }
        public void BindDataIntoRepeater()
        {
            string strCtr = "";
            string ctrInbox = "", ctrUnread = "", ctrRead = "", ctrSent="";
            var dt = GetDataFromDb(out ctrInbox,out ctrUnread,out ctrRead,out ctrSent);
            if (dt == null) return;
            
            lblCtrInbox.Text = ctrInbox;
            lblCtrSent.Text = ctrSent;
            _pgsource.DataSource = dt.DefaultView;
            _pgsource.AllowPaging = true;
            // Number of items to be displayed in the Repeater
            _pgsource.PageSize = _pageSize;
            _pgsource.CurrentPageIndex = CurrentPage;
            // Keep the Total pages in View State
            ViewState["TotalPages"] = _pgsource.PageCount;
            // Example: "Page 1 of 10"
                    // lblpage.Text = "Page " + (CurrentPage + 1) + " of " + _pgsource.PageCount;
            // Enable First, Last, Previous, Next buttons
            lbPrevious.Enabled = !_pgsource.IsFirstPage;
            lbNext.Enabled = !_pgsource.IsLastPage;
            /* lbFirst.Enabled = !_pgsource.IsFirstPage;
            lbLast.Enabled = !_pgsource.IsLastPage;*/

            // Bind data into repeater
            rptrInbox.DataSource = _pgsource;
            rptrInbox.DataBind();

            // Call the function to do paging
            HandlePaging();
        }

        public string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
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

            if(strlblsubject.Contains("Credit"))
            Session["sessTtype"] = "C";
            else if(strlblsubject.Contains("Purchase") || strlblsubject.Contains("Buy"))
            Session["sessTtype"] = "P";
            else if(strlblsubject.Contains("Transfer"))
            Session["sessTtype"] = "T";
            Response.Redirect("compose.aspx");
        }
            private void HandlePaging()
        {
            var dt = new DataTable();
            dt.Columns.Add("PageIndex"); //Start from 0
            dt.Columns.Add("PageText"); //Start from 1

            _firstIndex = CurrentPage - 5;
            if (CurrentPage > 5)
                _lastIndex = CurrentPage + 5;
            else
                _lastIndex = 10;

            // Check last page is greater than total page then reduced it 
            // to total no. of page is last index
            if (_lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
            {
                _lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
                _firstIndex = _lastIndex - 10;
            }

            if (_firstIndex < 0)
                _firstIndex = 0;

            // Now creating page number based on above first and last page index
            for (var i = _firstIndex; i < _lastIndex; i++)
            {
                var dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }

            rptPaging.DataSource = dt;
            rptPaging.DataBind();
        }
        protected void lbPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            BindDataIntoRepeater();
        }
        protected void lbNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            BindDataIntoRepeater();
        }

        protected void rptPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (!e.CommandName.Equals("newPage")) return;
            CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
            BindDataIntoRepeater();
        }

        protected void rptPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            var lnkPage = (LinkButton)e.Item.FindControl("lbPaging");
            if (lnkPage.CommandArgument != CurrentPage.ToString()) return;
            //lnkPage.Enabled = false;
            lnkPage.Visible = false;
           // lnkPage.BackColor = Color.FromName("#00FF00");
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
    }
}