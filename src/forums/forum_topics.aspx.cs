using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class forums_forum_topics : System.Web.UI.Page
{    public String StrT ,StrTopicId,StrTopicName,StrTopicStarter,StrTopicDesc,StrPostDate="";

    protected void Page_Load(object sender, EventArgs e)
    {
       SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);
       Cn.Open();
        SqlCommand Com =new SqlCommand("update forum_topics set total_views=total_views+1 where sno =" + Request.QueryString["topic_id"].ToString(), Cn);
        Com.ExecuteNonQuery();

        StrTopicName = "";


    }
}

