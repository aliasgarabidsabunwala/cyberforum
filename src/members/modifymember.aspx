<%@ Page Language="C#" AutoEventWireup="true" CodeFile="modifymember.aspx.cs" Inherits="members_modifymember" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
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
          <td height="26" bgcolor="#999999" class ="td4" align="left" valign="top">
			<img border="0" src="../forums/images/top1.gif" width="988" height="90"></td>
        </tr>
        
        <tr>
          <td valign="top" align="left">
            <p class="B1">
            
            
            &nbsp;<div align="left">
              <table border="0" width="100%" cellpadding="2" id="table4">
                <tr>
                  <td width="76%">
                    <p align="left" style="line-height: 150%">Welcome my friend here you can become member 
					of my site. I did not claim any copyright of content and 
					project source file, however for downloading any source code 
					and project file need authentication.<b><br>
                    &nbsp;</b></p>
            
                  </td>
                  <td width="3%">
                    &nbsp;</td>
                  <td width="21%" rowspan="9">&nbsp;</td>
                </tr>
                <tr>
                  <td width="76%" rowspan="10" valign="top" align="left">
            
                  <p >
                  
                  				<table border="0" width="582" cellspacing="0" bgcolor="#000000" id="table1">
	<tr>
		<td style="width: 580px">
		<table border="0" width="100%" bgcolor="#FFFFFF" id="table2">
			<tr>
				<td style="height: 21px; width: 14px;">&nbsp;</td>
				<td style="height: 21px; width: 124px;">
                    <p align="left"><b>Modify Details&nbsp;</b></p></td>
				<td style="height: 21px; width: 14px;">&nbsp;</td>
				<td style="height: 21px; width: 410px;">&nbsp;</td>
			</tr>
			<tr>
				<td style="height: 21px; width: 14px;">&nbsp;</td>
				<td style="height: 21px; width: 124px;">&nbsp;</td>
				<td style="height: 21px; width: 14px;">&nbsp;</td>
				<td style="height: 21px; width: 410px;">&nbsp;<asp:Label ID="LblDup" runat="server" 

ForeColor="Red" Text="Label" Width="192px"></asp:Label></td>
			</tr>
			<tr>
				<td style="height: 26px; width: 14px;">&nbsp;</td>
				<td style="height: 26px; width: 124px;">
                    Display Name</td>
				<td style="height: 26px; width: 14px;">:</td>
				<td style="height: 26px; width: 410px;">&nbsp;<asp:TextBox ID="TxtName" runat="server" 

MaxLength="50" CssClass="TextBoxStyle" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 

ControlToValidate="TxtName"
                        ErrorMessage="Name cannot blank" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
			</tr>
			<tr>
				<td style="height: 21px; width: 14px;">&nbsp;</td>
				<td style="height: 21px; width: 124px;">
                    Email ID</td>
				<td style="height: 21px; width: 14px;">:</td>
				<td style="height: 21px; width: 410px;">&nbsp;<asp:TextBox ID="TxtEmailID" 

runat="server" MaxLength="100" CssClass="TextBoxStyle" Width="184px" Enabled="False"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 

ControlToValidate="TxtEmailID"
                        ErrorMessage="Enter email ID" 

ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 

SetFocusOnError="True"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 

ControlToValidate="TxtEmailID"
                        ErrorMessage="Email ID required" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
			</tr>
            <tr>
                <td style="width: 14px">
                </td>
                <td style="width: 124px">
                    Location</td>
                <td style="width: 14px">
                    :</td>
                <td style="width: 410px">
                    <asp:DropDownList ID="Ddllocation" runat="server" CssClass="TextBoxStyle">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 14px">
                </td>
                <td style="width: 124px">
                    Occupation</td>
                <td style="width: 14px">
                    :</td>
                <td style="width: 410px">
                    <asp:DropDownList ID="DdlOcupation" runat="server" CssClass="TextBoxStyle">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 14px">
                </td>
                <td style="width: 124px">
                    Gender</td>
                <td style="width: 14px">
                    :</td>
                <td style="width: 410px">
                    <asp:DropDownList ID="DdlGender" runat="server" CssClass="TextBoxStyle">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 14px">
                </td>
                <td style="width: 124px">
                    Display Email</td>
                <td style="width: 14px">
                    :</td>
                <td style="width: 410px">
                    <asp:CheckBox ID="ChkDisplayEmail" runat="server" CssClass="TextBoxStyle" />
                    Note : Email ID will be visible to other members</td>
            </tr>
            <tr>
                <td style="width: 14px">
                </td>
                <td style="width: 124px">
                    Home Page</td>
                <td style="width: 14px">
                    :</td>
                <td style="width: 410px">
                    <asp:TextBox ID="txtHomePage" runat="server" CssClass="TextBoxStyle" MaxLength="100"
                        Width="184px"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 14px">
                </td>
                <td style="width: 124px">
                </td>
                <td style="width: 14px">
                </td>
                <td style="width: 410px">
                </td>
            </tr>
            <tr>
                <td style="width: 14px">
                </td>
                <td style="width: 124px">
                </td>
                <td style="width: 14px">
                </td>
                <td style="width: 410px">
                </td>
            </tr>
            <tr>
                <td style="width: 14px">
                </td>
                <td style="width: 124px">
                </td>
                <td style="width: 14px">
                </td>
                <td style="width: 410px">
                    <asp:Button ID="BtnSubmit" runat="server" Text="Update" Width="80px" CssClass="TextBoxStyle" OnClick="BtnSubmit_Click" 

/>
                    <asp:Button ID="BtnCancel" runat="server" Text="Cancel" Width="80px" CssClass="TextBoxStyle" OnClick="BtnCancel_Click" 

/></td>
            </tr>
            <tr>
                <td style="width: 14px">
                </td>
                <td style="width: 124px">
                </td>
                <td style="width: 14px">
                </td>
                <td style="width: 410px">
                </td>
            </tr>
		</table>
		</td>
	</tr>
</table>
		
                  
                  
                  
                  
                  </p>
		
                  
                  
                  
                  
                  <p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
            
                  </td>
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
                  <td width="100%" colspan="3">&nbsp;<p>&nbsp;</p>
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
      (C) eForum Version 1.0</div>
    </div>
    </form>
</body>
</html>