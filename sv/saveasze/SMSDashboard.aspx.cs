using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Net;
using System.Drawing;

namespace saveasze
{
    public partial class SMSDashboard : System.Web.UI.Page
    {
        connString constring = new connString();
        string ServerName;
        string ConString = "";
        string SQLConString = "";
        DataSet _dataset;
        string SenderID;
        string SMSmessage;
        SqlConnection con;// = new SqlConnection(constring.connstring(""));
        SqlCommand cmd;
        Sms ts;
        WebClient wbClient;
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            try
            {
            con = new SqlConnection(constring.connstring(""));
                lstStatus.Columns.Add("Status", 2500, HorizontalAlignment.Left);
                ts = new Sms();
                ts.ServerName = "Server";
                DataTable ds = ts.GetSMS();
                dgvPendingMsg.DataSource = ds;
                txtServer.Focus();
            }
            catch(Exception ex)
            {
                if (Err.Number = 5)
                    lstStatus.Items.Add("Error: " + ex.Message).ForeColor = Color.Red;
                else
                    lstStatus.Items.Add("Error: " + ex.Message).ForeColor = Color.Red;
                lstStatus.Items(lstStatus.Items.Count - 1).EnsureVisible();
            }*/
        }
        public void clickedBtn()
        {
            /*
            try
            {
                con.Open();
                cmd = new SqlCommand("select ss from gb_image where acct_no='4020100100'", con);
                Byte[] imageData = DirectCast(cmd.ExecuteScalar(), Byte[]);
                if(imageData.Equals(null))
                {
                    using (MemoryStream ms = new MemoryStream(imageData, 0, imageData.Length))
                    {
                        ms.Write(imageData, 0, imageData.Length);
                        //PictureBox1.BackgroundImage = Image.FromStream(ms, True); To be discussed with Okey
                    }
                }
                //Label1.Visible = True ------ WHY?
            }
            catch (Exception ex)
            {

            }
*/
        }
        public void sendSMS()
        {
            try
            {
                SendMessage();
            }
            catch(Exception ex)
            {
                /*
                if(Err.Number == 5)
                {
                    //lstStatus.Items.Add("Error: " + ex.Message).ForeColor = Color.Red; -------- WHY?
                }
                else
                    // lstStatus.Items.Add("Error: " + ex.Message).ForeColor = Color.Red; -------- WHY?
*/
            }
        }
        public void SendMessage()
        {
            /*
            WebClient wbClient = new WebClient();
            Stream strm;
            string content;
            string username = "";
            string password = "";
            string userid = "";
            Sms ts = new Sms();
            ts.ServerName = txtServer.Text;
            DataTable ds = ts.GetSMS();
            if (ds.Rows.Count > 0)
            {
                foreach (DataRow rs in ds.Rows)
                {
                    //  lblMsg.Text = "";------------ why ?
                    username = rs!username;
                    password = rs!password;
                    userid = rs!userid;
                    strm = wbClient.OpenRead("http://sms.elsoftnig.com/api/?username=" + username + "&password=" + rs!password + "&sender=" + rs!senderid + "&mobiles=" + (rs!numto).ToString + "&message=" + rs!data1);
                    StreamReader sR = new StreamReader(strm);
                    content = sR.ReadToEnd();

                    //===========elsoft api code================
                    string StatusID = Mid(content, 12, 2);
                    string count = Mid(content, 1, 26);
                    string Status = "";
                    if (StatusID.Equals("OK"))
                        Status = "SUBMITTED"; // successfull
                    else
                        Status = "SUBMITTED"; // successfull
                    ts.UpdateSMS(rs!id, "", Status, content);

                    if (StatusID.Equals("OK"))
                        lstStatus.Items.Add(count + "}" + " Mobile No: " + rs!numto).ForeColor = Color.Blue;
                    else if (StatusID.Equals(""))
                        lstStatus.Items.Add(content + " Mobile No: " + rs!numto).ForeColor = Color.Red;
                    else
                        lstStatus.Items.Add(content + " Mobile No: " + rs!numto + "; Account Number: " + rs!CustomerID).ForeColor = Color.Red;

                }
                strm = wbClient.OpenRead("http://sms.elsoftnig.com/api/?username=" + username + "&password=" + password + "&action=balance");
                StreamReader sR1 = new StreamReader(strm);
                content = sR1.ReadToEnd();
                string balance = Mid(content, 13, content.Length - 14);
                ts.UpdateUser(userid, CInt(balance));
                lstStatus.Items.Add(content).ForeColor = Color.Blue;
            }
            else
                lstStatus.Items.Add("No message on queue").ForeColor = Color.Blue;
            lstStatus.Items(lstStatus.Items.Count - 1).EnsureVisible();
             dgvPendingMsg.DataSource = ts.GetSMS();
             dgvPendingMsg.Refresh();*/
        }
        public void timerticker()
        {
            try
            {
                SendMessage();
                SendBirthDaySMS();
            }
            catch(Exception ex)
            {
                /*
                if (Err.Number == 5)
                    lstStatus.Items.Add("Error: " + ex.Message).ForeColor = Color.Red;
                else
                    lstStatus.Items.Add("Error: " + ex.Message).ForeColor = Color.Red;
                lstStatus.Items(lstStatus.Items.Count - 1).EnsureVisible();
*/
            }
        }
        public void BalanceBtn()
        {
            /*
            try
            {
            wbClient = new WebClient();
            ts = new Sms();
            ts.ServerName = txtServer.Text;
            DataTable ds = ts.getUser();
            if (ds.Rows.Count > 0)
            {
                foreach (DataRow rs in ds.Rows)
                {
                    lblMsg.Text = "";
                    Stream strm = wbClient.OpenRead("http://sms.elsoftnig.com/api/?username=" + rs!username + "&password=" + rs!password + "&action=balance");
                    StreamReader sR = new StreamReader(strm);
                    string content = sR.ReadToEnd();

                    //===========elsoft api code================
                    string balance = Mid(content, 13, content.Length - 14);

                    lstStatus.Items.Add(content).ForeColor = Color.Blue;
                    ts.UpdateUser(rs!userid, CInt(balance));

                }
            }
            else
                lstStatus.Items.Add("No message on queue").ForeColor = Color.Blue;
            lstStatus.Items(lstStatus.Items.Count - 1).EnsureVisible();
            }
            catch(Exception ex)
            {
                lstStatus.Items.Add(ex.Message).ForeColor = Color.Blue;
            lstStatus.Items(lstStatus.Items.Count - 1).EnsureVisible();
            }
            */
        }

