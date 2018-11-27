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
    <script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<style>
.main {
  background-color: #CEE3F6;
  width: 800px;
  margin: 0 auto;
  padding: 20px;
  text-align:center;
}
.file-upload {
  background-color: #CEE3F6;
  width: 200px;
  margin: 0 auto;
  padding: 20px;
  display: inline-block;
}

.file-upload-btn {
  width: 100%;
  width: 200px;
  margin: 0;
  color: #fff;
  background: #1FB264;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: 4px solid #15824B;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.file-upload-btn:hover {
  background: #1AA059;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.file-upload-btn:active {
  border: 0;
  transition: all .2s ease;
}

.file-upload-content {
  display: none;
  text-align: center;
}

.file-upload-input {
  position: absolute;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  outline: none;
  opacity: 0;
  cursor: pointer;
}

.image-upload-wrap {
  margin-top: 20px;
  border: 4px dashed #1FB264;
  position: relative;
}

.image-dropping,
.image-upload-wrap:hover {
  background-color: #1FB264;
  border: 4px dashed #ffffff;
}

.image-title-wrap {
  padding: 0 15px 15px 15px;
  color: #222;
}

.drag-text {
  text-align: center;
}

.drag-text h3 {
  font-weight: 100;
  text-transform: uppercase;
  color: #15824B;
  padding: 60px 0;
}

.file-upload-image {
  max-height: 200px;
  max-width: 200px;
  margin: auto;
  padding: 20px;
}

.remove-image {
  width: 200px;
  margin: 0;
  color: #fff;
  background: #cd4535;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: 4px solid #b02818;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.remove-image:hover {
  background: #c13b2a;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.remove-image:active {
  border: 0;
  transition: all .2s ease;
}

.submit {
  background-color: #ffffff;
  width: 800px;
  margin: 0 auto;
  text-align:center;
  padding: 20px;
}

.submit-btn {
  width: 600px;
  margin: 0 auto;  
  color: #fff;
  background: #1FB264;
  border: none;
  padding: 10px;
  border-radius: 4px;
  border-bottom: 4px solid #15824B;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
}

.submit-btn:hover {
  background: #1AA059;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.submit-btn-btn:active {
  border: 0;
  transition: all .2s ease;
}


</style>

<script>
function readURL(input, section) {
	  if (input.files && input.files[0]) {

	    var reader = new FileReader();

	    reader.onload = function(e) {
	      $('#image-upload-wrap__' + section).hide();

	      $('#file-upload-image__' + section).attr('src', e.target.result);
	      $('#file-upload-content__' + section).show();

	      $('#image-title__' + section).html(input.files[0].name);
	    };

	    reader.readAsDataURL(input.files[0]);

	  } else {
	    removeUpload();
	  }
	}

	function removeUpload(section) {
	  $('#file-upload-input__' + section).replaceWith($('#file-upload-input__' + section).clone());
	  $('#file-upload-content__' + section).hide();
	  $('#image-upload-wrap__' + section).show();
	}
	$('#image-upload-wrap__' + section).bind('dragover', function () {
			$('#image-upload-wrap__' + section).addClass('image-dropping');
		});
		$('#image-upload-wrap__' + section).bind('dragleave', function () {
			$('#image-upload-wrap__' + section).removeClass('image-dropping');
	});

</script>
  </head>
  <body>
    <a href="index.jsp" class="doprava">Hlavní stránka</a>
    <h1 align = "center"><strong>PŘIDEJTE NOVÉ HŘIŠTĚ</strong></h1>

    <form action="savePlayground" enctype="multipart/form-data" method="post">
		<div class="main">
			<div class="file-upload">
			  <button class="file-upload-btn" type="button" onclick="$('#file-upload-input__main').trigger( 'click' )">Přidat hlavní obrázek</button>
			
			  <div id="image-upload-wrap__main" class="image-upload-wrap">
			    <input id="file-upload-input__main" class="file-upload-input" type='file' onchange="readURL(this,'main');" accept="image/*" name="imageMain"/>
			    <div class="drag-text">
			      <h3>Přetáhni obrázek zde, nebo použij tlačítko "Přidat ..."</h3>
			    </div>
			  </div>
			  <div id="file-upload-content__main" class="file-upload-content">
			    <img id="file-upload-image__main" class="file-upload-image" src="#" alt="your image" />
			    <div id="image-title-wrap__main"class="image-title-wrap">
			      <button type="button" onclick="removeUpload('main')" class="remove-image">Odebrat</button>
			    </div>
			  </div>
			</div>
			<div class="file-upload">
			  <button class="file-upload-btn" type="button" onclick="$('#file-upload-input__next1').trigger( 'click' )">Přidat další obrázek</button>
			
			  <div id="image-upload-wrap__next1" class="image-upload-wrap">
			    <input id="file-upload-input__next1" class="file-upload-input" type='file' onchange="readURL(this,'next1');" accept="image/*" name="imageNext1"/>
			    <div class="drag-text">
			      <h3>Přetáhni obrázek zde, nebo použij tlačítko "Přidat ..."</h3>
			    </div>
			  </div>
			  <div id="file-upload-content__next1" class="file-upload-content">
			    <img id="file-upload-image__next1" class="file-upload-image" src="#" alt="your image" />
			    <div id="image-title-wrap__next1"class="image-title-wrap">
			      <button type="button" onclick="removeUpload('next1')" class="remove-image">Odebrat</button>
			    </div>
			  </div>
			</div>
			<div class="file-upload">
			  <button class="file-upload-btn" type="button" onclick="$('#file-upload-input__next2').trigger( 'click' )">Další obrázek</button>
			
			  <div id="image-upload-wrap__next2" class="image-upload-wrap">
			    <input id="file-upload-input__next2" class="file-upload-input" type='file' onchange="readURL(this,'next2');" accept="image/*" name="imageNext2"/>
			    <div class="drag-text">
			      <h3>Přetáhni obrázek zde, nebo použij tlačítko "Přidat ..."</h3>
			    </div>
			  </div>
			  <div id="file-upload-content__next2" class="file-upload-content">
			    <img id="file-upload-image__next2" class="file-upload-image" src="#" alt="your image" />
			    <div id="image-title-wrap__next2"class="image-title-wrap">
			      <button type="button" onclick="removeUpload('next2')" class="remove-image">Odebrat</button>
			    </div>
			  </div>
			</div>
		</div>
	    
	    <div class="clearfix"></div>
	    
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

      <table class="tabNoveHriste">
        <tr>
          <td>Město:</td>
          <td>Ulice:</td>
        </tr>
        <tr>
          <td><input type="text" name="city"></td>
          <td><input type="text" name ="street"></td>
        </tr>
        <tr>
          <td colspan="2">Dopravní dostupnost:</td>
        </tr>
        <tr>
          <td colspan="2"><input type="text" name="traffic"></td>
        </tr>
        <tr>
          <td colspan="2">GPS souřadnice:</td>
        </tr>
        <tr>
          <td><input type="text" name="latitude"></td>
          <td><input type="text" name = "longtitude"></td>
        </tr>
        <tr>
          <td colspan="2">Otevírací doba:</td>
        </tr>
        <tr>
          <td colspan="2"><input type="text" name="open"></td>
        </tr>
      </table>
      <button type="submit">Přidat nové hřiště</button>
    </form>
  </body>
</html>