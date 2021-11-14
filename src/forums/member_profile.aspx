<%@ Page Language="C#" AutoEventWireup="true" CodeFile="member_profile.aspx.cs" Inherits="forums_member_profile" %>
<%@ Import Namespace ="System.Data" %>
<%@ Import Namespace ="System.Data.SqlClient" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<meta name="Description" content="eForum : : Forum for the Programmers, anything related to programming, technologies, security and logics." />
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
    
    <div align="center">
      <table border="0" width="993" cellspacing="0" cellpadding="0" height="684" bgcolor="#FFFFFF" id="table2">
        <tr>
          <td  bgcolor="#666666" width="5" rowspan="3" class="td3">
			</td>
          <td height="26" bgcolor="#999999" class ="td4" align="left" valign="top">
			<img border="0" src="images/top1.gif" width="988" height="90"></td>
        </tr>
        
        <tr>
          <td valign="top" align="left">
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
									if (Session["login_success"] == "" || Session["login_success"] ==null) 
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
									if (Session["login_success"] == "" || Session["login_success"] ==null) 
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
					<a href="../default.aspx">eForum</a><b> &gt;&gt;
					<a href="forum_members.aspx?id=ALL">Members</a> &gt;&gt; <% Response.Write(StrDisplayName); %><br>
					</b> <br>
                  </td>
                </tr>
                <tr>
                  <td width="100%" colspan="2">
					<table border="0" width="100%" cellspacing="0" bgcolor="#000000" id="table7">
						<tr>
							<td>
							<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" id="table8">
								<tr>
									<td>
									<table border="1" width="818" id="table9" bordercolor="#E1E4F0" cellpadding="2">
										<tr>
											<td width="795" class="td1" height="34" colspan="6">&nbsp;<b>Profile 
											: <% Response.Write(StrDisplayName); %></b></td>
										</tr>
										<tr>
											<td width="17">&nbsp;</td>
											<td width="93" align="left">&nbsp;</td>
											<td width="284" align="left">&nbsp;</td>
											<td width="27" align="left">
											&nbsp;</td>
											<td width="93" align="left">
											&nbsp;</td>
											<td width="254" align="left">
											&nbsp;</td>
										</tr>
										<tr>
											<td width="17">&nbsp;</td>
											<td width="385" colspan="2" class="td6">
											<b>About</b></td>
											<td width="27" align="center">
											&nbsp;</td>
											<td width="355" align="center" colspan="2" class="td6">
											<p align="left"><b>Stats</b></td>
										</tr>
										<tr>
											<td width="17" height="19">&nbsp;</td>
											<td width="93" align="left" height="19">
											User Name: </td>
											<td width="284" align="left" height="19">
											
											<% Response.Write(StrDisplayName) ;%>
											
											</td>
											<td width="27" align="left" height="19">
											&nbsp;</td>
											<td width="93" align="left" height="19">
											Joined: </td>
											<td width="254" align="left" height="19">
											<%Response.Write(StrJoinDate); %>
											
											</td>
										</tr>
										<tr>
											<td width="17">&nbsp;</td>
											<td width="93" align="left">Forum 
											Rank</td>
											<td width="284" align="left">
											<% Response.Write(StrRank); %></td>
											<td width="27" align="left">
											&nbsp;</td>
											<td width="93" align="left">
											Last Post Date: </td>
											<td width="254" align="left">
											<%Response.Write(StrLastPostDate); %>
											
											</td>
										</tr>
										<tr>
											<td width="17">&nbsp;</td>
											<td width="93" align="left">&nbsp;</td>
											<td width="284" align="left">&nbsp;</td>
											<td width="27" align="left">
											&nbsp;</td>
											<td width="93" align="left">
											Number of Posts: </td>
											<td width="254" align="left">
											<% Response.Write(StrNoOfPost); %>
											
											</td>
										</tr>
										<tr>
											<td width="17">&nbsp;</td>
											<td width="93" align="left">Location </td>
											<td width="284" align="left">
											<% Response.Write(StrLocation); %></td>
											<td width="27" align="left">
											&nbsp;</td>
											<td width="93" align="left">
											&nbsp;</td>
											<td width="254" align="left">
											&nbsp;</td>
										</tr>
										<tr>
											<td width="17" height="22">&nbsp;</td>
											<td width="93" align="left" height="22">
											Occupation: </td>
											<td width="284" align="left" height="22">
											<% Response.Write(StrOccupation) ;%></td>
											<td width="27" align="left" height="22">
											&nbsp;</td>
											<td width="355" align="left" height="22" colspan="2" class="td6">
											<b>Photo</b></td>
										</tr>

										<tr>
											<td width="17">&nbsp;</td>
											<td width="93" align="left">Gender: </td>
											<td width="284" align="left">
											
											<% Response.Write(StrGender);%>
											</td>
											<td width="27" align="left">
											&nbsp;</td>
											<td width="355" align="left" colspan="2" rowspan="6" valign="top">
											<img border="0" src="images/mem1.gif" width="97" height="89"></td>
										</tr>

										<tr>
											<td width="17">&nbsp;</td>
											<td width="93" align="left">&nbsp;</td>
											<td width="284" align="left">&nbsp;</td>
											<td width="27" align="left">
											&nbsp;</td>
										</tr>

										<tr>
											<td width="17">&nbsp;</td>
											<td width="93" align="left">Home 
											Page</td>
											<td width="284" align="left">
											<% Response.Write(StrHomePage); %>
											</td>
											<td width="27" align="left">
											&nbsp;</td>
										</tr>

										<tr>
											<td width="17">&nbsp;</td>
											<td width="93" align="left">&nbsp;</td>
											<td width="284" align="left">
											<% Response.Write(StrEmailId);%>
											</td>
											<td width="27" align="left">
											&nbsp;</td>
										</tr>

										<tr>
											<td width="17">&nbsp;</td>
											<td width="93" align="left">&nbsp;</td>
											<td width="284" align="left">&nbsp;</td>
											<td width="27" align="left">
											&nbsp;</td>
										</tr>

										<tr>
											<td width="17">&nbsp;</td>
											<td width="93" align="left">&nbsp;</td>
											<td width="284" align="left">
											

											
											<asp:Button Text="Modify Profile" id="CmdModify" Runat ="server" CssClass ="TextBoxStyle" OnClick ="CmdModify_Click"></asp:Button>
											</td>
											<td width="27" align="left">
											&nbsp;</td>
										</tr>

									</table>
									
									</td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
                  </td>
                </tr>
                <tr>
                  <td width="100%" colspan="2">
					<table border="0" width="100%" cellspacing="1" cellpadding="0" bgcolor="#000000" id="table10">
						<tr>
							<td>
							<table border="0" width="100%" bgcolor="#FFFFFF" id="table11" cellpadding="2">
								<tr>
									<td class="td1" height="40"><b>Last 5 Post by <% Response.Write(StrDisplayName) ;%></b></td>
								</tr>
								
								<%
									//check from post master for last 5 post
									SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);					    							    
                                    SqlDataAdapter Da = new SqlDataAdapter(" select * from forum_post where mem_id = " + Request.QueryString["id"].ToString() + " order by post_date desc ", Cn);
								    
								    DataSet Ds = new DataSet();
								    Da.Fill(Ds, "forum_post");
								    if (Ds.Tables["forum_post"].Rows.Count > 0 )
                                    {
								        int LoopCount, i ;
								        
								        if ( Ds.Tables["forum_post"].Rows.Count > 5 )
                                        {
								            LoopCount = 5;
                                        }
								        else
                                        {
								            LoopCount = Ds.Tables["forum_post"].Rows.Count;
								        }
								        for ( i = 1;i<= LoopCount;i++)
                                        {
								            DataRow R ;
								            R = Ds.Tables["forum_post"].Rows[i - 1];
								            String StrTopicId ,StrTopicSub, StrPostDate,StrPostDesc; 
								            
								            SqlDataAdapter Da1 = new SqlDataAdapter("select * from forum_topics where sno =" + R["topic_id"].ToString(), Cn);
								            DataSet Ds1 = new DataSet();
								            Ds1.Clear();
								            Da1.Fill(Ds1, "form_topics");
								            								            
								            StrTopicId = R["topic_id"].ToString();
								            StrTopicSub = Ds1.Tables["form_topics"].Rows[0]["topic_desc"].ToString();
								            StrPostDate = R["post_date"].ToString();
								            StrPostDesc = ClsMain.TextParse(R["post_desc"].ToString());
								            Response.Write("<tr>");
								            Response.Write("<td class ='td6'><b>Topic:</b>");
								            Response.Write("<a href='forum_topics.aspx?topic_id=" + StrTopicId + "'>" + StrTopicSub + "</a> ");
								            Response.Write("<br>");
								            Response.Write(StrPostDate + "</td></tr>");
								            
								            Response.Write("<tr>");
                                            Response.Write("<td>" + StrPostDesc + " <br><br></td></tr>");
								            
								            
								        }
								        
								    }

								
								
								%>
								

								
								
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
					</td>
                </tr>
                <tr>
                  <td width="50%" valign="bottom"></td>
                  <td width="50%" valign="bottom">
                  
                  					<p align="right" class="TextBoxStyle"><br>
</td>
    
                  
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>

      </table>
      (C) eForum Version 1.0</div>
      </form>


</body>
</html>
