<%@page import="cz.czechitas.detskahriste.bean.Playground"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="playgroundDao"
	class="cz.czechitas.detskahriste.dao.PlaygroundDao" />
<jsp:useBean id="ratingDao"
	class="cz.czechitas.detskahriste.dao.RatingDao" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Detail hřiště</title>
<link rel="stylesheet" href="CSS/style.css">
<link
	href="https://fonts.googleapis.com/css?family=Kanit:400,600,600i&amp;subset=latin-ext"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
</head>
<body>
	<a href="index.jsp" class="doprava">Hlavní stránka</a>
	<h1 align="center">
		<strong>DETAIL HŘIŠTĚ</strong>
	</h1>
	<p align="center">
		<img id="borderimg1" src="IMG_0502.jpeg" alt="Dětská hřiště" width=50%>
	</p>
	<a href="photos.jsp" class="doprava">Otevřít fotogalerii</a>
	<div>
		<h2>Parametry hřiště</h2>

		<%
			Long idPlayground = Long.parseLong(request.getParameter("idPlayground"));
			Playground playground = playgroundDao.load(idPlayground);
		%>

		<p>
			Město:
			<%=playground.getLocation().getCity()%>
			<br> Ulice:
			<%=playground.getLocation().getStreet()%>
			<br> Dopravní dostupnost:
			<%=playground.getTraffic()%>
			<%-- <br> GPS:
			<%=playground.getLocation().getLatitude()%>
			<%=playground.getLocation().getLongtitude()%> --%>
			<br> Otevírací doba:
			<%=playground.getOpen()%>
			<br>
		</p>
	</div>
	<div>
		
		<h2>Hodnocení</h2>
		<p>Průměrné skóre: <%=playground.getAverageRating() %></p>
		<ul>
			<li>Vybavenost: 
			<%= playground.getRating() == null? "Nehodnoceno" : playground.getRating().getEquipment() == null? "Nehodnoceno" : String.format("%.2f", playground.getRating().getEquipment()) %>
			</li>
			<li>Čistota: 
			<%= playground.getRating() == null? "Nehodnoceno" : playground.getRating().getTidiness() %>
			</li>
			<li>Bezpečnost: 
			<%= playground.getRating() == null? "Nehodnoceno" : playground.getRating().getTidiness() %>
			</li>
			<li>Množství okolní zeleně: 5</li>
			<li>Zázemí pro doprovod dětí: 5</li>
		</ul>
	</div>
	<div>
		<h2>Zadat nové hodnocení</h2>
		<form action="">
			Vybavenost <input type="radio" name="vyb" value="1">1 <input
				type="radio" name="vyb" value="2">2 <input type="radio"
				name="vyb" value="3">3 <input type="radio" name="vyb"
				value="4">4 <input type="radio" name="vyb" value="5">5<br>
			Čistota <input type="radio" name="cist" value="1">1 <input
				type="radio" name="cist" value="2">2 <input type="radio"
				name="cist" value="3">3 <input type="radio" name="cist"
				value="4">4 <input type="radio" name="cist" value="5">5<br>
			Bezpečnost <input type="radio" name="bezp" value="1">1 <input
				type="radio" name="bezp" value="2">2 <input type="radio"
				name="bezp" value="3">3 <input type="radio" name="bezp"
				value="4">4 <input type="radio" name="bezp" value="5">5<br>
			Množství okolní zeleně <input type="radio" name="zelen" value="1">1
			<input type="radio" name="zelen" value="2">2 <input
				type="radio" name="zelen" value="3">3 <input type="radio"
				name="zelen" value="4">4 <input type="radio" name="zelen"
				value="5">5<br> Zázemí pro doprovod dětí <input
				type="radio" name="zazemi" value="1">1 <input type="radio"
				name="zazemi" value="2">2 <input type="radio" name="zazemi"
				value="3">3 <input type="radio" name="zazemi" value="4">4
			<input type="radio" name="zazemi" value="5">5<br>
			<button type="submit">Odeslat hodnocení</button>
		</form>

	</div>
	<div>
		<h2>Komentáře</h2>
		<p>
			<strong class="fialova">PetrP - 12.03.2018 14:13</strong><br> <i>Oblečený
				k tkání. Pásu od vystoupám věc fotogalerii názoru, tím o lyžování
				hřebeni ukáže jejího ne tj. oslovil víkend. Stáda voda z klonovacího
				nezávislé kréta spoustu o federální Atlantik v řeč, zabíjí ať
				dokonce lyžařské, nazvaný oceánu přetrvávaj</i>
		</p>
		<p>
			<strong class="fialova">xxxxxxxy - 15.02.2018 11:12</strong><br>
			<i>Lodi 1 jasnější mlze skutečnost putuje zamrzlé textu, dobrá že
				lyžařské vy domech lidí. Ptáků magma jedete větru ji označených,
				kariéru dva říkat 360° lidstvo a směna, jen vousům a přeléval 1
				vědci</i>
		</p>
		<p>
			<strong class="fialova">ZdenkaZs - 14.02.2018 09:13</strong><br>
			<i>Bílou mozkové přísun obyvatelé změn geometrické dlouho, noc
				žije zapomenu rok dlouhokrkých nákaza.</i>
		</p>
		<p>
			<strong class="fialova">LenkaMalá - 11.01.2018 09:13</strong><br>
			<i>Silou a zemí i pohybovaly severoamerická z zemědělské
				dodržování zapamatovat softwarový s největšího sezonní, i objevili
				aktivitu s jihoafrické souvislosti za sem prozkoumány potravou o
				svědomí, polárního půjčovna řečení ho primitivních. </i>
		<p>
			<strong class="fialova">IvaVelká - 10.01.2018 09:10</strong><br>
			<i>Dočkala vrcholky opadavých hmyz pět dá rozmnožováním splňoval,
				začal to a počasí písně techniku u panenská malém dvě rozeznatelné
				či ruce. Před té aktivitu u aktivitách ta vložit poškození budova,
				zajímavou, může ať popis ruin kurzů dá popis natočen </i>
		</p>

	</div>
	<a href="comment.jsp" class="doleva">Zobrazit všechny komentáře</a>
</body>
</html>