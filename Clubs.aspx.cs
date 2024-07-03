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
public partial class Clubs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if(!IsPostBack)
        {
            BindGrid();
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
    //bind data to grid
    private void BindGrid()
    {
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        string connstr = ConfigurationManager.ConnectionStrings["soccerconnstring"].ConnectionString;
        conn = new SqlConnection(connstr);
        comm = new SqlCommand("select clubId,clubName from clubs",conn);
        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            clubGrid.DataSource = reader;
            clubGrid.DataKeyNames = new string[] { "clubId" };
            clubGrid.DataBind();
            reader.Close();

        }
        finally
        {
            conn.Close();
        }

    }
    //Jasneet kaur  300961578


    protected void clubGrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        // get the index value of selected club to the next page
        Response.Redirect("ClubDetails.aspx?clubId=" + clubGrid.SelectedDataKey.Value.ToString());
    }
}

//Jasneet kaur  300961578