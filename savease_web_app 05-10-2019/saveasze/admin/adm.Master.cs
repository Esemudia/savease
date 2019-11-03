using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace saveasze.admin
{
    public partial class adm : System.Web.UI.MasterPage
    {
        procedurs proc = new procedurs();
        string hosts = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            procedurs dtProc = new procedurs();
            hosts = Request.Url.Host;
            Session["host"] = hosts;
            getuname();
            if (!Page.IsPostBack)
            {
                /**/
                if (Session["displayName"] != null)
                {
                    // cmdOptionDiv.Visible = true;
                    //loginAnchor.Visible = false;
                    // quickDesposit.Visible = true;
                    lblUsr.Text = Session["displayName"].ToString();
                }


                // else cmdOptionDiv.Visible = false;
            }
            getuname();
            string uname = lbluname.Text;
            string displayName = "";
            string strEmail = "";
            string strPhone = "";
            string expMessage = "";
            string straccessControl = dtProc.accessControl(uname, out displayName, hosts, out strEmail, out strPhone, out expMessage).ToString();
            if (straccessControl.Equals(-1))
            {
                LiAdd.Visible = true;
            }
            else
            {
                LiAdd.Visible = false;
            }
        }
        public void showLink()
        {
            if (Session["txtUsr"] != null)
            {
                //Redirect to Welcome Page if Session is not null
                //Response.Redirect("Welcome.aspx");
                Response.Write("logout.aspx");
                //   <li class='active '>	<a href='#' class='dropdown-toggle'><i class=' fa '></i>
                //  btnLogin.Visible = false;
                // btnLogout.Visible = true;
            }
            else
            {
                Response.Write("Default.aspx");
            }
            if (!Page.IsPostBack)
            {
                if (Session["txtUsr"] != null)
                {
                    string cmdName = Session["txtUsr"].ToString();
                    DataTable theTable = new DataTable();
                    theTable.Columns.Add("Names", typeof(string));
                    theTable.Rows.Add(cmdName);
                    // theTable.Rows.Add("My Transactions");
                    theTable.Rows.Add("Logout");

                    for (int i = 0; i < theTable.Rows.Count; i++)
                    {
                        string theValue = theTable.Rows[i].ItemArray[0].ToString();
                        //cmdOptions.Items.Add(theValue);
                    }
                }
            }

        }
        public void getuname()
        {
            string expMessage = "";
            int ctr = 0;
            //getCardPin(string pin, string connLocation, out string )
            DataTable dtCardDetaail = new DataTable();
            int ctr1 = 0;
            try
            {
                dtCardDetaail = proc.getAdminUname(Session["displayName"].ToString(), hosts, out expMessage);
                foreach (DataRow dr in dtCardDetaail.Rows)
                {
                    string vent = "";
                    ctr1 = dtCardDetaail.Rows.Count;
                    vent = dr["username"].ToString();
                    // tdMessage.Visible = false;
                    //  lblAcctName.Text = dr[""].ToString();
                    lbluname.Text = vent;
                }
            }
            catch (Exception ex)
            {
                string mmsg = ex.ToString();

                //tdMessage.Visible = true;
                // lblMessage.Text = mmsg;
                //lblMessage.BorderColor = Color.OrangeRed;
                return;
            }
        }
    }
}