using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class testing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBoxPrice_TextChanged(object sender, EventArgs e)
        {
            string price1 = (string.IsNullOrEmpty(TextBoxPrice1.Text)) ? "0": TextBoxPrice1.Text;
            string price2 = (string.IsNullOrEmpty(TextBoxPrice2.Text)) ? "0": TextBoxPrice2.Text;
            Int32 intrst = Int32.Parse(price1) + Int32.Parse(price2);
            rst.Text = intrst.ToString();
        }
    }
}