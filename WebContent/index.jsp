<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Comparator"%>
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
<body>

	<h1 align="center">
		<strong>DĚTSKÁ HŘIŠTĚ</strong>
	</h1>
	<p class="ip" align="center">
		<i class="fas fa-horse"></i> <i class="fas fa-helicopter"></i> <i
			class="fas fa-spa"></i> <i class="fas fa-cloud-sun"></i> <i
			class="fas fa-car-side"></i> <i class="fas fa-basketball-ball"></i> <i
			class="fas fa-dog"></i> <i class="fas fa-futbol"></i> <i
			class="fas fa-rocket"></i> <i class="fas fa-tree"></i> <i
			class="fas fa-music"></i> <i class="far fa-bell"></i> <i
			class="far fa-grin-tongue-wink"></i> <i class="fas fa-paw"></i> <i
			class="fas fa-bicycle"></i> <i class="fas fa-anchor"></i> <i
			class="fas fa-crow"></i> <i class="fas fa-snowflake"></i> <i
			class="fas fa-volleyball-ball"></i> <i class="fas fa-dragon"></i> <i
			class="fas fa-hat-wizard"></i> <i class="fas fa-plane"></i> <i
			class="fas fa-child"></i> <i class="fas fa-umbrella"></i> <i
			class="fas fa-cat"></i>
	</p>
	<div class="photoIndex">
		<img id="borderimg1" src="images/imageLeft.jpeg" alt="Dětská hřiště" width=25%><img
			id="borderimg1" src="images/imageMain.jpeg" alt="Dětská hřiště" width=50%><img
			id="borderimg1" src="images/imageRight.jpeg" alt="Dětská hřiště" width=25%>		
	</div>
	<a href="newZone.jsp" class="doprava">Přidat nové hřiště</a>
	<form action="index.jsp" method="post">
		<p align="center">
			<select name="filterCity">
				<option value=""
					<%if (request.getParameter("filterCity") == null) {%> selected
					<%}%>>Vybrat město</option>
				<%
					ArrayList<String> cityList = locationDao.loadCity();
					for (String city : cityList) {
				%>
				<option value="<%=city%>"
					<%if (city.equals(request.getParameter("filterCity"))) {%> selected
					<%}%>><%=city%></option>
				<%
					}
				%>


			</select> <input type="text" name="filterStreet" />
			<button type="submit" name="search">
				Hledat <i class="fas fa-search"></i>
			</button>
		</p>
	</form>

	<span style='color: white'></span>
	<%
		ArrayList<Playground> list;
		String city = request.getParameter("filterCity");
		String street = request.getParameter("filterStreet");
		if ((city == null || city.isEmpty()) && street == null) {
			list = playgroundDao.loadAll();
		} else {
			list = playgroundDao.loadCityStreet(city, street);
		}
		if (list != null && !list.isEmpty()) {
	%>
	<table align="center">
		<tr style="background-color: #81BEF7">
			<th>Město</th>
			<th>Ulice</th>
			<th>Dopravní dostupnost</th>
			<th>Otevírací doba</th>
			<th><a href="index.jsp?sort=rating" alt="Průměrné hodnocení"> Hodnocení </a></th>
		</tr>
		<%
			if ("rating".equals(request.getParameter("sort"))) {
					Collections.sort(list, new Comparator<Playground>() {
						@Override
						public int compare(Playground lhs, Playground rhs) {
							// -1 - less than, 1 - greater than, 0 - equal, all inversed for descending
							return lhs.getAverageRating() > rhs.getAverageRating() ? -1
									: (lhs.getAverageRating() < rhs.getAverageRating()) ? 1 : 0;
						}
					});
				}
				for (Playground playground : list) {
		%>
		<tr>
			<td><%=playground.getLocation().getCity()%></td>
			<td><a
				href="detail.jsp?idPlayground=<%=playground.getIdPlayground()%>"><%=playground.getLocation().getStreet()%></a></td>


			<td><%=playground.getTraffic()%></td>
			<td align="center"><%=playground.getOpen()%></td>
			<td align="center">
				<%
					if (playground.getAverageRating() == 0) {
				%> --- <%
					} else {
				%> <%=String.format("%.2f", playground.getAverageRating())%>

				<%
					}
				%>
			</td>
		</tr>
		<%
			}
		%>

	</table>
	<%
		} else {
	%>
	<p>Nebyl nalezen žádný záznam.</p>
	<%
		}
	%>

</body>
</html>
