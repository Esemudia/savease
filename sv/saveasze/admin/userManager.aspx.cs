using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace saveasze.admin
{
    public partial class userManager : System.Web.UI.Page
    {
        MailMgr mailMessenger = new MailMgr();
        procedurs dtProc = new procedurs();
        // navigations nav = new navigations();
        string hosts = "";
        //DataTable dtBankDeposit = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

            //RadGrid1.Skin = "WebBlue";
            string userName = "";
            hosts = Request.Url.Host;
            string ipaddress;
            /* ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
             if (ipaddress == "" || ipaddress == null)
                 ipaddress = Request.ServerVariables["REMOTE_ADDR"];
             lblIP.Text = ipaddress;*/
            if (!Page.IsPostBack)
            {

                if (Session["txtUsr"] == null || Session["txtUsr"].ToString() == "")
                    Response.Redirect("Default.aspx");
                else
                    userName = Session["txtUsr"].ToString();

            }
        }

        protected void RadGrid1_DeleteCommand(object source, GridCommandEventArgs e)
        {
            var productId = (int)((GridDataItem)e.Item).GetDataKeyValue("ID");

            //retrive entity form the Db
            // var product = DbContext.Products.Where(n => n.ProductID == productId).FirstOrDefault();
            string uid = productId.ToString();
            if (!string.IsNullOrEmpty(uid))//productId != null)
            {
                //add the product for deletion
                // DbContext.Products.DeleteObject(product);
                try
                {
                    //save chanages to Db
                    // write deletFunction(var)
                }
                catch (System.Exception)
                {
                    // ShowErrorMessage();
                }
            }
        }
    }
}