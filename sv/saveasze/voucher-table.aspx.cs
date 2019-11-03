using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class voucher_table : System.Web.UI.Page
    {

        MailMgr mailMessenger = new MailMgr();
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
        DataTable dtgetpin = new DataTable();
        string userName = "";
        string strusr = "";
        string headerMiddleCell = "<h2>Transaction Log</h2>Report";
        // string headerLeftCell = "<img src=\"Images/sushibar.jpg\" alt=\"sushi bar\" style=\"width:64px; height: 64px;\" />";
        string headerLeftCell = "<img src=\"Images/sushibar.jpg\" alt=\"sushi bar\" style=\"width:64px; height: 64px;\" />";
        string footerMiddleCell = "<?page-number?>";
        protected void Page_Load(object sender, EventArgs e)
        {
            

            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            hosts = Request.Url.Host;
            string ipaddress;
            
            if (!Page.IsPostBack)
            {
                

                if (Session["txtUsr"].ToString() == null || Session["txtUsr"].ToString() == "")
                    Response.Redirect("login.aspx");
                else
                    userName = Session["txtUsr"].ToString();
                strusr = userName;
                try
                {
                    getUsedpin();
                    getUnUsedpin();
                }
                catch (Exception ex)
                {
                    //    lblMessage.Text = ex.Message;
                    //   lblMessage.BorderColor = Color.OrangeRed;
                }
            }
        }

        protected void getUsedpin()
        {
            string expMessage = "";
            dtgetpin = dtProc.SortPinby(Session["txtusr"].ToString(), "", "1", "", "", hosts, out expMessage);
            Gridusedpin.Visible = true;
            Gridusedpin.DataSource = dtgetpin;
            Gridusedpin.DataBind();
            Gridusedpin.AllowPaging = true;
        }
        protected void getUnUsedpin()
        {
            string expMessage = "";
            dtgetpin = dtProc.SortPinby(Session["txtusr"].ToString(), "", "2", "", "", hosts, out expMessage);
            GridView1.Visible = true;
            GridView1.DataSource = dtgetpin;
            GridView1.DataBind();
            GridView1.AllowPaging = true;
        }

        protected void usedtab_Click(object sender, EventArgs e)
        {
            used.Visible = true;
            unUsed.Visible = false;
            getUsedpin();
        }

        protected void unUsedtab_Click(object sender, EventArgs e)
        {
            used.Visible = false;
            unUsed.Visible = true;
            getUnUsedpin();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.getUnUsedpin();
        }

        protected void Gridusedpin_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Gridusedpin.PageIndex = e.NewPageIndex;
            this.getUsedpin();
        }
    }
}