<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forum_topics.aspx.cs" Inherits="forums_forum_topics" %>
<%@ Import Namespace ="System.Data" %>
<%@ Import Namespace ="System.Data.SqlClient" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<meta name="Description" content="eForum : : Forum for the Programmers, anything related to programming, technologies, security and logics." />
<meta name="Keywords" content="eForum : : Forum for the Programmers, anything related to programming, technologies, security and logics." />

<link href="../style/Style1.css" rel="stylesheet" type="text/css" />
    <title>eForum : : Forum for the Programmers, anything related to programming, technologies, security and logics.</title>
       <script language="javascript" type="text/javascript">
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
<body >
    <form id="form1" runat="server">

   
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
									<td><a name="top1"></a>Welcome <b>
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

					<%
					    //>>> topic description
					    //String StrLink, StrTopicName, StrTopicStarter="";
                        String StrLink="";	    
					    String StrMemName ="";
					    String StrRank="";
					    String StrPostCount="";
					    String StrLocation ;
					    String StrJoinDate ;
					    SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);

					    SqlDataAdapter Da= new SqlDataAdapter(" select * from forum_topics where sno = " + Request.QueryString["topic_id"].ToString() , Cn);
                        DataSet Ds = new DataSet();
                        Da.Fill(Ds, "forum_topics");
                        if (Ds.Tables["forum_topics"].Rows.Count > 0 )
                        {
                        	StrTopicName=Ds.Tables["forum_topics"].Rows[0]["topic_sub"].ToString();
					        StrTopicStarter = Ds.Tables["forum_topics"].Rows[0]["mem_id"].ToString();
					        
					        //>>>
					        SqlDataAdapter Da1= new SqlDataAdapter("select * from member_master where sno =" + Ds.Tables["forum_topics"].Rows[0]["mem_id"].ToString(), Cn);
					        DataSet Ds1 = new DataSet();
					        
					        Da1.Fill(Ds1, "member_master");
					        StrMemName = Ds1.Tables["member_master"].Rows[0]["displayname"].ToString();
					        StrRank = Ds1.Tables["member_master"].Rows[0]["rank"].ToString();
					        StrPostCount = "0" ;
					        StrLocation = Ds1.Tables["member_master"].Rows[0]["location"].ToString();
					        StrJoinDate = Ds1.Tables["member_master"].Rows[0]["createdate"].ToString();
					        
                        	StrTopicDesc=Ds.Tables["forum_topics"].Rows[0]["topic_desc"].ToString();
                        	StrPostDate=Ds.Tables["forum_topics"].Rows[0]["create_date"].ToString();
                        	
                        	Response.Write("<b><span style='FONT-WEIGHT: 700'><a href='../forum.aspx'>");
					        Response.Write("eForum</a></span> &gt;&gt; ");

                            Da1 = new SqlDataAdapter(" select * from forum_master where sno = " + Ds.Tables["forum_topics"].Rows[0]["forum_id"].ToString(), Cn);
                            Da1.Fill(Ds, "forum_master");
                            StrLink = "";
                            if (Ds.Tables["forum_master"].Rows.Count >0 )
                            {
								StrLink= "<a href='" + Ds.Tables["forum_master"].Rows[0]["forum_url"].ToString() + "?forum_id=" + Ds.Tables["forum_topics"].Rows[0]["forum_id"].ToString() + "'>" + Ds.Tables["forum_master"].Rows[0]["forum_name"].ToString() + "</a> &gt;&gt; </b>";
                        	}
                            StrLink = StrLink + StrTopicName;
							Response.Write(StrLink);
					    }
					%>
					
					
					 </br>
					 </br>
					<%
					if (Session["login_success"] == "" || Session["login_success"] ==null)
                    {
					        Response.Write("<font color='red'>NOTE : Log In required to post Replies for this discussion.</font>");
                    }
					else
                    {
                        
					}
					
					%>
                  </td>
                </tr>
                <tr>
                  <td width="100%" colspan="2">
					<table border="1" width="100%" cellspacing="0" bgcolor="#000000" id="table7">
						<tr>
							<td>
							<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" id="table8">
								<tr>
									<td>
									<table border="1" width="100%" cellspacing="1" id="table9" bordercolor="#E1E4F0">
										<tr>
											<td width="795" class="td1" height="34">
											<b><font size="2">
											<% Response.Write(StrTopicName); %>
											
											</font></b></td>
										</tr>
										<tr>
											<td width="100%">
											<table border="0" width="100%" cellspacing="1" id="table10">
												<tr>
													<td class="td6" width="17%" height="34">
													&nbsp;&nbsp;
													<% Response.Write("<a href='member_profile.aspx?id=" + StrTopicStarter + "'>" + StrMemName + "</a>");%>
													</td>
													<td class="td6" height="34" width="82%">
													<b>Posted</b>: <% Response.Write(StrPostDate); %> &nbsp;&nbsp;&nbsp;&nbsp;

												
																	
													<%
													if (Session["login_success"] == "" || Session["login_success"] ==null)
                                                    {
                                                    }
                                                    else
                                                    {								    
													        Response.Write("<a href=forum_new_replies.aspx?topic_id=" + Request.QueryString["topic_id"].ToString() + "&post_id=0><img border='0' src='images/reply.gif' width='72' height='19'></a>");
													}
													%>
													
													</td>
												</tr>
												<tr>
													<td width="17%" height="94" align="left" valign="top">
													<table border="0" width="83%" id="table11">
														<tr>
															<td width="10" height="98">&nbsp;</td>
															<td height="98" align="left" valign="top">
															<img border="0" src="images/mem1.gif"></td>
															<td width="8" height="98">&nbsp;</td>
														</tr>
														</table>
													</td>
													<td height="94" align="left" valign="top" width="82%" >
													<table with="600px">
													<tr>
													<td>
													<% Response.Write(ClsMain.TextParse(StrTopicDesc)); %>
													</td>
													</tr>
													</table>
													</td>
												</tr>
												<tr>
													<td width="17%" height="30" align="left" class="td6">
													Back to Top <a href="#top1">
													^</a></td>
													<td height="30" align="left" class="td6" width="82%">
													&nbsp;</td>
												</tr>
												<tr>
													<td colspan="2" height ="3 px" class="td1"></td>
													
												</tr>
											</table>


