//Jasneet kaur  300961578
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class MatchScheduling : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // call drop_down_bind method to bind drop down list at page load
            drop_down_bind();
        }
        BindGrid();
    }
    //Jasneet kaur  300961578
    // matchDetails is grid view to show the scheduled matches
    // shows scheduled matches from todays date.. not before todays date.
    public void BindGrid()
    {
        string strCurrentDate = DateTime.Today.Year + "/" + DateTime.Today.Month + "/" + DateTime.Today.Day;
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        string connstr = ConfigurationManager.ConnectionStrings["soccerconnstring"].ConnectionString;
        conn = new SqlConnection(connstr);
        comm = new SqlCommand("select host_clubName,guest_clubName,scheduleDate from matchScheduling where scheduleDate>=@date", conn);
        comm.Parameters.AddWithValue("@date", strCurrentDate);
        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            matchDetails.DataSource = reader;
            matchDetails.DataBind();
            reader.Close();
        }
        finally
        {
            conn.Close();
        }
    }

    public void drop_down_bind()
    {
        SqlConnection conn;
        string connstr = ConfigurationManager.ConnectionStrings["soccerconnstring"].ConnectionString;
        conn = new SqlConnection(connstr);
        SqlDataAdapter adpt = new SqlDataAdapter("Select * from clubs", conn);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        hostList.DataSource = dt;
        hostList.DataBind();
        hostList.DataTextField = "clubName";
        hostList.DataBind();
        guestList.DataSource = dt;
        guestList.DataBind();
        guestList.DataTextField = "clubName";
        guestList.DataBind();
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

   
    //save the match scheduling details 
    protected void Schedule_Click(object sender, EventArgs e)
    {
        SqlConnection conn;
        SqlCommand comm;
        string connstr = ConfigurationManager.ConnectionStrings["soccerconnstring"].ConnectionString;
        conn = new SqlConnection(connstr);
        try
        {
            comm = new SqlCommand("insert into matchScheduling (host_clubName,guest_clubName,scheduleDate) values(@host,@guest,@date)", conn);
            comm.Parameters.AddWithValue("@host", hostList.Text);
            comm.Parameters.AddWithValue("@guest", guestList.Text);
            comm.Parameters.Add("@date", System.Data.SqlDbType.Date);
            comm.Parameters["@date"].Value = Calendar.SelectedDate;
            conn.Open();
            comm.ExecuteNonQuery();
            conn.Close();
            Response.Write("Match Scheduled Successfully");
            BindGrid();
            
        }
        catch (Exception ex)
        {
            error.Text = ex.Message;
           
        }
    }
}
//Jasneet kaur  300961578