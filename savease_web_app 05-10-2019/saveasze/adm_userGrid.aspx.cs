using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class adm_userGrid : System.Web.UI.Page
    {
        procedurs dtProc = new procedurs();
        string hosts = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            hosts = Session["hosts"].ToString();
        }
        public void leftNavigation()
        {
            string accesscontrol = Session["accesscontrol"].ToString();
            //
            string expMessage = "";
            DataTable dtNav = dtProc.getLeftNavigation(Int32.Parse(accesscontrol), hosts,out expMessage);
            foreach (DataRow row in dtNav.Rows)
            {
                string link = row["link"].ToString()+".aspx";
                string strText = row["text"].ToString();
            string leftNav=  "<li class='active'><a href='"+link+"'>"+strText+"</a></li>";
            Response.Write(leftNav);
            }
        }
    }
}