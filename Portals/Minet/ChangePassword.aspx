<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Bandari_Sacco.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="sub">
   </div>

<div class = "contents">  

 

<table>
<tr>
<td rowspan="4">
<img style="padding-right:80px;" src="images/logo.jpeg" width="80%" alt="logo" />
</td>
</tr>
<tr>
<td>	  
    <asp:Label ID="Old_Password" runat="server" AssociatedControlID="txtOldPass"><span style="font-weight:bold;">Current Password</span></asp:Label>
</td>
 <td> <asp:TextBox ID="txtOldPass" runat="server" TextMode="Password"  CssClass="textEntry"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtOldPass" 
      CssClass="failureNotification" ErrorMessage="Please Enter the Current Password." ToolTip="Current Password." 
      ValidationGroup="LoginUserValidationGroup"><span style="color:red;">Required</span></asp:RequiredFieldValidator>
   </td>
</tr>
    
<tr>
<td>
    <asp:Label ID="New_Password" runat="server"  AssociatedControlID="txtNewPass"><span style="font-weight:bold;">New Password:</span></asp:Label>
</td>
<td><asp:TextBox ID="txtNewPass" runat="server" TextMode="Password"  CssClass="textEntry"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPass" 
    CssClass="failureNotification" ErrorMessage="Please Enter the New Password." ToolTip="New Password." 
    ValidationGroup="LoginUserValidationGroup"><span style="color:red;">Required</span></asp:RequiredFieldValidator>
</td>

</tr>

<tr>
<td>
    <asp:Label ID="LabelConfirmNewPass" runat="server" AssociatedControlID="txtConfirmNewPass"><span style="font-weight:bold;">Confirm Password:</span></asp:Label>
</td>
<td>
     <asp:TextBox ID="txtConfirmNewPass" TextMode="Password" runat="server"  CssClass="textEntry"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtConfirmNewPass" 
    CssClass="failureNotification" ErrorMessage="Please Confirm the New Password." ToolTip="Confirm Password." 
    ValidationGroup="LoginUserValidationGroup"><span style="color:red;">Required</span></asp:RequiredFieldValidator>
</td>
</tr>

<tr>
<td></td>
<td>
        <asp:Button ID="ResetButton" runat="server" CssClass="btn btn-primary" 
            CommandName="ResetButton" Text="Submit" ValidationGroup="LoginUserValidationGroup" onclick="ResetButton_Click" >
        </asp:Button>
    </td>
</tr>  

<tr>
<td></td>
<td></td>
 </tr>

 </table>
   <div> <asp:Label ID="lblDisplay" runat="server" Text=""></asp:Label></div>
    <div> <asp:Label ID="lblDisplay2" runat="server" Text="" CssClass ="alert alert-info"></asp:Label></div>
    
</div>
</asp:Content>