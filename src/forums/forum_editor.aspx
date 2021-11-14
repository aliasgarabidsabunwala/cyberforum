<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forum_editor.aspx.cs" Inherits="forums_forum_editor" %>

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
		else if (myField.selectionStart || myField.selectionStart == '0') 
		{
			var startPos = myField.selectionStart;
			var endPos = myField.selectionEnd;
			myField.value = myField.value.substring(0, startPos) +STag + myField.value.substring( startPos,endPos ) + ETag + myField.value.substring(endPos, myField.value.length);
			//myField.value = myField.value.substring(0, startPos)
			//+ myValue + '\n\n'
			//+ myField.value.substring(endPos, myField.value.length);
		} else 
		{
			myField.value += myValue;
		}
		
	}

    </script>
   
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">

    
    <div align="center">
      <table border="0" width="993" cellspacing="0" cellpadding="0" height="643" bgcolor="#FFFFFF" id="table2">
        <tr>
          <td  bgcolor="#666666" width="5" rowspan="3" class="td3">
			</td>
          <td height="26" bgcolor="#999999" class ="td4" align="left" valign="top">
			<img border="0" src="images/top1.gif" width="988" height="90"></td>
        </tr>
        
        <tr>
          <td valign="top" align="left" height="553">
            <div align="left">
              <table border="0" width="100%" cellpadding="2" id="table4">
                <tr>
                  <td width="99%" colspan="2">
                    <table border="0" width="100%" cellspacing="0" id="table5" bgcolor="#000000">
						<tr>
							<td>
							<table border="0" width="100%" id="table6" bgcolor="#FFFFFF">
								<tr>
									<td>Welcome <b>Guest </b></td>
									<td align="right" width="420">My Thread | Search | 
									Active Topics | Members | Log In | Register
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
					<b><span style="FONT-WEIGHT: 700"><a href="../forum.aspx">
					Programmer2Programmer.NET Forum</a></span> &gt;&gt; 
					<a href="forum_vb_dot_net.aspx">VB.NET 
					Development</a> &gt;&gt;
					</b>how can i change the 
											date format to ddmmyy in sql server 
											2005<b><br>
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
									<table border="1" width="100%" cellspacing="1" id="table9" bordercolor="#E1E4F0">
										<tr>
											<td width="795" class="td1" height="34">
											&nbsp;</td>
										</tr>
										<tr>
											<td width="100%">
											<table border="0" width="100%" id="table10" cellspacing="1">
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
													<b>Subject </b></td>
													<td width="4" valign="top" class="td6">&nbsp;</td>
													<td valign="top" class="td6">
													<asp:TextBox ID="TxtSubject" runat="server" Width="525px"></asp:TextBox>
													</td>
												</tr>
												<tr>
													<td width="219" valign="top" align="right" height="162" class="td6">
													<table border="0" width="76%" id="table11">
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
													<asp:Button ID="CmdPreview" Text ="Preview" CssClass ="TextBoxStyle" Runat ="server" OnClick="CmdPreview_Click"></asp:Button>
													&nbsp;
													&nbsp;
													<asp:Button ID="CmdSubmit" Text ="Submit" CssClass ="TextBoxStyle" Runat ="server" ></asp:Button>

													
													</td>
												</tr>
											</table>





											</td>
										</tr>
										<tr>
											<td width="795" height="59">&nbsp;
					<b><span style="FONT-WEIGHT: 700"><a href="../forum.aspx">
					Programmer2Programmer.NET Forum</a></span> &gt;&gt; 
					<a href="forum_vb_dot_net.aspx">VB.NET 
					Development</a> &gt;&gt;
					</b>how can i change the 
											date format to ddmmyy in sql server 
											2005</td>
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
                  <td width="100%" colspan="2">&nbsp;<p>&nbsp;</p>
					<p>&nbsp;</td>
                </tr>
                <tr>
                  <td width="50%" valign="bottom"></td>
                  <td width="50%" valign="bottom">
                  
                  					<p align="right" class="TextBoxStyle"><br>
					&nbsp;</td>
    
                  
                  d</td>
                </tr>
              </table>
            </div>
          </td>
        </tr>

      </table>
      </form>
      <p align="center">(C) eForum Version 1.0</p>

	<p align="center">&nbsp;</p>
</body>
</html>
