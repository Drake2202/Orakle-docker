<?php include("config.php"); ?>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Orakle | Home</title>
<link rel="shortcut icon" href="/templates/images/favicon.ico"/>
<link rel="stylesheet" href="/templates/css/styles.css?A22">
<link rel="stylesheet" href="/templates/css/colorbox.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script>
</head>
<body style="background: url(/templates/images/header.png) no-repeat top center #000000;">
<header id="header" style="padding-top: 55px;margin-bottom: 55px;margin-top: 55px;"></header>
<div id="content" class='mainWidth'>
<nav id='mainNav'>
<ul class='inlineContainer'>
<li><a href='/'>Home</a></li>
<li><a href='register.php'>Register</a></li>
<li><a href='/rank'>Best Players</a></li>
<li><a href='/play'>Play</a></li>
<li><a href='/store'>Store</a></li>
<li id='userNavigation'>
<a>Account</a>
<ul class='submenu right'>
<li><a href='/account'>Options</a></li>
<li><a href='/logout'>Logout</a></li>
</ul>
</li>
</ul>
</nav>
<div id='slidebox'>
<div class='inner'>
<div class='left'></div>
<div class='right'></div>
<div class='images'>
<div class='slideImage'>
<img src='/templates/images/placeholders/slide-1.png' alt='Play through all NEW quests and stories!'/>
<a href='/play'></a>
</div>
<div class='slideImage'>
<img src='/templates/images/placeholders/slide-3.png' alt='Adventure to all NEW custom maps and areas! '/>
<a href='/play'></a>
</div>
</div>
<div class='caption'></div>
<a class='readMore generalButton'>Play Now</a>
</div>
</div>
<div id='mainbody'>
<div class='leftColumn2 borderBox news'>
<center>
</center>
 
<div class='sectionHeader'>
<h1>News</h1>
 
</div>
<br/>
<?php
			$result = mysql_query("SELECT * FROM web_designnotes ORDER BY id DESC");
			while($rows = mysql_fetch_assoc($result)){
			    echo '<article class="inline_container">';				
				echo '<div class="detai_ls">';
			    echo '<div class="my_class">';
				echo '<img src="templates/images/avatars/'.$rows['strAvatar'].'.png" />';
                echo '</div>';
                echo '</div>';								
				echo '<div class="post borderBox">';			
				echo '<h2>'.$rows['strTitle'].'</h2>';
                echo '<br>';					
                echo 'Posted on: ';			
				echo ''.$rows['strDate'].'';
				echo ' by ';	
				echo ''.$rows['strAuthor'].'';	
                echo '<br>';
				echo '<p>';
				echo '<h5>'.$rows['strContent'].$rows['strDate'].'</h5>';
				echo '</p>';
                echo '<br>';					
                echo '</div>';
                echo '</article>';													
			}
		?>
<br/>
<center>
</center>
</div>
</div>
<div class="footer">
<div class="footerContent">
<div class="col-11">
<p>Orakle / <a href="/play">Play</a> / <a href="/register">Register</a></p>
</div>
<div class="col-1">
</div>
</div>
</div>
</div>
<script type="text/javascript" src="/templates/js/error.js"></script>
<script type="text/javascript" src='/templates/js/slider.js'></script>
</body>
</html>