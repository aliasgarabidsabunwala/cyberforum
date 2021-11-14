<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forum_editor_preview.aspx.cs" Inherits="forums_forum_editor_preview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
<meta http-equiv="Content-Language" content="en-us">
<link href="../style/Style1.css" rel="stylesheet" type="text/css" />
    <title>eForum forum editor preview</title>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
   

    </form>
	<div align="center">
		<table border="0" width="95%"  height="100%" id="table1" bgcolor="#FFFFFF">
			<tr>
				<td colspan="2" align="center" class="td1"><b><font size="3">
				Preview</font></b></td>
			</tr>
			<tr>
				<td width="8%" align="right" valign="top" class="td6" height="21">
				<b>Subject : </b> </td>
				<td width="89%" align="left" valign="top" class="td6" height="21"><b><% Response.Write(Session["preview_subject"].ToString());%></b></td>
			</tr>
			<tr>
				<td width="8%" align="right" valign="top" class="td6" height="212">
				Message :</td>
				<td width="89%" align="left" valign="top" class="td6" height="212"> <% Response.Write(Session["preview_message"].ToString());%></td>
			</tr>
			<tr>
				<td width="8%" align="left" valign="top" class="td6">&nbsp;</td>
				<td width="89%" align="left" valign="top" class="td6">
				<p align="center"><a href="Close">Close preview</a></td>
			</tr>
			</table>

	</div>
</body>
</html>
