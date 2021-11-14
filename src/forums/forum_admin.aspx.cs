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

public partial class forums_forum_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack==false )
        {
            Session["mtype"] = "member";
        }
    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        String SqlStr  = "";
        if (Session["mtype"] == "member" )
        {
            SqlStr = "select Sno,isenable as Statu, displayname as Name,email_id as Email, CreateDate as [Join Date] from member_master where displayname like '" + TxtSearch.Text + "%'";
        }
        else if (Session["mtype"].ToString() == "topic" )
        {
            SqlStr = "select * from forum_topics where topic_sub like '%" + TxtSearch.Text + "%'";
        }
        else
        {
            Response.Redirect("../members/member_signin.aspx");
        }
        String Dpath ;
        SqlConnection Cn=new SqlConnection(ClsMain.ConnStr);
        SqlDataAdapter Da;
        DataSet Ds;

        Da = new SqlDataAdapter(SqlStr, Cn);
        Ds = new DataSet();
        Ds.Clear();
        Da.Fill(Ds, "serach_result");
        Dg1.Columns.Clear();

        Dg1.DataSource = Ds;
        Dg1.DataMember = "serach_result";

        Dg1.DataBind();

    }
    protected void LkHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("../default.aspx");
    }
    protected void LkMember_Click(object sender, EventArgs e)
    {
        Session["mtype"] = "member";
        LblCap.Text = "Search Member";
        TxtSearch.Text = "";
    }
    protected void LkTopic_Click(object sender, EventArgs e)
    {
        Session["mtype"] = "topic";
        LblCap.Text = "Search Topic";
        TxtSearch.Text = "";
    }
    protected void LkReport_Click(object sender, EventArgs e)
    {
        Response.Redirect("forum_report.aspx");

    }
}

