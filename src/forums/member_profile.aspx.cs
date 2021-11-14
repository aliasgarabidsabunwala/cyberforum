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

public partial class forums_member_profile : System.Web.UI.Page
{
    public String StrDisplayName , StrRank, StrLocation, StrOccupation, StrGender, StrJoinDate, StrLastPostDate,  StrNoOfPost;
    public String StrHomePage, IsEmail, StrEmailId;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"].ToString() == Session["mem_id"].ToString() &&  Session["login_success"].ToString() != "" )
        {
            CmdModify.Visible = true;
        }
        else
        {
            CmdModify.Visible = false;
        }

        SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);
        int LastTopicId =0;
        SqlDataAdapter Da = new SqlDataAdapter("select * from member_master  where sno = " + Request.QueryString["id"].ToString() , Cn);
        DataSet Ds = new DataSet();
        Da.Fill(Ds, "member_master");
        if (Ds.Tables["member_master"].Rows.Count > 0)
        {
            if(Cn.State == ConnectionState.Closed ){Cn.Open ();}

            DataRow R;
            R = Ds.Tables["member_master"].Rows[0];
            StrDisplayName = R["displayname"].ToString();
            StrRank = R["rank"].ToString();
            StrLocation = R["location"].ToString();
            StrOccupation = R["occupation"].ToString();
            StrGender = R["gender"].ToString();
            StrJoinDate = R["createdate"].ToString();

            SqlCommand Com = new SqlCommand("select post_date from forum_post where mem_id=" + R["sno"].ToString(), Cn);
            SqlDataAdapter da2 = new SqlDataAdapter(Com);
            DataSet ds2=new DataSet ();
            da2.Fill(ds2, "post_date");
            if (ds2.Tables["post_date"].Rows.Count > 0)
            {
                StrLastPostDate = ds2.Tables["post_date"].Rows[0][0].ToString();
            }



            

            Com = new SqlCommand("select count(*) from forum_post where mem_id=" +  R["sno"].ToString(), Cn);
            StrNoOfPost = Com.ExecuteScalar().ToString();
            String s1;
            s1 = R["homepage"].ToString();
            if (s1 != "" )
            {
                StrHomePage = "<a href='" + s1 + "' target=_blank>" + s1 + "</a>";
            }
            IsEmail = R["display_emailid"].ToString();
            if (int.Parse(IsEmail) != 0 )
            {
                StrEmailId = "<a href=mailto:" + R["email_id"].ToString() + ">" + R["email_id"].ToString() + "</a>";
            }
            else
            {
                StrEmailId = "&nbsp;";
            }
            
        }


    }

    protected void CmdModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/members/modifymember.aspx");

    }
}

