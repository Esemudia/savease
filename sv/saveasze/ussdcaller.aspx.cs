using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class ussdcaller : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            localhost.USSD_Service service = new localhost.USSD_Service();
            // string str = service.USSDPost();
            lblTest.Text = service.USSDPost();
          //  lblTest.Text = "Card: " + output.CountryName;
        }
    }
}