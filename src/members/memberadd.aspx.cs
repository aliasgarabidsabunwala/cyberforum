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

public partial class members_memberadd : System.Web.UI.Page
{
    public String  StrT, StrTT;
    protected void Page_Load(object sender, EventArgs e)
    {


        SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);

        SqlDataAdapter Da = new SqlDataAdapter("select * from member_master where email_id= '" + Request.QueryString["email"].ToString() + "'", Cn);
        DataSet ds = new DataSet();
        ds.Clear();

        Da.Fill(ds, "member");

        if (ds.Tables["member"].Rows.Count > 0 )
        {

            StrTT = "Welcome <b>" + ds.Tables["member"].Rows[0]["displayname"].ToString() + "</b>,<br><br>Thanks for become a member in my web site. I would like to get feedback and your contribution for imporiving this site.<br><br> Click here to <a href='member_signin.aspx'><b>Sign In</b></a>";
        }
            else
        {
            StrTT = "Server is busy .. can not complete your request";
        }
    }
}


