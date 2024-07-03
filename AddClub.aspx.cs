//jasneet kaur  300961578
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class AddClub : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand comm;
    string connstr= ConfigurationManager.ConnectionStrings["soccerconnstring"].ConnectionString;
    //string aa;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            AddPlayer.Visible = false;
            PlayerDiv.Visible = false;
        }
       
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        string theme = (string)Session["theme"];
        if (theme != null)
        {
            Page.Theme = theme;

        }
        else
        {
            Page.Theme = "Light";
        }
    }
    //jasneet kaur  300961578
    // button coding to save Clubs
    protected void saveclub_Click(object sender, EventArgs e)
    {
        conn = new SqlConnection(connstr);
        try
        {
            comm = new SqlCommand("insert into clubs (clubName,clubCity,registrationNum,address) values(@cname,@ccity,@reg,@address)", conn);
            comm.Parameters.AddWithValue("@cname", clubname.Text);
            comm.Parameters.AddWithValue("@ccity", clubcity.Text);
            comm.Parameters.Add("@reg", SqlDbType.Int);
            comm.Parameters["@reg"].Value = regtext.Text;
            comm.Parameters.AddWithValue("@address", addresstext.Text);
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            Response.Write("Club successfully added");
            AddPlayer.Visible = true;
        }
        catch(Exception ex)
        {
            error.Text = ex.Message;
        }
    }
    // add player div visibility code
    protected void AddPlayer_Click(object sender, EventArgs e)
    {
        PlayerDiv.Visible = true;
    }
 
    // Save player code
    protected void SavePlayer_Click(object sender, EventArgs e)
    {

        conn = new SqlConnection(connstr);
        try
        {
            // Get the value of club id and insert into the player table
            SqlCommand command=new SqlCommand("SELECT clubId from clubs Where registrationNum=@reg",conn);
            command.Parameters.AddWithValue("@reg", regtext.Text);
            conn.Open();
            SqlDataReader reader = command.ExecuteReader();
            reader.Read();
            int cid = reader.GetInt32(0);
            reader.Close();

            comm = new SqlCommand("insert into playersTable (clubId,playerName,dob,jerseyNum) values(@cid,@pname,@dob,@jersey)", conn);
            comm.Parameters.AddWithValue("@cid", cid);
            comm.Parameters.AddWithValue("@pname", pnameTxt.Text);
            comm.Parameters.Add("@dob", System.Data.SqlDbType.Date);
            comm.Parameters["@dob"].Value = dobTxt.Text;
            comm.Parameters.Add("@jersey", System.Data.SqlDbType.Int);
            comm.Parameters["@jersey"].Value = JerseyNumberTxt.Text;
            comm.ExecuteNonQuery();
            conn.Close();
            Response.Write("Player successfully added to the Club");
            AddPlayer.Visible = true;
        }
        catch (Exception ex)
        {
            error.Text = ex.Message;
            AddPlayer.Visible = true;
        }
       
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("AddClub.aspx");

    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        dobTxt.Text = Calendar1.SelectedDate.ToShortDateString();
        AddPlayer.Visible = true;
        PlayerDiv.Visible = true;
    }

    protected void cancel_Click(object sender, EventArgs e)
    {
        pnameTxt.Text = "";
        dobTxt.Text = "";
        JerseyNumberTxt.Text = "";
    }
}
//jasneet kaur  300961578