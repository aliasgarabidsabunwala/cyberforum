<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgetpassword.aspx.cs" Inherits="members_forgetpassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<link href="../style/Style1.css" rel="stylesheet" type="text/css" />
    <title>eForum : Sign In Member</title>
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
          <td  bgcolor="#666666" width="5" rowspan="3" class="td3">
			</td>
          <td height="26" bgcolor="#999999" class ="td4" align="left" valign="top">
			<img border="0" src="../forums/images/top1.gif" width="988" height="90"></td>
        </tr>
        
        <tr>
          <td valign="top" align="left">
            <p class="B1">
            
            
            &nbsp;<div align="left">
              <table border="0" width="100%" cellpadding="2" id="table4">
                <tr>
                  <td width="7%">
                    <p align="center">&nbsp;</p>
            
                  </td>
                  <td width="72%" colspan="2">
                    Dear Member Sign In to access all the resource available in 
					this site. If you are not a member of my site click here to 
					become <a href="newmember.aspx">New Member</a> </td>
                  <td width="21%" rowspan="9">&nbsp;</td>
                </tr>
                <tr>
                  <td width="7%" rowspan="10" valign="top" align="left">
            
                  <p >
                  
                  				                  
                  
                  
                  
                  <p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
		
                  
                  
                  
                  
                  </p>
            
                  </td>
                  <td width="66%" rowspan="10" valign="top" align="left">
            
                  
                  	<table border="0" width="88%" cellspacing="1" bgcolor="#000000" id="table5">
						<tr>
							<td>
							<table border="0" width="100%" cellpadding="3" bgcolor="#FFFFFF" id="table6">
								<tr>
									<td width="4">&nbsp;</td>
									<td colspan="3"><b>Please Enter your email 
									id and click Forget Password button to get 
									your old password.</b></td>
								</tr>
								<tr>
									<td width="4">&nbsp;</td>
									<td width="110">Email ID</td>
									<td width="10">:</td>
									<td style="width: 353px">&nbsp;<asp:TextBox ID="TxtEmailID" runat="server" CssClass="TextBoxStyle" Width="176px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtEmailID"
                                            ErrorMessage="Enter Email ID"></asp:RequiredFieldValidator></td>
								</tr>
								<tr>
									<td width="4" style="height: 42px">&nbsp;</td>
									<td width="110" style="height: 42px">&nbsp;</td>
									<td width="10" style="height: 42px">&nbsp;</td>
									<td style="width: 353px; height: 42px">&nbsp;</td>
								</tr>
								<tr>
									<td width="4">&nbsp;</td>
									<td width="110">&nbsp;</td>
									<td width="10">&nbsp;</td>
									<td style="width: 353px">&nbsp;<asp:Button ID="CmdSubmit" runat="server" CssClass="TextBoxStyle" Text="Submit"
                                            Width="72px" />&nbsp;</td>
								</tr>
								<tr>
									<td width="4">&nbsp;</td>
									<td width="110">&nbsp;</td>
									<td width="10">&nbsp;</td>
									<td style="width: 353px">&nbsp;</td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
						<p>&nbsp;</p>
						<p>&nbsp;</p>
						<p>&nbsp;</p>
						<p>&nbsp;</p>
						<p>&nbsp;</p>
						<p>&nbsp;</p>
						<p>&nbsp;</p>
						<p>&nbsp;</p>
						<p>&nbsp;</p>
						<p>&nbsp;</p>
						<p>&nbsp;</p>
						<p>&nbsp;</td>
                  <td width="3%" class="BodyText">
            
                  </td>
                </tr>
                <tr>
                  <td width="3%" class="BodyText">
            
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
                  <td width="100%" colspan="4">&nbsp;<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p><br>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>

      </table>
      C) eForum Version 1.0</div>
    </div>

    </form>
</body>
</html>
