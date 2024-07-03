//Jasneet kaur  300961578
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class ClubDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
           // Bind the previous selected club details to this page
             BindClubDetails();
            BindPlayers();
           // BindPlayerDetails();
        }
    }
    //Theme
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

    //Jasneet kaur  300961578
    //code to bind data of selected Club Id in details view
    private void BindClubDetails()
    {

        // Obtain the value of the selected row
        int cid;
        if(Request.QueryString["clubId"]!=null)
        {
            string clubid = Request.QueryString["clubId"];
            cid = Convert.ToInt32(clubid);
            SqlConnection conn;
            SqlCommand comm;
            DataTable dt = new DataTable();
            string connstr = ConfigurationManager.ConnectionStrings["soccerconnstring"].ConnectionString;
            conn = new SqlConnection(connstr);
            // Create command
            comm = new SqlCommand(
                "SELECT clubId,clubName,clubCity,registrationNum,address FROM clubs where clubId=@cid", conn);
            comm.Parameters.Add("@cid", SqlDbType.Int);
            comm.Parameters["@cid"].Value = cid;

            SqlDataAdapter dadapter = new SqlDataAdapter(comm);
            try
            {
                conn.Open();
                comm.Connection = conn;
              //  dadapter.SelectCommand = comm;
                dadapter.Fill(dt);
                clubDetails.DataSource = dt;
                clubDetails.DataBind();
            }
            finally
            {
                conn.Close();
            }
        }
        
    }
    // Bind Player Details
    public void BindPlayerDetails()
    {
        int selectedRowIndex = playerView.SelectedIndex;

        int pid = (int)playerView.DataKeys[selectedRowIndex].Value;
        SqlConnection conn;
        SqlCommand comm;
        DataTable dt = new DataTable();
        string connstr = ConfigurationManager.ConnectionStrings["soccerconnstring"].ConnectionString;
        conn = new SqlConnection(connstr);
        // Create command
        comm = new SqlCommand(
            "SELECT playerName,dob,jerseyNum FROM playersTable where playerId=@pid", conn);
        comm.Parameters.Add("@pid", SqlDbType.Int);
        comm.Parameters["@pid"].Value = pid;

        SqlDataAdapter dadapter = new SqlDataAdapter(comm);
        try
        {
            conn.Open();
            comm.Connection = conn;
            //  dadapter.SelectCommand = comm;
            dadapter.Fill(dt);
            playerDetails.DataSource = dt;
            playerDetails.DataBind();
        }
        finally
        {
            conn.Close();
        }

    }
// Code to delete the club details
    protected void clubDetails_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        int cid;
        string clubid = Request.QueryString["clubId"];
        cid = Convert.ToInt32(clubid);
        SqlConnection conn;
        SqlCommand comm;
        DataTable dtable = new DataTable();
        string connstr = ConfigurationManager.ConnectionStrings["soccerconnstring"].ConnectionString;
        conn = new SqlConnection(connstr);
        // Create command
        comm = new SqlCommand(
            "DELETE FROM clubs where clubId=@cid", conn);
        comm.Parameters.Add("@cid", SqlDbType.Int);
        comm.Parameters["@cid"].Value = cid;

        SqlDataAdapter da = new SqlDataAdapter(comm);
        try
        {
            conn.Open();
            comm.Connection = conn;
          //  da.SelectCommand = comm;
            da.Fill(dtable);
            clubDetails.DataSource = dtable;
            clubDetails.DataBind();
            Response.Redirect("Clubs.aspx");
           
        }
        finally
        {
            conn.Close();
        }
    }
    private void BindPlayers()
    {

        int cid;
        string clubid = Request.QueryString["clubId"];
        cid = Convert.ToInt32(clubid);
        string connstr = ConfigurationManager.ConnectionStrings["soccerconnstring"].ConnectionString;
        SqlConnection conn = new SqlConnection(connstr);
        SqlCommand command = new SqlCommand("select playerId,playerName from playersTable where clubId=" + cid,conn);
        SqlDataReader reader;
        conn.Open();
        reader = command.ExecuteReader();
        
        playerView.DataSource = reader;
        playerView.DataKeyNames = new string[] { "playerId" };
            playerView.DataBind();
        reader.Close();
        conn.Close();
        
    }


    protected void playerView_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindPlayerDetails();
    }

   
    protected void playerDetails_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        int selectedRowIndex = playerView.SelectedIndex;

        int pid = (int)playerView.DataKeys[selectedRowIndex].Value;
        TextBox newplayernameTextbox = (TextBox)playerDetails.FindControl("editPname");
        TextBox newdobTextbox = (TextBox)playerDetails.FindControl("editDob");
        TextBox newjerseyTextbox = (TextBox)playerDetails.FindControl("editJersey");
        string newPname = newplayernameTextbox.Text;
        string newDob = newdobTextbox.Text;
        string newJersey = newjerseyTextbox.Text;

        SqlConnection conn;
        string connstr = ConfigurationManager.ConnectionStrings["soccerconnstring"].ConnectionString;
        conn = new SqlConnection(connstr);
        SqlCommand cmd = new SqlCommand("Update playersTable set playerName=@name,dob=@dob, jerseyNum=@jersey where playerId=" + pid, conn);
        cmd.Parameters.AddWithValue("@name", newPname);
        cmd.Parameters.Add("@dob", SqlDbType.Date);
        cmd.Parameters["@dob"].Value = newDob;
        cmd.Parameters.Add("@jersey", SqlDbType.Int);
        cmd.Parameters["@jersey"].Value = newJersey;
        try
        {
            conn.Open();
            cmd.ExecuteNonQuery();

        }
        finally
        {
            conn.Close();
            playerDetails.ChangeMode(DetailsViewMode.ReadOnly);
            BindClubDetails();
            BindPlayers();
            BindPlayerDetails();

        }
    
}

    protected void playerDetails_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        playerDetails.ChangeMode(e.NewMode);
        BindPlayerDetails();
    }
}
//Jasneet kaur  300961578