using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace saveasze
{
    public class EmailManager
    {

        public string sendEmailAlert(string subj, string messBody, string messageFrom, string messageTo)
        {
            string errMessage = "";
            //string messageFrom = "jonathan.ataisi@gmail.com";
            //string messageTo = "jottaisi@yahoo.com";

            using (
            MailMessage message = new MailMessage
            {
                To = { new MailAddress(messageTo, "Recipient 1") },
                Sender = new MailAddress(messageFrom, "Me"),
                From = new MailAddress(messageFrom, "Client"),
                Subject = subj,
                Body = messBody,
                IsBodyHtml = true,
            }
         )
            {
                using (
                   SmtpClient smtp = new SmtpClient
                   {
                       Host = "smtp.office365.com",
                       Port = 587,
                       Credentials = new System.Net.NetworkCredential("jonathanataisi@ngdelta.com", "P@55w0rd5@"),
                       EnableSsl = true
                   }
                )
                {
                    try { smtp.Send(message); errMessage = ""; }
                    catch (Exception excp)
                    {
                        errMessage = excp.Message;
                    }
                }
            }

            return errMessage;
        }
        public string sendEmail2(string subj, string messBody, string messageTo)
        {
            string errMessage = "";
            try
            {
                MailMessage message = new MailMessage();
                message.IsBodyHtml = true;
                // message.Headers.Add("Message-Id", String.Concat("<", DateTime.Today, "@ngdelta.com>"));
                message.BodyEncoding = System.Text.Encoding.UTF8;
                message.SubjectEncoding = System.Text.Encoding.Default;
                //message.From = new MailAddress("jonathan.ataisi@gmail.com");
                message.From = new MailAddress("sips@ngdelta.com");
                message.To.Add(new MailAddress(messageTo));
                //message.CC.Add(new MailAddress("email@gmail.com"));
                message.Subject = subj;
                message.Body = messBody;
                // sr.Close();
                SmtpClient client = new SmtpClient();
                client.Send(message);

                errMessage = "";
            }
            catch (Exception ex)
            {
                errMessage = ex.ToString();
            }
            return errMessage;

        }
    }
}