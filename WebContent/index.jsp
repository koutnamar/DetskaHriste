<%@page import="cz.czechitas.detskahriste.bean.Playground"%>
<%@page import="cz.czechitas.detskahriste.dao.PlaygroundDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="locationDao"
	class="cz.czechitas.detskahriste.dao.LocationDao" />
<jsp:useBean id="playgroundDao"
	class="cz.czechitas.detskahriste.dao.PlaygroundDao" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dětská hřiště</title>
<link rel="stylesheet" href="CSS/style.css">
<link
	href="https://fonts.googleapis.com/css?family=Kanit:400,600,600i&amp;subset=latin-ext"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
</head>
<body text-align:center>

	<h1 align="center">
		<strong>DĚTSKÁ HŘIŠTĚ</strong>
	</h1>
	<p align = "center">
      <i class="fas fa-horse"></i> <i class="fas fa-helicopter"></i> <i class="fas fa-spa"></i> <i class="fas fa-cloud-sun"></i> <i class="fas fa-car-side"></i> <i class="fas fa-basketball-ball"></i> <i class="fas fa-dog"></i> <i class="fas fa-futbol"></i> <i class="fas fa-rocket"></i> <i class="fas fa-tree"></i> <i class="fas fa-music"></i> <i class="far fa-bell"></i> <i class="far fa-grin-tongue-wink"></i> <i class="fas fa-paw"></i> <i class="fas fa-bicycle"></i> <i class="fas fa-anchor"></i> <i class="fas fa-crow"></i> <i class="fas fa-snowflake"></i> <i class="fas fa-volleyball-ball"></i> <i class="fas fa-dragon"></i> <i class="fas fa-hat-wizard"></i> <i class="fas fa-plane"></i> <i class="fas fa-child"></i> <i class="fas fa-umbrella"></i> <i class="fas fa-cat"></i>
    </p>
	<p>
		<img id="borderimg1" src="IMG_0612.jpeg" alt="Dětská hřiště" width=25%><img
			id="borderimg1" src="IMG_0502.jpeg" alt="Dětská hřiště" width=50%><img
			id="borderimg1" src="IMG_0592.jpeg" alt="Dětská hřiště" width=25%>
	</p>
	<p align="center">
		<select>
			<option disabled selected>Vybrat město</option>
			<%
				ArrayList<String> cityList = locationDao.loadCity();
				for (String city : cityList) {
			%>
			<option><%=city%></option>
			<%
				}
			%>
		</select> <input type="text" name="street">
		<button type="submit" name="search">
			<Strong>Hledat </Strong><i class="fas fa-search"></i>
		</button>
	</p>

	<span style='color: white'></span>
	<table align="center">
		<tr style="background-color: #9090ff">
			<th>Ulice</th>
			<th>Město</th>
			<th>Dopravní dostupnost</th>
			<th>Otevírací doba</th>
			<th>Průměrná známka</th>
		</tr>		
			<%
				ArrayList<Playground> list = playgroundDao.loadAll();
				for (Playground playground : list) {
			%>
			<tr>
			<td><a
				href="detail.jsp?idPlayground=<%=playground.getIdPlayground()%>"><%=playground.getLocation().getStreet()%></a></td>
			<td><%=playground.getLocation().getCity()%></td>
			<td><%=playground.getTraffic()%></td>
			<td><%=playground.getOpen()%></td>
			<td><%=String.format("%.2f", playground.getAverageRating())%></td>
			</tr>
			<%
				}
			%>
		
	</table>
	<a href="newZone.jsp" class="doprava">Přidat nové hřiště</a>
</body>
</html>
