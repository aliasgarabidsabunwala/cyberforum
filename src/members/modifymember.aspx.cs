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

public partial class members_modifymember : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
                
        if (IsPostBack == false )
        {
            LblDup.Text = "";
            int Sno ;
            Sno =int.Parse( Session["mem_id"].ToString());



            LblDup.Visible =false;

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

            SqlDataAdapter da= new SqlDataAdapter("select * from country_master order by country_name", Cn);
            DataSet Ds =new DataSet();
            da.Fill(Ds, "country_master");
            int i ;
            for (i = 0;i<= Ds.Tables["country_master"].Rows.Count - 1;i++)
            {
                Ddllocation.Items.Add(Ds.Tables["country_master"].Rows[i][0].ToString());
            }

            //>>> show details

            SqlCommand  cmd;
            SqlDataReader dr;
            cmd = new SqlCommand("select * from member_master where sno = " + Sno.ToString() + "", Cn);
            dr = cmd.ExecuteReader();
            if (dr.Read() == true)
                TxtName.Text = dr["displayname"].ToString();
                TxtEmailID.Text = dr["email_id"].ToString();
                Ddllocation.Text = dr["location"].ToString();
                DdlOcupation.Text = dr["occupation"].ToString();
                DdlGender.Text = dr["gender"].ToString();
                txtHomePage.Text = dr["homepage"].ToString();
                if (dr["display_emailid"].ToString() == "1" )
                {
                    ChkDisplayEmail.Checked = true;
                }
                else
                {
                    ChkDisplayEmail.Checked = false;
                }
        }
        
    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        int Sno;
        Sno = int.Parse( Session["mem_id"].ToString());

        if (this.Page.IsValid == true)
        {

            SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);
            if(Cn.State == ConnectionState.Closed ){Cn.Open ();}
            
            SqlCommand Com ;
            int i ;
            
            Com = new SqlCommand("select count(*) from member_master where displayname='" + TxtName.Text + "'", Cn);
            i = int.Parse( Com.ExecuteScalar().ToString());
            if (i > 1 )
            {
                LblDup.Visible = true;
                LblDup.Text = "Duplicate display name.";
                return ;
            }

            int  intEmailVisible ;
            if (ChkDisplayEmail.Checked == true)
            {
                intEmailVisible = 1;
            }
            else
            {
                intEmailVisible = 0;
            }
            //intEmailVisible = Math.Abs(int.Parse((ChkDisplayEmail.Checked.ToString())));

            DataSet ds ;
            SqlCommandBuilder cb ;
            SqlDataAdapter da ;

            ds = new DataSet();
            da = new SqlDataAdapter("select * from member_master where sno= " + Sno.ToString() + "", Cn);
            cb = new SqlCommandBuilder(da);

            da.Fill(ds, "member_master");

            if (ds.Tables["member_master"].Rows.Count > 0)
            {

                DataRow r1 ;
                r1 = ds.Tables["member_master"].Rows[0];
                r1["displayname"] = TxtName.Text;
                r1["homepage"] = txtHomePage.Text;
                r1["gender"] = DdlGender.Text;
                r1["location"] = Ddllocation.Text;
                r1["occupation"] = DdlOcupation.Text;
                if (ChkDisplayEmail.Checked == true )
                {
                    r1["display_emailid"] = 1;
                }
                else
                {
                    r1["display_emailid"] = 0;
                }

                da.Update(ds, "member_master");
                Cn.Close();
                Response.Redirect("~/default.aspx");
                
            }
        }
    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/default.aspx");
    }
}

