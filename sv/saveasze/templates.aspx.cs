using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class templates : System.Web.UI.Page
    {
        procedurs dtProc = new procedurs();
        string hosts = "";
        //double totals;
        protected void Page_Load(object sender, EventArgs e)
        {
            hosts = Request.Url.Host;
            string expMessage = "";
             Session["sessSaveID"]=dtProc.getSaveaseID_By_Name(Session["txtUsr"].ToString(), hosts, out expMessage);
            string svid= Session["sessSaveID"].ToString();
        }
        /*
        private void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                int fieldValue = int.Parse(dataItem["Quantity"].Text);
                total += fieldValue;
            }
            if (e.Item is GridFooterItem)
            {
                GridFooterItem footerItem = e.Item as GridFooterItem;
                footerItem["Quantity"].Text = "total: " + total.ToString();
            }
        }*/
    }
}