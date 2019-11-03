using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class orderGrid : System.Web.UI.Page
    {
        procedurs procc = new procedurs();
        string hosts = "";// Session["host"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            hosts = Session["host"].ToString();
            if (!Page.IsPostBack)
                loadGrid();
        }

        protected void loadGrid1()
        {
           // string dFrm = string.Format("{0:dd/MM/yyyy}", dateFrom.SelectedDate);
            //Convert.ToDateTime();
           // string dTo = string.Format("{0:dd/MM/yyyy}", dateTo.SelectedDate);
           
            GridView1.DataSource = new string[] { };
            //RadGrid1.DataSource = null;
            GridView1.DataBind();
           /* GridView1.Columns.Clear();*/

           // BoundField bfield = new BoundField();
            BoundField boundColumn;
            //  if (RadFilter.SelectedIndex == 0)
            // {
            // RadGrid1.DataSource =  oTier4.fdProduced_FS(cmbField.SelectedValue, 
            //Convert.ToDateTime(dateFrom.SelectedDate), Convert.ToDateTime(dateTo.SelectedDate));
            // loadBuyPinAll( string connLocation, out string expMessage)
            string expMessage;
            DataTable dtl = procc.loadBuyPinAll(hosts, out  expMessage);
            Int32 dtCount = dtl.Rows.Count;
            GridView1.DataSource = dtl;
            /* boundColumn = new BoundField();
            GridView1.Columns.Add(boundColumn);
            // bfield.DataFormatString = "{0:dd/MM/yyyy}";
            boundColumn.DataField = "cardType";
            boundColumn.HeaderText = "Product type";
            //}
            boundColumn = new BoundField();
            GridView1.Columns.Add(boundColumn);
            boundColumn.DataField = "Card_pin";
            boundColumn.ItemStyle.Width = 150;
            boundColumn.HeaderText = "PIN";

            boundColumn = new BoundField();
            GridView1.Columns.Add(boundColumn);
            boundColumn.DataField = "cardpin_sn";
            boundColumn.ItemStyle.Width = 150;
            boundColumn.HeaderText = "Card Serial";

            boundColumn = new BoundField();
            GridView1.Columns.Add(boundColumn);
            boundColumn.DataFormatString = "{0:dd/MM/yyyy}";
            boundColumn.DataField = "OderDate";
            boundColumn.ItemStyle.Width = 150;
            boundColumn.HeaderText = "Order Date";
           */

            GridView1.DataBind();
/*
            boundColumn = new GridBoundColumn();
            RadGrid1.MasterTableView.Columns.Add(boundColumn);
            boundColumn.DataField = "Cond";
            boundColumn.HeaderText = "Cond<br />(bbl)";
            boundColumn = new GridBoundColumn();
            RadGrid1.MasterTableView.Columns.Add(boundColumn);
            boundColumn.DataField = "SAnd";
            boundColumn.HeaderText = "Sand<br />(pptb)";
            if (!needDTS.Equals("skip")) RadGrid1.DataBind();*/
            //daterow.Visible = true;
        }
        public void loadGrid()
        {
            string expMessage;
            DataTable dt = procc.loadBuyPinAll(hosts, out  expMessage);

            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            loadGrid();
        }
        protected void go_fs_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
           // skipMethod = "skip";
            try
            {
                // errDisplay.Text = "";
                /*
                string alternateText = (sender as ImageButton).AlternateText;
                RadGrid1.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), alternateText);
                RadGrid1.ExportSettings.IgnorePaging = false;
                //   RadGrid1.ExportSettings.IgnorePaging = true;
                RadGrid1.ExportSettings.ExportOnlyData = true;
                RadGrid1.ExportSettings.OpenInNewWindow = true;
                RadGrid1.MasterTableView.ExportToExcel();*/
            }
            catch (Exception ee)
            {
                //  errDisplay.Text = ee.Message;
            }
        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.loadGrid();
        }
    }
}