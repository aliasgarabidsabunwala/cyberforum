<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forum_admin.aspx.cs" Inherits="forums_forum_admin" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<link href="../style/Style1.css" rel="stylesheet" type="text/css" />
    <title>eForum : New Member Sigin Up</title>
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
    

    <div align="center">
      <table border="0" width="993" cellspacing="0" cellpadding="0" height="684" bgcolor="#FFFFFF" id="table2">
        <tr>
          <td  bgcolor="#666666" rowspan="3" class="td3" style="width: 5px">
			</td>
          <td bgcolor="#999999" class ="td4" align="left" valign="top" style="height: 90px">
			<img border="0" src="../forums/images/top1.gif" width="988" height="90"></td>
        </tr>
        
        <tr>
          <td valign="top" align="left" style="height: 594px">
            <div align="left">
              <table border="0" width="100%" cellpadding="2" id="table4">
                <tr>
                  <td style="width: 1%" rowspan="8">
            
                  </td>
                  <td width="3%">
                      <strong>Admin Options</strong></td>
                  <td width="21%" rowspan="8" valign ="top">
                      <table border="0" cellpadding="0" cellspacing="0" width="100%" id="table5">
						<tr>
							<td width="26">&nbsp;</td>
							<td>&nbsp;</td>
							<td width="18">&nbsp;</td>
						</tr>
						<tr>
							<td width="26" style="height: 25px">&nbsp;</td>
							<td style="height: 25px">&nbsp;<asp:Label ID="LblCap" runat="server" Text="Search Member :"></asp:Label>
                                <asp:TextBox ID="TxtSearch" runat="server" Width="280px" CssClass="TextBoxStyle"></asp:TextBox>&nbsp;<asp:Button
                                    ID="BtnSearch" runat="server" CssClass="TextBoxStyle" Text="Search" Width="72px" OnClick="BtnSearch_Click" /></td>
							<td width="18" style="height: 25px">&nbsp;</td>
						</tr>
						<tr>
							<td width="26" height="12"></td>
							<td height="12"></td>
							<td width="18" height="12"></td>
						</tr>
						<tr>
							<td width="26">&nbsp;</td>
							<td>&nbsp;<asp:GridView ID="Dg1" runat="server" AllowPaging="True" Width="536px">
                                </asp:GridView>
                            </td>
							<td width="18">&nbsp;</td>
						</tr>
						</table>
                      </td>
                </tr>
                <tr>
                  <td width="3%" class="BodyText">
                      <asp:LinkButton ID="LkHome" runat="server" OnClick="LkHome_Click">Home</asp:LinkButton></td>
                </tr>
                <tr>
                  <td width="3%" class="BodyText">
                      <asp:LinkButton ID="LkMember" runat="server" OnClick="LkMember_Click">Manage Member</asp:LinkButton></td>
                </tr>
                <tr>
                  <td width="3%">
                      <asp:LinkButton ID="LkTopic" runat="server" OnClick="LkTopic_Click">Manage Topic</asp:LinkButton></td>
                </tr>
                <tr>
                  <td width="3%">
                      </td>
                </tr>
                <tr>
                  <td width="3%">
            
                  </td>
                </tr>
                <tr>
                  <td width="3%">
            
                  </td>
                </tr>
                <tr>
                  <td width="3%" height="82">
            
                  </td>
                </tr>
                <tr>
                  <td width="100%" colspan="3">
					<p>&nbsp;</td>
                </tr>
              </table>
            </div>
          </td>
        </tr>

      </table>
      (C) eForum Version 1.0</div>
    </div>
    </form>
</body>
</html>