using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class blockpinreq : System.Web.UI.Page
    {
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
        string strusr = "";
        protected void Page_Load(object sender, EventArgs e)
        {
           // hosts = Session["hosts"].ToString();
            hosts = Request.Url.Host;
            strusr = Session["txtUsr"].ToString();
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
        

        protected void Raddrp_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            if (Raddrp.SelectedIndex.Equals(0)) {
                lblbatch.Text = "Batch Number";
                txtVal.Text = "";
            }
            if (Raddrp.SelectedIndex.Equals(1))
            {
                lblbatch.Text = "Serial Number";
                txtVal.Text = "";
            }
            if (Raddrp.SelectedIndex.Equals(2))
            {
                lblbatch.Text = "Pin Number";
                txtVal.Text = "";
            }

        }

        public void BindGrid(Int32 queryby)
        {
            string txtCardNumber = txtVal.Text;
            string query = "";
           
            if (queryby == 0)
                query = "select * from orderdetails where orderby ='"+ strusr + "' and orderstatus = 'completed' and ordernumber='"+ txtCardNumber + "'";
            else if (queryby == 1)
                query = "select * from orderdetails where orderby ='"+ strusr+"' and orderstatus = 'completed' and cardpin_sn='"+txtCardNumber+"'";
            else
                query = "select * from orderdetails where orderby ='" + strusr + "' and orderstatus = 'completed' and card_pin='" + txtCardNumber + "'";
            try
            {
                SqlCommand cmd = new SqlCommand(query);
                gvOrders.DataSource = this.ExecuteQuery(cmd, "SELECT");
                gvOrders.DataBind();
            }
            catch { }
        }
        public DataTable ExecuteQuery(SqlCommand cmd, string action)
        {
            try {
            string conString = ConfigurationManager.ConnectionStrings["saveaseSqlLocal"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                cmd.Connection = con;
                switch (action)
                {
                    case "SELECT":
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                return dt;
                            }
                        }
                    case "UPDATE":
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        break;
                }
            }
            }
            catch 
            {

            }
                return null;
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                /*
                SqlCommand cmd = new SqlCommand("SELECT DISTINCT(Country) FROM Customers");
                DropDownList ddlCountries = (e.Row.FindControl("ddlCountries") as DropDownList);
                ddlCountries.DataSource = this.ExecuteQuery(cmd, "SELECT");
                ddlCountries.DataTextField = "Country";
                ddlCountries.DataValueField = "Country";
                ddlCountries.DataBind();
                string country = (e.Row.FindControl("lblCountry") as Label).Text;
                ddlCountries.Items.FindByValue(country).Selected = true;*/
            }
        }
        protected void OnCheckedChanged(object sender, EventArgs e)
        {
            bool isUpdateVisible = false;
            CheckBox chk = (sender as CheckBox);
            if (chk.ID == "chkAll")
            {
                foreach (GridViewRow row in gvOrders.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        row.Cells[0].Controls.OfType<CheckBox>().FirstOrDefault().Checked = chk.Checked;
                    }
                }
            }
            CheckBox chkAll = (gvOrders.HeaderRow.FindControl("chkAll") as CheckBox);
            chkAll.Checked = true;
            foreach (GridViewRow row in gvOrders.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    bool isChecked = row.Cells[0].Controls.OfType<CheckBox>().FirstOrDefault().Checked;
                   
                    for (int i = 1; i < row.Cells.Count; i++)
                    {
                        /*
                        row.Cells[i].Controls.OfType<Label>().FirstOrDefault().Visible = !isChecked;
                        if (row.Cells[i].Controls.OfType<TextBox>().ToList().Count > 0)
                        {
                            row.Cells[i].Controls.OfType<TextBox>().FirstOrDefault().Visible = isChecked;
                        }
                        if (row.Cells[i].Controls.OfType<DropDownList>().ToList().Count > 0)
                        {
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().Visible = isChecked;
                        }*/
                        if (isChecked && !isUpdateVisible)
                        {
                            isUpdateVisible = true;
                        }
                        if (!isChecked)
                        {
                            chkAll.Checked = false;
                        }
                    }
                }
            }
            btnUpdate.Visible = isUpdateVisible;
        }
        protected void Update(object sender, EventArgs e)
        {
            Int32 queryby = Raddrp.SelectedIndex;
            string insertBlockReq = "insert into blockPinReq (blockBy,orderNumber,uniqueID,reqDate,reqStatus,reqBy)";
            string today = DateTime.Today.ToString();
            foreach (GridViewRow row in gvOrders.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    bool isChecked = row.Cells[0].Controls.OfType<CheckBox>().FirstOrDefault().Checked;
                    if (isChecked)
                    {
                        string query = "";
                        SqlCommand cmd;
                        /*
                        if (queryby == 0)
                        {
                             cmd = new SqlCommand(insertState + " values(@blockBy,@orderNumber,@uniqueID,@reqDate,@reqStatus,@reqBy)");
                            cmd.Parameters.AddWithValue("@blockBy", Raddrp.SelectedItem.Text);
                            cmd.Parameters.AddWithValue("@orderNumber", row.Cells[4].Controls.OfType<Label>().FirstOrDefault().Text);
                           // cmd.Parameters.AddWithValue("@uniqueID", Raddrp.SelectedItem.Text);
                            cmd.Parameters.AddWithValue("@uniqueID", row.Cells[3].Controls.OfType<Label>().FirstOrDefault().Text);
                            cmd.Parameters.AddWithValue("@reqDate", today);
                            cmd.Parameters.AddWithValue("@reqStatus", "Block");
                            cmd.Parameters.AddWithValue("@reqBy", strusr);
                        }
                        else
                        {
                       // SqlCommand cmd = new SqlCommand("UPDATE blockPinReq SET blockBy = 'Block', uniqueID = @uniqueID WHERE CustomerId = @CustomerId");
                         cmd = new SqlCommand(insertState +" values('"+ Raddrp.SelectedItem.Text + "','" + txtVal.Text + "','"+ today + "','Block','" + strusr+"')");
                        }*/
                        try
                        {
                            cmd = new SqlCommand(insertBlockReq + " values(@blockBy,@orderNumber,@uniqueID,@reqDate,@reqStatus,@reqBy)");
                            cmd.Parameters.AddWithValue("@blockBy", Raddrp.SelectedItem.Text);
                            cmd.Parameters.AddWithValue("@orderNumber", row.Cells[4].Controls.OfType<Label>().FirstOrDefault().Text);
                            // cmd.Parameters.AddWithValue("@uniqueID", Raddrp.SelectedItem.Text);
                            cmd.Parameters.AddWithValue("@uniqueID", row.Cells[3].Controls.OfType<Label>().FirstOrDefault().Text);
                            cmd.Parameters.AddWithValue("@reqDate", today);
                            cmd.Parameters.AddWithValue("@reqStatus", "Block");
                            cmd.Parameters.AddWithValue("@reqBy", strusr);
                            this.ExecuteQuery(cmd, "SELECT");
                            trDisplay.Visible = true;
                            lblDisplay.Text = "Block PIN Request Successful...";
                            lblDisplay.ForeColor = Color.OrangeRed;
                        }
                        catch(Exception exp) {
                            trDisplay.Visible = true;
                            lblDisplay.Text = "Error!  " + exp.Message + "...";
                            lblDisplay.ForeColor = Color.OrangeRed;
                            return;
                        }

                    }
                }
            }
            btnUpdate.Visible = false;
            this.BindGrid(queryby);
        }

        protected void btnConfirmPIN_Click(object sender, Telerik.Web.UI.ImageButtonClickEventArgs e)
        {
            if(txtVal.Text=="")
            {
                trDisplay.Visible = true;
                lblDisplay.Text = "Enter valid value for "+lblbatch.Text+"...";
                lblDisplay.ForeColor = Color.OrangeRed;
                return;
            }
            else
            {
                trDisplay.Visible = false;
                this.BindGrid(Raddrp.SelectedIndex);
            }
           
        }
    }
}