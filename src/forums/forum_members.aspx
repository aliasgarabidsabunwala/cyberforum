<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forum_members.aspx.cs" Inherits="forums_forum_members" %>
<%@ Import Namespace ="System.Data" %>
<%@ Import Namespace ="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<meta name="Description" content="eForum : : Forum for the Programmers, anything related to programming, technologies, security and logics. "/>
<meta name="Keywords" content="eForum : : Forum for the Programmers, anything related to programming, technologies, security and logics. "/>

<link href="../style/Style1.css" rel="stylesheet" type="text/css" />
    <title>eForum : : Forum for the Programmers, anything related to programming, technologies, security and logics.</title>
       <script language="javascript">
    	function click_link(url)
    	{
    		self.location=url;
    	}
    	function bgMOver(t)
		{
			t.background='../images/b2.gif';
		}
		function bgMOut(t )
		{
			
				t.background='../images/b1.gif';
			
		}
    	
    </script>
   
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
    <div align="center">
      <table border="0" width="993" cellspacing="0" cellpadding="0" height="327" bgcolor="#FFFFFF" id="table2">
        <tr>
          <td  bgcolor="#666666" width="5" rowspan="3" class="td3">
			</td>
          <td height="26" bgcolor="#999999" class ="td4" align="left" valign="top">
			<img border="0" src="images/top1.gif" width="988" height="90"></td>
        </tr>
        
        <tr>
          <td valign="top" align="left" height="237">
            <div align="left">
              <table border="0" width="100%" cellpadding="2" id="table4">
                <tr>
                  <td width="99%" colspan="2">
                    <table border="0" width="100%" cellspacing="0" id="table5" bgcolor="#000000">
						<tr>
							<td>
							<table border="0" width="100%" id="table6" bgcolor="#FFFFFF">
								<tr>
									<td>Welcome <b>
									<% 
									if( Session["login_success"] == "" || Session["login_success"] == null)
									{ 
										Response.Write("Guest");
									}
                                    else					    
									{
										Response.Write(Session["display_name"].ToString());
									}
									%>
									
									
									</b></td>
									<td align="right" width="420">									
									<a href="forum_mythread.aspx">My Thread</a> | 
									<a href="forum_search.aspx">Search</a> | 
									<a href="forum_active_topics.aspx">Active Topics</a> | 
									<a href="forum_members.aspx">Members</a> |									
									<%
									if( Session["login_success"] == "" || Session["login_success"] == null) 
									{
										Response.Write("<a href='../members/member_signin.aspx'>Log In</a> | <a href='../members/newmember.aspx'>Register</a>");
									}
									else
									{
									    Response.Write("<a href='../members/member_signin.aspx'>Log Out</a>");
									}
									%>
									
									
									
									</td>

								</tr>
							</table>
							</td>
						</tr>
					</table>
                    
                    
                    
                    </td>
                </tr>
                <tr>
                  <td width="100%" colspan="2"><br>
					<a href="../default.aspx">eForum</a><b> &gt;&gt; Members<br>
					</b> <br>
                  </td>
                </tr>
                <tr>
                  <td width="100%" colspan="2">&nbsp;<a href="forum_members.aspx?id=ALL">ALL</a> 
					| <a href="forum_members.aspx?id=A">A</a> | 
					<a href="forum_members.aspx?id=B">B</a> | 
					<a href="forum_members.aspx?id=C">C</a> | 
					<a href="forum_members.aspx?id=D">D</a> | 
					<a href="forum_members.aspx?id=E">E</a> | 
					<a href="forum_members.aspx?id=F">F</a> | 
					<a href="forum_members.aspx?id=G">G</a> 
					| <a href="forum_members.aspx?id=H">H</a> | <a href="I">I</a> | 
					<a href="forum_members.aspx?id=J">J</a> | 
					<a href="forum_members.aspx?id=K">K</a> | 
					<a href="forum_members.aspx?id=L">L</a> | 
					<a href="forum_members.aspx?id=M">M</a> | 
					<a href="forum_members.aspx?id=N">N</a> | 
					<a href="forum_members.aspx?id=O">O</a> | 
					<a href="forum_members.aspx?id=P">P</a> | 
					<a href="forum_members.aspx?id=Q">Q</a> | 
					<a href="forum_members.aspx?id=R">R</a> | 
					<a href="forum_members.aspx?id=S">S</a> | 
					<a href="forum_members.aspx?id=T">T</a> | 
					<a href="forum_members.aspx?id=U">U</a> | 
					<a href="forum_members.aspx?id=V">V</a> 
					| <a href="forum_members.aspx?id=W">W</a> | 
					<a href="forum_members.aspx?id=X">X</a> | 
					<a href="forum_members.aspx?id=Y">Y</a> | 
					<a href="forum_members.aspx?id=Z">Z</a>&nbsp;&nbsp;&nbsp;
					<a href="search_member.aspx">Search Member</a> | <a href="../members/newmember.aspx">New Member</a> </td>
					
                </tr>
                <tr>
                  <td width="100%" colspan="2">
					<table border="0" width="100%" cellspacing="0" bgcolor="#000000" id="table7">
						<tr>
							<td>
							<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" id="table8">
								<tr>
									<td>
									<table border="1" width="818" cellspacing="1" id="table9" bordercolor="#E1E4F0">
										<tr>
											<td width="565" class="td1" height="34" colspan="5">
											<b>&nbsp;Members</b></td>
										</tr>
										<tr>
											<td width="162" class="td6" align="center">
											User Name</td>
											<td width="155" class="td6" align="center">
											Rank</td>
											<td width="171" align="center" class="td6">
											Join Date</td>
											<td width="123" align="center" class="td6">
											Post</td>
											<td width="177" align="center" class="td6">
											Points</td>
										</tr>
										<%
									        //>>> topic description
									    	//Dim DPath As String
			                    			//DPath = Server.MapPath(".")
			                    			int rowCount  =0;
		                        			SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);
		                        			int i ;
                                            if (Request.QueryString.Count <=0)
										    {
										        //For i = 1 To 20
										        //    Response.Write("<br/>")
										        // Next
										    }
										    else
										    {
										        String StrQr ;
										        if (Request.QueryString["id"].ToString() == "ALL" )
											{
										            StrQr = " ";
											}
										        else
											{
										            StrQr = " where displayname like '" + Request.QueryString["id"].ToString() + "%' ";
										        }
										        //Response.Write(StrQr)
										        SqlDataAdapter Da = new SqlDataAdapter(" select * from member_master " + StrQr + "  order by displayname ", Cn);
										        DataSet Ds = new DataSet();
										        Da.Fill(Ds, "member_master");
                                                rowCount = Ds.Tables["member_master"].Rows.Count;
										        if (Ds.Tables["member_master"].Rows.Count > 0 )
											    {
										            for (i = 0; i<= Ds.Tables["member_master"].Rows.Count - 1;i++)
											        {
										                String StrMemSno;
										                String StrDisplayName;
										                String StrRank;
										                String StrJoinDate;
										                String StrPostCount = "0";
										                String StrPoints = "0";
										                StrMemSno = Ds.Tables["member_master"].Rows[i]["sno"].ToString();
										                StrDisplayName = Ds.Tables["member_master"].Rows[i]["displayname"].ToString();
										                StrRank = Ds.Tables["member_master"].Rows[i]["rank"].ToString();
										                StrJoinDate = Ds.Tables["member_master"].Rows[i]["createdate"].ToString();
										                Response.Write("<tr>");
										                Response.Write("<td width='162'><a href=member_profile.aspx?id=" + StrMemSno + ">" + StrDisplayName + "</a></td>");
										                Response.Write("<td width='155'>" + StrRank + "</td>");
										                Response.Write("<td width='171' align='center'>" + StrJoinDate + "</td>");
											
										                Response.Write("<td width='123' align='center'>" + StrPostCount + "</td>");
										                Response.Write("<td width='177' align='center'>" + StrPoints + "</td>");
											
										                Response.Write("</tr>");
										            }
											    }

										        else
											    {
										            //For i = 1 To 30
										            //    Response.Write("<br/>")
										            //Next
										
										        }
										    }
										%>



									</table>
										<%
											    if ( rowCount < 30 )
											    {
										            for (i = 1 ;i< 30 - rowCount;i++)
												    {
										                  Response.Write("<br/>");
										            }
										         }
										%>
									<p class="TextBoxStyle"><br>
									</td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
                  </td>
                </tr>
                <tr>
                  <td width="100%" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                  <td width="50%" valign="bottom"></td>
                  <td width="50%" valign="bottom">
                  
                  					<p align="right" class="TextBoxStyle"><br>
					&nbsp;</td>
    
                  
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>

      </table>
      <p class="TextBoxStyle">(C) eForum Version 1.0</div>


</body>
</html>
