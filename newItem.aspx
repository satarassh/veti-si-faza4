<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newItem.aspx.cs" Inherits="newItem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta charset="UTF-8">
		<title>Veti.si</title>
		<link rel="stylesheet" type="text/css" href="design.css">
		<script src="jquery-2.0.3.min.js"></script>
		<script src="newItemscript.js"></script>
		<script src="readxml.js"></script>
		<link rel="stylesheet" type="text/css" href="datestyle.css">
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	</head>
	<body>
		<header>
			<a href="Index.aspx"> 
				<img class="homeLogo" src="img/logohome.png" alt="link na domaco stran" width=236 height=64>
			</a>
			
			<img class="sloTran" src="img/sloflag.png" width=20 height=20>
			<img class="engTran" src="img/gbflag.png" width=20 height=20>
			
			<form class="searchBox">
				<input type="text" class="searchData" name="search" size="13" placeholder="Iskanje..." id="searchfield">
				<a href="http://www.espn.com"> 
					<img src="img/searchGlass.png" class="glassStil" alt="isci" width=30 height=30>
				</a><br>
				<span class="checkStil">
					<label class="checkStil" id="cdcheck">CD<input name = "cdcheck" type = "radio" value="CD" checked></label>
					<label class="checkStil" id="lpcheck">LP<input name = "cdcheck" type = "radio" value="LP"></label>
					<label class="checkStil" ><span id="bothcheck">Oboje</span><input name = "cdcheck" type = "radio" value="Oboje"></label>
				</span>
			</form>
			
			<form class="userData" enctype="multipart/form-data" action="login.aspx" method="post" runat="server">
				<span id="upimel">Up. ime: </span><asp:TextBox runat="server" type="text" class="inputStil" name="user" size="13"/><br>
				<span id="geslol">Geslo: </span><asp:TextBox runat="server" type="password" class="inputStil" name="pass" size="13"/><br>
				<a href="newUser.aspx" class="regLink" id="reglink">Registracija</a>
				<asp:Button type="submit" class ="regSubmit" id="logingumb" text="Prijavi se" runat="server"/>
				<%
                    testLogin();
                %>
			</form>
		</header>
		
		<div class="domov" title="Domov">
			<a href="Index.aspx"> 
				<img src="img/home.png" alt="domov" width=48 height=38>
			</a>
		</div>
	
		<div class="basket" title="Nakupovalna ko&#353;arica">
			<a href="kosarica.aspx"> 
				<img src="img/basket.png" alt="nakupovalna ko&#353;arica" width=48 height=38>
			</a>
		</div>
		
		<div class="profile" title="Moj profil">
			<a href="newItem.aspx"> 
				<img src="img/profile.png" alt="moj profil" width=48 height=38>
			</a>
		</div>
		
		<div class="logout" title="Odjava">
			<p id="logot">Odjava</p>
		</div>
		
		<nav class="navigation">
			<div id="accordion">
			  <h3 id="cdlab">CD zgoščenke</h3>
			  <div id="insideCascCD">
			  	<p class="inspar" id="slo1">Slovenska</p>
			  	<p class="inspar" id="cro1">Hrvaška</p>
			  	<p class="inspar" id="ost1">Ostalo</p>
			  	<p class="inspar" id="newon">Novo na sceni</p>
			  </div>
			  
			  <h3 id="lplab">LP vinyl</h3>
			  <div id="insideCascLP">
			  	<p class="inspar" id="slo2">Slovenska</p>
			  	<p class="inspar" id="cro2">Hrvaška</p>
			  	<p class="inspar" id="ost2">Ostalo</p>
			  </div>
			</div>
		</nav>
		
		<section class="grid">
			<%
                vrniUporabnika();    
            %>

			<footer>
				<p class="footp" id="contactp">Kontakt</p>
				<p class="footp2">Silvester Jak&#353;a</p>
				<p class="footp3" id="unip">Univerza v Ljubljani - Fakulteta za ra&#269;unalni&#353;tvo in informatiko</p>
				<p class="footp3"><span id="vpisnap">Vpisna &#353;tevilka</span>: 63110185</p>
				<p class="footp3">Veti.si - 2013</p>
			</footer>
		</section>
	</body>
</html>
