<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddClub.aspx.cs" Inherits="AddClub" %>
<%@ Register TagPrefix="sp" TagName="SmartBox" Src="~/SmartBox.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">   
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="center">
       <p class="heading">Add Club</p>
        <p>
            <asp:Label  ID="error" runat="server" Text="" style="color: #FF0000"></asp:Label></p>
       <sp:SmartBox ID="clubname" runat="server" LabelText="Club Name:" />
       <sp:SmartBox ID="clubcity" runat="server" LabelText="Club City:" />
       <asp:Label ID="regno" runat="server" Text="Registration Number:"></asp:Label> 
       &nbsp;&nbsp;&nbsp; 
       <asp:TextBox ID="regtext" runat="server" width="200" MaxLength="20"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredRegNumber" runat="server" 
            ControlToValidate="regtext"
           ErrorMessage="Required Field" style="color: #FF0000"></asp:RequiredFieldValidator>
        <br /> <br />
              <asp:Label ID="address" runat="server" Text="Address: "></asp:Label>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:TextBox ID="addresstext" runat="server" Width="200" TextMode="MultiLine" Columns="5" Rows="3" ></asp:TextBox>
       <br />
      <p> 
       <asp:Button ID="saveclub" runat="server" Text="Save Club" OnClick="saveclub_Click" />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Button ID="AddPlayer" runat="server" Text="Add Player" OnClick="AddPlayer_Click"  /> 
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         <asp:Button ID="Button1" runat="server" Text="Cancel" OnClick="Button1_Click" />
         
      </p>
      
           <div runat="server" id="PlayerDiv">
               <p>
                  <asp:Label ID="Label1" runat="server" Text="Player’s name"></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="pnameTxt" runat="server"></asp:TextBox>
                   </p>
                <p>
                    <asp:Label ID="Label2" runat="server" Text="Date of birth"></asp:Label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:TextBox ID="dobTxt" runat="server" Width="145px">Select from the Calender</asp:TextBox>
                      &nbsp;<p><asp:Calendar ID="Calendar1" runat="server"  BackColor="White" BorderColor="#3366CC" BorderWidth="1px"
                           CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="71px" OnSelectionChanged="Calendar1_SelectionChanged" Width="43px">
                          <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                          <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                          <OtherMonthDayStyle ForeColor="#999999" />
                          <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                          <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                          <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                          <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                          <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      </p>
                <p>
                    <asp:Label ID="Label3" runat="server" Text="Jersey number"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="JerseyNumberTxt" runat="server"></asp:TextBox> 
               <p>
                    (must be from 0 to 99) 
                        
               <asp:RangeValidator ID="RangeValidator1" runat="server"
                    ControlToValidate="JerseyNumberTxt"
                    MinimumValue="0" MaximumValue="99"
                    Display="Dynamic"
                    Type="Integer"
                    ErrorMessage="Jersey number must be between 0 to 99" style="color: #FF0000"></asp:RangeValidator>

               &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="JerseyNumberTxt"
                    Display="Dynamic"
                   ErrorMessage="Required Field" style="color: #FF0000"></asp:RequiredFieldValidator>
                <p> <asp:Button ID="SavePlayer" runat="server" Text="Save Player" OnClick="SavePlayer_Click" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="cancel" runat="server" Text="Cancel" OnClick="cancel_Click" /></p>
                     </p>
           </div>
       
   
   </div>  

   
</asp:Content>

