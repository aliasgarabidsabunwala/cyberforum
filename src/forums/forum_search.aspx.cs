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

public partial class forums_forum_search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);
        String Str1;
        Str1 = "select * from forum_topics where sno in (select distinct topic_id from forum_post where post_desc like '%" + TxtSerach.Text + "%') ";

        SqlDataAdapter Da = new SqlDataAdapter(Str1, Cn);
        DataSet Ds = new DataSet();
        Da.Fill(Ds, "forum_topics");
        GridView1.Columns.Clear();
        GridView1.DataBind();
        if (Ds.Tables["forum_topics"].Rows.Count > 0 )
        {
            DataTable Dt =new DataTable("search_result");
            Dt.Columns.Add( "Sr");
            Dt.Columns.Add("Topic_id");
            Dt.Columns.Add("Description");
           
            int i ;
            for (i = 0 ;i<=Ds.Tables["forum_topics"].Rows.Count - 1;i++)
            {
                DataRow r  = Dt.NewRow();
                r["sr"] = i + 1;
                r["topic_id"] = Ds.Tables["forum_topics"].Rows[i]["sno"].ToString();
                r["description"] = Ds.Tables["forum_topics"].Rows[i]["topic_sub"].ToString();
              

                Dt.Rows.Add(r);
            }
            GridView1.Width = 800;
            GridView1.DataSource = Dt;

            GridView1.DataBind();



        }
        else
        {
            int i;
            String T1;
            T1 = "";

            for (i = 0;i<=25;i++)
            {

                T1 = T1 + "<br>";
            }

            BlankSpace.InnerHtml = "<BR> No Record Found.." + T1;

        }
    }
}

