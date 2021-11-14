<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forum_new_replies.aspx.cs" Inherits="forums_forum_new_replies" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<meta name="Description" content="eForum : : Forum for the Programmers, anything related to programming, technologies, security and logics." />
<meta name="Keywords" content="eForum : : Forum for the Programmers, anything related to programming, technologies, security and logics." />

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
    	
    	function FormatText(STag,ETag)
    	{
    	    var t;
    	    var myValue;
    	    myValue='TEST';
    	    t=document.all('TxtMessage');
    	    
    	    insertAtCursor(t,STag,ETag);
    	
    	}
    	function insertAtCursor(myField, STag, ETag) 
    	{
		//IE support
		if (document.selection) {
			myField.focus();
			sel = document.selection.createRange();
			var s;
			s=sel.text;
			sel.text = STag + s + ETag;
		}
		
		//MOZILLA/NETSCAPE support
		else if (myField.selectionStart || myField.selectionStart == '0') {
			var startPos = myField.selectionStart;
			var endPos = myField.selectionEnd;
			myField.value = myField.value.substring(0, startPos) +STag + myField.value.substring( startPos,endPos ) + ETag + myField.value.substring(endPos, myField.value.length);
			//myField.value = myField.value.substring(0, startPos)
			//+ myValue + '\n\n'
			//+ myField.value.substring(endPos, myField.value.length);
		} else {
			myField.value += myValue;
		}
		
	}

    </script>
     
