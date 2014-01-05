using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void testLogin()
    {
        if (Request.Cookies["username"] != null)
        {
            Response.Write("<p id=\"imePrijave\">Prijavljeni kot: " + Request.Cookies["username"].Value + "</p>");
        }
        else
        {
            Response.Write("<p id=\"imePrijave\">Niste prijavljeni</p>");
        }
    }
}