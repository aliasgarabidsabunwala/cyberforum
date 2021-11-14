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

public partial class forums_forum_modify_replies : System.Web.UI.Page
{
    public String StrT, StrTopicId, StrTopicName, StrTopicStarter, StrTopicDesc, StrPostDate, StrForumName, StrForumId;

    protected void Page_Load(object sender, EventArgs e)
    {
          if (IsPostBack == false)
          {

            String StrForumId ;
            //>>> topic description
            SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);;
            SqlDataAdapter Da ;
            DataSet Ds ;

            Da = new SqlDataAdapter(" select * from forum_topics where sno = " +  Request.QueryString["topic_id"].ToString(), Cn);
            Ds = new DataSet();
            Ds.Clear();
            Da.Fill(Ds, "forum_topics");
            if (Ds.Tables["forum_topics"].Rows.Count > 0 )
            {
                StrForumId = Ds.Tables["forum_topics"].Rows[0]["forum_id"].ToString();
                StrTopicName = Ds.Tables["forum_topics"].Rows[0]["topic_sub"].ToString();
                StrTopicStarter = Ds.Tables["forum_topics"].Rows[0]["mem_id"].ToString();
                StrTopicDesc = Ds.Tables["forum_topics"].Rows[0]["topic_desc"].ToString();
                StrPostDate = Ds.Tables["forum_topics"].Rows[0]["create_date"].ToString();
            }
            if ( int.Parse(Request.QueryString["post_id"].ToString()) != 0 )
            {
                Da = new SqlDataAdapter(" select * from forum_post where sno = " + Request.QueryString["post_id"].ToString(), Cn);
                Ds = new DataSet();
                Ds.Clear();
                Da.Fill(Ds, "forum_post");
                if (Ds.Tables["forum_post"].Rows.Count > 0 )
                {
                    StrTopicStarter = Ds.Tables["forum_post"].Rows[0]["mem_id"].ToString();
                    StrTopicDesc = Ds.Tables["forum_post"].Rows[0]["post_desc"].ToString();
                    StrPostDate = Ds.Tables["forum_post"].Rows[0]["post_date"].ToString();
                }
            }


            TxtMessage.Text = StrTopicDesc;

            sp1.InnerHtml = ClsMain.TextParse(StrTopicDesc);
        }



    }

    protected void CmdPreview_Click(object sender, EventArgs e)
    {
        //>>> show the previewss
        String S1 ;
        S1 = TxtMessage.Text;

        S1 = S1.Replace( "<", "&lt");
        S1 = S1.Replace( ">", "&gt");

        Session["preview_subject"]= TxtMessage.Text;
        Session["preview_message"] = ClsMain.TextParse(S1);


        sp1.InnerHtml = ClsMain.TextParse(S1);
    }
    protected void CmdSubmit_Click(object sender, EventArgs e)
    {
        // save the reply


        if (TxtMessage.Text == "" )
        {
            ClsMain.CreateMessageAlert(this, "Message can not blank", "123");
            return ;
        }

        if (Request.QueryString["post_id"].ToString() == "0" || Request.QueryString["post_id"].ToString()  == "" )
        {
            ClsMain.CreateMessageAlert(this, "Unable to edit the post, for this topic.", "123");
            return ;
        }
        SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);

        int LastPostId  = 0;
        SqlDataAdapter Da= new SqlDataAdapter();
        DataSet Ds = new DataSet();

        Da = new SqlDataAdapter("select * from forum_post where sno=" + Request.QueryString["post_id"].ToString() , Cn);
        SqlCommandBuilder cb = new SqlCommandBuilder(Da);
        Da.Fill(Ds, "forum_post");

        DataRow R ;
        R = Ds.Tables["forum_post"].Rows[0];
       
        String s1, s2;
        
        s2 = "";
        s1 = TxtMessage.Text;
        R["post_desc"] = s1 ;

        Da.Update(Ds, "forum_post");

        Response.Redirect("forum_topics.aspx?topic_id=" + Request.QueryString["topic_id"].ToString ());

    }

}


