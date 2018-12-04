<%@page import="cz.czechitas.detskahriste.bean.Photo"%>
<%@page import="cz.czechitas.detskahriste.dao.PhotoDao"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="cz.czechitas.detskahriste.bean.Comment"%>
<%@page import="java.util.ArrayList"%>
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
<style>
.tabDetail tr{
	width: 60%;
	background-color: #CEE3F6;
}
</style>
<body>

	<%
		if (request.getParameter("idPlayground") == null || request.getParameter("idPlayground").length() == 0) {
			pageContext.forward("/error.jsp");
			return;
		}
	%>
	<%
		Long idPlayground = Long.parseLong(request.getParameter("idPlayground"));
		PhotoDao photoDao = new PhotoDao();
		ArrayList<Photo> photos = photoDao.load(idPlayground);
		Long idPhoto = (photos != null && photos.size() > 0 ? photos.get(0).getIdPhoto() : null);//ternární operátor - podmínka
	%>
	<a href="index.jsp" class="doprava">Hlavní stránka</a>
	<h1 align="center">

		<%
			Playground playground = playgroundDao.load(idPlayground);
		%>
		<strong>DETAIL HŘIŠTĚ ul. <%=playground.getLocation().getStreet()%>,
			<%=playground.getLocation().getCity()%></strong>
	</h1>
	<p align="center">
		<%
			if (idPhoto != null) {
		%>
		<img id="borderimg1" src="DownloadPhoto?idPhoto=<%=idPhoto%>"
			alt="Dětská hřiště" width=300px>
		<%
			} else {
		%>
		<img id="borderimg1" src="images/defaultPlayground.jpeg"
			alt="Dětská hřiště" width=300px>
			<br align="center">Ilustrační foto
		<%
			}
		%>
	</p>
	<a
		href="photos.jsp?idPlayground=<%=request.getParameter("idPlayground")%>"
		class="doprava">Otevřít fotogalerii</a>


	<div>
		<h2>Parametry hřiště</h2>


		<p>
			Město:
			<%=playground.getLocation().getCity()%>
			<br> Ulice:
			<%=playground.getLocation().getStreet()%>
			<br> Dopravní dostupnost:
			<%=playground.getTraffic()%>
			<%-- <br> GPS:
			<%=playground.getLocation().getLatitude()%>
			<%=playground.getLocation().getLongitude()%> --%>
			<br> Otevírací doba:
			<%=playground.getOpen()%>
			<br>
		</p>
	</div>
	<div>

		<h2>Hodnocení</h2>
		<p>
			Průměrné skóre:
			<%=String.format("%.2f", playground.getAverageRating())%></p>
		<ul>
			<li>Vybavenost: <%=playground.getRating() == null || playground.getRating().getEquipment() == null ? "Nehodnoceno"
					: String.format("%.2f", playground.getRating().getEquipment())%>
			</li>
			<li>Čistota: <%=playground.getRating() == null || playground.getRating().getTidiness() == null ? "Nehodnoceno"
					: String.format("%.2f", playground.getRating().getTidiness())%>

			</li>
			<li>Bezpečnost: <%=playground.getRating() == null || playground.getRating().getSafety() == null ? "Nehodnoceno"
					: String.format("%.2f", playground.getRating().getSafety())%>

			</li>
			<li>Množství okolní zeleně: <%=playground.getRating() == null || playground.getRating().getEnvironment() == null ? "Nehodnoceno"
					: String.format("%.2f", playground.getRating().getEnvironment())%>
			</li>
			<li>Zázemí pro doprovod dětí: <%=playground.getRating() == null || playground.getRating().getRestZone() == null ? "Nehodnoceno"
					: String.format("%.2f", playground.getRating().getRestZone())%>
			</li>
		</ul>
	</div>
	<div>
		<%
			if (session.getAttribute("ratedPlaygrounds") != null
					&& ((ArrayList<Long>) session.getAttribute("ratedPlaygrounds")).contains(idPlayground)) {
		%>
		<p>Děkujeme za přidání hodnocení hřiště.</p>
		<%
			} else {
		%>
		<h2>Zadat nové hodnocení</h2>
		<p>Maximálně 5 bodů = nejlepší</p>
		<form action="saveRating">
			<input type="hidden" name="idPlayground" value="<%=idPlayground%>" />
			<table class="tabDetail">
				<tr>
					<td>Vybavenost</td>
					<td><input type="radio" name="vyb" value="1" required>1
						<input type="radio" name="vyb" value="2">2
						<input type="radio" name="vyb" value="3">3
						<input type="radio" name="vyb" value="4">4
						<input type="radio" name="vyb" value="5">5
					</td>
				<tr>
					<td>Čistota</td>
					<td><input type="radio" name="cist" value="1" required>1
						<input type="radio" name="cist" value="2">2
						<input type="radio" name="cist" value="3">3
						<input type="radio" name="cist" value="4">4
						<input type="radio" name="cist"value="5">5
					</td>
				</tr>
				<tr>
					<td>Bezpečnost</td>
					<td><input type="radio" name="bezp" value="1" required>1
						<input type="radio" name="bezp" value="2">2
						<input type="radio" name="bezp" value="3">3
						<input type="radio" name="bezp" value="4">4
						<input type="radio" name="bezp" value="5">5
					</td>
				</tr>
				<tr>
					<td>Množství okolní zeleně</td>
					<td><input type="radio" name="zelen" value="1" required>1
						<input type="radio" name="zelen" value="2">2
						<input type="radio" name="zelen" value="3">3
						<input type="radio" name="zelen" value="4">4
						<input type="radio" name="zelen" value="5">5
					</td>
				</tr>
				<tr>
					<td>Zázemí pro doprovod dětí</td>
					<td><input type="radio" name="zazemi" value="1" required>1
						<input type="radio" name="zazemi" value="2">2
						<input type="radio" name="zazemi" value="3">3
						<input type="radio" name="zazemi" value="4">4
						<input type="radio" name="zazemi" value="5">5
					</td>
				</tr>
			</table>
			<br>
			<button type="submit">Odeslat hodnocení</button>
			</fo
				rm>
			<%
				}
			%>
		
	</div>
	<div>
		<jsp:useBean id="dao" class="cz.czechitas.detskahriste.dao.CommentDao"></jsp:useBean>
		<h2>Komentáře</h2>
		<%
			ArrayList<Comment> listCom = dao.load(Long.valueOf(request.getParameter("idPlayground")));
			if (listCom != null && listCom.size() > 0) {
				for (int i = 0; i < 5 && i < listCom.size(); i++) {
		%>
		<p>
			<strong class="fialova"> <%=listCom.get(i).getUser()%> - <%=listCom.get(i).getDate().format(DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm"))%></strong><br>
			<i><%=listCom.get(i).getText()%></i><br> <br>
		</p>
		<%
			}
		%>
		<a
			href="comment.jsp?idPlayground=<%=request.getParameter("idPlayground")%>"
			class="doleva">Zobrazit všechny komentáře</a>
		<%
			}

			else {
		%>
		<p>
			Nejsou vloženy žádné komentáře, nový můžete přidat <a
				href="comment.jsp?idPlayground=<%=request.getParameter("idPlayground")%>">zde.</a>
			<%
				}
			%>
		</p>
	</div>

</body>
</html>