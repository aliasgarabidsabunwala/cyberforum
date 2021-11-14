using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Mail;

public partial class members_forgetpassword : System.Web.UI.Page
{
    String mMailServer,mTo,mFrom,mMsg,mSubject,mCC,mPort;

    String StrT, DisplayName;
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void CmdSubmit_Click(object sender, EventArgs e)
    {

        SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);

        SqlDataAdapter Da = new SqlDataAdapter("select * from member_master where email_id='" + TxtEmailID.Text + "'", Cn);
        DataSet Ds = new DataSet();
        Da.Fill(Ds, "member_master");
        int MemCount ;

        MemCount = Ds.Tables["member_master"].Rows.Count;
        if (MemCount != 1 )
        {
            ClsMain.CreateMessageAlert(this, "Unable to get the password..", "123");
            return;
        }
        else
        {
            Session["forget_email"] = TxtEmailID.Text;
            String StrToEmail ;
            String StrMemName ;
            MailMessage msgMail= new MailMessage();

            StrToEmail = Ds.Tables["member_master"].Rows[0]["email_id"].ToString();
            StrMemName = Ds.Tables["member_master"].Rows[0]["displayname"].ToString();

            msgMail.To = StrToEmail;
            
            msgMail.From = "webmaster@onlineforum.com";
            msgMail.Subject = "Login Password for online forum";

            msgMail.BodyFormat = MailFormat.Html;


            String strBody  = "";

            strBody = strBody + "";

            strBody = strBody + "<p>Hi " + StrMemName + ",</p>";
            strBody = strBody + "<p>Your password for <a href='http://www.onlineforum.net'>";
            strBody = strBody + "http://www.onlineforum.net</a> is </p>";
            strBody = strBody + "<p>" + Ds.Tables["member_master"].Rows[0]["passwd"].ToString() + "</p>";
            strBody = strBody + "<p>For login to onlineforum.net ";
            strBody = strBody + "<a target='_blank' href='http://www.onlineforum.net/members/member_signin.aspx'>";
            strBody = strBody + "click </a> here .</p>";
            strBody = strBody + "<p>From</p>";
            strBody = strBody + "<p>Webmaster</p>";
            strBody = strBody + "<p>onlineforum.NET</p>";
            strBody = strBody + "<hr>";
            strBody = strBody + "<p>It is an auto generated email do not reply to this email. <br>";
            strBody = strBody + "For any query send email to <a href='mailto:am@onlineforum.net'>";
            strBody = strBody + "am@onlineforum.net</a> </p>";


            msgMail.Body = strBody;

            SmtpMail.Send(msgMail);


            Response.Redirect("sendpassword.aspx");

        }
    }
}


