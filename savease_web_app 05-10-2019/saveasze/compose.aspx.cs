using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace saveasze
{
    public partial class compose : System.Web.UI.Page
    {
        //  btn .ServerClick += new EventHandler(submit_click);
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
        DataTable dttable = new DataTable();
        readonly PagedDataSource _pgsource = new PagedDataSource();
        int _firstIndex, _lastIndex;
        private int _pageSize = 10;
        string userName = "";
        string strNotID ="";
        string rcverID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            // strNotID= Request.QueryString["i00"];
             strNotID= Session["sessNotID"].ToString();
            // rcverID= Request.QueryString["i01"];
             rcverID= Session["sessRecerverID"].ToString();
            DataTable dt = new DataTable();
            if(!Page.IsPostBack)
            {
            hosts = Request.Url.Host;
                BindDataIntoRepeater();
                //lblCompose.Text = (string.IsNullOrEmpty(strSaveaseID)) ? "Compose New Mail" : "Read Mail";
                if (string.IsNullOrEmpty(strNotID))
            {
                lblCompose.Text = "Compose New Mail";
                txtTo.Attributes.Add("Placeholder","To:");
                txtTo.Value = "";
                txtBody.Attributes.Add("Placeholder","Message:");
                txtBody.Value = "";
            }
            else
            {
                string expMessage = "";
                string sveID = dtProc.getSaveaseID_By_Name(Session["txtUsr"].ToString(), hosts, out expMessage);
                dt = dtProc.getMailByID4user(strNotID,sveID, 'r', hosts, out expMessage);
                    //updateInboxStatus(string in_SaveadeID, string in_statusType, out string expObj)
                    dtProc.updateInboxStatus(strNotID, 'r', out expMessage);
                    Int32 intCtr = dt.Rows.Count;
                //dt.Rows[0]["saveaseID"].ToString();
                lblCompose.Text = "Read Mail";
          //      lblDate.Text= dt.Rows[0]["sendDate"].ToString();
                txtTo.Attributes.Add("Placeholder","From:");
                txtTo.Attributes.Add("Readonly", "True");
                txtTo.Value = dt.Rows[0]["saveaseID"].ToString();
                txtTo.Attributes.Add("Readonly", "True");
                txtSubject.Value = dt.Rows[0]["subject"].ToString();
                txtSubject.Attributes.Add("Readonly", "True");
                txtBody.Attributes.Add("Placeholder","Message:");
                txtBody.Value = dt.Rows[0]["contents"].ToString() ;
                txtBody.Attributes.Add("Readonly", "True");
                btnxend.Enabled = false;
                    //displayBatchRecord();
            }

            }
        }
        public void displayBatchRecord()
        {
            //if(string.IsNullOrEmpty(Request.QueryString["i02"].ToString()))
            string strOrderNo = "";
            if (Session["sessOrderNumber"] == null)
            {
                strOrderNo = "";
                tblCompose1.Visible = true;
            }
            else { 
            strOrderNo = Session["sessOrderNumber"].ToString();
                //  notID  recerverID orderNumber
                //Response.Redirect("batchReadMail.aspx?i00="+ strNotID+"&i01="+ rcverID+"&i02="+ Request.QueryString["i02"].ToString());
                Response.Redirect("batchReadMail.aspx");
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


        protected void btnzend_Click()
        {
            
        }

        protected void btnxend_Click(object sender, EventArgs e)
        {
            string subject = txtSubject.Value;
            string to = txtTo.Value;
            string body = txtBody.Value;
            string strUsr = getBal();
            string Sname = Session["displayName"].ToString();
            string expMessage = "";

            Int32 saveaseIdexist = dtProc.existSaveaseId(to, hosts, out expMessage);
            if (saveaseIdexist > 0)
            {
                DataTable dtAcctDetaail = dtProc.getName(to, hosts, out expMessage);
                try
                {
                    int ctr = dtAcctDetaail.Rows.Count;
                    foreach (DataRow dr in dtAcctDetaail.Rows)
                    {

                        lblAcctName.Text = dr["dname"].ToString();

                        //return;
                    }

                }
                catch (Exception ex)
                {
                    string mmsg = "Account Detail not valid" + ex;

                    return;
                }

                if (lblAcctName!=null) { 
                dtProc.composeMail(strUsr, subject, body, Sname, to, lblAcctName.Text,"", out expMessage);

                     fclear();
                    MessageBox.Show("Message Sent" +" " + to);
                   
                    //lbldeliMess.ForeColor = Color.Green;
                    //lbldeliMess.Text = "";
                     string cleanMessage = "Message sent Successfully to"; 
               Response.Write( "<script>alert('"+ cleanMessage + "');</script>"); 
               Response.Redirect("MailBox.aspx");

                    return;
                }
                else
                {
                    fclear();
                    MessageBox.Show("Message not Sent");
                    Response.Redirect("MailBox.aspx");
                    // lbldeliMess.ForeColor = Color.Red;
                    // lbldeliMess.Text = "";
                }
            }
            else
            {

                MessageBox.Show("Invalid SaveaseID");
                //lbldeliMess.ForeColor = Color.Red;
                //lbldeliMess.Text = ;
            }
        }

        public void fclear()
        {
            txtBody.Value = string.Empty;
            txtSubject.Value = string.Empty;
            txtTo.Value = string.Empty;
        }

        public string getBal()
        {
            string userName = Session["txtUsr"].ToString();
            string expMessage;
            DataTable dtBal = dtProc.getBalance(userName, hosts, out expMessage);
            foreach (DataRow dr in dtBal.Rows)
            {
                try
                {
                    String saveaseID = dr["saveaseID"].ToString();
                    return saveaseID;
                }
                catch (Exception expp)
                {
                    //bal = "-1";
                }
            }
            return ToString();

        }

        
        public void txclear()
        {
            txtTo.Value = string.Empty;
        }

        protected void btnfwd_Click()
        {
            txtTo.Attributes.Add("Readonly", "false");
            txclear();
            string subject = "fwd"+ txtSubject.Value;
            string to = txtTo.Value;
            string body = txtBody.Value;
            string strUsr = getBal();
            string Sname = Session["displayName"].ToString();
            string expMessage = "";

            Int32 saveaseIdexist = dtProc.existSaveaseId(to, hosts, out expMessage);
            if (saveaseIdexist > 0)
            {
                DataTable dtAcctDetaail = dtProc.getName(to, hosts, out expMessage);
                try
                {
                    int ctr = dtAcctDetaail.Rows.Count;
                    foreach (DataRow dr in dtAcctDetaail.Rows)
                    {

                        lblAcctName.Text = dr["dname"].ToString();

                        //return;
                    }

                }
                catch (Exception ex)
                {
                    string mmsg = "Account Detail not valid" + ex;

                    return;
                }

                if (lblAcctName != null)
                {
                    dtProc.composeMail(strUsr, subject, body, Sname, to, lblAcctName.Text, "", out expMessage);


                    Response.Redirect("MailBox.aspx");
                    lbldeliMess.ForeColor = Color.Green;
                    lbldeliMess.Text = "Message Sent";
                    fclear();
                    return;
                }
                else
                {
                    lbldeliMess.ForeColor = Color.Red;
                    lbldeliMess.Text = "Message not Sent";
                }
            }
            else
            {
                lbldeliMess.ForeColor = Color.Red;
                lbldeliMess.Text = "Invalid SaveaseID";
            }
        }

        protected void btnFwd_Click1(object sender, ImageClickEventArgs e)
        {
            lblCompose.Text = "Read Mail";
            //      lblDate.Text= dt.Rows[0]["sendDate"].ToString();
            txtTo.Attributes.Add("Readonly", "False");
            txtTo.Value = "";
            txtSubject.Value = "FWD: " + txtSubject.Value;
            txtSubject.Attributes.Add("Readonly", "False");
            txtBody.Attributes.Add("Readonly", "False");
        }

        protected void btnReply_Click(object sender, ImageClickEventArgs e)
        {

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

                // ctrInbox = "0"; ctrUnread = "0"; ctrRead = "0"; ctrSent = "0";
                // strCtr = intCtr.ToString();
            }
            return dt;
        }
        public void BindDataIntoRepeater()
        {
            string strCtr = "";
            string ctrInbox = "", ctrUnread = "", ctrRead = "", ctrSent = "";
            var dt = GetDataFromDb(out ctrInbox, out ctrUnread, out ctrRead, out ctrSent);
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
          //  lbPrevious.Enabled = !_pgsource.IsFirstPage;
          //  lbNext.Enabled = !_pgsource.IsLastPage;
            /* lbFirst.Enabled = !_pgsource.IsFirstPage;
            lbLast.Enabled = !_pgsource.IsLastPage;*/

            // Bind data into repeater
          //  rptrInbox.DataSource = _pgsource;
           // rptrInbox.DataBind();

            // Call the function to do paging
            HandlePaging();
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

          //  rptPaging.DataSource = dt;
           // rptPaging.DataBind();
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
    }

}