<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SetupPage.aspx.cs" Inherits="SetupPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <p class="heading">Color Theme for Website</p>
        <asp:RadioButton ID="rdbdark" runat="server" Text="Dark" GroupName="rdb"/> <br />
        <asp:RadioButton ID="rdblight" runat="server" Text="Light" GroupName="rdb"/><br/>

        <asp:Button ID="Button1" runat="server" Text="Change Theme" OnClick="Button1_Click" />
    </div>
</asp:Content>

<%--Jasneet kaur  300961578--%>