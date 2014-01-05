<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <section class="basketLook">
	    <p class="basketh"><b>Administrator</b></p>
	    <p class="basketn">Silvester Jak&#353;a</p>
	    <asp:Image src="img/admin.jpg" class="adphoto" width="200" height="200" runat="server"/>
							
	    <p>&nbsp;</p>
	    <p class="basketn">Nov izdelek:</p>
	    <form id="regForm" runat="server">
		    <div class="line"><label for="fileupload">Slika: </label><asp:FileUpload runat="server" class="formGumb" id="fileupload"/></div>
		    <div class="line"><label for="artistname">Ime izvajalca: </label><asp:TextBox runat="server" class="inputStilr" id="artname"/></div>
		    <div class="line"><label for="albumname">Ime albuma: </label><asp:TextBox runat="server" class="inputStilr" id="albname" /></div>
		    <div class="line"><label for="year">Leto izdaje: </label><asp:TextBox runat="server" class="inputStilr" type="number" id="year" min="0" step="1" value="2014"/></div>
		    <div class="line"><label for="prod">Zalo&#382;ba: </label><asp:TextBox runat="server"  class="inputStilr" type="text" id="prod"/></div>
		    <div class="line"><label for="price">Cena: </label><asp:TextBox runat="server" class="inputStilr" type="number" id="price" min="0.0" step="0.01" value="0.0"/>&euro;</div>
		    <div class="line"><label for="quant">Koli&#269;ina: </label><asp:TextBox runat="server" class="inputStilr" type="number" id="quant" min="1" step="1" value="1"/></div> 
		    <div class="line"><label for="type">Kategorija: </label>
			    <asp:DropDownList id="category" runat="server" class="inputStilr">
                    <asp:ListItem>slovenska</asp:ListItem>
                    <asp:ListItem>hrva&#353;ka</asp:ListItem>
                    <asp:ListItem>ostalo</asp:ListItem>
                </asp:DropDownList>
		    </div>

		    <div class="line"><label for="type">Tip: </label>
                <asp:DropDownList id="plateType" runat="server" class="inputStilr">
                    <asp:ListItem>cd</asp:ListItem>
                    <asp:ListItem>lp</asp:ListItem>
                </asp:DropDownList>
		    </div>
            <div class="line submit"><asp:Button Text="Dodaj med izdelke" OnClick="dodajIzdelek" runat="server"/></div>
	    </form>
    </section>
</body>
</html>
