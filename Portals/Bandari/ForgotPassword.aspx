<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Bandari_Sacco.ForgotPassword" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
    <div class="col-lg-3 col-sm-2 col-md-3 hidden-xs ">&nbsp;</div>
    <div class="col-sm-8 col-xs-12 col-md-6 col-lg-6">
            <div class = "panel panel-primary">
                <div class="panel-heading"><i class="fa fa-lock fa-2x"></i>  Bandari Sacco Members Portal</div>
                <div class="panel-body">
               <asp:Label ID="lblError" runat="server" Text="" CssClass="text-warning label label-danger"></asp:Label>
                    <div class="row">
                        <div class="col-sm-4 hidden-xs">
                        <img src="images/logo_small.png" alt="" />
                            </div>
                         <div class="col-sm-8 col-xs-12">
                            <asp:Label ID="User_NoLabel" runat="server" AssociatedControlID="User_No"><span class="text-danger">Member No:</span></asp:Label>
                             <asp:TextBox ID="User_No" runat="server"  CssClass="form-control"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="User_NoRequired" runat="server" ControlToValidate="User_No" 
                            CssClass="failureNotification" ErrorMessage="User No is required." ToolTip="User No is required." 
                            ValidationGroup="LoginUserValidationGroup"><span class="ui-state-error"><i class="fa fa-exclamation-circle"></i> Please enter your membership number.</span></asp:RequiredFieldValidator>
                             <asp:Label Visible=false ID="lblResult" runat="server" />
                             <div class="form-group bg-info" style="padding: 4px;border: 1px #008b8b dotted;border-radius: 4px;">
                              <asp:Label  ID="Label2" runat="server" AssociatedControlID="User_No"><span class="text-danger">Security Code:</span></asp:Label>
                              <BotDetect:Captcha ID="SampleCaptcha" runat="server" />
                              <asp:TextBox ID="txtsecurity_code" runat="server"  CssClass="form-control"/>
                                  <asp:RequiredFieldValidator ID="Security_CodeRequired" runat="server" ControlToValidate="txtsecurity_code" 
                                    CssClass="failureNotification" ErrorMessage="Security Code is required." ToolTip="Security Code is required." 
                                    ValidationGroup="LoginUserValidationGroup"><span class="ui-state-error"><i class="fa fa-exclamation-circle"></i>Please enter the security code</span></asp:RequiredFieldValidator>
                                </div>
                             <asp:Button ID="ResetButton" runat="server" CssClass="btn btn-warning" 
            CommandName="ResetButton" Text="Submit" 
            ValidationGroup="LoginUserValidationGroup" onclick="ResetButton_Click" >
                        </asp:Button>
     
  <a href="Login.aspx">Back to Login</a> 
                             </div>
                   </div>
                    </div>
            </div>
    </div>
    <div class="col-lg-3 col-sm-2 col-md-3 hidden-xs hidden-sm">&nbsp;</div>
</div>

</asp:Content>
