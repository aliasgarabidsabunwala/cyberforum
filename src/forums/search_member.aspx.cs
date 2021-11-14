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

public partial class forums_search_member : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnSearch_Click(object sender, EventArgs e)

    {

        SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);
        String Str1 ;
        Str1 = "select * from member_master where displayname like '" + TxtSerach.Text + "%'  ";

        SqlDataAdapter Da = new SqlDataAdapter(Str1, Cn);
        DataSet Ds = new DataSet();
        Da.Fill(Ds, "member_master");
        GridView1.Columns.Clear();
        GridView1.DataBind();

        if (Ds.Tables["member_master"].Rows.Count > 0)
        {

            DataTable Dt = new DataTable("search_result");

            Dt.Columns.Add("Sr");
            Dt.Columns.Add("SystemID");
            Dt.Columns.Add("Display");
            Dt.Columns.Add("EmailID");
            Dt.Columns.Add("JoinDate");
            

            int i ;
            for (i = 0;i<=Ds.Tables["member_master"].Rows.Count - 1;i++)
            {
                DataRow r = Dt.NewRow();

                r["sr"] = i + 1;
                r["SystemID"] = Ds.Tables["member_master"].Rows[i]["sno"].ToString();
                r["Display"] = Ds.Tables["member_master"].Rows[i]["displayname"].ToString();
                r["EmailID"] = Ds.Tables["member_master"].Rows[i]["email_id"].ToString();
                r["JoinDate"] = Ds.Tables["member_master"].Rows[i]["createdate"].ToString();
                

                Dt.Rows.Add(r);
            }
            GridView1.Width = 900;
            GridView1.DataSource = Dt;

            
            GridView1.DataBind();

            //Dim Row As GridViewRow
            //For Each Row In GridView1.Rows

            //    '>>> hide sno
            //    'Row.Cells(1).Visible = False

            //    Dim hl As New HyperLink
            //    hl.Text = Row.Cells(2).Text
            //    hl.NavigateUrl = "member_profile.aspx?id=" & Row.Cells(1).Text
            //    Row.Cells(2).Controls.Add(hl)

            //    'Row.Cells(1).Width = 1
            //Next
        }
        else
        {
            int i ;
            String T1 ;
            T1 = "";

            for (i = 0;i<25;i++)
            {

                T1 = T1 + "<br>";
            }

            BlankSpace.InnerHtml = "<BR> No Record Found.." + T1;
        }
    }
}

