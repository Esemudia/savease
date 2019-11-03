using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Paystack.Net.SDK.Transactions;
using Paystack.Net.SDK;
using Paystack.Net.Contstants;
using Paystack.Net.Models;
using Paystack.Net.Interfaces;

namespace saveasze
{
    public partial class pay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void initializeTransaction()
        {
            var paystackTransactionAPI = new PaystackTransaction("");
            var response = await paystackTransactionAPI.InitializeTransaction("customer@gmail.com", 500000);
            if (response.status)
            {
                Response.AddHeader("Access-Control-Allow-Origin", "*");
                Response.AppendHeader("Access-Control-Allow-Origin", "*");
                Response.Redirect(response.data.authorization_url);
            }
            else
            {
                //Handle Error
            }
        }
    }
}