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

public partial class members_newmember : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         if (IsPostBack == false )
         {
            LblDup.Visible = false;


            DdlOcupation.Items.Clear();
            DdlOcupation.Items.Add("Academic Institution");
            DdlOcupation.Items.Add("Research Scholar");
            DdlOcupation.Items.Add("NGO");
            DdlOcupation.Items.Add("Scientist");
            DdlOcupation.Items.Add("Student");
            DdlOcupation.Items.Add("Other");

            DdlGender.Items.Add("Male");
            DdlGender.Items.Add("Female");

            Ddllocation.Items.Clear();
            SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);
            if(Cn.State == ConnectionState.Closed ){Cn.Open ();}

            SqlDataAdapter da = new SqlDataAdapter("select * from country_master order by country_name", Cn);
            DataSet Ds = new DataSet();
            da.Fill(Ds, "country_master");
            int i ;
            for (i = 0 ;i<= Ds.Tables["country_master"].Rows.Count - 1;i++)
             {
                Ddllocation.Items.Add(Ds.Tables["country_master"].Rows[i][0].ToString() );
            }
         }
    }
    protected void  BtnSubmit_Click(object sender, EventArgs e)
    {
    
        if (Page.IsValid == true)
        {

            SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);
            if(Cn.State == ConnectionState.Closed ){Cn.Open ();}
            SqlCommand Com ;
            int i ;
            Com = new SqlCommand("select count(*) from member_master where email_id='" + TxtEmailID.Text + "'", Cn);
            i =int.Parse( Com.ExecuteScalar().ToString());
            if (i > 0 )
            {
                LblDup.Visible = true;
                LblDup.Text = "Duplicate Email ID";
                return ;
            }

            Com = new SqlCommand("select count(*) from member_master where displayname='" + TxtName.Text + "'", Cn);
            i = int.Parse( Com.ExecuteScalar().ToString());
            if (i > 0 )
            {
                LblDup.Visible = true;
                LblDup.Text = "Duplicate display name.";
                return ;
            }

            int LastSno ;
            Com = new SqlCommand("select   max(sno) from member_master", Cn);
            LastSno = int.Parse(Com.ExecuteScalar().ToString()) + 1;
            int intEmailVisible ;
            if (ChkDisplayEmail.Checked == true)
            {
                intEmailVisible = 1;
            }
            else
            {
                intEmailVisible = 0;
            }

            
            String StrSql;
            StrSql = "insert into member_master values(" + LastSno.ToString() + ",'" + TxtEmailID.Text + "','" + TxtPassword1.Text + "','" + TxtName.Text + "','" + System.DateTime.Now.ToString() + "',1,NULL,'" + Ddllocation.Text + "','" + DdlOcupation.Text + "','" + txtHomePage.Text + "'," + intEmailVisible.ToString() + ",'Beginer','" + DdlGender.Text + "')";

            Com = new SqlCommand(StrSql, Cn);
            i = 0;
            i = int.Parse( Com.ExecuteNonQuery().ToString());
            Cn.Close();


            if (i > 0 )
            {
                String StrEmail ;
                StrEmail = TxtEmailID.Text;
                TxtName.Text = "";
                TxtEmailID.Text = "";
                TxtPassword1.Text = "";
                TxtPassword2.Text = "";
                Response.Redirect("member_signin.aspx");
            }
        }
    }
    protected void  BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("../default.aspx");

        }
   }

