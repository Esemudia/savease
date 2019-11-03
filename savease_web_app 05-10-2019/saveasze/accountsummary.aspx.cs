using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class accountsummary : System.Web.UI.Page
    {
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
        /*
        DataTable dt50 = new DataTable();
        DataTable dt100 = new DataTable();
        DataTable dt200 = new DataTable();
        DataTable dt500 = new DataTable();
        DataTable dt1000 = new DataTable();
        DataTable dt2000 = new DataTable();
        DataTable dt5000 = new DataTable();
        */
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
        protected void TextBoxPrice_TextChanged(object sender, EventArgs e)
        {
            string str50 = (string.IsNullOrEmpty(txt50.Text)) ? "0" : txt50.Text;
            Int32 int50 = Int32.Parse(str50) * 50;
            rst500.Text = "N" + String.Format("{0:n}", int50);
          /*  Int32 intTxt50 = Int32.Parse(txt50.Text);
            if(intTxt50>0)
            dt50 =getTable(intTxt50);*/
            // rst50.Text = int500.ToString(); 

            string str100 = (string.IsNullOrEmpty(txt100.Text)) ? "0" : txt100.Text;
            Int32 int100 = Int32.Parse(str100) * 100;
            rst500.Text = "N" + String.Format("{0:n}", int100); 
           /* Int32 intTxt100 = Int32.Parse(txt100.Text);
            if(intTxt100>0)
            dt100 =getTable(intTxt100);*/
           // rst100.Text = int500.ToString();

            string str200 = (string.IsNullOrEmpty(txt200.Text)) ? "0" : txt200.Text;
            Int32 int200 = Int32.Parse(str200) * 200;
            rst500.Text = "N" + String.Format("{0:n}", int200); 
           /* Int32 intTxt200 = Int32.Parse(txt200.Text);
            if(intTxt200>0)
            dt200 =getTable(intTxt200);*/
           // rst200.Text = int500.ToString();

            string str500 = (string.IsNullOrEmpty(txt500.Text)) ? "0" : txt500.Text;
            Int32 int500 = Int32.Parse(str500) * 500;
            rst500.Text = "N" + String.Format("{0:n}", int500); 
           /*  Int32 intTxt500 = Int32.Parse(txt500.Text);
            if(intTxt500>0)
            dt500 =getTable(intTxt500);*/
           // rst500.Text = int500.ToString();

            string str1000 = (string.IsNullOrEmpty(txt1000.Text)) ? "0" : txt1000.Text;
            Int32 int1000 = Int32.Parse(str1000) * 1000;
            rst1000.Text = "N" + String.Format("{0:n}", int1000); 
           /*  Int32 intTxt1000 = Int32.Parse(txt1000.Text);
            if(intTxt1000>0)
            dt1000 =getTable(intTxt1000);*/
           // rst1000.Text = int1000.ToString();

            string str2000 = (string.IsNullOrEmpty(txt2000.Text)) ? "0" : txt2000.Text;
            Int32 int2000 = Int32.Parse(str2000) * 2000;
            rst2000.Text = "N" + String.Format("{0:n}", int2000); 
            /*Int32 intTxt2000 = Int32.Parse(txt2000.Text);
            if(intTxt2000>0)
            dt2000 =getTable(intTxt2000);*/
           // rst2000.Text = int2000.ToString();

            string str5000 = (string.IsNullOrEmpty(txt5000.Text)) ? "0" : txt5000.Text;
            Int32 int5000 = Int32.Parse(str5000) * 5000;
            rst5000.Text = "N" + String.Format("{0:n}", int5000); 
           /* Int32 intTxt5000 = Int32.Parse(txt5000.Text);
            if(intTxt5000>0)
            dt5000 =getTable(intTxt5000);*/
            //rst1000.Text = int1000.ToString();

            Int32 intrst = int50+int100 + int200 +int500 + int1000 + int2000 +int5000;
            rstSubTotal.Text = "N"+String.Format("{0:n}", intrst);

            rstTotal.Text = "N"+String.Format("{0:n}", intrst);
            // rstSubTotal.Text = intrst.ToString();

            /*
             */
        }
        public DataTable getTable( Int32 pinQty)
        {
            // Here we create a DataTable with four columns.
            DataTable table = new DataTable();
            table.Columns.Add("pin", typeof(string));
            table.Columns.Add("sn", typeof(string));
            table.Columns.Add("CreatedDate", typeof(DateTime));

            // Here we add five DataRows.
            for(int i =1;i<=pinQty;i++)
            {
                table.Rows.Add(25, genPin(), genSN(), DateTime.Now);
            }
            return table;
        }
        public string genPin()
        {
            Random rnd = new Random();
            string rands = "";
            for (int i = 0; i < 2; i++)
            {
                int myRandomNo = rnd.Next(100000, 999999);
                rands = rands + myRandomNo;
            }
            return rands;
        }
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
    }
}