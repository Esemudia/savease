using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class randomGen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string getdates = DateTime.Now.ToString("dd/MM/yyyy");
            getdates = getdates.Replace("/", "");
            getdates = getdates.Trim();
            lblGen.Text= genPin();
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
    }
}