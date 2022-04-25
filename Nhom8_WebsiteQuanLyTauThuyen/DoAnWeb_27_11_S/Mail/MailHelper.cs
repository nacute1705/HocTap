using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace Mail
{
    public class MailHelper
    {
        public void sendMail(string toEmail, string subject, string content)
        {
            var FromEmail = ConfigurationManager.AppSettings["FromEmail"].ToString();
            var FromEmailName = ConfigurationManager.AppSettings["FromEmailName"].ToString();
            var FromEmailPassword = ConfigurationManager.AppSettings["FromEmailPassword"].ToString();

            var SMTPHost = ConfigurationManager.AppSettings["SMTPHost"].ToString();
            var SMTPPort = ConfigurationManager.AppSettings["SMTPPort"].ToString();

            bool enabledSsl = bool.Parse(ConfigurationManager.AppSettings["EnabledSSL"].ToString());
            string body = content;
            MailMessage message = new MailMessage(new MailAddress(FromEmail, FromEmailName), new MailAddress(toEmail));
            message.Subject = subject;
            message.IsBodyHtml = true;
            message.Body = body;

            var client = new SmtpClient();
            client.Credentials = new NetworkCredential(FromEmail, FromEmailPassword);
            client.Host = SMTPHost;
            client.EnableSsl = enabledSsl;
            client.Port = !string.IsNullOrEmpty(SMTPPort)?Convert.ToInt32(SMTPPort):0;
            client.Send(message);
        }
    }
}
