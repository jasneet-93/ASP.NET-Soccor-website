<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MatchScheduling.aspx.cs" Inherits="MatchScheduling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <%--Jasneet kaur  300961578--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="center">
     <p class="heading"> <strong>Match Scheduling Page</strong></p>
        <p style="text-align: center">
            <asp:Label ID="error" runat="server" Text=""></asp:Label></p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Select the Host Club"></asp:Label><br /><br />
        <asp:DropDownList ID="hostList" runat="server"></asp:DropDownList><br /><br />
         <asp:Label ID="Label2" runat="server" Text="Select the Guest Club"></asp:Label><br /><br />
        <asp:DropDownList ID="guestList" runat="server"></asp:DropDownList>
        <br />
        <br />
         <asp:Label ID="Label3" runat="server" Text="Select the Date for Match"></asp:Label><br />
    </p>
        <p>
            <asp:Calendar ID="Calendar" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" 
            CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" 
            Height="106px" Width="112px">
            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
            <WeekendDayStyle BackColor="#CCCCFF" />
        </asp:Calendar>
        <br />
        <br />
            <%--Jasneet kaur  300961578--%>
        <asp:Button ID="ScheduleSubmit" runat="server" Text="Schedule Match" OnClick="Schedule_Click" />
    </p>
    </div>
    <div>
        <asp:GridView ID="matchDetails" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="host_clubName" HeaderText="Host Club Name" />
                <asp:BoundField DataField="guest_clubName" HeaderText="Guest Club Name" />
                <asp:BoundField DataField="scheduleDate" HeaderText="Schedule Date" DataFormatString="{0:MM/dd/yyyy}" />
            
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