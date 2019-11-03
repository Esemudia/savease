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
using iTextSharp.text;
using System.IO;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace saveasze
{
    public partial class batchReadmail : System.Web.UI.Page
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
        string SveNAme = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string strNotID= Request.QueryString["i00"];
            string rcverID= Request.QueryString["i01"];
          //  string rcverID= Request.QueryString["i02"];
            DataTable dt = new DataTable();
            if(!Page.IsPostBack)
            {
                string expObj = "";
            hosts = Request.Url.Host;
                BindDataIntoRepeater();
                //lblCompose.Text = (string.IsNullOrEmpty(strSaveaseID)) ? "Compose New Mail" : "Read Mail";
                 SveNAme = dtProc.getDName(Session["txtUsr"].ToString(), hosts, out expObj);
                if (string.IsNullOrEmpty(strNotID))
            {
                lblCompose.Text = "Compose New Mail";
          
            }
            else
            {
                    // query string readstatus parameter
                    // P=Purchase
                    // T=Transfer
                    // D=Debit
                string expMessage = "";
                string sveID = dtProc.getSaveaseID_By_Name(Session["txtUsr"].ToString(), hosts, out expMessage);
                dt = dtProc.getMailByID4user(strNotID,sveID, 'r', hosts, out expMessage);
                    //updateInboxStatus(string in_SaveadeID, string in_statusType, out string expObj)
                    dtProc.updateInboxStatus(strNotID, 'r', out expMessage);
                    Int32 intCtr = dt.Rows.Count;
                //dt.Rows[0]["saveaseID"].ToString();
                lblCompose.Text = "Savease Orders  (Order No: "+ Request.QueryString["i02"].ToString()+")";
          //      lblDate.Text= dt.Rows[0]["sendDate"].ToString();
                    //displayBatchRecord();
            }

            }
        }
        public void returnCardImage()
        {
            string expMessage = "";
            string imagename = dtProc.getcardImageName(hosts, out expMessage);
            Response.Write(imagename);
        }
        public void displayBatchRecord()
        {
                  //  pnlTransfer.Visible = false;
            string strBatchHtml = "";
            string strOrderNo = "";
            if (Session["sessOrderNumber"] == null)
            {
                strOrderNo = "";
                tblCompose1.Visible = true;
            }
            else
            {

                tblCompose1.Visible = false;
                string expMessage = "";
              DataTable dtgetpin = dtProc.getPinBybatch(Session["txtUsr"].ToString(), Session["sessOrderNumber"].ToString(), hosts, out expMessage);
                if(dtgetpin==null)
                {
                    pnlCard.Visible = false;
                    strBatchHtml = strBatchHtml+"<table border='1'><tr><td>";
                    strBatchHtml = strBatchHtml + "No record found";
                    strBatchHtml = strBatchHtml + "</td></tr></table>";
                    Response.Write(strBatchHtml);
                }
                else
                {
                    pnlCard.Visible = true;
                    Repeater1.DataSource = dtgetpin;
                    Repeater1.DataBind();
                    Response.Write("<br />");
                }
              
            }
        }
        public void displayTransferRecord()
        {
            string strBatchHtml = "";
            string strOrderNo = "";
            if (Session["sessOrderNumber"] == null)
            {
                strOrderNo = "";
                tblCompose1.Visible = true;
            }
            else
            {
                strOrderNo = Session["sessOrderNumber"].ToString();

                string strSuccessMessage = "";
                tblCompose1.Visible = false;
                string expMessage = "";
                //     public DataTable getTransfers(string in_uname,string in_transferRef, string connLocation, out string expMessage)
               // DataTable dtgetTransfer = dtProc.getPinBybatch(Session["txtUsr"].ToString(), strOrderNo, hosts, out expMessage);
                DataTable dtgetTransfer = dtProc.getTransfers(Session["txtUsr"].ToString(), strOrderNo, hosts, out expMessage);
                if(dtgetTransfer == null)
                {
                    pnlTransfer.Visible = false;
                    strSuccessMessage = strSuccessMessage + "<table border='1'><tr><td>";
                    strSuccessMessage = strSuccessMessage + "No record found";
                    strSuccessMessage = strSuccessMessage + "</td></tr></table>";
                }
                else
                {
                    pnlTransfer.Visible = true;
                    foreach(DataRow dr in dtgetTransfer.Rows)
                    {
                        //start transfer display //dr["password"].ToString();
                        string amtCredit = dr["credit"].ToString();
                        string amtDebit = dr["debit"].ToString();
                        string strAmt = (amtCredit.Equals("0")) ? "-" + amtDebit : amtCredit;
                        strSuccessMessage = strSuccessMessage + "<div class='container' style='width:500px;'>";
                strSuccessMessage = strSuccessMessage + "<div class='header'>";
                strSuccessMessage = strSuccessMessage + "<div class='logo'>";
                strSuccessMessage = strSuccessMessage + " <img src='images/icons/bowsmiley.png' ALIGN='right' >";
                strSuccessMessage = strSuccessMessage + "</div><br>";
                strSuccessMessage = strSuccessMessage + "<div class='text'>";
                strSuccessMessage = strSuccessMessage + "<h3 style='font-family:calibri;'>Hi &nbsp" +SveNAme + ",</h3><br><br>";
                strSuccessMessage = strSuccessMessage + "<p style='font-size: 14px; font-family:calibri;'>Transfer Notification</p>";
                strSuccessMessage = strSuccessMessage + "</div><br>";
                strSuccessMessage = strSuccessMessage + "<h3 style='font-family:calibri;font-size: 14px;font-weight: bolder;'>Transaction Details<label></label></h3><br>";
                strSuccessMessage = strSuccessMessage + "<div class='button'>";
                strSuccessMessage = strSuccessMessage + "<table width='499' height='113' border='0' bordercolor='#000000' >";
                strSuccessMessage = strSuccessMessage + "<tbody>";
                strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td width='138' height='19' style='font-family:calibri'>Transfer Reference:</td><td width='343' style='font-family:calibri'>" + dr["RefNumber"].ToString() + "</td></tr>";
               // strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td width='138' height='19' style='font-family:calibri'>Beneficiary Bank:</td><td width='343' style='font-family:calibri'>" + Session["in_bankSAC"].ToString() + "</td></tr>";
                strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'>Beneficiary Name:</td><td style='font-family:calibri'>" + dr["SenderName"].ToString() + "  </td></tr>";
                strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'>Beneficiary Account:</td><td>" + dr["AccountNo"].ToString() + "</td></tr>";
                strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'>Transaction Date:</td><td>" + dr["TransactionDate"].ToString() + "</td></tr>";
                //strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'>Transaction Narrative:</td><td style='font-family:courier new'>" + Session["in_narative"].ToString() + "</td></tr>";
                strSuccessMessage = strSuccessMessage + "<tr bgcolor='#212435' style='color: #fff'><td height='19' style='font-family:calibri'>Amount:</td><td>" + strAmt + "</td></tr>";
                strSuccessMessage = strSuccessMessage + "</tbody>";
                strSuccessMessage = strSuccessMessage + "</table>";
                strSuccessMessage = strSuccessMessage + "</div><br><br>";
                strSuccessMessage = strSuccessMessage + "<div class='quest'>";
                strSuccessMessage = strSuccessMessage + "<h4 style='color: #fa9928;font-family:calibri;'><a href='' style='color: blue; font-size:12px;font-family:calibri;'>Please click here to provide freedback on your experience</a></h4><br>";
                strSuccessMessage = strSuccessMessage + "<p style='color: #212435;font-family:calibri; font-weight: bold'>Thank you for using Savease.</p>";
                strSuccessMessage = strSuccessMessage + "</div>";
                strSuccessMessage = strSuccessMessage + "</div> ";
                strSuccessMessage = strSuccessMessage + "</div> ";
                
                    }
           
                } // dtProc.inserttransactionLog(Session["in_TransRefSAC"].ToString(), "Debit", strSuccessMessage, Session["in_acctNoSAC"].ToString(), Session["in_acctNameSAC"].ToString(), strAdminID, Session["in_DisplayNameSAC"].ToString(),float.Parse("-"+Session["in_amountSAC"].ToString()), out expMessage);
                Response.Write(strSuccessMessage);

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

        protected void btnPrint_click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Panel.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            pnlCard.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            pdfDoc.Add(new Chunk(""));
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            /* Response.ContentType = "application/pdf";
             Response.AddHeader("content-disposition", "attachment;filename=Panel.pdf");
             Response.Cache.SetCacheability(HttpCacheability.NoCache);
             StringWriter sw = new StringWriter();
             HtmlTextWriter hw = new HtmlTextWriter(sw);
             pnlCard.RenderControl(hw);
             StringReader sr = new StringReader(sw.ToString());
             Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
             HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
             PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
             pdfDoc.Open();
             pdfDoc.NewPage();
             htmlparser.Parse(sr);
             pdfDoc.Close();
             Response.Write(pdfDoc);
             Response.End();*/
        }
        protected void btnzend_Click()
        {
            
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