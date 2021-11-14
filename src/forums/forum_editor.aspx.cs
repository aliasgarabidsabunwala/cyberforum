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

public partial class forums_forum_editor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CmdPreview_Click(object sender, EventArgs e)
    {
        String S1;
        S1 = TxtMessage.Text;

        S1 = S1.Replace( "<", "&lt");
        S1 = S1.Replace ( ">", "&gt");

        Session["preview_subject"] = TxtSubject.Text;
        Session["preview_message"] = ClsMain.TextParse(S1);

        Response.Write("<script>window.open('forum_editor_preview.aspx', 'my_new_window', 'width=800,height=400,top=150,left=50,scrollbars=yes')</script>");
        

    }
}


