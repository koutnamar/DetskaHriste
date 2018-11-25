<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="cz.czechitas.detskahriste.bean.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cz.czechitas.detskahriste.dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Komentáře</title>
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
	<br>
	<a href="detail.jsp" class="doprava">Detail hřiště</a>
	<h1 align="center">
		<strong>KOMENTÁŘE K HŘIŠTI Zednická, Ostrava</strong>
	</h1>
<%-- 	<form action="comment.jsp?idPlayground=<%=request.getParameter("idPlayground")%>" method="post" > --%>
	<form action="CommentServlet" method="post" >
		    <input type="hidden" name="idPlayground" value="<%=request.getParameter("idPlayground")%>" />
		    Jméno uživatele:
		    <br> 
		    <input type="text" value="Jméno/nick" class="seda" name="userField">
			<br> 
			Komentář:
			<br> 
			<input type="text" value="Přidejte text komentáře" id="koment" name="commentField"><br>
			<button type="submit" name="action" value="createComment">Odeslat komentář</button>
	</form>
	<jsp:useBean id="dao" class="cz.czechitas.detskahriste.dao.CommentDao"></jsp:useBean>
	

	<div>
		<h2>Komentáře</h2>
		<%
		ArrayList<Comment> listCom = dao.load(Long.valueOf(request.getParameter("idPlayground")));
		for (Comment s : listCom) {
	%>
	<p>
		<strong class="fialova">
		<%=s.getUser()%> - <%=s.getDate().format(DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm"))%></strong><br>
		<i><%=s.getText()%></i><br>
		<br>
	</p>
	<%}%>
	</div>
</body>
</html>