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

public partial class members_member_signin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack ==false )
        {
            Session["login_success"] = "";

        }
    }
    protected void CmdSubmit_Click(object sender, EventArgs e)
    {
        Session["login_success"] = "";
        if (TxtEmailID.Text.IndexOf("'") > 0 )
        {
            ClsMain.CreateMessageAlert(this, "Invalid Email ID", "123");
            return;
        }
        if (TxtEmailID.Text.IndexOf(";") > 0 )
        {
            ClsMain.CreateMessageAlert(this, "Invalid Email ID", "123");
            return ;
        }
        if (TxtEmailID.Text.IndexOf(" ") > 0 )
        {
            ClsMain.CreateMessageAlert(this, "Invalid Email ID", "123");
            return ;
        }

        SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);
        SqlDataAdapter Da = new SqlDataAdapter("select * from member_master where email_id='" + TxtEmailID.Text + "'", Cn);
        DataSet DS = new DataSet();
        DS.Clear();
        Da.Fill(DS, "member_master");
        if (DS.Tables["member_master"].Rows.Count == 1 )
        {
            String P ;
            P = DS.Tables["member_master"].Rows[0]["passwd"].ToString();
            if (P != TxtPassword.Text )
            {
                ClsMain.CreateMessageAlert(this, "Invalid Password", "123");
            }
            else
            {
                Session["display_name"] = DS.Tables["member_master"].Rows[0]["displayname"].ToString();
                Session["mem_id"] = DS.Tables["member_master"].Rows[0]["sno"].ToString();
                Session["mem_type"] = DS.Tables["member_master"].Rows[0]["rank"].ToString();
                Session["last_login"] = DS.Tables["member_master"].Rows[0]["lastlogin"].ToString();
                Cn.Open();

                SqlCommand com = new SqlCommand("update member_master set lastlogin=getdate() where email_id='" + TxtEmailID.Text + "'", Cn);
                Session["login_success"] = TxtEmailID.Text;
                com.ExecuteNonQuery();
                Cn.Close();

                Session["isauthenticate"] = "1";
                if (Session["LoginFromPage"] == "" || Session["LoginFromPage"]== null)
                {
                    Response.Redirect("../default.aspx");
                    
                }
                else
                {
                    Response.Redirect(Session["LoginFromPage"].ToString());
                }
               

            }
        }
        else
        {
            ClsMain.CreateMessageAlert(this, "Invalid Email ID", "123");
        }
    }
}

