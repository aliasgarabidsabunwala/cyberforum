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

public partial class members_changepassword : System.Web.UI.Page
{
    public String StrT, DisplayName ;
    public String EMail ;
    protected void Page_Load(object sender, EventArgs e)
    {
        EMail = Session["login_success"].ToString();
        if (EMail != "" )
        {
            SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);
            SqlDataAdapter Da = new SqlDataAdapter("select * from member_master where email_id='" + EMail + "'", Cn);
            DataSet DS = new DataSet();
            DS.Clear();
            Da.Fill(DS, "member_master");
            if (DS.Tables["member_master"].Rows.Count > 0 )
            {
                DisplayName = DS.Tables["member_master"].Rows[0]["displayname"].ToString();

            }

        }
    }
    protected void CmdSubmit_Click(object sender, EventArgs e)
    {
        if (TxtNewPassword.Text != TxtConformPassword.Text )
        {
            ClsMain.CreateMessageAlert(this , "Password are not match", "123");
            return ;

        }

        EMail = Session["login_success"].ToString();
        if (EMail != "" )
        {
            SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);
            SqlDataAdapter Da = new SqlDataAdapter("select * from member_master where email_id='" + EMail + "'", Cn);
            DataSet DS =new DataSet();
            DS.Clear();
            Da.Fill(DS, "member_master");
            if (DS.Tables["member_master"].Rows.Count > 0 )
            {
                String P ;
                P = DS.Tables["member_master"].Rows[0]["passwd"].ToString();
                if (P != TxtOldPassword.Text )
                {
                    ClsMain.CreateMessageAlert(this, "Invalid old password", "123");
                    return;
                }
                Cn.Open();
                SqlCommand Com = new SqlCommand("update member_master set passwd='" + TxtNewPassword.Text + "' where email_id='" + EMail + "'", Cn);
                Com.ExecuteNonQuery();
                Cn.Close();
                ClsMain.CreateMessageAlert(this, "Password changed successfully", "123");
                Response.Redirect("member_signin.aspx");
            }
        }

    }
}


