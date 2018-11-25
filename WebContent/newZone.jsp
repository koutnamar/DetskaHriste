<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Přidat nové hřiště</title>
    <link rel="stylesheet" href="CSS/style.css">
    <link href="https://fonts.googleapis.com/css?family=Kanit:400,600,600i&amp;subset=latin-ext" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
  </head>
  <body>
    <a href="index.jsp" class="doprava">Hlavní stránka</a>
    <h1 align = "center"><strong>PŘIDEJTE NOVÉ HŘIŠTĚ</strong></h1>
    <div class="sedefoto1_container">
      <div class="sedefoto1">
        <button class="plus">+</button>
      </div>
      <div class="clearfix"></div>
      <button class="btnOdebrat">Odebrat</button>
    </div>
      
    <div class="sedefoto2_container">
    <div class="sedefoto2">
      <button class="plus">+</button>
    </div>
      <div class="clearfix"></div>
      <button class="btnOdebrat">Odebrat</button>
    </div>
    <div class="sedefoto2_container">
    <div class="sedefoto2">
      <button class="plus">+</button>
    </div>
      <div class="clearfix"></div>
      <button class="btnOdebrat">Odebrat</button>
    </div>
    <div class="clearfix"></div>
    <form action="">
      <table class="tabNoveHriste">
        <tr>
          <td>Město:</td>
          <td>Ulice:</td>
        </tr>
        <tr>
          <td><input type="text"></td>
          <td><input type="text"></td>
        </tr>
        <tr>
          <td colspan="2">Dopravní dostupnost:</td>
        </tr>
        <tr>
          <td colspan="2"><input type="text"></td>
        </tr>
        <tr>
          <td colspan="2">GPS souřadnice:</td>
        </tr>
        <tr>
          <td><input type="text"></td>
          <td><input type="text"></td>
        </tr>
        <tr>
          <td colspan="2">Otevírací doba:</td>
        </tr>
        <tr>
          <td colspan="2"><input type="text"></td>
        </tr>
      </table>
      <button type="submit">Přidat nové hřiště</button>
    </form>
  </body>
</html>