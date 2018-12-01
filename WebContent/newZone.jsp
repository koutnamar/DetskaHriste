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
  background: #5375bd;
  border: none;
  padding: 10px;
  border-radius: 4px;
  transition: all .2s ease;
  outline: none;
  text-transform: uppercase;
  font-weight: 700;
  box-shadow: 5px 5px 0px 0px #BDBDBD;
}

.file-upload-btn:hover {
  background: #819ff7;
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
  border: 1px solid #5375bd;
  position: relative;
  background-color: #808484;
  border-color: #808484;
  border-radius: 20px;
  color: #D3D3D3; 
}

.image-dropping,
.image-upload-wrap:hover {
  background-color: #f0f0f0;
  border: 2px solid #ffffff;
  color: #3c3c3c;
}

.image-title-wrap {
  float: left;
  position: absolute;
  #padding: 0 15px 15px 15px;
  color: #222;
}


#.sedefoto1 {
#  background-color: #808484; 
#  width: 400px;
#  height: 250px;
#  float: left;
#  border-radius: 20px;
#  bird
#}

.drag-text {  
  text-align: center;
  height: 200px;  
   vertical-align:middle;
}

.drag-text span {
  font-weight: 100;
  font-style: italic;
  ###color: grey;
  padding: 100px 0;
  ###color: #D3D3D3;
}

.file-upload-image {
  max-height: 200px;
  max-width: 200px;
  margin: auto;
  pading: 20px;
}

.remove-image {
  width: 200px;
  margin: 0;
  color: #fff;
  background: #cd4535;
  border: none;
  padding: 10px;
  border-radius: 4px;
  box-shadow: 5px 5px 0px 0px #BDBDBD;
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
  #text-transform: uppercase;
  font-weight: 700;
}

.submit-btn:hover {
  background: #1AA059 ;
  color: #ffffff;
  transition: all .2s ease;
  cursor: pointer;
}

.submit-btn-btn:active {
  border: 0;
  transition: all .2s ease;
}

.plus2 {
  background-color: #3ed78e;
  border-radius: 20px;
  width: 40px;
  height: 40px;
  float: right;
  margin: 10px 10px 30px 80px;
  border:none;
}

.minus2 {
  background-color: red;
  border-radius: 20px;
  width: 40px;
  height: 40px;
  float: right;
  margin: 10px 10px 30px 130px;
  border:none;
}

.tabNoveHriste {
  background-color: #CEE3F6;
  width: 450 px;
  border:none;
  align:center;
}

.tabNoveHriste tr{
  background-color: #CEE3F6;
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
			  <div id="image-upload-wrap__main" class="image-upload-wrap">
			     <input id="file-upload-input__main" class="file-upload-input" type='file' onchange="readURL(this,'main');" accept="image/*" name="imageMain"/>  
			    <div class="drag-text">
			      <button class="plus2" alt="Přidat hlavní obrázek" onclick="$('#file-upload-input__main').trigger( 'click' )">+</button>
			      <span>Přetáhni obrázek zde, nebo použij tlačítko "+"</span>
			    </div>			    
			  </div>
			  <div id="file-upload-content__main" class="file-upload-content">
			    <div id="image-title-wrap__main"class="image-title-wrap">
			      <button type="button" onclick="removeUpload('main')" class="minus2">-</button>
			    </div>			    
			    <img id="file-upload-image__main" class="file-upload-image" src="#" alt="Váš obrázek ...">
			    </img>

			  </div>
			</div>
			<div class="file-upload">
			  <div id="image-upload-wrap__next1" class="image-upload-wrap">
			    <input id="file-upload-input__next1" class="file-upload-input" type='file' onchange="readURL(this,'next1');" accept="image/*" name="imageNext1"/>
			    <div class="drag-text">
			      <button class="plus2" alt="Přidat další obrázek" onclick="$('#file-upload-input__next1').trigger( 'click' )">+</button>
			      <span>Přetáhni obrázek zde, nebo použij tlačítko "+"</span>
			    </div>
			  </div>
			  <div id="file-upload-content__next1" class="file-upload-content">
			    <div id="image-title-wrap__next1"class="image-title-wrap">
			      <button type="button" onclick="removeUpload('next1')" class="minus2">-</button>
			    </div>
			    <img id="file-upload-image__next1" class="file-upload-image" src="#" alt="Váš obrázek ..." />

			  </div>
			</div>
			<div class="file-upload">
			  <div id="image-upload-wrap__next2" class="image-upload-wrap">
			    <input id="file-upload-input__next2" class="file-upload-input" type='file' onchange="readURL(this,'next2');" accept="image/*" name="imageNext2"/>
			    <div class="drag-text">
			      <button class="plus2" alt="Přidat další obrázek" onclick="$('#file-upload-input__next2').trigger( 'click' )">+</button>
			      <span>Přetáhni obrázek zde, nebo použij tlačítko "+"</span>
			    </div>
			  </div>
			  <div id="file-upload-content__next2" class="file-upload-content">
			  <div id="image-title-wrap__next2"class="image-title-wrap">
			      <button type="button" onclick="removeUpload('next2')" class="minus2">-</button>
			    </div>
			    <img id="file-upload-image__next2" class="file-upload-image" src="#" alt="Váš obrázek ..." />
			    
			  </div>
			</div>
		</div>
	    
	 
      <table class="tabNoveHriste" align="center">
        <tr>
          <td>Město:</td>
          <td>Ulice:</td>
        </tr>
        <tr>
          <td><input type="text" name="city" required></td>
          <td><input type="text" name ="street" required></td>
        </tr>
        <tr>
          <td colspan="2">Dopravní dostupnost:</td>
        </tr>
        <tr>
          <td colspan="2"><input type="text" name="traffic" required></td>
        </tr>
        <tr>
          <td colspan="2">GPS souřadnice:</td>
        </tr>
        <tr>
          <td><input type="text" name="latitude"></td>
          <td><input type="text" name = "longitude"></td>
        </tr>
        <tr>
          <td colspan="2">Otevírací doba:</td>
        </tr>
        <tr>
          <td colspan="2"><input type="text" name="open" required></td>
        </tr>
        </div> 
      </table>
       
      <div align ="center">
      <button type="submit" name="action" value="newZone">Uložit nové hřiště</button>
      </div>
    </form>
  </body>
</html>