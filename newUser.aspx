<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newUser.aspx.cs" Inherits="newUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta charset="UTF-8">
		<title>Veti.si</title>
		<link rel="stylesheet" type="text/css" href="design.css">
		<script src="jquery-2.0.3.min.js"></script>
		<script src="newUserscript.js"></script>
		<script src="readxml.js"></script>
		<link rel="stylesheet" type="text/css" href="datestyle.css">
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
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
			
			<form class="userData" enctype="multipart/form-data" action="db-checklogin.aspx" method="post">
				<span id="upimel">Up. ime: </span><input type="text" class="inputStil" name="user" size="13"><br>
				<span id="geslol">Geslo: </span><input type="password" class="inputStil" name="pass" size="13"><br>
				<a href="newUser.aspx" class="regLink" id="reglink">Registracija</a>
				<input type="submit" class ="regSubmit" id="logingumb" value="Prijavi se">
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
			<section class="newUser">
				<form id="regForm" enctype="multipart/form-data" action="addUser.aspx" method="post">
                	<h3>Registracija</h3>
	                <div class="line"><label for="names">*Ime: </label><input class="inputStilr" type="text" id="names" name="names" title="Vnesi ime"/></div>
	                <div class="line"><label for="surname">*Priimek: </label><input class="inputStilr" type="text" id="surname" name="surname" title="Vnesi priimek"/></div>
	                <div class="line"><label for="datepicker">*Datum rojstva: </label><input class="inputStilr" type="text" id="datepicker" name="datepicker"/></div>
	                <div class="line"><label for="email">*Email: </label><input class="inputStilr" type="email" id="email" name="email" title="Vnesi veljaven email"/></div>
	                <div class="line"><label for="tel">Telefon: </label><input class="inputStilr" type="tel" id="tel" name="tel" title="Vnesi telefonsko številko, brez črk ali drugih znakov"/></div>
	                <div class="line"><label for="addr">Naslov: </label><input class="inputStilr" type="text" id="addr" name="addr" title="Vnesi naslov stalnega prebivališča"/></div>
	                <div class="line"><label for="post">Po&#353;ta: </label><input class="inputStilr" type="text" id="post" name="post" title="Vnesi poštno številko in ime pošte"/></div>
	                <div class="line"><label for="post">Država: </label><input class="inputStilr" type="text" id="country" name="country" title="Vnesi državo bivanja"/></div>
	                <div class="line"><label for="fileupload">Slika: </label><input class="inputStilr" name="fileupload" type="file" id="fileupload"/></div><br>
	                
	                <div class="line"><label for="username">*Uporabni&#353;ko ime: </label><input class="inputStilr" type="text" id="username" name="username"/></div>
	                <div class="line"><label for="pwd">*Geslo: </label><input class="inputStilr" type="password" id="pwd" name="pwd"/></div>
	                <div class="line"><label for="pwdcon">*Potrdi geslo: </label><input class="inputStilr" type="password" id="pwdcon" title="Gesli se morata ujemati"/></div>
	                
	                <div class="line submit"><input class="regSubmit" type="submit" value="Nadaljuj" /></div><br>
           		</form>
			</section>
			
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
