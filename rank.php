<?php include("config.php"); ?>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Orakle | Ranking</title>
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
<div id='mainbody' class='inlineContainer'>
<div class='leftColumn2 borderBox news'>
<div class='sectionHeader'>
<h1>Rankings</h1>
</div>
<br>
<div class="Rank">
<table class="table table-condensed">
<tbody>
<tr>
<td>Character Name</td>
<td>Level</td>
<td>Gold</td>
<td>Kami Koins</td>
<td>Kills</td>
<td>Deaths</td>
</tr>

<td>

<?php
			$result = mysql_query("SELECT Username FROM meh_users ORDER BY kills DESC LIMIT 10");
			while($rows = mysql_fetch_assoc($result)){					
				echo '<font color="#931F1F">'.$rows['Username'].'</font><br><br>';				
			}
		?></td>
<td>		
<?php
			$result = mysql_query("SELECT Level FROM meh_users ORDER BY kills DESC LIMIT 10");
			while($rows = mysql_fetch_assoc($result)){					
				echo ''.$rows['Level'].'<br><br>';				
			}
		?>
</td>		
<td><?php
			$result = mysql_query("SELECT Gold FROM meh_users ORDER BY kills DESC LIMIT 10");
			while($rows = mysql_fetch_assoc($result)){					
				echo ''.$rows['Gold'].'<br><br>';				
			}
		?>
</td>
<td><?php
			$result = mysql_query("SELECT Coins FROM meh_users ORDER BY kills DESC LIMIT 10");
			while($rows = mysql_fetch_assoc($result)){					
				echo ''.$rows['Coins'].'<br><br>';				
			}
		?>
		</td>
<td><?php
			$result = mysql_query("SELECT Kills FROM meh_users ORDER BY kills DESC LIMIT 10");
			while($rows = mysql_fetch_assoc($result)){					
				echo ''.$rows['Kills'].'<br><br>';				
			}
		?></td>
<td><?php
			$result = mysql_query("SELECT Deaths FROM meh_users ORDER BY kills DESC LIMIT 10");
			while($rows = mysql_fetch_assoc($result)){					
				echo ''.$rows['Deaths'].'<br><br>';				
			}
		?></td>	
</tbody>
</table>
</div>
<center>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
 
<ins class="adsbygoogle" style="display:inline-block;width:728px;height:90px" data-ad-client="ca-pub-2776420396696608" data-ad-slot="6013497576"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
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