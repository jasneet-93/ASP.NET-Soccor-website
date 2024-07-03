//Jasneet kaur  300961578
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SetupPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
    //Jasneet kaur  300961578
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (rdbdark.Checked)
        {
            Session["theme"] = "Dark";
        }
        else
        {
            Session["theme"] = "Light";
        }
        Response.Redirect("Default.aspx");
    
}
}
//Jasneet kaur  300961578