<%

    //SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);
    Da = new SqlDataAdapter(" select * from forum_post where topic_id = " +Request.QueryString["topic_id"].ToString() + " order by sno " , Cn);
    Ds = new DataSet();
    Da.Fill(Ds, "forum_post");
    if (Ds.Tables["forum_post"].Rows.Count > 0 )
    {
	    int i ;
	    for (i=0 ;i<= Ds.Tables["forum_post"].Rows.Count -1 ;i++)
        {
		    DataRow R ;
		    R=Ds.Tables["forum_post"].Rows[i];
			    Response.Write("<table border='0' width='100%' cellspacing='1' id='table1_" + i.ToString() + "'>");
			    Response.Write("<tr>");
    			
                Response.Write("<td class='td6' width='212' height='34'>");
                
                SqlDataAdapter Da1 = new SqlDataAdapter("select * from member_master where sno =" + R["mem_id"].ToString(), Cn);
                DataSet Ds1 = new DataSet();
    					        
                Da1.Fill(Ds1, "member_master");
                StrMemName = Ds1.Tables["member_master"].Rows[0]["displayname"].ToString();
                StrRank = Ds1.Tables["member_master"].Rows[0]["rank"].ToString();
                StrPostCount = "0" ;
                StrLocation = Ds1.Tables["member_master"].Rows[0]["location"].ToString();
                StrJoinDate = Ds1.Tables["member_master"].Rows[0]["createdate"].ToString();
                
                
                Response.Write("&nbsp;<a href='member_profile.aspx?id=" + R["mem_id"].ToString() + "'>" + StrMemName + "</a></td>");
                Response.Write("<td class='td6' height='34'> <b>Posted</b>: " + R["post_date"].ToString());
                if (Session["login_success"] == "" || Session["login_success"] ==null) 
                {
                    
                }
                else
                {
                    Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;<a href=forum_new_replies.aspx?topic_id=" + Request.QueryString["topic_id"].ToString() + "&post_id=" + R["sno"].ToString() + "><img border='0' src='images/reply.gif' width='72' height='19'></a>");
                    if (Session["mem_id"].ToString() == Ds1.Tables["member_master"].Rows[0]["sno"].ToString())
                    {
                        Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;<a href=forum_modify_replies.aspx?topic_id=" + Request.QueryString["topic_id"].ToString() + "&post_id=" + R["sno"].ToString() + "><img border='0' src='images/edit.gif' width='72' height='19'></a>");
                    }
                }
    				
                Response.Write("</td>");
                Response.Write("</tr>");
                Response.Write("<tr>");
                Response.Write("<td width='17%' height='94' align='left' valign='top'>");
    				
                Response.Write("<table border='0' width='82%%' id='table1__" + i.ToString() + "'>");
                Response.Write("<tr>");
                Response.Write("<td width='10' height='98'>&nbsp;</td>");
                Response.Write("<td height='98' align='left' valign='top'>");
                Response.Write("<img border='0' src='images/mem1.gif'></td>");
                Response.Write("<td width='8' height='98'>&nbsp;</td>");
                Response.Write("</tr>");
                Response.Write("<tr>");
                Response.Write("<td width='10'>&nbsp;</td>");
                Response.Write("<td>&nbsp;</td>");
                Response.Write("<td width='8'>&nbsp;</td>");
                Response.Write("</tr>");

                Response.Write("</table>");
    			
                Response.Write("</td>");
                Response.Write("<td height='94' align='left' valign='top' width='82%'>");
                Response.Write(ClsMain.TextParse( R["post_desc"].ToString()));
    			
                Response.Write("</td>");
                Response.Write("</tr>");
                Response.Write("<tr>");
                Response.Write("<td width='212' height='30' align='left' class='td6'>");
                Response.Write("Back to Top <a href='#top1'>^</a></td>");
                Response.Write("<td height='30' align='left' class='td6'>");
                Response.Write("&nbsp;</td>");
                Response.Write("</tr>");
                Response.Write("<tr>");
                Response.Write("<td colspan='2' height ='3 px' class='td1'></td>");
                Response.Write("</tr>");
                Response.Write("</table>");





        }
    }
    else
    {
            int j ;
            for (j = 0;j<=20;j++)
            {
                Response.Write("<br>");
            }
    }
