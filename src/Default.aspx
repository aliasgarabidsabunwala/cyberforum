<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default"  %>
<%@ Import Namespace ="System.Data" %>
<%@ Import Namespace ="System.Data.SqlClient" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<meta name="Description" content="Cyber Forums :: Madhya Pradesh Police" />
<meta name="Keywords" content="Cyber Forums :: Madhya Pradesh Police" />


<link href="style/Style1.css" rel="stylesheet" type="text/css" />
    <title>Cyber Forums :: Madhya Pradesh Police</title>
       <script language="javascript">
    	function click_link(url)
    	{
    		self.location=url;
    	}
    	function bgMOver(t)
		{
			t.background='images/b2.gif';
		}
		function bgMOut(t )
		{
			
				t.background='images/b1.gif';
			
		}

    	
    </script>
   
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
    <div align="center">
      <table border="0" width="993" cellspacing="0" cellpadding="0" height="684" bgcolor="#FFFFFF" id="table2">
        <tr>
          <td  bgcolor="#666666" width="5" rowspan="3" class="td3">
			</td>
          <td height="59" bgcolor="#999999" class ="td4" align="left" valign="top">
			<p align="left">
			<img border="0" src="forums/images/top1.gif" width="988" height="90"></td>
        </tr>
        
        <tr>
          <td valign="top" align="left">
            <div align="left">
              <table border="0" width="100%" cellpadding="2" id="table4">
                <tr>
                  <td width="99%">
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
									
									%> </b></td>
									<td align="right" width="600">
									<% 
									    if( Session["mem_type"] == ""||Session["mem_type"] ==null)
                                        {
                                        }
									
									    else
                                        {
                                            
									        if (Session["mem_type"].ToString() == "Admin")
                                            {
									            Response.Write("<a href='forums/forum_admin.aspx'>Admin</a> | ");
                                            }
									        
									    }
									%>
									<a href="forums/forum_mythread.aspx">My Thread</a> | 
									<a href="forums/forum_search.aspx">Search</a> | 
									<a href="forums/forum_active_topics.aspx">Active Topics</a> | 
									<a href="forums/forum_members.aspx">Members</a> | 
									<%
                                        if (Session["login_success"] == "" || Session["login_success"]==null)
                                    {
										Response.Write("<a href='members/member_signin.aspx'>Log In</a> | <a href='members/newmember.aspx'>Register</a>");
                                    }
									else
                                    {
									    Response.Write("<a href='members/modifymember.aspx'>Modify Details</a> | <a href='members/changepassword.aspx'>Change Password</a> | <a href='members/member_signin.aspx'>Log Out</a>");
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
                  <td width="100%">eForum <br>
					<br>
					Current time: <% Response.Write(System.DateTime.Now.ToString());  %> <br>
					<%
                        if (Session["login_success"] == "" || Session["login_success"]==null)
                    {
						Response.Write("<br>");
                    }
					else
                    {
					    Response.Write("Your last visit: " + Session["last_login"].ToString() + "<br>" );
					}
					%>
					
                  </td>
                </tr>
                <tr>
                  <td width="100%">
					<table border="0" width="100%" cellspacing="0" bgcolor="#000000" id="table7">
						<tr>
							<td>
							<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" id="table8">
								<tr>
									<td>
									<table border="1" width="100%" cellspacing="1" id="table9" bordercolor="#E1E4F0">
										<tr>
											<td width="44" class="td6" height="34">
											<b>&nbsp;</b></td>
											<td width="316" class="td6" height="34">
											<b>Forum</b></td>
											<td class="td6" height="34"><b>
											Topics</b></td>
											<td width="118" class="td6" height="34">
											<b>Posts</b></td>
											<td width="289" class="td6" height="34">
											<b>Last Post</b></td>
										</tr>
										<%
				                            						    
                                            SqlConnection Cn=new SqlConnection( ClsMain.ConnStr);
										    SqlDataAdapter Da=new SqlDataAdapter(" select * from forum_master where is_visible = 1 order by forum_position ", Cn);
										    DataSet Ds=new DataSet();
										    SqlCommand Com=new SqlCommand();
										   
                                            Da.Fill(Ds, "forum_master");
									        if(Cn.State == ConnectionState.Closed )
                                            {
                                                Cn.Open ();
                                            }
										    
										    if (Ds.Tables["forum_master"].Rows.Count > 0 )
                                            {
										        int i;
										        for (i = 0 ;i<= Ds.Tables["forum_master"].Rows.Count - 1;i++)
                                                {
										            DataRow R;
										            R = Ds.Tables["forum_master"].Rows[i];
										            Response.Write("<tr>");
					                          	  	
										            String StrForumIcon ;
										            StrForumIcon = "<img src=forums/images/p2p_forum_old.gif alt='eForum Forum - Old and Active'>";
										            if (R["is_locked"].ToString () == "1" )
                                                    {
										                StrForumIcon = "<img src=forums/images/p2p_forum_old_lock.gif alt='eForum Forum - Currently this is locked'>";
										            }
										            Com = new SqlCommand ("select count(*)  from forum_topics where forum_id =" + R["sno"].ToString() + " and last_post_id =0 ", Cn);
										            if (int.Parse (Com.ExecuteScalar().ToString()) == 0 )
                                                    {
										                StrForumIcon = "<img src=forums/images/p2p_forum_new.gif alt='eForum Forum - New Post'>";
										            }
										            
										            
										            Response.Write("<td width='50' align='center'>" + StrForumIcon + "</td>");
					                          	  	
										            Response.Write("<td width='329'><b>");
										            Response.Write("<span style='font-weight: 700'>");
										            Response.Write("<a href='forums/" + R["forum_url"].ToString() + "?forum_id=" + R["sno"].ToString()  + "'>" + R["forum_name"].ToString() + "</a></span></b><br><font size='1'>" + R["forum_description"].ToString() + "</font></td>");

										            // find count from forum_post
										            String StrTopicCount,StrPostCount ;
										            									            
										            Com = new SqlCommand("select count(*) from forum_topics where forum_id =" + R["sno"].ToString(), Cn);
										            StrTopicCount = Com.ExecuteScalar().ToString();
										            
										            Com = new SqlCommand("select count(*) from forum_post where forum_id =" + R["sno"].ToString(), Cn);
										            StrPostCount = Com.ExecuteScalar().ToString();
										            
										            Response.Write("<td>");
										            Response.Write("<p align='center'>" + StrTopicCount + "</td>");
																									
										            Response.Write("<td width='75'>");
										            Response.Write("<p align='center'>" + StrPostCount + "</td>");
													
										            // get the last post deatils from 
										            SqlDataAdapter  Da1 =new SqlDataAdapter(" select * from forum_post where forum_id= " + R["sno"].ToString() + " order by sno desc ", Cn);
										            DataSet Ds1 = new DataSet();
										            Da1.Fill(Ds1, "post_master");
													
										            Response.Write("<td width='246'>");
										            if (Ds1.Tables["post_master"].Rows.Count > 0 )
                                                    {
										                DataRow r1 ;
										                r1 = Ds1.Tables["post_master"].Rows[0];
										                
										                // get the last post
										                SqlDataAdapter da2 = new SqlDataAdapter("select * from member_master where sno =" + r1["mem_id"].ToString(), Cn);
										                DataSet Ds2 = new DataSet();
										                da2.Fill(Ds2, "member_master");
										                
										                Response.Write("<p align='center'><font size='1'>" + r1["post_date"].ToString() + "<br>");
										                Response.Write(" by <b><a href=forums/member_profile.aspx?id=" + r1["mem_id"].ToString() + ">" + Ds2.Tables["member_master"].Rows[0]["displayname"].ToString() + "</a></b> </font> ");
                                                    }
										            else
                                                    {
										                Response.Write("&nbsp;");
										            }
										            Response.Write("</td>");
					                          	  
										            Response.Write("</tr>");

										        }
										        
										    }
										    if (Cn.State ==ConnectionState.Open )
                                            {
                                                Cn.Close ();
                                            }
										%>
										
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
                  <td width="100%">
					<table border="0" width="100%" cellspacing="0" bgcolor="#000000" id="table13">
						<tr>
							<td>
							<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" id="table14">
								<tr>
									<td>
									<table border="1" width="100%" cellspacing="1" id="table15" bordercolor="#E1E4F0">
										<tr>
											<td class="td6" height="34" colspan="3">
											<b>Active and Latest Discussion</b></td>
										</tr>
										<%
										    Da = new SqlDataAdapter("select * from forum_topics where last_post_id <> 0 order by last_post_id desc ", Cn);
										    Ds = new DataSet();
										    Da.Fill(Ds, "forum_topic_latest");
										    int RowCount ;
										    
										    String LastPaostDate ;
										    
										    if (Ds.Tables["forum_topic_latest"].Rows.Count > 0 )
                                            {
										        if (Ds.Tables["forum_topic_latest"].Rows.Count > 5 )
                                                {
										            RowCount = 5;
                                                }
										        else
                                                {
										            RowCount = Ds.Tables["forum_topic_latest"].Rows.Count;
										        }
										        int i ;
										        for (i = 0; i<= RowCount - 1 ;i++)
                                                {
										            Response.Write("<tr>");
										            Response.Write("<td width='2%'>&nbsp;</td>");
										            Response.Write("<td width='70%'><a href=forums/forum_topics.aspx?topic_id=" + Ds.Tables["forum_topic_latest"].Rows[i]["sno"].ToString() + ">" + Ds.Tables["forum_topic_latest"].Rows[i]["topic_sub"].ToString() + "</a></td>");
										            SqlDataAdapter Da2 = new SqlDataAdapter("select * from forum_post where sno =" + Ds.Tables["forum_topic_latest"].Rows[i]["last_post_id"].ToString (), Cn);
										            DataSet Ds2 =new DataSet();
										            Da2.Fill(Ds2, "last_post");
										            if (Ds2.Tables["last_post"].Rows.Count > 0 )
                                                    {
										                LastPaostDate = Ds2.Tables["last_post"].Rows[0]["post_date"].ToString();
                                                    }
                                                    else
                                                    {
                                                        LastPaostDate = "&nbsp;";
                                                    }

										            Response.Write("<td width='26%' align='right'>" + LastPaostDate + "</td>");
										            Response.Write("</tr>");
										        }
										    }
										    if (Cn.State == ConnectionState.Open )
                                            {
                                                Cn.Close ();
                                            }

										
										%>

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
                  <td width="100%">
					<table border="0" width="100%" cellspacing="0" bgcolor="#000000" id="table19">
						<tr>
							<td>
							<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" id="table20">
								<tr>
									<td>
									<table border="1" width="100%" cellspacing="1" id="table21" bordercolor="#E1E4F0">
										<tr>
											<td class="td6" height="34" colspan="3">
											<b>Unanswered</b></td>
										</tr>
										<%
										
										
										    Da = new SqlDataAdapter("select * from forum_topics where last_post_id =0 order by last_post_id desc ", Cn);
	                                        Ds = new DataSet();									    
										    Ds.Clear();
										    
										    Da.Fill(Ds, "forum_topic_unanswred");
										    
										    if (Ds.Tables["forum_topic_unanswred"].Rows.Count > 0)
                                            {
										        if (Ds.Tables["forum_topic_unanswred"].Rows.Count > 10)
                                                {
										            RowCount = 10;
                                                }
										        else
                                                {
										            RowCount = Ds.Tables["forum_topic_unanswred"].Rows.Count;
										        }
										        int i ;
                                                for (i = 0; i <= RowCount - 1; i++)
                                                {
                                                    Response.Write("<tr>");
                                                    Response.Write("<td width='2%'>&nbsp;</td>");
                                                    Response.Write("<td width='70%'><a href=forums/forum_topics.aspx?topic_id=" + Ds.Tables["forum_topic_unanswred"].Rows[i]["sno"].ToString() + ">" + Ds.Tables["forum_topic_unanswred"].Rows[i]["topic_sub"].ToString() + "</a></td>");

                                                    LastPaostDate = Ds.Tables["forum_topic_unanswred"].Rows[i]["create_date"].ToString();

                                                    Response.Write("<td width='26%' align='right'>" + LastPaostDate + "</td>");
                                                    Response.Write("</tr>");
                                                }
                                            }
										    else
                                            {
										        Response.Write("<td width='1%'>&nbsp;</td>");
										        Response.Write("<td width='70%'>NO TOPICS</td>");
										        Response.Write("<td width='26%'>&nbsp;</td>");
										    }
										    
											if (Cn.State== ConnectionState.Open )
                                            {
                                                Cn.Close ();
                                            }

										%>									
										

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
                  <td width="100%">&nbsp;</td>
                </tr>
                <tr>
                  <td width="100%">&nbsp;</td>
                </tr>
                <tr>
                  <td width="100%">&nbsp;</td>
                </tr>
              </table>
            </div>
          </td>
        </tr>

      </table>
      (C) eForum Version 1.0</div>

</body>
</html>
