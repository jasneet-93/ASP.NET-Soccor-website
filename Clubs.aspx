<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Clubs.aspx.cs" Inherits="Clubs" %>
<%--Jasneet kaur  300961578--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="center">
        <p class="heading"> List of Clubs
            <%--Jasneet kaur  300961578--%>
        </p>
        <asp:GridView ID="clubGrid" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" DataKeyNames="clubId" 
            OnSelectedIndexChanged="clubGrid_SelectedIndexChanged" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" 
            BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Height="160px" Width="308px"   >
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="clubId" HeaderText="club Id" />
                <asp:BoundField DataField="clubName" HeaderText="club Name" />
                <asp:CommandField ShowSelectButton="true" />
               
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>

        </div>
</asp:Content>

<%--Jasneet kaur  300961578--%>