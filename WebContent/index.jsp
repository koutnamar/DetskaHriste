<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="locationDao"
	class="cz.czechitas.detskahriste.dao.LocationDao" />
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
			<th>Zeměpisná šířka</th>
			<th>Zeměpisná délka</th>
			<th>Otvírací doba</th>
			<th>Průměrná známka</th>
		</tr>
		<tr>
			<td><a href="detail.jsp">Zednická</a></td>
			<td>Ostrava</td>
			<td>Tram, Bus</td>
			<td>49°49'53.4"N</td>
			<td>18°10'34.0"E</td>
			<td>10-18</td>
			<td>4,5</td>
		</tr>
		<tr>
			<td><a href="detail.jsp">Panelová</a></td>
			<td>Ostrava</td>
			<td>Tram</td>
			<td>49°49'48.2"N</td>
			<td>18°10'58.5"E</td>
			<td>non-stop</td>
			<td>3</td>
		</tr>
		<tr>
			<td><a href="detail.jsp">Ukrajinská</a></td>
			<td>Ostrava</td>
			<td>Tram</td>
			<td>49°49'37.7"N</td>
			<td>18°11'27.8"E</td>
			<td>non-stop</td>
			<td>4,7</td>
		</tr>
		<tr>
			<td><a href="detail.jsp">Lvovská</a></td>
			<td>Ostrava</td>
			<td>Tram, Bus</td>
			<td>49°50'06.1"N</td>
			<td>18°11'18.9"E</td>
			<td>15-19</td>
			<td>4,8</td>
		</tr>
	</table>
	<a href="newZone.jsp" class="doprava">Přidat nové hřiště</a>
</body>
</html>
