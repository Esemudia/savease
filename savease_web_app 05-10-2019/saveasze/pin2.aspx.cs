using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.VisualBasic;
using Telerik.Web.UI;
using Telerik.Web.UI.Calendar;
using static Telerik.Web.UI.GridPdfSettings;

namespace saveasze
{
    public partial class pin2 : System.Web.UI.Page
    {
        MailMgr mailMessenger = new MailMgr();
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
        DataTable dtgetpin = new DataTable();
            string userName = "";
            string strusr = "";
        string headerMiddleCell = "<h2>Sushi Bar Menu</h2>Hot Offers";
        // string headerLeftCell = "<img src=\"Images/sushibar.jpg\" alt=\"sushi bar\" style=\"width:64px; height: 64px;\" />";
        string headerLeftCell = "<img src=\"Images/sushibar.jpg\" alt=\"sushi bar\" style=\"width:64px; height: 64px;\" />";
        string footerMiddleCell = "<?page-number?>";
        protected void Page_Load(object sender, EventArgs e)
        {
            // hosts = Session["hosts"].ToString();

            //gridBatch.ExportSettings.Pdf.PageHeight = 210;
            //gridBatch.ExportSettings.Pdf.PageTopMargin = 45;
            //gridBatch.ExportSettings.Pdf.BorderStyle = GridPdfBorderStyle.Medium;
            //gridBatch.ExportSettings.Pdf.BorderColor = Color.SpringGreen;

            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            hosts = Request.Url.Host;
            string ipaddress;
            /* ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
             if (ipaddress == "" || ipaddress == null)
                 ipaddress = Request.ServerVariables["REMOTE_ADDR"];
             lblIP.Text = ipaddress;*/
            trbatch.Visible = false;
            txtdate.Visible = false;
            if (!Page.IsPostBack)
            {
                //getbankDeposit();
                dateMgr("");
            if (Session["txtUsr"].ToString() == null || Session["txtUsr"].ToString() == "")
                userName = "";
            else
                userName = Session["txtUsr"].ToString();
                strusr = userName;
                try
                {
                    /*
                    getBal(userName);
                    getAllBanks();
                    getSavedBeneficiary();
                    getAcctDetail3();*/
                    //   lblMessage.BorderColor = Color.Gray;
                }
                catch(Exception ex)
                {
                //    lblMessage.Text = ex.Message;
                 //   lblMessage.BorderColor = Color.OrangeRed;
                }
            }
        }
        public void setUserDetails()
        {
            DataTable dtBal = dtProc.getBalance(Session["txtUsr"].ToString(), hosts, out string expMessage);
            foreach (DataRow dr in dtBal.Rows)
            {
                String saveaseID = dr["saveaseID"].ToString();
                hideSEID.Value = saveaseID;
                String FName = dr["fname"].ToString();
                String lName = dr["lname"].ToString();
                hideFullName.Value = FName + " " + lName;
            }
        }
        public void dateMgr(string strNew)
        {
            dtfrom.MaxDate = DateTime.Today;
            dtTo.MaxDate = DateTime.Today;
            if (string.IsNullOrEmpty(strNew))
            {
                dtfrom.SelectedDate = DateTime.Today.AddMonths(-3);
                DateTime dtFrome1 = dtfrom.SelectedDate.Value;
                dtTo.SelectedDate = dtFrome1.AddMonths(3);
            }
            else
            {
                DateTime dtFrome1 = dtfrom.SelectedDate.Value;
                dtTo.SelectedDate = dtFrome1.AddMonths(3);
            }
            
        }
        protected void btnser_click(object sender, ImageClickEventArgs e)
        {
        }
            protected void RadSearchBox2_Search(object sender, SearchBoxEventArgs e)
        {
                //Label2.Text = "Text: " + e.Text;
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
        
        protected void btnser_Click1(object sender, EventArgs e)
        {
             string in_batch = txtbacth.Text;
            if(string.IsNullOrEmpty(in_batch))
            {
                lblmes.Visible = true;
                lblmes.Text = "Enter value in field available...";
                lblmes.ForeColor = Color.OrangeRed;
                return; }
            loadGrid(in_batch);

        }
        public void loadGrid(string in_batch)
        {
            string expMessage = "";
            Int32 existbatch = dtProc.exisbatchNo(in_batch, hosts, out expMessage);
            if (existbatch > -1)
            {
                dtgetpin = dtProc.getPinBybatch(Session["txtUsr"].ToString(), in_batch, hosts, out expMessage);
                if (dtgetpin == null)
                {
                    return;
                }
                gridBatch.Visible = true;
                gridBatch.DataSource = dtgetpin;
                gridBatch.Skin = "WebBlue";
                gridBatch.DataBind();
            }
            else
            {
                lblmes.Text = "Invalid Batch Number! Please Check your batch number.";
                lblmes.ForeColor = Color.Red;
                lblmes.Font.Bold = true;
                return;
            }
        }
        //
        //
        public void getPinAmount(string in_ostatus)
        {
            string expMessage = "";
            //getPinAmount(string in_uname, string in_ostatus, string connLocation, out string expMessage)
            string dtAmount=dtProc.getPinAmount(Session["txtUsr"].ToString(), in_ostatus, hosts, out expMessage);
            if (string.IsNullOrEmpty(dtAmount)) dtAmount = "";
            Response.Write(dtAmount);
        }
        protected void gridBatch_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string expMessage = "";
            // loadGrid("");
            if (cmddrop.SelectedIndex.Equals(0))
            {
                dtgetpin = dtProc.getPinBybatch1(Session["txtUsr"].ToString(), txtbacth.Text, hosts, out expMessage);
                trbatch.Visible = false;
                txtdate.Visible = false;
            }
            else if (cmddrop.SelectedIndex.Equals(1))
            {
                dtgetpin = dtProc.SortPinby(Session["txtusr"].ToString(), "", "1", "", "", hosts, out expMessage);
                trbatch.Visible = false;
                txtdate.Visible = false;
            }
            else if (cmddrop.SelectedIndex.Equals(2))
            {
                dtgetpin = dtProc.SortPinby(Session["txtusr"].ToString(), "", "2", "", "", hosts, out expMessage);
                trbatch.Visible = false;
                txtdate.Visible = false;
            }
            else if (cmddrop.SelectedIndex.Equals(3))
            {
                txtdate.Visible = false;
                trbatch.Visible = false;
            }
            else if (cmddrop.SelectedIndex.Equals(4))
            {
                trbatch.Visible = false;
                txtdate.Visible = false;
            }
            else if (cmddrop.SelectedIndex.Equals(5))
            {
                txtdate.Visible = true;
                trbatch.Visible = false;
                //DateTime dttFrom = dtfrom.SelectedDate();
                string strDtFrom = String.Format("{0:yyyy/MM/dd}", dtfrom.SelectedDate); //dtfrom.SelectedDate.ToString("dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);//time.ToString("dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                string strDtTo = String.Format("{0:yyyy/MM/dd}", dtTo.SelectedDate);// dtTo.SelectedDate.ToString("dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                dtgetpin = dtProc.SortPinby(Session["txtusr"].ToString(), "", "5", strDtFrom, strDtTo, hosts, out expMessage);
            }
            else if (cmddrop.SelectedIndex.Equals(6))
            {
                trbatch.Visible = true;
            }
            if (dtgetpin == null)
            {
                return;
            }
            gridBatch.Visible = true;
            gridBatch.DataSource = dtgetpin;
           // gridBatch.DataBind();
            (sender as RadGrid).DataSource = dtgetpin;
            gridBatch.Skin = "WebBlue";
        }

