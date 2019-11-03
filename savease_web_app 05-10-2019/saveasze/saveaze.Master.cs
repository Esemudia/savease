using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using saveasze;

public partial class saveaze : System.Web.UI.MasterPage
{
    procedurs proc = new procedurs();
    string hosts = "";
    protected void Page_Load(object sender, EventArgs e)
    {
         hosts = Request.Url.Host;
        Session["host"] = hosts;
        if (!Page.IsPostBack)
        {
/**/
            if (Session["displayName"] != null)
            { 
                //cmdOptionDiv.Visible = true;
                //loginAnchor.Visible = false;
                //quickDesposit.Visible = true;
               // lblUsr.Text = Session["displayName"].ToString();
            }
            //else //cmdOptionDiv.Visible = false;
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
            Response.Write("login.aspx");
        }
        if(!Page.IsPostBack)
        {
            if (Session["txtUsr"] != null)
            {
                string cmdName = Session["txtUsr"].ToString();
                DataTable theTable = new DataTable();
                theTable.Columns.Add("Names", typeof(string));
                theTable.Rows.Add(cmdName);
                theTable.Rows.Add("My Transactions");
                theTable.Rows.Add("Logout");

                for (int i = 0; i < theTable.Rows.Count; i++)
                {
                    string theValue = theTable.Rows[i].ItemArray[0].ToString();
                    //cmdOptions.Items.Add(theValue);
                }
            }
        }
    }
    public void showLogin()
    {
        if (Session["txtUsr"] != null)
        {
            Response.Write("Logout");
        }
        else
        {
            Response.Write("Login | Register");
           // btnLogin.Visible = true;
           // btnLogout.Visible = false;

        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        string expMessage = "";
        string in_computerName = Dns.GetHostName();
        string in_ipaddress = Dns.GetHostByName(Dns.GetHostName()).AddressList[0].ToString();
        string str_saveaseID = proc.getSaveaseID_By_Name(Session["txtUsr"].ToString(), hosts, out expMessage);
        //  =================== Logs ==========================
        // Login
        Int32 intLoggedIn = proc.LoginLog(str_saveaseID, "", "Logged out", "Offline", in_computerName, in_ipaddress, "u", out expMessage);
        //System Log
        Session["txtUsr"] = null;
        Response.Redirect("Default.aspx");
    }
    public void horizontalMenu()
    {
        DataTable dtMenuGroup = new DataTable();
        try
        {
            string expMessage = "";
            dtMenuGroup = proc.getMenuGroup(hosts,out expMessage);
            for (int i = 0; i < dtMenuGroup.Rows.Count; i++)
            {
                // groupHeader 
                //loadPFDTS.Rows[0]["FIELDNAME"].ToString();
                /*
                 <li class="active"><a href="index.html">Home</a></li>

                        <li><a href="#">About us</a>
                        <ul class="dropdown">
                            <li><a href="#">About us</a></li>
                            <li><a href="#">Meet Our Team</a></li>
                            <li><a href="#">FAQ’s</a></li>
                            <li><a href="#">Client Feedback</a></li>
                         </ul>
                        </li>
                 */

                // Response.Write("  <li class='active '>	<a href='#' class='dropdown-toggle'><i class=' fa '></i>");
                Response.Write("  <li class='active '>	<a href='#'>" + dtMenuGroup.Rows[i]["TITLE"].ToString() + "</a>");
                // Response.Write("<span class='menu-text'> " +  + " </span>");
                // Response.Write("<b class='arrow fa fa-angle-down'></b></a>");
                // Response.Write("<b class='arrow'></b>");
                string tits = dtMenuGroup.Rows[i]["MenuID"].ToString();
                DataTable dtMenuDetails = new DataTable();
                dtMenuDetails.Clear();
                string parID = dtMenuGroup.Rows[i]["MenuID"].ToString();
                if (parID != "-1")
                {
                    dtMenuDetails = proc.getMenuDetails(hosts,parID, out expMessage);
                    if (dtMenuDetails.Rows.Count > 0)
                    {

                        Response.Write("<ul class='dropdown'>");
                        for (int ii = 0; ii < dtMenuDetails.Rows.Count; ii++)
                        {
                            string links = dtMenuDetails.Rows[ii]["LINK"].ToString();
                            string title = dtMenuDetails.Rows[ii]["TITLE"].ToString();
                            Response.Write("<li><a href='" + links + "'>" + title + "</a></li>");

                        }
                        Response.Write("</ul>");
                    }
                }

                Response.Write("</li>");

            }
        }
        catch (Exception e)
        {

        }

        // Clean up
        //reader2.Dispose();
        //reader.Dispose();
        //con.Dispose();
    }

    protected void cmdOptions_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Int32 optionsSelect = //cmdOptions.SelectedIndex;
    }
    public void showhidez()
    {
        Response.Write("display:none");
    }
    public void loggedInUserLink()
    {
        if (Session["txtUsr"] != null)
        {
           // Response.Write("display:block");
            Response.Write("display:block");
        }
        else
        {
            Response.Write("display:block");
          //  Response.Write("display:none");
            // btnLogin.Visible = true;
            // btnLogout.Visible = false;

        }
    }
}