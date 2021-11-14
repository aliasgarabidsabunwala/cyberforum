using System;
using System.Data;
using System.Data.SqlClient ;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Mail;

public partial class forums_forum_new_replies : System.Web.UI.Page
{
    public String StrT ,StrTopicId,StrTopicName,StrTopicStarter,StrTopicDesc,StrPostDate,StrForumName,StrMemName,StrRank,StrJoinDate,StrPostCount,StrLocation;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CmdPreview_Click(object sender, EventArgs e)
    {

        if (Session["login_success"] == "" || Session["login_success"] ==null) 
        {
            Session["LoginFromPage"] = "../forums/forum_new_replies.aspx";
            Server.Transfer("../members/member_signin.aspx");
            return;

        }
        //>>> show the preview
        String S1 ;
        S1 = TxtMessage.Text;

        S1 = S1.Replace(  "<", "&lt");
        S1 = S1.Replace( ">", "&gt");

        Session["preview_subject"] = TxtMessage.Text;
        Session["preview_message"] = S1;// ClsMain.TextParse(S1);

        Response.Write("<script>window.open('forum_editor_preview.aspx', 'my_new_window', 'width=800,height=400,top=150,left=50,scrollbars=yes')</script>");

        //>>> Response.Redirect("forum_editor_preview.aspx")

    }


    protected void CmdSubmit_Click(object sender, EventArgs e)
    {
        //>>> save the reply

        if (Session["login_success"] == "" || Session["login_success"] ==null)
        {
            Session["LoginFromPage"] = "" ;
            Server.Transfer("../members/member_signin.aspx");
            return;

        }
        if (TxtMessage.Text == "" )
        {
            ClsMain.CreateMessageAlert(this, "Message can not blank", "123");
            return;
        }

        if (int.Parse(Request.QueryString["topic_id"].ToString()) == 0 || Request.QueryString["topic_id"].ToString() == "" )
        {
            ClsMain.CreateMessageAlert(this, "Unable to add the new post, for this topic.", "123");
            return;
        }
        SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);

        int LastPostId ;
        SqlDataAdapter Da = new SqlDataAdapter("select max(sno) from forum_post  ", Cn);
        DataSet Ds = new DataSet();
        Da.Fill(Ds, "max_sno");
        //if IsDBNull(Ds.Tables("max_sno").Rows(0).Item(0)) = False Then
            LastPostId = int.Parse (Ds.Tables["max_sno"].Rows[0][0].ToString());
        //End If
        LastPostId = LastPostId + 1;

        if(Cn.State == ConnectionState.Closed ){Cn.Open ();}
        
        SqlCommand Com = new SqlCommand("update forum_topics set total_replies=total_replies+1 , last_post_id= " + LastPostId.ToString() + " where sno =" + Request.QueryString["topic_id"].ToString(), Cn);
        Com.ExecuteNonQuery();
        

        int ForumId ;
        int SendMemID ;
        String CreateDate;
        String TopicSub ;
        Da = new SqlDataAdapter("select forum_id, mem_id, create_date, topic_sub from forum_topics where sno= " + Request.QueryString["topic_id"].ToString(), Cn);
        Da.Fill(Ds, "forum_id");
        ForumId = int.Parse(Ds.Tables["forum_id"].Rows[0]["forum_id"].ToString());
        SendMemID =int.Parse( Ds.Tables["forum_id"].Rows[0]["mem_id"].ToString());
        CreateDate = Ds.Tables["forum_id"].Rows[0]["create_date"].ToString ();
        TopicSub = Ds.Tables["forum_id"].Rows[0]["topic_sub"].ToString();

        Da = new SqlDataAdapter("select * from forum_post where 1 =2 ", Cn);
        SqlCommandBuilder cb = new SqlCommandBuilder(Da);
        Da.Fill(Ds, "forum_post");

        DataRow R ;
        R = Ds.Tables["forum_post"].NewRow();
        R["sno"] = LastPostId;
        R["forum_id"] = ForumId;
        R["topic_id"] = Request.QueryString["topic_id"].ToString();

