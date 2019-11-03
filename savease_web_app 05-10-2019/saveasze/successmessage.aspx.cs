using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class successmessage : System.Web.UI.Page
    {
        procedurs dtProc = new procedurs();
        navigations nav = new navigations();
        string hosts = "";
        string strURL;
        protected void Page_Load(object sender, EventArgs e)
        {
           // hosts = Session["hosts"].ToString();
            hosts = Request.Url.Host; ;
            strURL = Request.QueryString["strurl"];
        }
        
    public string getMessage()
        {
            string expMessage = "";
            string strAdminID = "0000001111";
            string strSuccessMessage = "";
            string strMessage = "";
        
            switch (strURL) { 
              case "SAC":
                    strSuccessMessage = strSuccessMessage + "<div class='container' style='width:500px;'>";
                    strSuccessMessage = strSuccessMessage + "<div class='header'>";
                    strSuccessMessage = strSuccessMessage + "<div class='logo'>";
                    strSuccessMessage = strSuccessMessage + " <img src='images/icons/bowsmiley.png' ALIGN='right' >";
                    strSuccessMessage = strSuccessMessage + "</div><br>";
                    strSuccessMessage = strSuccessMessage + "<div class='text'>";
                    strSuccessMessage = strSuccessMessage + "<h3 style='font-family:calibri;'>Hi " + Session["displayName"].ToString() + ",</h3><br><br>";
                    strSuccessMessage = strSuccessMessage + "<p style='color:black;font-size: 18px; font-family:calibri;'>Your deposit transaction was successful</p>";
                    strSuccessMessage = strSuccessMessage + "</div>";
                    strSuccessMessage = strSuccessMessage + "<h3 style='font-family:calibri;font-size: 20px;font-weight: bolder;'>Transaction Details<label></label></h3><br>";
                    strSuccessMessage = strSuccessMessage + "<div class='button'>";
                    strSuccessMessage = strSuccessMessage + "<table width='499' height='113' border='0' bordercolor='#000000' >";
                    strSuccessMessage = strSuccessMessage + "<tbody>";
                     strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td width='138' height='19' style='font-family:calibri'>Desposit Reference:</td><td width='343' style='font-family:calibri'>" +  Session["in_TransRefSAC"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td width='138' height='19' style='font-family:calibri'>Beneficiary Bank:</td><td width='343' style='font-family:calibri'>" + Session["in_BankNameOBC"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'>Beneficiary Name:</td><td style='font-family:calibri'>" + Session["in_acctNameSAC"].ToString() + "  </td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'>Beneficiary Account:</td><td>" + Session["in_acctNoSAC"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'>Transaction Date:</td><td>" + Session["in_date"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'> Narrative:</td><td style='font-family:calibri'>" + Session["in_narative"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#212435' style='color: #fff'><td height='19' style='font-family:calibri'>Amount:</td><td>" + Session["in_amountSAC"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "</tbody>";
                    strSuccessMessage = strSuccessMessage + "</table>";
                    strSuccessMessage = strSuccessMessage + "</div><br><br>";
                    strSuccessMessage = strSuccessMessage + "<div class='quest'>";
                    strSuccessMessage = strSuccessMessage + "<h4 style='color: #fa9928;font-family:calibri;'><a href='' style='color: blue; font-size:17px;font-family:calibri;'>Please click here to provide freedback on your experience</a></h4><br>";
                    strSuccessMessage = strSuccessMessage + "<p style='color: #212435;font-family:calibri;font-size:17px;'>Thank you for using Savease.</p>";
                    strSuccessMessage = strSuccessMessage + "</div>";
                    strSuccessMessage = strSuccessMessage + "</div> ";
                    strSuccessMessage = strSuccessMessage + "</div> ";
                    dtProc.composeMail(strAdminID, "Credit Alert <Saved Beneficiary>", " Ref Number: " + Session["in_TransRefSAC"].ToString(), Session["in_DisplayNameSAC"].ToString(), Session["in_acctNoSAC"].ToString(), Session["in_acctNameSAC"].ToString(), Session["in_TransRefSAC"].ToString(), out expMessage);
                    dtProc.inserttransactionLog(Session["in_TransRefSAC"].ToString(), "Credit", strSuccessMessage, Session["in_acctNoSAC"].ToString(), Session["in_acctNameSAC"].ToString(), strAdminID, Session["in_DisplayNameSAC"].ToString(),float.Parse(Session["in_amountSAC"].ToString()), out expMessage);
//dtProc.transMessage(Session["in_TransRefSAC"].ToString(), "Credit", string in_TransactionMessage, string in_senderID,
         //   string in_recipientID, float in_amount, out string expObj)
                    Response.Write(strSuccessMessage);

                    break;
            case "OBC":
                    strSuccessMessage = strSuccessMessage + "<div class='container' style='width:500px;'>";
                    strSuccessMessage = strSuccessMessage + "<div class='header'>";
                    strSuccessMessage = strSuccessMessage + "<div class='logo'>";
                    strSuccessMessage = strSuccessMessage + " <img src='images/icons/bowsmiley.png' ALIGN='right' >";
                    strSuccessMessage = strSuccessMessage + "</div><br>";
                    strSuccessMessage = strSuccessMessage + "<div class='text'>";
                    strSuccessMessage = strSuccessMessage + "<h3 style='font-family:calibri;'>Hi " + Session["displayName"].ToString() + ",</h3><br><br>";
                    strSuccessMessage = strSuccessMessage + "<p style='color:black;font-size: 18px; font-family:calibri;'>Your deposit transaction was successful</p>";
                    strSuccessMessage = strSuccessMessage + "</div>";
                    strSuccessMessage = strSuccessMessage + "<h3 style='font-family:calibri;font-size: 20px;font-weight: bolder;'>Transaction Details<label></label></h3><br>";
                    strSuccessMessage = strSuccessMessage + "<div class='button'>";
                    strSuccessMessage = strSuccessMessage + "<table width='499' height='113' border='0' bordercolor='#000000' >";
                    strSuccessMessage = strSuccessMessage + "<tbody>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td width='138' height='19' style='font-family:calibri'>Desposit Reference:</td><td width='343' style='font-family:calibri'>" + Session["in_TransRefSAC"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td width='138' height='19' style='font-family:calibri'>Beneficiary Bank:</td><td width='343' style='font-family:calibri'>" + Session["in_BankNameOBC"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'>Beneficiary Name:</td><td style='font-family:calibri'>" + Session["in_acctNameSAC"].ToString() + "  </td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'>Beneficiary Account:</td><td>" + Session["in_acctNoSAC"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'>Transaction Date:</td><td>" + Session["in_date"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'> Narrative:</td><td style='font-family:calibri'>" + Session["in_narative"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#212435' style='color: #fff'><td height='19' style='font-family:calibri'>Amount:</td><td>" + Session["in_amountSAC"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "</tbody>";
                    strSuccessMessage = strSuccessMessage + "</table>";
                    strSuccessMessage = strSuccessMessage + "</div><br><br>";
                    strSuccessMessage = strSuccessMessage + "<div class='quest'>";
                    strSuccessMessage = strSuccessMessage + "<h4 style='color: #fa9928;font-family:calibri;'><a href='' style='color: blue; font-size:17px;font-family:calibri;'>Please click here to provide freedback on your experience</a></h4><br>";
                    strSuccessMessage = strSuccessMessage + "<p style='color: #212435;font-family:calibri;font-size:17px;'>Thank you for using Savease.</p>";
                    strSuccessMessage = strSuccessMessage + "</div>";
                    strSuccessMessage = strSuccessMessage + "</div> ";
                    strSuccessMessage = strSuccessMessage + "</div> ";
                    dtProc.composeMail(strAdminID, "Credit Alert <Saved Beneficiary>", " Ref Number: " + Session["in_TransRefSAC"].ToString(), Session["in_DisplayNameSAC"].ToString(), Session["in_acctNoSAC"].ToString(), Session["in_acctNameSAC"].ToString(), Session["in_TransRefSAC"].ToString(), out expMessage);
                    dtProc.inserttransactionLog(Session["in_TransRefSAC"].ToString(), "Credit", strSuccessMessage, Session["in_acctNoSAC"].ToString(), Session["in_acctNameSAC"].ToString(), strAdminID, Session["in_DisplayNameSAC"].ToString(), float.Parse(Session["in_amountSAC"].ToString()), out expMessage);
                    Response.Write(strSuccessMessage);
                    break;
                case "SBC":
                    strSuccessMessage = strSuccessMessage + "<div class='container' style='width:500px;'>";
                    strSuccessMessage = strSuccessMessage + "<div class='header'>";
                    strSuccessMessage = strSuccessMessage + "<div class='logo'>";
                    strSuccessMessage = strSuccessMessage + " <img src='images/icons/bowsmiley.png' ALIGN='right' >";
                    strSuccessMessage = strSuccessMessage + "</div><br>";
                    strSuccessMessage = strSuccessMessage + "<div class='text'>";
                    strSuccessMessage = strSuccessMessage + "<h3 style='font-family:calibri;'>Hi " + Session["displayName"].ToString() + ",</h3><br><br>";
                    strSuccessMessage = strSuccessMessage + "<p style='color:black;font-size: 18px; font-family:calibri;'>Your deposit transaction was successful</p>";
                    strSuccessMessage = strSuccessMessage + "</div>";
                    strSuccessMessage = strSuccessMessage + "<h3 style='font-family:calibri;font-size: 20px;font-weight: bolder;'>Transaction Details<label></label></h3><br>";
                    strSuccessMessage = strSuccessMessage + "<div class='button'>";
                    strSuccessMessage = strSuccessMessage + "<table width='499' height='113' border='0' bordercolor='#000000' >";
                    strSuccessMessage = strSuccessMessage + "<tbody>";
                     strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td width='138' height='19' style='font-family:calibri'>Desposit Reference:</td><td width='343' style='font-family:calibri'>" +  Session["in_TransRefSAC"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td width='138' height='19' style='font-family:calibri'>Beneficiary Bank:</td><td width='343' style='font-family:calibri'>" + Session["in_BankNameOBC"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'>Beneficiary Name:</td><td style='font-family:calibri'>" + Session["in_acctNameSAC"].ToString() + "  </td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'>Beneficiary Account:</td><td>" + Session["in_acctNoSAC"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'>Transaction Date:</td><td>" + Session["in_date"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'> Narrative:</td><td style='font-family:calibri'>" + Session["in_narative"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#212435' style='color: #fff'><td height='19' style='font-family:calibri'>Amount:</td><td>" + Session["in_amountSAC"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "</tbody>";
                    strSuccessMessage = strSuccessMessage + "</table>";
                    strSuccessMessage = strSuccessMessage + "</div><br><br>";
                    strSuccessMessage = strSuccessMessage + "<div class='quest'>";
                    strSuccessMessage = strSuccessMessage + "<h4 style='color: #fa9928;font-family:calibri;'><a href='' style='color: blue; font-size:17px;font-family:calibri;'>Please click here to provide freedback on your experience</a></h4><br>";
                    strSuccessMessage = strSuccessMessage + "<p style='color: #212435;font-family:calibri;font-size:17px;'>Thank you for using Savease.</p>";
                    strSuccessMessage = strSuccessMessage + "</div>";
                    strSuccessMessage = strSuccessMessage + "</div> ";
                    strSuccessMessage = strSuccessMessage + "</div> ";
                    dtProc.composeMail(strAdminID, "Credit Alert <Saved Beneficiary>", " Ref Number: " + Session["in_TransRefSAC"].ToString(), Session["in_DisplayNameSAC"].ToString(), Session["in_acctNoSAC"].ToString(), Session["in_acctNameSAC"].ToString(), Session["in_TransRefSAC"].ToString(), out expMessage);
                    dtProc.inserttransactionLog(Session["in_TransRefSAC"].ToString(), "Credit", strSuccessMessage, Session["in_acctNoSAC"].ToString(), Session["in_acctNameSAC"].ToString(), strAdminID, Session["in_DisplayNameSAC"].ToString(), float.Parse(Session["in_amountSAC"].ToString()), out expMessage);
                    Response.Write(strSuccessMessage);
                    break;
                case "Transfer":
                    strSuccessMessage = strSuccessMessage + "<div class='container' style='width:500px;'>";
                    strSuccessMessage = strSuccessMessage + "<div class='header'>";
                    strSuccessMessage = strSuccessMessage + "<div class='logo'>";
                    strSuccessMessage = strSuccessMessage + " <img src='images/icons/bowsmiley.png' ALIGN='right' >";
                    strSuccessMessage = strSuccessMessage + "</div><br>";
                    strSuccessMessage = strSuccessMessage + "<div class='text'>";
                    strSuccessMessage = strSuccessMessage + "<h3 style='font-family:calibri;'>Hi &nbsp" + Session["displayName"].ToString() + ",</h3><br><br>";
                    strSuccessMessage = strSuccessMessage + "<p style='font-size: 14px; font-family:calibri;'>Your transfer to  was successful</p>";
                    strSuccessMessage = strSuccessMessage + "</div><br>";
                    strSuccessMessage = strSuccessMessage + "<h3 style='font-family:calibri;font-size: 14px;font-weight: bolder;'>Transaction Details<label></label></h3><br>";
                    strSuccessMessage = strSuccessMessage + "<div class='button'>";
                    strSuccessMessage = strSuccessMessage + "<table width='499' height='113' border='0' bordercolor='#000000' >";
                    strSuccessMessage = strSuccessMessage + "<tbody>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td width='138' height='19' style='font-family:calibri'>Transfer Reference:</td><td width='343' style='font-family:calibri'>" + Session["in_transSac"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td width='138' height='19' style='font-family:calibri'>Beneficiary Bank:</td><td width='343' style='font-family:calibri'>" + Session["in_bankSAC"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'>Beneficiary Name:</td><td style='font-family:calibri'>" + Session["in_acctNameSAC"].ToString() + "  </td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'>Beneficiary Account:</td><td>" + Session["in_acctNoSAC"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'>Transaction Date:</td><td>" + Session["in_date"].ToString() + "</td></tr>";
                    //strSuccessMessage = strSuccessMessage + "<tr bgcolor='#fa9928'><td height='19' style='font-family:calibri'>Transaction Narrative:</td><td style='font-family:courier new'>" + Session["in_narative"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "<tr bgcolor='#212435' style='color: #fff'><td height='19' style='font-family:calibri'>Amount:</td><td>" + Session["in_amountSAC"].ToString() + "</td></tr>";
                    strSuccessMessage = strSuccessMessage + "</tbody>";
                    strSuccessMessage = strSuccessMessage + "</table>";
                    strSuccessMessage = strSuccessMessage + "</div><br><br>";
                    strSuccessMessage = strSuccessMessage + "<div class='quest'>";
                    strSuccessMessage = strSuccessMessage + "<h4 style='color: #fa9928;font-family:calibri;'><a href='' style='color: blue; font-size:12px;font-family:calibri;'>Please click here to provide freedback on your experience</a></h4><br>";
                    strSuccessMessage = strSuccessMessage + "<p style='color: #212435;font-family:calibri; font-weight: bold'>Thank you for using Savease.</p>";
                    strSuccessMessage = strSuccessMessage + "</div>";
                    strSuccessMessage = strSuccessMessage + "</div> ";
                    strSuccessMessage = strSuccessMessage + "</div> ";
                    dtProc.composeMail(strAdminID, "Debit Alert <Transfer>", " Ref Number: " + Session["in_TransRefSAC"].ToString(), Session["in_acctNameSAC"].ToString(), Session["in_acctNoSAC"].ToString(), Session["in_acctNameSAC"].ToString(), Session["in_TransRefSAC"].ToString(), out expMessage);
                   // dtProc.inserttransactionLog(Session["in_TransRefSAC"].ToString(), "Debit", strSuccessMessage, Session["in_acctNoSAC"].ToString(), Session["in_acctNameSAC"].ToString(), strAdminID, Session["in_DisplayNameSAC"].ToString(),float.Parse("-"+Session["in_amountSAC"].ToString()), out expMessage);
                    Response.Write(strSuccessMessage);
                    break;
            case "BUY":
                    strSuccessMessage = strSuccessMessage + "<div class='container' style='width:500px;'>";
                    strSuccessMessage = strSuccessMessage + "<div class='header'>";
                    strSuccessMessage = strSuccessMessage + "<div class='logo'>";
                    strSuccessMessage = strSuccessMessage+ " <img src='images/icons/bowsmiley.png' ALIGN='right' >";
                     strSuccessMessage= strSuccessMessage+"</div><br>";
                     strSuccessMessage= strSuccessMessage+"<div class='text'>";
                     strSuccessMessage= strSuccessMessage+"<h3 style='font-family:calibri;'>Hi &nbsp" + Session["displayName"].ToString() + ",</h3><br>";
                     strSuccessMessage= strSuccessMessage+"<p style='color:black;  font-size:16px; font-family:calibri;'>Your voucher purchase was successful.</p>";
                     strSuccessMessage= strSuccessMessage+"</div><br>";
                     strSuccessMessage= strSuccessMessage+"<p style='color:green;'>Your transaction reference | batch number is <a href='' style='font-family:calibri;'>" + Session["in_orderSAC"].ToString() + ".</a> Kindly check your inbox for details.</p><br>";
                    strSuccessMessage= strSuccessMessage+"<p style='color:black;'>Thanks you for using Savease.</p>";
                     strSuccessMessage= strSuccessMessage+"</div><br><br>";
                     strSuccessMessage= strSuccessMessage+"<div class='quest'>";
                     strSuccessMessage= strSuccessMessage+"<h4 style='color: #fa9928;font-family:calibri;'><a href='' style='color: blue; ;font-family:calibri;'>Please click here to provide freedback on your experience</a></h4><br>";
                     strSuccessMessage= strSuccessMessage+ "<p style='color: #212435;font-family:calibri;><b>You may contact us through any of the options below:</b></p>";
                    //strSuccessMessage = strSuccessMessage + "<p style='color: #212435;font-family:calibri;>Telephone: 0700SAVEASE, 09064215137, 09064214402</p>";
                    //strSuccessMessage = strSuccessMessage + "<p style='color: #212435;font-family:calibri;>Email: enquiry@savease.ng, care@savease.ng, </p><br><br>";
                    strSuccessMessage = strSuccessMessage + "<p>&copy; 2016.Savease. All Right Reserved</p>";
                    strSuccessMessage = strSuccessMessage+ " </div>";
                    strSuccessMessage = strSuccessMessage+"</div>";
                     strSuccessMessage= strSuccessMessage+"</div> ";
                   //dtProc.inserttransactionLog(Session["in_TransRefSAC"].ToString(), "Debit", strSuccessMessage, Session["in_acctNoSAC"].ToString(), Session["in_acctNameSAC"].ToString(), strAdminID, Session["in_DisplayNameSAC"].ToString(), float.Parse("-"+Session["in_amountSAC"].ToString()), out expMessage);
                    Response.Write(strSuccessMessage);
                    break;
            }

           if(Session["depositz"]==null)
            { }
           else
            {
               string strDepozit= Session["depositz"].ToString();

                strSuccessMessage = strSuccessMessage + "<div class='container' style='width:500px;'>";
                strSuccessMessage = strSuccessMessage + "<div class='header'>";
                strSuccessMessage = strSuccessMessage + "<div class='logo'>";
                strSuccessMessage = strSuccessMessage + " <img src='images/icons/bowsmiley.png' ALIGN='right' >";
                strSuccessMessage = strSuccessMessage + "</div><br>";
                strSuccessMessage = strSuccessMessage + "<div class='text'>";
                strSuccessMessage = strSuccessMessage + "<h3 style='font-family:calibri;'>Hi &nbsp" + Session["displayName"].ToString() + ",</h3><br>";
                strSuccessMessage = strSuccessMessage + "<p style='color:black;  font-size:16px; font-family:calibri;'>Your deposit was successful.</p>";
                strSuccessMessage = strSuccessMessage + "</div><br>";
              //  strSuccessMessage = strSuccessMessage + "<p style='color:green;'>Your transaction reference | batch number is <a href='' style='font-family:calibri;'>" + Session["in_orderSAC"].ToString() + ".</a> Kindly check your inbox for details.</p><br>";
                strSuccessMessage = strSuccessMessage + "<p style='color:black;'>Thanks you for using Savease.</p>";
                strSuccessMessage = strSuccessMessage + "</div><br><br>";
                strSuccessMessage = strSuccessMessage + "<div class='quest'>";
                strSuccessMessage = strSuccessMessage + "<h4 style='color: #fa9928;font-family:calibri;'><a href='' style='color: blue; ;font-family:calibri;'>Please click here to provide freedback on your experience</a></h4><br>";
                strSuccessMessage = strSuccessMessage + "<p style='color: #212435;font-family:calibri;><b>You may contact us through any of the options below:</b></p>";
                //strSuccessMessage = strSuccessMessage + "<p style='color: #212435;font-family:calibri;>Telephone: 0700SAVEASE, 09064215137, 09064214402</p>";
                //strSuccessMessage = strSuccessMessage + "<p style='color: #212435;font-family:calibri;>Email: enquiry@savease.ng, care@savease.ng, </p><br><br>";
                strSuccessMessage = strSuccessMessage + "<p>&copy; 2016.Savease. All Right Reserved</p>";
                strSuccessMessage = strSuccessMessage + " </div>";
                strSuccessMessage = strSuccessMessage + "</div>";
                strSuccessMessage = strSuccessMessage + "</div> ";
                dtProc.inserttransactionLog(Session["in_TransRefSAC"].ToString(), "Debit", strSuccessMessage, Session["in_acctNoSAC"].ToString(), Session["in_acctNameSAC"].ToString(), strAdminID, Session["in_DisplayNameSAC"].ToString(), float.Parse("-" + Session["in_amountSAC"].ToString()), out expMessage);

            }
            return strMessage;
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
    }
}