        protected void btnprint_Click(object sender, EventArgs e)
        {
            #region [ XSLX FORMAT ]
            bool boolCards = false;
            if (drpPrintOption.SelectedIndex==0)
            {
              /*  RadGrid1.MasterTableView.GetColumn("BatchNo").HeaderStyle.BackColor = Color.LightGray;
                RadGrid1.MasterTableView.GetColumn("CardPin").ItemStyle.BackColor = Color.LightGray;
                RadGrid1.MasterTableView.GetColumn("Amount").ItemStyle.BackColor = Color.LightGray;*/
            }
            #endregion
            //RadGrid1.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), "Xlsx");

            //if (drpPrintOption.SelectedIndex == 0) RadGrid1.ExportSettings.IgnorePaging = false;
            //else  RadGrid1.ExportSettings.IgnorePaging = true;
            //RadGrid1.ExportSettings.ExportOnlyData = true;
            //RadGrid1.ExportSettings.OpenInNewWindow = true;
            //RadGrid1.MasterTableView.ExportToExcel();
        }
  protected void PrintPages(object sender, EventArgs e)
        {
            if(gvOrders.Visible=true)
            {
            if (drpPrintOption.SelectedIndex == 0) printOrdersCurrentPage();
            else printOrdersAllPages();
            }
            else
            {

            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            return;
        }
        // start Export to PDF

        public void exportGridToPDF()
        {
/*
            gridBatch.ExportSettings.Pdf.BorderType = GridPdfSettings.GridPdfBorderType.AllBorders;
            gridBatch.ExportSettings.Pdf.PageHeader.MiddleCell.Text = headerMiddleCell;
            gridBatch.ExportSettings.Pdf.PageHeader.MiddleCell.TextAlign = GridPdfPageHeaderFooterCell.CellTextAlign.Center;
            gridBatch.ExportSettings.Pdf.PageHeader.LeftCell.Text = headerLeftCell;
            gridBatch.ExportSettings.Pdf.PageHeader.LeftCell.TextAlign = GridPdfPageHeaderFooterCell.CellTextAlign.Center;
            gridBatch.ExportSettings.Pdf.PageFooter.MiddleCell.Text = footerMiddleCell;
            gridBatch.ExportSettings.Pdf.PageFooter.MiddleCell.TextAlign = GridPdfPageHeaderFooterCell.CellTextAlign.Center;
       */ }
        protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
        {
           // if (gridBatch.IsExporting)
            //    FormatGridItem(e.Item);
        }
        protected void FormatGridItem(GridItem item)
        {
            item.Style["color"] = "#eeeeee";

            if (item is GridDataItem)
            {
                item.Style["vertical-align"] = "middle";
                item.Style["text-align"] = "center";
            }

            switch (item.ItemType) //Mimic RadGrid appearance for the exported PDF file
            {
                case GridItemType.Item: item.Style["background-color"] = "#4F4F4F"; break;
                case GridItemType.AlternatingItem: item.Style["background-color"] = "#494949"; break;
                case GridItemType.Header: item.Style["background-color"] = "#2B2B2B"; break;
                case GridItemType.CommandItem: item.Style["background-color"] = "#000000"; break;
            }

            if (item is GridCommandItem)
            {
                item.PrepareItemStyle();  //needed to span the image over the CommandItem cells
            }
        }
        protected void BordersCombo_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            switch (e.Value)
            {
                case "0":
                    gridBatch.ExportSettings.Pdf.BorderType = GridPdfSettings.GridPdfBorderType.AllBorders;
                    break;
                case "1":
                    gridBatch.ExportSettings.Pdf.BorderType = GridPdfSettings.GridPdfBorderType.OuterBorders;
                    break;
                case "2":
                    gridBatch.ExportSettings.Pdf.BorderType = GridPdfSettings.GridPdfBorderType.TopAndBottom;
                    break;
                case "3":
                    gridBatch.ExportSettings.Pdf.BorderType = GridPdfSettings.GridPdfBorderType.NoBorder;
                    break;
            }
        }

