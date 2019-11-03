using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Newtonsoft.Json;
using System.Xml;

namespace saveasze
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://savease.ng/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {
        procedurs dtproc = new procedurs();
        SH1Encryption sh1 = new SH1Encryption();
        string hosts = HttpContext.Current.Request.Url.Host;

        [WebMethod]
        public string getEmp()
        {
            string sql = "SELECT * from users";
            SqlDataAdapter da = new SqlDataAdapter(sql, ConfigurationManager.ConnectionStrings["saveaseSqlLocal"].ToString());
            DataSet ds = new DataSet();
            da.Fill(ds);
            return JsonConvert.SerializeObject(ds, Newtonsoft.Json.Formatting.Indented);

        }

        [WebMethod]
        public string HelloWorld(string data)
        {
            string host = "";
            string expMessage = "";
            DataTable value = dtproc.getVendorCount(host, out expMessage);
            data = value.ToString();
            return data;
        }
        [WebMethod]
        public string getVendorCount()
        {
            string expMessage = "";
            DataTable value = dtproc.getVendorCount(hosts, out expMessage);
            return JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
        }

        [WebMethod]
        public String RegisterUser( string fname, string lname, string phone, string email, string username, string password)
        {
            string expMessage = "";
            sh1.GetSHA1HashData(password);
            string value = dtproc.RegisterUser(1,  fname,  lname,  phone,  email,  username,  password,  "guest",  hosts,  "",  "1");
            return JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
        }

        [WebMethod]
        public void registerVendor1(string fname, string lname, string phone, string email, string username, string password, string createdBy,
            string companyname, string passport, string caccert, string cacdoc, string identitfication, string vatreg, string taxid,
            string address, string connLocation, string token, string status, string saveaseid)
        {
            string expMessage = "";
            string value = dtproc.registerVendor1( fname,  lname,  phone,  email,  username,  password,  createdBy,
             companyname,  passport,  caccert,  cacdoc,  identitfication,  vatreg,  taxid,address,  connLocation,  token,  status,  saveaseid);
             JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
        }

        [WebMethod]
        public string getProfiles(Int32 accesscontrol)
        {
            string expMessage = "";
            DataTable value = dtproc.getProfiles( accesscontrol,hosts, out expMessage);
            return JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
        }
        [WebMethod]
        public string getVendors(Int32 accesscontrol)
        {
            string expMessage = "";
            //, string connLocation, string procc, out string expMessag
            DataTable value = dtproc.getVendors( accesscontrol,"Procedure",hosts, out expMessage);
            return JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
        }
        [WebMethod]
        public string getBalance(string inputParame)
        {
            string expMessage = "";
            DataTable value = dtproc.getBalance(inputParame,hosts, out expMessage);
            return JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
        }
        [WebMethod]
        public string getBeneficiary(string inputParame)
        {
            string expMessage = "";
            DataTable value = dtproc.getBeneficiary(inputParame,hosts, out expMessage);
            return JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
        }

        [WebMethod]
        public void saveDeposit(string in_acctNo, string in_cardpin, string in_cardsn, string in_bankName, string in_acctName, double in_amount,
            string in_depositor, string in_computerName, string in_ipaddress, string in_tranRef)
        {
            string expMessage = "";
            Int32 value = dtproc.saveDeposit( in_acctNo,  in_cardpin,  in_cardsn,  in_bankName,  in_acctName,  in_amount,
             in_depositor,  in_computerName,  in_ipaddress,  in_tranRef, out expMessage);
             JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
        }

        [WebMethod]
        public void transferFund(string in_transferCode, double in_balB4Transfer, double amountTransfered, double balance, string beneficiaryAccount, string beneficaryName,
            string accountNo, string transferedBy, string in_computerName)
        {
            string expMessage = "";
            Int32 value = dtproc.transferFund( in_transferCode,  in_balB4Transfer,  amountTransfered,  balance,  beneficiaryAccount,  beneficaryName,
             accountNo,  transferedBy,  in_computerName, out expMessage );
             JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
        }

        [WebMethod]
        public void saveBenDetails(string in_acctNo, string in_acctName, string in_bankName, string in_depositor, string in_cardpin,
            string in_phoneNumber, string in_emailID)
        {
            string expMessage = "";
            Int32 value = dtproc.saveBenDetails(in_acctNo, in_acctName, in_bankName, in_depositor, in_cardpin,
             in_phoneNumber, in_emailID, out expMessage);
             JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
        }

        [WebMethod]
        public string VerifyPin(string inputParame)
        {
            XmlDocument doc = new XmlDocument();
            
            string expMessage = "";
            Int32 exitpin = dtproc.usedPin(inputParame, hosts, out expMessage);
            string value = "";
                if (exitpin < 1)
                {
                    DataTable dtCardDetaail = dtproc.getCardPin(inputParame, hosts, out expMessage);
                    if (dtCardDetaail == null)
                    {

                        value = "Invalid Voucher details supplied!!!";
                    }
                    else
                {
             foreach (DataRow dr in dtCardDetaail.Rows)
                                {
                        
                                    value = "Card Valid. Amount: " + dr["cardAmount"].ToString();
                                    //  lblAcctName.Text = dr[""].ToString();
                                }
                }
                   
                }
                else
                {
                    value = "Voucher details has been used!!!";
                }
           // doc.LoadXml(value);
           // string jsonText = JsonConvert.SerializeXmlNode(doc);
            // return JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
            return value;
        }
        /*
         Int32 exitpin = dtProc.usedPin(txtPIN.Value.ToString(), hosts, out expMessage);

         */
    }
}
