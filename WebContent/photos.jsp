<%@page import="cz.czechitas.detskahriste.bean.Playground"%>
<%@page import="cz.czechitas.detskahriste.bean.Photo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cz.czechitas.detskahriste.dao.PhotoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Fotogalerie</title>
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
	<%
		if (request.getParameter("idPlayground") == null || request.getParameter("idPlayground").length() == 0) {
			pageContext.forward("/error.jsp");
			return;
		}
	%>

	<a href="index.jsp" class="doprava">Hlavní stránka</a>
	<br>
	<a
		href="detail.jsp?idPlayground=<%=request.getParameter("idPlayground")%>"
		class="doprava">Detail hřiště</a>
	<h1 align="center">
	
	<jsp:useBean id="playgroundDao" class="cz.czechitas.detskahriste.dao.PlaygroundDao"></jsp:useBean>
		<% Playground playground = playgroundDao.load(Long.parseLong(request.getParameter("idPlayground"))); %>
		
		<strong>FOTOGALERIE HŘIŠTĚ ul. <%=playground.getLocation().getStreet() %>, <%=playground.getLocation().getCity() %></strong>
	</h1>
	<div class="photocontainer" align="center">

		<jsp:useBean id="daoPhoto" class="cz.czechitas.detskahriste.dao.PhotoDao"></jsp:useBean>
		

		<%
			Long idPlayground = Long.parseLong(request.getParameter("idPlayground"));
			PhotoDao photoDao = new PhotoDao();
			ArrayList<Photo> photos = photoDao.load(idPlayground);
			if (photos != null && photos.size() > 0) {
				for (Photo photo : photos) {
		%>
		<div>
			<img src="DownloadPhoto?idPhoto=<%=photo.getIdPhoto()%>"
				alt="Dětská hřiště" width=50%>
		</div>
		<%
			}
			} else {%>
				<p> Pro dané hřiště nebyla uložena žádná fotografie.
				</p>
		<%	}
		%>

	</div>
</body>
</html>