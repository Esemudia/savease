using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class manageVendor : System.Web.UI.Page
    {
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
        protected void Page_Load(object sender, EventArgs e)
        {
           // hosts = Session["hosts"].ToString();
            hosts = Request.Url.Host; ;
        }
        public void leftNavigation()
        {
            if (Session["accesscontrol"]=="" || Session["accesscontrol"] == null)
            {
                Response.Redirect("login.aspx");
            }
            string accesscontrol = Session["accesscontrol"].ToString();
            //
            string expMessage = "";
            DataTable dtNav = dtProc.getLeftNavigation(Int32.Parse(accesscontrol),hosts,out expMessage);
            foreach (DataRow row in dtNav.Rows)
            {
                string link = row["link"].ToString()+".aspx";
                string strText = row["text"].ToString();
            string leftNav=  "<li class='active'><a href='"+link+"'>"+strText+"</a></li>";
            Response.Write(leftNav);
            }
        }

        protected void genPin1_Click(object sender, EventArgs e)
        {
            pinRow1.Visible = true;
            //lblgenPin1.Text = RandomPassword();
            Random rnd = new Random();
            string rands = "";
            for (int i = 0; i < 2; i++)
            {
                int myRandomNo = rnd.Next(100000, 999999);
                rands = rands + myRandomNo;
            }
            lblgenPin1.Text = rands;
        }
    }
}