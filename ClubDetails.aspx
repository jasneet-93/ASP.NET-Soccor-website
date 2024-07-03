<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ClubDetails.aspx.cs" Inherits="ClubDetails" %>
<%--Jasneet kaur  300961578--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align:center; height: 791px;">
       
      <p class="heading"> Club Details </p>  
       <div >
           <p class="heading"> Details of Club</p>
         <asp:DetailsView ID="clubDetails" runat="server" AutoGenerateRows="False" AllowPaging="True" HorizontalAlign="Center"  
             OnItemDeleting="clubDetails_ItemDeleting" Height="112px" Width="183px" 
             BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
             <AlternatingRowStyle BackColor="#F7F7F7" />
             <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
        <Fields>
            <asp:TemplateField HeaderText="Club Id">
                <ItemTemplate>
                    <asp:Label ID="clubId" runat="server" Text='<%# Eval("clubId") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Club Name">
                <ItemTemplate>
                    <asp:Label ID="clubName" runat="server" Text='<%# Eval("clubName") %>' />
                </ItemTemplate>
      <%--Jasneet kaur  300961578--%>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Club City">
                <ItemTemplate>
                    <asp:Label ID="clubCity" runat="server" Text='<%# Eval("clubCity") %>' />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Registeration Number">
                <ItemTemplate>
                    <asp:Label ID="registrationNum" runat="server" Text='<%# Eval("registrationNum") %>' />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Address">
                <ItemTemplate>
                    <asp:Label ID="address" runat="server" Text='<%# Eval("address") %>' />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowDeleteButton="true" />
        </Fields>
             <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
             <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderTemplate>
                <%#Eval("clubName")%>
            </HeaderTemplate>
            
             <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
             <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            
        
    </asp:DetailsView><br />
        </div>
        <div style="display:inline-block; height: 277px; width: 197px;">
        <p class="heading"> Players in this Club</p>
        <asp:GridView ID="playerView" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
            CellPadding="3" CellSpacing="1" GridLines="None" Height="236px" Width="188px" OnSelectedIndexChanged="playerView_SelectedIndexChanged">
            <Columns>
                 <asp:BoundField HeaderText="Player ID" DataField="playerId" />
                <asp:BoundField HeaderText="Player Name"  DataField="PlayerName" />
             <%-- %>   <asp:BoundField HeaderText="Date Of Birth" DataField="dob" DataFormatString="{0:MM/dd/yyyy}" />
               --%>
                <asp:ButtonField CommandName="Select" Text="Select"/>
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
            </div>


        <div style="display:inline-block; height: 276px; width: 217px;">
           <p class="heading" > Player Update</p>
            <asp:DetailsView ID="playerDetails" runat="server" Height="234px" Width="195px" HorizontalAlign="Center"
                AutoGenerateRows="False" OnItemUpdating="playerDetails_ItemUpdating" OnModeChanging="playerDetails_ModeChanging" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <Fields>
                    <asp:TemplateField HeaderText="Player Name">
                        <EditItemTemplate>
                            <asp:TextBox id="editPname" runat="server" Text='<%# Bind("PlayerName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="PnameLabel" runat="server" Text='<%# Bind("PlayerName") %>'></asp:Label>
                        </ItemTemplate>
                      
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Date of Birth">
                        <EditItemTemplate>
                            <asp:TextBox id="editDob" runat="server" Text='<%# Bind("dob") %>' ></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="dobLabel" runat="server" Text='<%# Bind("dob") %>' ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Jersey Number">
                        <EditItemTemplate>
                            <asp:TextBox id="editJersey" runat="server" Text='<%# Bind("jerseyNum") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="JerseyLabel" runat="server" Text='<%# Bind("jerseyNum") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" />
                </Fields>
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <HeaderTemplate>
                    <%#Eval("PlayerName") %>
                </HeaderTemplate>
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            </asp:DetailsView>
        </div>
        </div>
</asp:Content>
<%--Jasneet kaur  300961578--%>
