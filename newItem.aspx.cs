using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class newItem : System.Web.UI.Page
{
    const string bazaConn = "SERVER=mysql.lrk.si;" + "Port = 3306;" + "DATABASE=sj6701_b1;" + "UID=sj6701;" + "PASSWORD=superbosna083";
    protected void vrniUporabnika()
    {
        if (Request.Cookies["username"] != null)
        {
            string user = Request.Cookies["username"].Value;
            int id;
            string ime = "";
            string priimek = "";
            string email = "";
            
            MySqlConnection bazaPovezava = new MySqlConnection(bazaConn);
            try
            {
                bazaPovezava.Open();
                string SQLcommand = "SELECT * FROM UPORABNIK WHERE username=\""+user+"\"";
                MySqlCommand bazaUkaz = new MySqlCommand(SQLcommand, bazaPovezava);
                MySqlDataReader rdr = bazaUkaz.ExecuteReader();

                while (rdr.Read())
                {
                    id = (int)rdr["id"];
                    ime = (string)rdr["ime"];
                    priimek = (string)rdr["priimek"];
                    email = (string)rdr["email"];
                    break;
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

            if (user.Equals("administrator")) {
                Response.Write("<section class=\"basketLook\">"+
							"<p class=\"basketh\"><b>Administrator</b></p>"+
							"<p class=\"basketn\">Silvester Jak&#353;a</p>"+
							"<img src=\"img/admin.jpg\" class=\"adphoto\" alt=\"admin\" width=200 height=200>"+
							"<p>&nbsp;</p>"+
							"<p class=\"basketn\">Nov izdelek:</p>"+
							"<form id=\"regForm\" enctype=\"multipart/form-data\" action=\"insert.php\" method=\"post\">"+
				                "<div class=\"line\"><label for=\"fileupload\">Slika: </label><input class=\"formGumb\" name=\"fileupload\" type=\"file\" id=\"fileupload\"/></div>"+
				                "<div class=\"line\"><label for=\"artistname\">Ime izvajalca: </label><input class=\"inputStilr\" name=\"artname\" type=\"text\" id=\"artname\"/></div>"+
				                "<div class=\"line\"><label for=\"albumname\">Ime albuma: </label><input class=\"inputStilr\" name=\"albname\" type=\"text\" id=\"albname\" /></div>"+
				                "<div class=\"line\"><label for=\"year\">Leto izdaje: </label><input class=\"inputStilr\" name=\"year\" type=\"number\" id=\"year\" min=\"0\" step=\"1\" value=\"2013\"/></div>"+
				                "<div class=\"line\"><label for=\"prod\">Zalo&#382;ba: </label><input class=\"inputStilr\" name=\"prod\" type=\"text\" id=\"prod\"/></div>"+
				                "<div class=\"line\"><label for=\"price\">Cena: </label><input class=\"inputStilr\" name=\"price\" type=\"number\" id=\"price\" min=\"0.0\" step=\"0.01\" value=\"0.0\"/>&euro;</div>"+
				                "<div class=\"line\"><label for=\"quant\">Koli&#269;ina: </label><input class=\"inputStilr\" name=\"quant\" type=\"number\" id=\"quant\" min=\"1\" step=\"1\" value=\"1\"/></div> "+
				                "<div class=\"line\"><label for=\"type\">Kategorija: </label>"+
				                "	<select id=\"category\" name=\"category\" class=\"inputStilr\">"+
								"		<option value=\"slovenska\">Slovenska</option>"+
								"		<option value=\"hrvaska\">Hrva&#353;ka</option>"+
								"		<option value=\"ostalo\">Ostalo</option>"+
								"	</select>"+
								"</div>"+
				              "  <div class=\"line\"><label for=\"type\">Tip: </label>"+
				             "   	<select id=\"plateType\" name=\"plateType\" class=\"inputStilr\">"+
							"			<option value=\"cd\">CD</option>"+
							"			<option value=\"lp\">LP</option>"+
							"		</select>"+
							"	</div>"+
				         "       <div class=\"line submit\"><input class=\"formGumb\" type=\"submit\" name=\"sen\" value=\"Dodaj med izdelke\"/></div>"+
                        "	</form>" +
						"</section>");
            } else { 
                Response.Write("<section class=\"basketLook\">"+
								"<p class=\"basketh\"><b>Moj profil</b></p>"+
								"<p class=\"basketn\">"+ime+" "+priimek+"</p>"+
                                "<img src=\"img/profilka.jpg\" id=\"neumnost\" class=\"adphoto\" width=\"200\" height=\"200\" /><br/><br/>" +
								"<p class=\"basketn\">"+email+"</p>"+
								"</section>");
            }
        }
        else
        {
            Response.Write("<section class=\"basketLook\">"+
							"<p class=\"basketh\"><b>Niste prijavljeni</b></p>"+
							"</section>");
        }
    }

    public void dodajIzdelek(object sender, EventArgs eArgs)
    {
        Response.Write("<p>uspešno dodan</p>");
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