<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="members_changepassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<link href="../style/Style1.css" rel="stylesheet" type="text/css" />
    <title>Untitled Page</title>
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
                  <td width="79%" colspan="3">
                    <p align="center">&nbsp;</p>
            
                  </td>
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
            
                  
                  	<table border="0" width="91%" cellspacing="1" bgcolor="#000000" id="table5">
						<tr>
							<td>
							<table border="0" width="100%" cellpadding="3" bgcolor="#FFFFFF" id="table6">
								<tr>
									<td width="7">&nbsp;</td>
									<td width="118"><b>Change Password</b></td>
									<td width="5">&nbsp;</td>
									<td style="width: 328px">
									<% Response.Write(DisplayName);%>
									
									</td>
								</tr>
								<tr>
									<td width="7">&nbsp;</td>
									<td width="118">Old Password</td>
									<td width="5">:</td>
									<td style="width: 328px"><asp:TextBox ID="TxtOldPassword" runat="server" CssClass="TextBoxStyle" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtOldPassword"
                                            ErrorMessage="Enter old password"></asp:RequiredFieldValidator></td>
								</tr>
								<tr>
									<td width="7" style="height: 42px">&nbsp;</td>
									<td width="118" style="height: 42px">New 
									Password</td>
									<td width="5" style="height: 42px">:</td>
									<td style="width: 328px; height: 42px">
                                        <asp:TextBox ID="TxtNewPassword" runat="server" CssClass="TextBoxStyle" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtNewPassword"
                                            ErrorMessage="Enter New password"></asp:RequiredFieldValidator></td>
								</tr>
								<tr>
									<td width="7" style="height: 42px">&nbsp;</td>
									<td width="118" style="height: 42px">Confirm 
									Password</td>
									<td width="5" style="height: 42px">&nbsp;</td>
									<td style="width: 328px; height: 42px">
                                        <asp:TextBox ID="TxtConformPassword" runat="server" CssClass="TextBoxStyle" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtConformPassword"
                                            ErrorMessage="Enter confirm password"></asp:RequiredFieldValidator></td>
								</tr>
								<tr>
									<td width="7">&nbsp;</td>
									<td width="118">&nbsp;</td>
									<td width="5">&nbsp;</td>
									<td style="width: 328px">&nbsp;<asp:Button ID="CmdSubmit" runat="server" CssClass="TextBoxStyle" Text="Submit"
                                            Width="72px" OnClick="CmdSubmit_Click" />&nbsp;</td>
								</tr>
								<tr>
									<td width="7">&nbsp;</td>
									<td width="118">&nbsp;</td>
									<td width="5">&nbsp;</td>
									<td style="width: 328px">&nbsp;</td>
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
					<p><br>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>


      </table>

      </form>
