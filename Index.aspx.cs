using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
public partial class Index : System.Web.UI.Page
{

    const string bazaConn = "SERVER=mysql.lrk.si;" + "Port = 3306;" + "DATABASE=sj6701_b1;" + "UID=sj6701;" + "PASSWORD=superbosna083";
    /*
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }*/

    protected void vrniMrezo()
    {
        MySqlConnection bazaPovezava = new MySqlConnection(bazaConn);
        try
        {
            bazaPovezava.Open();
            string SQLcommand = "SELECT * FROM (SELECT * FROM IZDELEK ORDER BY id DESC LIMIT 12)sub ORDER BY id DESC";
            MySqlCommand bazaUkaz = new MySqlCommand(SQLcommand, bazaPovezava);
            MySqlDataReader rdr = bazaUkaz.ExecuteReader();
            
            int i = 0;
            int d = 1;
            while (rdr.Read())
            {
                
                int id = (int)rdr["id"];
                string naslovAlbuma = (string)rdr["naslovAlbuma"];
                string izvajalec = (string)rdr["izvajalec"];
                double cena = (double)rdr["cena"];
                string tip = (string)rdr["tip"];

                if (i % 3 == 0) Response.Write("<section class=\"middleSection\">");
                Response.Write("<div class=\"stolpec\" id=\"st"+d+"\">");
                Response.Write("<img src=\"img/album.jpg\" width=220 height=220 />");
                Response.Write("<div class=\"napisSlika\" id=\"div" + d + "\">");
                if (tip.Equals("cd", StringComparison.Ordinal))
                {
                    Response.Write("<p><img src=\"img/cd.png\" alt=\"cd\" width=20 height=20> " + izvajalec + " - " + naslovAlbuma + "</p>");
                }
                else
                {
                    Response.Write("<p><img src=\"img/vinyl.png\" alt=\"lp\" width=20 height=20> " + izvajalec + " - " + izvajalec + "</p>");
                }
                Response.Write("<p class=\"cena\"><b>" + cena + " &euro;</b></p></div></div>");
                if (d == 3 || d == 6 || d == 9 || d == 12) Response.Write("</section>");
                //$_SESSION['ids'][$d] = $row['id'];
                i++;
                d++;
            }

        }
        catch (Exception)
        {
            Response.Write("<p>Prišlo je do napake pri branju baze.</p>");
        }
        finally
        {
            bazaPovezava.Close();
        }
    }

    protected void testLogin() {
        if (Request.Cookies["username"] != null)
        {
            Response.Write("<p id=\"imePrijave\">Prijavljeni kot: " + Request.Cookies["username"].Value + "</p>");
        }
        else
        {
            Response.Write("<p id=\"imePrijave\">Niste prijavljeni</p>");
        }
    }

   public string logout()
    {
        if (Request.Cookies["username"] != null)
        {
            HttpCookie myCookie = new HttpCookie("username");
            myCookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(myCookie);
            return "Odjava uspešna";
        }

        return "Odjava neuspešna";
    }
}