        protected void HeaderAndFooterCombo_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            switch (e.Value)
            {
                case "0":
                    gridBatch.ExportSettings.Pdf.PageHeader.MiddleCell.Text = String.Empty;
                    gridBatch.ExportSettings.Pdf.PageHeader.LeftCell.Text = String.Empty;
                    gridBatch.ExportSettings.Pdf.PageFooter.MiddleCell.Text = String.Empty;
                    break;
                case "1":
                    gridBatch.ExportSettings.Pdf.PageHeader.MiddleCell.Text = headerMiddleCell;
                    gridBatch.ExportSettings.Pdf.PageHeader.MiddleCell.TextAlign = GridPdfPageHeaderFooterCell.CellTextAlign.Center;
                    gridBatch.ExportSettings.Pdf.PageHeader.LeftCell.Text = headerLeftCell;
                    gridBatch.ExportSettings.Pdf.PageHeader.LeftCell.TextAlign = GridPdfPageHeaderFooterCell.CellTextAlign.Center;
                    gridBatch.ExportSettings.Pdf.PageFooter.MiddleCell.Text = footerMiddleCell;
                    gridBatch.ExportSettings.Pdf.PageFooter.MiddleCell.TextAlign = GridPdfPageHeaderFooterCell.CellTextAlign.Center;
                    break;
                case "2":
                    gridBatch.ExportSettings.Pdf.PageHeader.MiddleCell.Text = headerMiddleCell;
                    gridBatch.ExportSettings.Pdf.PageHeader.MiddleCell.TextAlign = GridPdfPageHeaderFooterCell.CellTextAlign.Center;
                    gridBatch.ExportSettings.Pdf.PageHeader.LeftCell.Text = headerLeftCell;
                    gridBatch.ExportSettings.Pdf.PageHeader.LeftCell.TextAlign = GridPdfPageHeaderFooterCell.CellTextAlign.Center;
                    gridBatch.ExportSettings.Pdf.PageFooter.MiddleCell.Text = String.Empty;

                    break;
                case "3":
                    gridBatch.ExportSettings.Pdf.PageHeader.MiddleCell.Text = String.Empty;
                    gridBatch.ExportSettings.Pdf.PageHeader.LeftCell.Text = String.Empty;
                    gridBatch.ExportSettings.Pdf.PageFooter.MiddleCell.Text = footerMiddleCell;
                    gridBatch.ExportSettings.Pdf.PageFooter.MiddleCell.TextAlign = GridPdfPageHeaderFooterCell.CellTextAlign.Center;
                    break;
            }
        }