</head>
<body topmargin="0" leftmargin="0">
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
					
					
					<br>
					&nbsp;</td>
                </tr>
                <tr>
                  <td width="100%" colspan="2">
					<table border="0" width="100%" cellspacing="0" bgcolor="#000000" id="table7">
						<tr>
							<td>
							<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" id="table8">
								<tr>
											<td width="795" class="td1" height="34">
											<table border="0" width="99%" cellspacing="1" id="table14" bgcolor="#FFFFFF">
												<tr>
													<td class="td6" width="212" height="34">
													&nbsp;&nbsp;
													<% Response.Write("<a href='member_profile.aspx?id=" + StrTopicStarter + "'>" + StrMemName + "</a>");%>
													</td>
													<td class="td6" height="34">
													<b>Posted</b>: <% Response.Write(StrPostDate); %> &nbsp;&nbsp;
													
													</td>
												</tr>
												<tr>
													<td width="212" height="94" align="left" valign="top">
													<table border="0" width="92%" id="table15">
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
															<td>Rank: <% Response.Write(StrRank);%></td>
															<td width="13">&nbsp;</td>
														</tr>
														<tr>
															<td width="10">&nbsp;</td>
															<td>Joined: <% Response.Write(StrJoinDate);%>
															</td>
															<td width="13">&nbsp;</td>
														</tr>
														<tr>
															<td width="10">&nbsp;</td>
															<td>Posts: <% Response.Write(StrPostCount);%></td>
															<td width="13">&nbsp;</td>
														</tr>
														<tr>
															<td width="10">&nbsp;</td>
															<td>Location: 
															<% Response.Write(StrLocation);%></td>
															<td width="13">&nbsp;</td>
														</tr>
													</table>
													</td>
													<td height="94" align="left" valign="top" >
													<% //Response.Write(ClsMain.TextParse( StrTopicDesc));
                Response.Write(StrTopicDesc);								    %>
													
													</td>
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


											</td>
										</tr>
								<tr>
											<td width="100%" height="255">
											<table border="0" width="100%" id="table12" cellspacing="1" height="267">
												<tr>
													<td width="219" valign="top" align="right" height="32" rowspan="2" class="td6">
													<b>Format</b></td>
													<td width="4" valign="top" height="32" rowspan="2" class="td6">&nbsp;</td>
													<td valign="top" height="12" class="td6">
													<img border="0" src="images/icons/icon_editor_bold.gif" width="23" height="22" onclick="FormatText('[B]','[/B]')"><img border="0" src="images/icons/icon_editor_italicize.gif" width="23" height="22" onclick="FormatText('[I]','[/I]')"><img border="0" src="images/icons/icon_editor_underline.gif" width="23" height="22" onclick="FormatText('[U]','[/U]')">&nbsp;
													<img border="0" src="images/icons/icon_editor_left.gif" width="23" height="22" onclick="FormatText('[L]','[/L]')"><img border="0" src="images/icons/icon_editor_center.gif" width="23" height="22" onclick="FormatText('[C]','[/C]')"><img border="0" src="images/icons/icon_editor_right.gif" width="23" height="22" onclick="FormatText('[R]','[/R]')">&nbsp;
													<img border="0" src="images/icons/icon_editor_hr.gif" width="23" height="22" onclick="FormatText('[HR]','')"><img border="0" src="images/icons/icon_editor_url.gif" width="23" height="22" onclick="FormatText('[UR]','[/UR]')"><img border="0" src="images/icons/icon_editor_email.gif" width="23" height="22" onclick="FormatText('[EM]','[/EM]')"></td>
												</tr>
												<tr>
													<td valign="top" height="15" class="td6">
													Font Name :&nbsp;&nbsp;&nbsp; 
													Font Size :&nbsp;&nbsp; Font 
													Color :
													</td>
												</tr>
												<tr>
													<td width="219" valign="top" align="right" class="td6">
													&nbsp;</td>
													<td width="4" valign="top" class="td6">&nbsp;</td>
													<td valign="top" class="td6">
													&nbsp;</td>
												</tr>
												<tr>
													<td width="219" valign="top" align="right" height="162" class="td6">
													<table border="0" width="76%" id="table13">
														<tr>
															<td colspan="4" align="right" valign="top">
															<b>Message</b></td>
														</tr>
														<tr>
															<td colspan="4" align="right" valign="top">
															<br>
															Smilies<hr>
															</td>
														</tr>
														<tr>
															<td align="center">
															<img border="0" src="images/icons/icon_smile.gif" width="15" height="15" onclick="FormatText('[:)]','')"></td>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_big.gif" width="15" height="15" onclick="FormatText('[:D]','')"></td>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_cool.gif" width="15" height="15" onclick="FormatText('[8D]','')"></td>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_blush.gif" width="15" height="15" onclick="FormatText('[:I]','')"></td>
														</tr>
														<tr>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_tongue.gif" width="15" height="15" onclick="FormatText('[:p]','')"></td>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_evil.gif" width="15" height="15" onclick="FormatText('[}:)]','')"></td>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_wink.gif" width="15" height="15" onclick="FormatText('[;)]','')"></td>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_clown.gif" width="15" height="15" onclick="FormatText('[:o)]','')"></td>
														</tr>
														<tr>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_blackeye.gif" width="15" height="15" onclick="FormatText('[B)]','')"></td>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_8ball.gif" width="15" height="15" onclick="FormatText('[8]','')"></td>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_sad.gif" width="15" height="15" onclick="FormatText('[:(]','')"></td>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_shy.gif" width="15" height="15" onclick="FormatText('[8)]','')"></td>
														</tr>
														<tr>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_shock.gif" width="15" height="15" onclick="FormatText('[:0]','')"></td>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_angry.gif" width="15" height="15" onclick="FormatText('[:(!]','')"></td>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_dead.gif" width="15" height="15" onclick="FormatText('[xx(]','')"></td>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_sleepy.gif" width="15" height="15" onclick="FormatText('[|)]','')"></td>
														</tr>
														<tr>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_kisses.gif" width="15" height="15" onclick="FormatText('[:X]','')"></td>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_approve.gif" width="15" height="15" onclick="FormatText('[^]','')"></td>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_disapprove.gif" width="15" height="15" onclick="FormatText('[V]','')"></td>
															<td align="center">
															<img border="0" src="images/icons/icon_smile_question.gif" width="15" height="15" onclick="FormatText('[?]','')"></td>
														</tr>
													</table>
													</td>
													<td width="4" valign="top" height="162" class="td6">&nbsp;</td>
													<td valign="top" height="162" class="td6">
													<asp:TextBox ID="TxtMessage" runat="server" Height="250px" Width="525px" TextMode="MultiLine"></asp:TextBox>
													</td>
												</tr>
												<tr>
													<td width="219" valign="top" class="td6">&nbsp;</td>
													<td width="4" valign="top" class="td6">&nbsp;</td>
													<td valign="top" class="td6">&nbsp;Include 
													Profile Signature</td>
												</tr>
												<tr>
													<td width="219" valign="top" class="td6">&nbsp;</td>
													<td width="4" valign="top" class="td6">&nbsp;</td>
													<td valign="top" class="td6" align="center">
													<asp:Button ID="CmdPreview" Text ="Preview" CssClass ="TextBoxStyle" Runat ="server" OnClick ="CmdPreview_Click"></asp:Button>
													&nbsp;
													&nbsp;
													<asp:Button ID="CmdSubmit" Text ="Submit" CssClass ="TextBoxStyle" Runat ="server" OnClick ="CmdSubmit_Click"></asp:Button>

													
													</td>
												</tr>
											</table>





											</td>
										</tr>
								<tr>
									<td>
									<p class="TextBoxStyle">&nbsp;</td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
                  </td>
                </tr>
                <tr>
                  <td width="100%" colspan="2">
					<p>&nbsp;</p>
					<p>&nbsp;</td>
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
      (C) eForum Version 1.0</div>
         
    </form>


</body>
</html>