        String s1;
        String s2 ;
        s2 = "";
        s1 = TxtMessage.Text;
        //Dim a() As String
        //a = Split(s1, vbCrLf)
        //Dim i As Integer
        //For i = 0 To a.GetUpperBound(0)
        //    If Len(a(i)) = 0 Then
        //        s2 = s2 & vbCrLf
        //    Else
        //        If Len(a(i)) <= 63 Then
        //            s2 = s2 & a(i) & vbCrLf

        //        Else
        //            Dim c As Integer
        //            c = 1
        //            Dim p As Integer
        //            p = 1

        //            While c <= a(i).Length
        //                If p <= 63 Then
        //                    s2 = s2 & Mid(a(i), c, 1)
        //                Else

        //                    s2 = s2 & vbCrLf
        //                    s2 = s2 & Mid(a(i), c, 1)
        //                    p = 1
        //                End If
        //                p = p + 1
        //                c = c + 1
        //            End While
        //            s2 = s2 & vbCrLf
        //        End If
        //    End If
        //Next
        R["post_desc"] = s1 ;
        R["mem_id"] = int.Parse ((Session["mem_id"].ToString()));
        R["post_date"] = System.DateTime.Now.ToString ();

        Ds.Tables["forum_post"].Rows.Add(R);
        Da.Update(Ds, "forum_post");

        //>>>> send email for notification
        String StrToEmail  = "";
        String StrMemName ="";
        String StrByMemName ="";
        MailMessage msgMail = new MailMessage();
        Da = new SqlDataAdapter("select * from member_master where sno =" + SendMemID, Cn);
        Ds = new DataSet();
        Da.Fill(Ds, "member_master");
        if (Ds.Tables["member_master"].Rows.Count > 0 )
        {
            StrToEmail = Ds.Tables["member_master"].Rows[0]["email_id"].ToString();
            StrMemName = Ds.Tables["member_master"].Rows[0]["displayname"].ToString();
        }

        Da = new SqlDataAdapter("select * from member_master where sno =" + Session["mem_id"].ToString(), Cn);
        Ds = new DataSet();
        Da.Fill(Ds, "member_master_post");
        if (Ds.Tables["member_master_post"].Rows.Count > 0 )
        {
            StrByMemName = Ds.Tables["member_master_post"].Rows[0]["displayname"].ToString();
        }

        if (StrToEmail != "" )
        {
            String StrBody  = "";
            StrBody = StrBody + "<p><font face='Verdana' size='2'>" + StrMemName + ",</font></p>";
            StrBody = StrBody + "<p><font face='Verdana' size='2'>You have a new reply to your post dated ";
            StrBody = StrBody + CreateDate + " on<br><br><b>" + TopicSub + "</b><br><br> by " + StrByMemName + " on " + System.DateTime.Now.ToString () + "</font></p>";
            StrBody = StrBody + "<p><font face='Verdana' size='2'>To view the reply <a href='http://www.programmer2programmer.net/forums/forum_topics.aspx?topic_id=" + Request.QueryString["topic_id"].ToString() + "'>click</a> here.</font></p>";
            StrBody = StrBody + "<hr>";
            StrBody = StrBody + "<p><font face='Verdana' size='2'>Webmaster</font></p>";
            StrBody = StrBody + "<p><font face='Verdana' size='2'><a href='http://www.programmer2programmer.net'>";
            StrBody = StrBody + "http://www.programmer2programmer.net</a> </font></p>";
            StrBody = StrBody + "<p><font face='Verdana' size='2'>Note : This is an automated email don't reply ";
            StrBody = StrBody + "this email.</font></p>";

            msgMail.To = StrToEmail;
            
            msgMail.From = "webmaster@onlineforum.com";
            msgMail.Subject = "New reply to your post at Online Forum";
            msgMail.BodyFormat = MailFormat.Html;
            msgMail.Body = StrBody;

            SmtpMail.Send(msgMail);

        }


        Response.Redirect("forum_topics.aspx?topic_id=" + Request.QueryString["topic_id"].ToString());

    }
}