        protected void ContentFilters_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            switch (e.Value)
            {
                case "0":
                    gridBatch.ExportSettings.Pdf.ContentFilter = GridPdfFilter.NoFilter;
                    break;
                case "1":
                    gridBatch.ExportSettings.Pdf.ContentFilter = GridPdfFilter.Ascii85;
                    break;
                case "2":
                    gridBatch.ExportSettings.Pdf.ContentFilter = GridPdfFilter.AsciiHex;
                    break;
                case "3":
                    gridBatch.ExportSettings.Pdf.ContentFilter = GridPdfFilter.Flate;
                    break;
            }
        }

        protected void DownloadPDF_Click(object sender, EventArgs e)
        {
            bool pageview = true;
            if (drpPrintOption.SelectedIndex == 0) pageview=false;
            else pageview=true;
            gridBatch.ExportSettings.IgnorePaging = true;
            gridBatch.ExportSettings.OpenInNewWindow = true;
            gridBatch.ExportSettings.Pdf.PageWidth = 1200;
            gridBatch.MasterTableView.ExportToPdf();
        }
        //End Export to PDF
        public void printOrdersCurrentPage()
        {
            gvOrders.PagerSettings.Visible = false;
            gvOrders.DataBind();
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            gvOrders.RenderControl(hw);
            string gridHTML = sw.ToString().Replace("\"", "'")
                .Replace(System.Environment.NewLine, "");
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload = new function(){");
            sb.Append("var printWin = window.open('', '', 'left=0");
            sb.Append(",top=0,width=1000,height=600,status=0');");
            sb.Append("printWin.document.write(\"");
            sb.Append(gridHTML);
            sb.Append("\");");
            sb.Append("printWin.document.close();");
            sb.Append("printWin.focus();");
            sb.Append("printWin.print();");
            sb.Append("printWin.close();};");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", sb.ToString());
            gvOrders.PagerSettings.Visible = true;
            gvOrders.DataBind();
        }
        public void printOrdersAllPages()
        {
            gvOrders.AllowPaging = false;
            gvOrders.DataBind();
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            gvOrders.RenderControl(hw);
            string gridHTML = sw.ToString().Replace("\"", "'")
                .Replace(System.Environment.NewLine, "");
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload = new function(){");
            sb.Append("var printWin = window.open('', '', 'left=0");
            sb.Append(",top=0,width=1000,height=600,status=0');");
            sb.Append("printWin.document.write(\"");
            sb.Append(gridHTML);
            sb.Append("\");");
            sb.Append("printWin.document.close();");
            sb.Append("printWin.focus();");
            sb.Append("printWin.print();");
            sb.Append("printWin.close();};");
            sb.Append("</script>");
            ClientScript.RegisterStartupScript(this.GetType(), "GridPrint", sb.ToString());
            gvOrders.AllowPaging = true;
            gvOrders.DataBind();
        }
        protected void cmddrop_click(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            DataTable dtsearchby = new DataTable();

            txtdate.Visible = true;
            trbatch.Visible = false;
            string expMessage = "";
           //SortPinby(string in_uname, string in_pin, string in_searchby, string dateFrom, string dateTo, string connLocation, out string expMessage
            if (cmddrop.SelectedIndex.Equals(0))
            {
                trbatch.Visible = false;
             txtdate.Visible = false;
            }
            else if (cmddrop.SelectedIndex.Equals(1))
            {
                dtsearchby = dtProc.SortPinby(Session["txtusr"].ToString(),"","1","","",hosts,out expMessage);
                trbatch.Visible = false;
             txtdate.Visible = false;
            }
            else if (cmddrop.SelectedIndex.Equals(2))
            {
                dtsearchby = dtProc.SortPinby(Session["txtusr"].ToString(), "", "2", "", "", hosts, out expMessage);
                trbatch.Visible = false;
             txtdate.Visible = false;
            }
            else if (cmddrop.SelectedIndex.Equals(3))
            {
             txtdate.Visible = false;
                trbatch.Visible = false;
            }
            else if (cmddrop.SelectedIndex.Equals(4))
            {
                trbatch.Visible = false;
               txtdate.Visible = false;
            }
            else if (cmddrop.SelectedIndex.Equals(5))
            {
                txtdate.Visible = true;
                trbatch.Visible = false;
                //DateTime dttFrom = dtfrom.SelectedDate();
                string strDtFrom = String.Format("{0:yyyy/MM/dd}", dtfrom.SelectedDate); //dtfrom.SelectedDate.ToString("dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);//time.ToString("dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                string strDtTo = String.Format("{0:yyyy/MM/dd}", dtTo.SelectedDate);// dtTo.SelectedDate.ToString("dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                  dtsearchby = dtProc.SortPinby(Session["txtusr"].ToString(), "", "5",strDtFrom, strDtTo, hosts, out expMessage);
            }
            else if (cmddrop.SelectedIndex.Equals(6))
            {
                trbatch.Visible = true;
                txtdate.Visible = false;
            }

            if ((dtsearchby == null) || (dtsearchby.Rows.Count < 1))
            {
                string strDrp = cmddrop.SelectedText;
                lblGridBatch.Text = "No " + strDrp + " record found";
                lblGridBatch.Visible = true;
                gridBatch.Visible = false;
            }// return;
            else
            {
                lblGridBatch.Visible = false;
                gridBatch.Visible = true;
            gridBatch.DataSource = null;
            gridBatch.DataSource = dtsearchby;
            gridBatch.Skin = "WebBlue";
            gridBatch.DataBind();
            }
        }
        //
        // End Saved Beneficiary
        //

        /*
         Start Block PIN Request
         */

        public void BindGrid(Int32 queryby)
        {
            string txtCardNumber = txtbacth.Text;//.Value;
            strusr = Session["txtUsr"].ToString();
            string query = "";

            if (queryby == 0)
                query = "select * from orderdetails where orderby ='" + strusr + "' and orderstatus = 'completed' and ordernumber='" + txtCardNumber + "'";
            else if (queryby == 1)
                query = "select * from orderdetails where orderby ='" + strusr + "' and orderstatus = 'completed' and cardpin_sn='" + txtCardNumber + "'";
            else
                query = "select * from orderdetails where orderby ='" + strusr + "' and orderstatus = 'completed' and card_pin='" + txtCardNumber + "'";
            try
            {
                SqlCommand cmd = new SqlCommand(query);
                gvOrders.DataSource = this.ExecuteQuery(cmd, "SELECT");
                gvOrders.DataBind();
                gvOrders.Visible = true;
            }
            catch { }
        }
        public DataTable ExecuteQuery(SqlCommand cmd, string action)
        {
            try
            {
                string conString = ConfigurationManager.ConnectionStrings["saveaseSqlLocal"].ConnectionString;
                using (SqlConnection con = new SqlConnection(conString))
                {
                    cmd.Connection = con;
                    switch (action)
                    {
                        case "SELECT":
                            using (SqlDataAdapter sda = new SqlDataAdapter())
                            {
                                sda.SelectCommand = cmd;
                                using (DataTable dt = new DataTable())
                                {
                                    sda.Fill(dt);
                                    Int32 intRow = dt.Rows.Count;
                                    return dt;
                                }
                            }
                        case "UPDATE":
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            break;
                    }
                }
            }
            catch
            {

            }
            return null;
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

            }
        }
        //dtFrom_click
        protected void dtFrom_click(object sender, SelectedDateChangedEventArgs e)
        {

            if(string.IsNullOrEmpty(dtfrom.SelectedDate.ToString()))
            {
                lblmes.Text = "Enter valid start date.";
                lblmes.ForeColor = Color.Red;
                lblmes.Font.Bold = true;
                return;
            }
            if(string.IsNullOrEmpty(dtTo.SelectedDate.ToString()))
            {
                lblmes.Text = "Enter valid End date.";
                lblmes.ForeColor = Color.Red;
                lblmes.Font.Bold = true;
                return;
            }

            txtdate.Visible = true;
            trbatch.Visible = false;
            DataTable dtsearchby = new DataTable();
            string expMessage = "";
            DateTime dtFrom1 =Convert.ToDateTime(dtfrom.SelectedDate).AddDays(-1);
            DateTime dtTo1 =Convert.ToDateTime(dtTo.SelectedDate).AddDays(1);
            string strDtFrom = String.Format("{0:yyyy/MM/dd}", dtFrom1); //dtfrom.SelectedDate.ToString("dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);//time.ToString("dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            string strDtTo = String.Format("{0:yyyy/MM/dd}", dtTo1);// dtTo.SelectedDate.ToString("dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            dtsearchby = dtProc.SortPinby(Session["txtusr"].ToString(), "", "5", strDtFrom.Replace("/","-"), strDtTo, hosts, out expMessage);

            gridBatch.DataSource = null;
            gridBatch.DataSource = dtsearchby;
            gridBatch.Skin = "WebBlue";
            gridBatch.DataBind();
        }
        protected void OnCheckedChanged(object sender, EventArgs e)
        {
            bool isUpdateVisible = false;
            CheckBox chk = (sender as CheckBox);
            if (chk.ID == "chkAll")
            {
                foreach (GridViewRow row in gvOrders.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        row.Cells[0].Controls.OfType<CheckBox>().FirstOrDefault().Checked = chk.Checked;
                    }
                }
            }
            CheckBox chkAll = (gvOrders.HeaderRow.FindControl("chkAll") as CheckBox);
            chkAll.Checked = true;
            foreach (GridViewRow row in gvOrders.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    bool isChecked = row.Cells[0].Controls.OfType<CheckBox>().FirstOrDefault().Checked;

                    for (int i = 1; i < row.Cells.Count; i++)
                    {
                        /*
                        row.Cells[i].Controls.OfType<Label>().FirstOrDefault().Visible = !isChecked;
                        if (row.Cells[i].Controls.OfType<TextBox>().ToList().Count > 0)
                        {
                            row.Cells[i].Controls.OfType<TextBox>().FirstOrDefault().Visible = isChecked;
                        }
                        if (row.Cells[i].Controls.OfType<DropDownList>().ToList().Count > 0)
                        {
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().Visible = isChecked;
                        }*/
                        if (isChecked && !isUpdateVisible)
                        {
                            isUpdateVisible = true;
                        }
                        if (!isChecked)
                        {
                            chkAll.Checked = false;
                        }
                    }
                }
            }
            btnUpdate.Visible = isUpdateVisible;
        }
        protected void BlockPin_Click(object sender, EventArgs e)
        {
             string in_newOrderNumber = getOrderNumber();
            string tblTR = "";
            string tblOrder = "<strong>Order Number: " + in_newOrderNumber;
            tblOrder = tblOrder + "<table><tr><td>";
            string tblBody = "";
            // dtProc.insertRebatch(string in_newOrderNumber,, double , string in_orderby, string in_computerName, string in_ipaddress, out string expObj)
            Int32 queryby = cmdBlockPrint.SelectedIndex;
            string insertBlockReq = "insert into blockPinReq (blockBy,orderNumber,uniqueID,reqDate,reqStatus,reqBy)";
            string today = DateTime.Today.ToString();
            string in_orderBy= Session["txtUsr"].ToString();
            string in_computerName="";
            string in_ipaddress ="";
                            string expObj="";
            foreach (GridViewRow row in gvOrders.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    bool isChecked = row.Cells[0].Controls.OfType<CheckBox>().FirstOrDefault().Checked;
                    if (isChecked)
                    {
                        string query = "";
                        string strOrderNumber = row.Cells[4].Controls.OfType<Label>().FirstOrDefault().Text;
                        SqlCommand cmd;
                        try
                        {
                            string in_oldOrderNumber = strOrderNumber;//, 
                            string in_newCardPin = genPin();
                            string in_newSerialNumber = genSN();
                            string in_oldCardPin= row.Cells[2].Controls.OfType<Label>().FirstOrDefault().Text;
                            string in_oldSerialNumber = row.Cells[3].Controls.OfType<Label>().FirstOrDefault().Text;
                            string in_amount = row.Cells[5].Controls.OfType<Label>().FirstOrDefault().Text;//, string in_oldSerialNumber
                            cmd = new SqlCommand(insertBlockReq + " values(@blockBy,@orderNumber,@uniqueID,@reqDate,@reqStatus,@reqBy)");
                            cmd.Parameters.AddWithValue("@blockBy", cmdBlockPrint.SelectedItem.Text);
                            cmd.Parameters.AddWithValue("@orderNumber", strOrderNumber);
                            // cmd.Parameters.AddWithValue("@uniqueID", Raddrp.SelectedItem.Text);
                            cmd.Parameters.AddWithValue("@uniqueID", row.Cells[3].Controls.OfType<Label>().FirstOrDefault().Text);
                            cmd.Parameters.AddWithValue("@reqDate", today);
                            cmd.Parameters.AddWithValue("@reqStatus", "Block");
                            cmd.Parameters.AddWithValue("@reqBy", strusr);
                            this.ExecuteQuery(cmd, "SELECT");
                            lblmes.Visible = true;
                            lblmes.Text = "Block PIN Request Successful...";
                            lblmes.ForeColor = Color.OrangeRed;
                            dtProc.insertRebatch(in_newOrderNumber, in_newCardPin, in_newSerialNumber, in_oldOrderNumber,in_oldCardPin,in_oldSerialNumber,double.Parse(in_amount),in_orderBy,in_computerName,in_ipaddress,out expObj);
                            dtProc.saveOrder("Completed", in_newCardPin, in_newSerialNumber, in_newOrderNumber, in_amount, double.Parse(in_amount),0, 0, in_orderBy, in_computerName, in_ipaddress, out expObj);
                            tblTR = tblTR + "<table border='1'>";
                            tblTR = tblTR + "< tr><td> PIN: '" + in_newCardPin + "'</td></tr>";
                            tblTR = tblTR + "< tr><td> S/N: '" + in_newSerialNumber + "'</td></tr>";
                            tblTR = tblTR + "< tr><td> Amount: '" + in_amount + "'</td></tr>";
                            tblTR = tblTR + "</table>";
                        }
                        catch (Exception exp)
                        {
                            lblmes.Visible = true;
                            lblmes.Text = "Error!  " + exp.Message + "...";
                            lblmes.ForeColor = Color.OrangeRed;
                            return;
                        }

                    }
                }
            }
            tblOrder = tblOrder + tblBody + tblTR + "</td></tr></table>";
            mailHelper mh = new mailHelper();
            DateTime TransDate = DateTime.Today;
            string msgBody = mh.populatBuyPin(TransDate.ToString(), tblOrder);
            string expMessage = "";
            dtProc.composeMail(hideSEID.Value, "Credit Alert <Rebatched>", " Order Number: " + in_newOrderNumber,hideFullName.Value, hideSEID.Value, hideFullName.Value, in_newOrderNumber, out expMessage);

            btnUpdate.Visible = false;
            this.BindGrid(queryby);
        }
        
        /*
End Block PIN Request

General page controller
*/
        protected void cmdBlockPrint_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            if (cmdBlockPrint.SelectedIndex.Equals(0))
            {
                lblBatch.Text = "Batch Number";
                txtbacth.Text = "";
            }
            if (cmdBlockPrint.SelectedIndex.Equals(1))
            {
                lblBatch.Text = "Serial Number";
                txtbacth.Text = "";
            }
            if (cmdBlockPrint.SelectedIndex.Equals(2))
            {
                lblBatch.Text = "Pin Number";
                txtbacth.Text = "";
            }

        }
        protected void RadRadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(RadRadioButtonList1.SelectedIndex==0)
            {
                cmdBlockPrint.Visible = false;
                trbatch1.Visible = false;
                lblBatch.Visible = true;
                gvOrders.Visible = false;
                btnUpdate.Visible = false;
                gridBatch.Visible = true;
                drpPrintOption.Visible = true;
                btnprint.Visible = true;
                cmddrop.Visible = true;
                tblAmount.Visible = true;
                //trbatch1.Visible = true;
                //trsea.Visible = false;
            }
            else
            {
                gvOrders.Visible = true;
                trbatch1.Visible = true;
                cmdBlockPrint.Visible = true;
                lblBatch.Visible = false;
                btnUpdate.Visible = true;
                gridBatch.Visible = false;
                drpPrintOption.Visible = false;
                btnprint.Visible = false;
                txtbacth.Visible = true;
                lblGridBatch.Visible = false;
                trbatch.Visible = true;
                tblAmount.Visible = false;
                cmddrop.Visible = false;
                //trsea.Visible = false;
                //trbatch1.Visible = true;
            }
        }

        protected void btnsnd_Click(object sender, ImageClickEventArgs e)
        {
                string in_batch = txtbacth.Text;
            if (RadRadioButtonList1.SelectedIndex == 0)
            {
                if (string.IsNullOrEmpty(in_batch))
                {
                    lblmes.Visible = true;
                    lblmes.Text = "Enter Batch Code...";
                    lblmes.ForeColor = Color.OrangeRed;
                    txtbacth.Focus();
                    txtbacth.ForeColor = Color.OrangeRed;
                    return;
                }
                loadGrid(in_batch);
            }
            else
            {
                if (string.IsNullOrEmpty(in_batch))
                {
                    lblmes.Visible = true;
                    lblmes.Text = "Enter value for field available...";
                    lblmes.ForeColor = Color.OrangeRed;
                    txtbacth.Focus();
                    txtbacth.ForeColor = Color.OrangeRed;
                    return;
                    this.BindGrid(Int32.Parse(txtbacth.Text));
                }
                else
                {
                    this.BindGrid(cmdBlockPrint.SelectedIndex);
                }
            }
        }

        /*Generate Rebatch Pin/Serial Number/order Number*/


        public string genSN()
        {
            Random rnd = new Random();
            string rands = "";
            for (int i = 0; i < 2; i++)
            {
                int myRandomNo = rnd.Next(10000000, 99999999);
                rands = rands + myRandomNo;
            }
            return rands;
        }
        public string genPin()
        {
            Random rnd = new Random();
            string rands = "", rands1 = "";
            for (int i = 0; i < 2; i++)
            {
                int myRandomNo = rnd.Next(100000, 999999);
                rands = rands + myRandomNo;
            }
            return rands;
        }

        public string getOrderNumber()
        {
            string getdates = DateTime.Now.ToString("d/M/yyyy");
            getdates = getdates.Replace("/", "");
            getdates = getdates.Trim();
            // if(getdates.Length<)
            Random rnd = new Random();
            string rands = "";
            //for (int i = 0; i < 2; i++)
            // {
            int myRandomNo = rnd.Next(100000, 999999);
            rands = rands + myRandomNo;
            // }
            return rands + getdates;
        }


    }
}