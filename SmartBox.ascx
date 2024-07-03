<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SmartBox.ascx.cs" Inherits="SmartBox" %>
<script runat="server">
    public string LabelText
    {
        set
        {
            myLabel.Text = value;
        }
    }
    public string Text
    {
        get
        {
            return myTextBox.Text;
        }
    }
    
</script>
<p> <asp:Label ID="myLabel" runat="server" Text="" Width="100"></asp:Label>
    <asp:TextBox ID="myTextBox" runat="server" Text="" Width="200" MaxLength="20"></asp:TextBox>
    <asp:RequiredFieldValidator ID="myTextBox1" runat="server" 
            ControlToValidate="myTextBox"
           ErrorMessage="Required field" style="color: #FF0000"></asp:RequiredFieldValidator>
</p>