        public void SendBirthDaySMS()
        {
            /*
            try
            {
                ts = new Sms();
              DataTable  ds1  = ts.GetOptionsSettings();
                if(ds1.Rows.Count > 0)
                {
                    foreach(DataRow rs in ds1.Rows)
                    {
                        lblMsg.Text = "";
                        if (LTrim(rs!BirthdaySMS) == "")
                            SMSmessage = "We are happy to identify with you on your birthday. Congratulations!";
                        else
                            SMSmessage = rs!BirthdaySMS;
                        SenderID = rs!SenderID;
                    }
                }
                DataTable ds = ts.GetBirthDayCelebrants();
                    if (ds.Rows.Count > 0)
                    {
                        foreach (DataRow rs in ds.Rows)
                        {
                        lblMsg.Text = "";

                    //sms message here
                    string smsQuery;
                    smsQuery = "insert into queue (userid,NumTo,Data1,SenderID,CustomerID) values (1,'" + rs!phoneno + "','Dear " + rs!CustFirstName + ", " + SMSmessage + "','" + SenderID + "','" + rs!customerid + "')";
                        ts.UpdateBirthDaySMS(rs!customerid, smsQuery);

                        lstStatus.Items.Add("Birth day message generated for " + rs!CustLastName + " " + rs!CustFirstName + " (Phone No. is " + rs!phoneno).ForeColor = Color.Blue;
                        }
                }
                lstStatus.Items(lstStatus.Items.Count - 1).EnsureVisible();
             }
            catch(Exception ex)
            {
                lstStatus.Items.Add(ex.Message).ForeColor = Color.Blue;
            lstStatus.Items(lstStatus.Items.Count - 1).EnsureVisible();
            }*/
        }
    }
}