%>



<!-- START  ---------- >

											<table border="0" width="100%" cellspacing="1" id="table18">
												<tr>
													<td class="td6" width="212" height="34">
													&nbsp;&nbsp;
													<a href="member_profile.aspx">Atanu</a></td>
													<td class="td6" height="34">
													<b>Posted</b>: Tuesday, 
													March 11, 2008 8:45:11 PM</td>
												</tr>
												<tr>
													<td width="212" height="94" align="left" valign="top">
													<table border="0" width="92%" id="table19">
														<tr>
															<td width="10" height="98">&nbsp;</td>
															<td height="98" align="left" valign="top">
															<img border="0" src="images/mem1.gif"></td>
															<td width="13" height="98">&nbsp;</td>
														</tr>
														<tr>
															<td width="10">&nbsp;</td>
															<td>&nbsp;</td>
															<td width="13">&nbsp;</td>
														</tr>
														<tr>
															<td width="10">&nbsp;</td>
															<td>Rank: Member</td>
															<td width="13">&nbsp;</td>
														</tr>
														<tr>
															<td width="10">&nbsp;</td>
															<td>Joined: 
															12/7/2007</td>
															<td width="13">&nbsp;</td>
														</tr>
														<tr>
															<td width="10">&nbsp;</td>
															<td>Posts: 13</td>
															<td width="13">&nbsp;</td>
														</tr>
														<tr>
															<td width="10">&nbsp;</td>
															<td>Location: 
															Bulgaria</td>
															<td width="13">&nbsp;</td>
														</tr>
													</table>
													</td>
													<td height="94" align="left" valign="top">
													i'm having problems updating 
													records in a table in .net 
													... here is my update SQL 
													command<br>
													<br>
													UPDATE Project<br>
													SET Title = ?, Description = 
													?, Entered_By = ?, 
													Requested_By = ?, 
													Requested_ByDepartment = ?, 
													Assigned_To = ?, 
													Projected_CompletionDate = 
													?, <br>
													Status = ?, Priority = ?, 
													System = ?, Category = ?, 
													Production_Num = ?, 
													Company_Num = ?<br>
													WHERE (Title = ?) AND 
													(Description = ?) AND (Entered_By 
													= ?) AND (Requested_By = ?) 
													AND (Requested_ByDepartment 
													= ?) AND (Assigned_To = ?) 
													AND <br>
													(Projected_CompletionDate = 
													?) AND (Status = ?) AND 
													(Priority = ?) AND (System = 
													?) AND (Category = ?) AND (Production_Num 
													= ?) AND <br>
													(Company_Num = ?)<br>
													<br>
													what am i doing wrong? ... 
													its was woking fine 
													yesterday! </td>
												</tr>
												<tr>
													<td width="212" height="30" align="left" class="td6">
													Back to Top</td>
													<td height="30" align="left" class="td6">
													&nbsp;</td>
												</tr>
												<tr>
													<td colspan="2" height ="3 px" class="td1"></td>
												</tr>
											</table>


<!---- END        -------------->


											</td>
										</tr>
										<tr>
											<td width="795" height="28">&nbsp;<br />
											<a href="../default.aspx">eForum</a><b><span style="FONT-WEIGHT: 700">  &gt;&gt; </span><% Response.Write( StrLink) ;%>
</td>
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
                  <td width="100%" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                  <td width="50%" valign="bottom">
                  <br />
                  </td>
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
       </form>
      <p align="center">(C) eForum Version 1.0</p>

</body>
</html>
