<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search_member.aspx.cs" Inherits="forums_search_member" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
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
    	
    </script>
   
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">

   
    <div align="center">
      <table border="0" width="993" cellspacing="0" cellpadding="0" height="568" bgcolor="#FFFFFF" id="table2">
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

				 &nbsp;</br>
					 </td>
                </tr>
                <tr>
                  <td width="100%" colspan="2" height="84">
					<table border="1" width="100%" cellspacing="0" bgcolor="#000000" id="table7">
						<tr>
							<td>
							<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" id="table8">
								<tr>
									<td>
									<table border="1" width="100%" cellspacing="1" id="table9" bordercolor="#E1E4F0">
										<tr>
											<td width="795" class="td1" height="34">
											&nbsp;<b>Search Member : 
											<asp:TextBox ID="TxtSerach" Runat ="server" Width="350"/> &nbsp;&nbsp;&nbsp;
											<asp:Button ID="BtnSearch" Text="  Search  " Runat ="server" OnClick ="BtnSearch_Click" />
											
											</b></td>
										</tr>
										
																					<td width="795"  height="34">
																					
																					
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Vertical" BorderColor="Silver" BorderStyle="Double" BorderWidth="1px">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
														
        												
			<span id="BlankSpace" runat ="server" >
			
			</span>
																					
											</td>
										<tr>
											<td width="100%">



											<p>



											</td>
										</tr>
										<tr>
											<td width="795" height="31">&nbsp;<br />
											<a href="../default.aspx">eForum</a><b><span style="FONT-WEIGHT: 700">  &gt;&gt; </span> Search Forum
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
	<p align="center">&nbsp;</p>

</body>
</html>
