using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace saveasze
{
    public partial class sales_support : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsend_Click(object sender, EventArgs e)
        {
            string fromEmail = txtemail.Value;
            string ToEmail = "mudiakevweokpako@gmail.com";
            string subject = txtsubject.Value;
            string body = txtmessage.Value + "/n" + txtphone.Value + "/n" + txtname.Value;

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

            smtpClient.Credentials = new System.Net.NetworkCredential("mudiakevweokpako@gmail.com", "phy123456@#$M");
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

            MailMessage mailMessage = new MailMessage(fromEmail, ToEmail);
            mailMessage.Subject = txtsubject.Value;
            mailMessage.Body = txtmessage.Value + "/n" + txtphone.Value + "/n" + txtname.Value; ;

            try
            {
                smtpClient.Send(mailMessage);
                string mess = "Message sent";
                MessageBox.Show(mess);
            }
            catch (Exception ex)
            {
                string mess = ex.ToString();
                MessageBox.Show(mess);
            }
        }
    }
}