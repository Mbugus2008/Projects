<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Bandari_Sacco._Default" %>
    

<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
     <div class="panel panel-info">
        <div class="panel-heading"><i class="fa fa-user"></i> Profile</div>
        <div class="panel-body">
            <table class="table table-condensed table-responsive table-bordered">
                <tr>
                    <td><asp:Label runat="server" Text="User ID"></asp:Label></td>
                    <td><asp:Label runat="server" ID="lblUserID"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="Staff/Payroll No."></asp:Label></td>
                    <td><asp:Label runat="server" ID="lblStaffNo"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="Name"></asp:Label></td>
                    <td><asp:Label runat="server" ID="lblName"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="Email Address"></asp:Label></td>
                    <td><asp:Label runat="server" ID="lblEmailAddress"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="National ID No."></asp:Label></td>
                    <td><asp:Label runat="server" ID="lblIDNo"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="Gender"></asp:Label></td>
                    <td><asp:Label runat="server" ID="lblGender"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="Date Of Birth"></asp:Label></td>
                    <td><asp:Label runat="server" ID="lblDOB"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="Postal Address"></asp:Label></td>
                    <td><asp:Label runat="server" ID="lblPostalAddress"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="City"></asp:Label></td>
                    <td><asp:Label runat="server" ID="lblCity"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="Phone No."></asp:Label></td>
                    <td><asp:Label runat="server" ID="lblPhoneNo"></asp:Label></td>
                </tr>
               


                </table>
            </div>
        </div>
</asp:Content>

