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

public partial class forums_forum_new_topics : System.Web.UI.Page
{
     public   String StrT , StrForumName;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login_success"] == "" || Session["login_success"] ==null) 
        {
            Session["LoginFromPage"] = "" ;
            Server.Transfer("../members/member_signin.aspx");
            return;
        }
        SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);

        int LastTopicId   = 0;
        SqlDataAdapter Da = new SqlDataAdapter("select * from forum_master where sno = " + Request.QueryString["forum_id"].ToString(), Cn);
        DataSet Ds = new DataSet();
        Da.Fill(Ds, "forum_master");
        if (Ds.Tables["forum_master"].Rows.Count > 0 )
        {
            StrForumName = Ds.Tables["forum_master"].Rows[0]["forum_name"].ToString();
        }
    }

    protected void CmdPreview_Click(object sender, EventArgs e)
    {
        String S1 ;
        S1 = TxtMessage.Text;

        S1 = S1.Replace( "<", "&lt");
        S1 = S1.Replace( ">", "&gt");

        Session["preview_subject"] = TxtSubject.Text;
        Session["preview_message"] = ClsMain.TextParse(S1);

        Response.Write("<script>window.open('forum_editor_preview.aspx', 'my_new_window', 'width=800,height=400,top=150,left=50,scrollbars=yes')</script>");

    }

    protected void CmdSubmit_Click(object sender, EventArgs e)
    {
        if (Session["login_success"] == "" || Session["login_success"] ==null) 
        {
            Session["LoginFromPage"] = "" ;
            Server.Transfer("../members/member_signin.aspx");
            return ;

        }
        //>>> validation
        if (TxtSubject.Text == "" )
        {
            ClsMain.CreateMessageAlert(this, "Subject can not blank", "123");
            return ;
        }

        if (TxtMessage.Text == "" )
        {
            ClsMain.CreateMessageAlert(this, "Message can not blank", "123");
            return;
        }

        if ( int.Parse (Request.QueryString["forum_id"].ToString()) == 0 || Request.QueryString["forum_id"] == "")
        {
            ClsMain.CreateMessageAlert(this, "Unable to add the new topic, forum category not found.", "123");
            return;
        }
        SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);

        SqlDataAdapter Da ;
       //>>> check for same topics for the forum

        if(Cn.State == ConnectionState.Closed ){Cn.Open ();}
        SqlCommand Com = new SqlCommand("select count(*) from forum_topics where forum_id=" + Request.QueryString["forum_id"].ToString() + " and topic_sub = '" + TxtSubject.Text  + "' ", Cn);
        if (int.Parse(Com.ExecuteScalar().ToString()) > 0 )
        {
            ClsMain.CreateMessageAlert(this, "Unable to add the new topic, duplicate subject found in same forum.", "123");
            return;
        }

        int LastTopicId = 0;
        Da = new SqlDataAdapter("select max(sno) from forum_topics  ", Cn);
        DataSet Ds =new DataSet();
        Da.Fill(Ds, "max_sno");
        
        LastTopicId = int.Parse(Ds.Tables["max_sno"].Rows[0][0].ToString());
       
        LastTopicId = LastTopicId + 1;

        Da = new SqlDataAdapter("select * from forum_topics where 1 =2 ", Cn);
        SqlCommandBuilder cb = new SqlCommandBuilder(Da);
        Da.Fill(Ds, "forum_topics");

        DataRow R ;
        R = Ds.Tables["forum_topics"].NewRow();
        R["sno"] = LastTopicId;
        R["forum_id"] = int.Parse ((Request.QueryString["forum_id"].ToString()));
        R["topic_sub"] = TxtSubject.Text  ;
        R["is_locked"] = 0;
        R["is_hide"] = 0;
        //check thw warp
        R["topic_desc"] = TxtMessage.Text;
        R["mem_id"] = int.Parse((Session["mem_id"].ToString()));
        R["create_date"] = System.DateTime.Now.ToString();
        R["last_post_id"] = 0;
        R["total_replies"] = 0;
        R["total_views"] = 0;
        Ds.Tables["forum_topics"].Rows.Add(R);
        Da.Update(Ds, "forum_topics");

        Response.Redirect("forum_main.aspx?forum_id=" + Request.QueryString["forum_id"].ToString());


    }
}


