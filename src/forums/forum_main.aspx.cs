using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class forums_forum_main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         
        if (Session["login_success"] == "" || Session["login_success"] ==null)
        {
            CmdNewTopics.Visible = false;
        }
    }
    protected void CmdNewTopics_Click(object sender, EventArgs e)
    {
        
        if (Session["login_success"] == "" || Session["login_success"] ==null) 
        {

            Session["LoginFromPage"] = "";
            Server.Transfer("../members/member_signin.aspx");
            

        }
        else
        {
            Response.Redirect("forum_new_topics.aspx?forum_id=" + Request.QueryString["forum_id"].ToString());


        }
    }
}

