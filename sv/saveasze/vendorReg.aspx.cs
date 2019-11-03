using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace saveasze
{
    public partial class vendorReg : System.Web.UI.Page
    {
        string hosts = "";// Session["host"].ToString();
        procedurs dtProc = new procedurs();
        SH1Encryption sh1 = new SH1Encryption();
        RandomPassword temPassword = new RandomPassword();
        MailMgr mailMessenger = new MailMgr();
        string strUser = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            hosts = Session["host"].ToString(); strUser = Session["host"].ToString();
        }

        protected void chkTC2_CheckedChanged(object sender, EventArgs e)
        {

        }
        public bool checkPassword()
        {
            return (txtPassword1.Text.Equals(txtPassword2.Text)) ? true : false;
        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {

            try
            {
                string filename_identity = "";
                string filename_passport = "";
                string filename_caccert = "";
                string filename_cacothers = "";
                string filename_vatreg = "";
                string filename_Tax = "";

                string saveaseid = dtProc.genSaveaseID();
                if (uplIDType.HasFile)
                {
                    // 
                }
                    /**/
                    // if (uplIDType.HasFile)
                    // {
                    //look at this but remember the best way is to do this with javascript
                    string extensionType = System.IO.Path.GetExtension(uplIDType.PostedFile.FileName);

                    if (extensionType == ".pdf")
                    {
                        filename_identity = uplIDType.FileName;
                        uplIDType.PostedFile.SaveAs(MapPath("~") + "/Uploadform/identification/" + saveaseid + uplIDType.PostedFile.FileName);
                    }
                //}
                if (uplpassport.HasFile)
                {
                    //look at this but remember the best way is to do this with javascript
                    string extension = System.IO.Path.GetExtension(uplpassport.PostedFile.FileName);

                    if (extension == ".pdf")
                    {
                        filename_passport = uplpassport.FileName;
                        uplpassport.PostedFile.SaveAs(MapPath("~") + "/Uploadform/passports/" + saveaseid + uplpassport.PostedFile.FileName);
                    }
                }
                if (uplCAC.HasFile)
                {
                    //look at this but remember the best way is to do this with javascript
                    string extension = System.IO.Path.GetExtension(uplCAC.PostedFile.FileName);

                    if (extension == ".pdf")
                    {
                        filename_caccert = uplCAC.FileName;
                        uplCAC.PostedFile.SaveAs(MapPath("~") + "/Uploadform/CAC_certificates/" + saveaseid + uplCAC.PostedFile.FileName);
                    }
                }
                if (uplcacothers.HasFile)
                {
                    //look at this but remember the best way is to do this with javascript
                    string extension = System.IO.Path.GetExtension(uplcacothers.PostedFile.FileName);

                    if (extension == ".pdf")
                    {
                        filename_cacothers = uplcacothers.FileName;
                        uplcacothers.PostedFile.SaveAs(MapPath("~") + "/Uploadform/CAC_Docs/" + saveaseid + uplcacothers.PostedFile.FileName);
                    }
                }
                if (uplvatreg.HasFile)
                {
                    //look at this but remember the best way is to do this with javascript
                    string extension = System.IO.Path.GetExtension(uplvatreg.PostedFile.FileName);

                    if (extension == ".pdf")
                    {
                        filename_vatreg = uplvatreg.FileName;
                        uplvatreg.PostedFile.SaveAs(MapPath("~") + "/Uploadform/vat/" + saveaseid + uplvatreg.PostedFile.FileName);
                    }
                }
                if (uplTax.HasFile)
                {
                    //look at this but remember the best way is to do this with javascript
                    string extension = System.IO.Path.GetExtension(uplTax.PostedFile.FileName);

                    if (extension == ".pdf")
                    {
                        filename_Tax = uplTax.FileName;
                        uplTax.PostedFile.SaveAs(MapPath("~") + "/Uploadform/tax/" + saveaseid + uplTax.PostedFile.FileName);
                    }
                }
                /*
                strSaveMessage = dtProc.registerVendor(regfname, reglname, Phone, regemail, username, regpassword, "guest", companyname,
        filename_passport, filename_caccert, filename_identity, filename_vatreg, filename_cacothers, txtaddress.Value, filename_Tax, hosts, token, "0", saveaseid);
           */ }
            catch (Exception exp)
            {

            }
        }
        protected void RadButton11_Click(object sender, EventArgs e)
        {
            string regemail = txtEmail.Text;
            string regfname = txtFName.Text;
            string reglname = txtLName.Text;
            if (!checkPassword())
            {
                lblDisplay.Text = "Password did not match!!!";
                return;
            }
            string regpassword = sh1.GetSHA1HashData(txtPassword1.Text);
            string username = txtUName.Text;
            string Phone = txtPhone.Text;
            string companyname = txtCompany.Text;
            //string passport = txtpassport.Value;
            //string caccert = txtcac.Value;
            //string vatreg = txtvatreg.Value;
            //string cacdoc = txtcacothers.Value;
            //string taxid = txtTax.Value;
            //string address = txtaddress.Value;
            //string identitfication = txtidtype.Value;
            // String usertype = cmbType.SelectedValue;
            string expexpMessage = "";
            string strSaveMessage = "";
            string token = sh1.GetSHA1HashData(txtUName.Text);
            // string strAccessControl = Session["accesscontrol"].ToString();
            string strAccessControl = "2";
            Int32 intAccessControl = Int32.Parse(strAccessControl);
            int intExist = dtProc.existUser1(username, "", hosts, out expexpMessage);
            if (intExist <= 0)
            {
                /*
                 registerVendor( string fname, string lname, string phone, string email, string username, string password, string createdBy, 
            string companyname, string passport, string caccert, string identitfication , string vatreg, string cacdoc, 
            string address, string taxid, string connLocation, string token, string status)
                 */
                try
                {
                    string filename_identity = "";
                    string filename_passport = "";
                    string filename_caccert = "";
                    string filename_cacothers = "";
                    string filename_vatreg = "";
                    string filename_Tax = "";

                    string saveaseid = dtProc.genSaveaseID();

                    string filePathuplIDType = uplIDType.PostedFile.FileName;          // getting the file path of uploaded file
                    filename_identity = Path.GetFileName(filePathuplIDType);               // getting the file name of uploaded file
                    string extuplIDType = Path.GetExtension(filename_identity);                      // getting the file extension of uploaded file

                    string filefilename_passport = uplpassport.PostedFile.FileName;          // getting the file path of uploaded file
                    filename_passport = Path.GetFileName(filefilename_passport);               // getting the file name of uploaded file
                    string extpassport = Path.GetExtension(filename_passport);                      // getting the file extension of uploaded file

                    string filefilename_caccert = uplCAC.PostedFile.FileName;          // getting the file path of uploaded file
                    filename_caccert = Path.GetFileName(filefilename_caccert);               // getting the file name of uploaded file
                    string extpcaccert = Path.GetExtension(filename_caccert);                      // getting the file extension of uploaded file

                    string filefilename_cacothers = uplcacothers.PostedFile.FileName;          // getting the file path of uploaded file
                    filename_cacothers = Path.GetFileName(filefilename_cacothers);               // getting the file name of uploaded file
                    string extcacothers = Path.GetExtension(filename_cacothers);                      // getting the file extension of uploaded file

                    string filefilename_vatreg = uplvatreg.PostedFile.FileName;          // getting the file path of uploaded file
                    filename_vatreg = Path.GetFileName(filefilename_vatreg);               // getting the file name of uploaded file
                    string extvatreg = Path.GetExtension(filename_vatreg);                      // getting the file extension of uploaded file

                    string filefilename_Tax = uplTax.PostedFile.FileName;          // getting the file path of uploaded file
                    filename_Tax = Path.GetFileName(filefilename_Tax);               // getting the file name of uploaded file
                    string exttax = Path.GetExtension(filename_Tax);                      // getting the file extension of uploaded file

                    string type = String.Empty;
                    Byte[] bytes_identity = null, bytes_passport = null, bytes_caccert = null, bytes_cacothers = null, bytes_vatreg = null, bytes_tax = null;
                    if (uplIDType.HasFile)
                    {
                        try
                        {

                            switch (extuplIDType)                                         // this switch code validate the files which allow to upload only PDF  file 
                            {
                                case ".pdf":
                                    type = "application/pdf";
                                    break;

                            }

                            if (type != String.Empty)
                            {
                                //  connection();
                                Stream fs = uplIDType.PostedFile.InputStream;
                                BinaryReader br = new BinaryReader(fs);                                 //reads the   binary files
                                bytes_identity = br.ReadBytes((Int32)fs.Length);                           //counting the file length into bytes
                            }
                            else
                            {

                                lblDisplay.ForeColor = System.Drawing.Color.Red;
                                lblDisplay.Text = "Select Only PDF Files  ";                              // if file is other than speified extension 
                            }
                        }
                        catch (Exception ex)
                        {
                            lblDisplay.Text = "Error: " + ex.Message.ToString();
                        }
                    }
                    if (uplpassport.HasFile)
                    {
                        try
                        {

                            switch (extpassport)                                         // this switch code validate the files which allow to upload only PDF  file 
                            {
                                case ".pdf":
                                    type = "application/pdf";
                                    break;

                            }

                            if (type != String.Empty)
                            {
                                //  connection();
                                Stream fs = uplpassport.PostedFile.InputStream;
                                BinaryReader br = new BinaryReader(fs);                                 //reads the   binary files
                                bytes_passport = br.ReadBytes((Int32)fs.Length);                           //counting the file length into bytes
                            }
                            else
                            {

                                lblDisplay.ForeColor = System.Drawing.Color.Red;
                                lblDisplay.Text = "Select Only PDF Files  ";                              // if file is other than speified extension 
                            }
                        }
                        catch (Exception ex)
                        {
                            lblDisplay.Text = "Error: " + ex.Message.ToString();
                        }
                    }
                    if (uplCAC.HasFile)
                    {
                        try
                        {

                            switch (extpcaccert)                                         // this switch code validate the files which allow to upload only PDF  file 
                            {
                                case ".pdf":
                                    type = "application/pdf";
                                    break;

                            }

                            if (type != String.Empty)
                            {
                                //  connection();
                                Stream fs = uplCAC.PostedFile.InputStream;
                                BinaryReader br = new BinaryReader(fs);                                 //reads the   binary files
                                bytes_caccert = br.ReadBytes((Int32)fs.Length);                           //counting the file length into bytes
                            }
                            else
                            {

                                lblDisplay.ForeColor = System.Drawing.Color.Red;
                                lblDisplay.Text = "Select Only PDF Files  ";                              // if file is other than speified extension 
                            }
                        }
                        catch (Exception ex)
                        {
                            lblDisplay.Text = "Error: " + ex.Message.ToString();
                        }
                    }
                    if (uplcacothers.HasFile)
                    {
                        try
                        {

                            switch (extcacothers)                                         // this switch code validate the files which allow to upload only PDF  file 
                            {
                                case ".pdf":
                                    type = "application/pdf";
                                    break;

                            }

                            if (type != String.Empty)
                            {
                                //  connection();
                                Stream fs = uplcacothers.PostedFile.InputStream;
                                BinaryReader br = new BinaryReader(fs);                                 //reads the   binary files
                                bytes_cacothers = br.ReadBytes((Int32)fs.Length);                           //counting the file length into bytes
                            }
                            else
                            {

                                lblDisplay.ForeColor = System.Drawing.Color.Red;
                                lblDisplay.Text = "Select Only PDF Files  ";                              // if file is other than speified extension 
                            }
                        }
                        catch (Exception ex)
                        {
                            lblDisplay.Text = "Error: " + ex.Message.ToString();
                        }
                    }
                    if (uplvatreg.HasFile)
                    {
                        try
                        {

                            switch (extvatreg)                                         // this switch code validate the files which allow to upload only PDF  file 
                            {
                                case ".pdf":
                                    type = "application/pdf";
                                    break;

                            }

                            if (type != String.Empty)
                            {
                                //  connection();
                                Stream fs = uplvatreg.PostedFile.InputStream;
                                BinaryReader br = new BinaryReader(fs);                                 //reads the   binary files
                                bytes_vatreg = br.ReadBytes((Int32)fs.Length);                           //counting the file length into bytes
                            }
                            else
                            {

                                lblDisplay.ForeColor = System.Drawing.Color.Red;
                                lblDisplay.Text = "Select Only PDF Files  ";                              // if file is other than speified extension 
                            }
                        }
                        catch (Exception ex)
                        {
                            lblDisplay.Text = "Error: " + ex.Message.ToString();
                        }
                    }
                    if (uplTax.HasFile)
                    {
                        try
                        {

                            switch (exttax)                                         // this switch code validate the files which allow to upload only PDF  file 
                            {
                                case ".pdf":
                                    type = "application/pdf";
                                    break;

                            }

                            if (type != String.Empty)
                            {
                                //  connection();
                                Stream fs = uplTax.PostedFile.InputStream;
                                BinaryReader br = new BinaryReader(fs);                                 //reads the   binary files
                                bytes_tax = br.ReadBytes((Int32)fs.Length);                           //counting the file length into bytes
                            }
                            else
                            {

                                lblDisplay.ForeColor = System.Drawing.Color.Red;
                                lblDisplay.Text = "Select Only PDF Files  ";                              // if file is other than speified extension 
                            }
                        }
                        catch (Exception ex)
                        {
                            lblDisplay.Text = "Error: " + ex.Message.ToString();
                        }
                    }
                    /**/

                    /*
                     registerVendor( string fname, string lname, string phone, string email, string username, string password, string createdBy, 
            string companyname,string passport, Byte[] passportB, string caccert, Byte[] caccertB, string cacdoc, Byte[] cacdocB,
            string identitfication, Byte[] identitficationB, string vatreg,Byte[] vatregB,   string taxid, Byte[] taxidB,
            string address, string connLocation, string token, string status, string saveaseid)
                     */
                    strSaveMessage = dtProc.registerVendor(regfname, reglname, Phone, regemail, username, regpassword, "guest", companyname,
            filename_passport, bytes_passport, filename_caccert, bytes_caccert, filename_identity, bytes_identity, filename_vatreg, bytes_vatreg,
            filename_cacothers, bytes_cacothers, filename_Tax, bytes_tax, txtAddress.Text, hosts, token, "0", saveaseid);
                }
                catch (Exception exp)
                {

                }
            }
        }
    }
}