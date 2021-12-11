<?php

require_once "class.encrypt.php";
require_once "class.mysqli.php";
require_once "define.db.php";
require_once "class.user.php";
require_once "class.sessions.php";

$decoder = new EnDecoder();
$EpixSQL = new EpixSQL(HOST,USERNAME,PASSWORD,DATABASE);

define("SESSIONID","923eh40uidghf");
global $Session;
$Session = new Sessions(SESSIONID);
$User = new User(SESSIONID);
$BAR = '<div id="aion-nav-bar">
            <ul class="left">
              <li id="aion-nav-bar-news" class="nav-bar-button"><a class="menu-button" href="/" ></a></li>
              <li id="aion-nav-bar-about" class="nav-bar-button"><a class="menu-button" href="https://www.facebook.com/AdventurOnline"></a></li>
            </ul>
            <ul class="right">
              <li id="aion-nav-bar-forums" class="nav-bar-button"> <a class="menu-button" href="#"></a></li>
              <li id="aion-nav-bar-services" class="nav-bar-button"><a class="menu-button" href="/store"></a></li>
            </ul>
            <div class="nav-bar-center-bottom"></div>
          </div>';
		  
$Access = $User->ReturnLevel($Session->getData("uid"));
$FBPOP = "
<div id='fanback'>
  <div id='fan-exit'></div>
  <div id='like-boxA'>
    <div id='TheBlogWidgets'></div>
    <div class='remove-borda'></div>
    <iframe allowtransparency='true' frameborder='0' scrolling='no' src='//www.facebook.com/plugins/likebox.php?href=https://www.facebook.com/AdventurOnline&width=402&height=255&colorscheme=dark&show_faces=true&show_border=false&stream=false&header=false'style='border: none; overflow: hidden; margin-top: -19px; width: 402px; height: 230px;'></iframe><center>
    </center>
  </div>
</div>
";
if($User->IsLogged()){
$NAVBAR = "<nav id='mainNav'>
			<ul class='inlineContainer'>
				<li class=><a href='/'>Home</a></li>
				<li><a href='/rank'>Best Players</a></li>
				<li><a href='/play'>Play</a></li>
				<li><a href='/store'>Store</a></li>
				<!--<li>
					<a>Menu</a>
					<ul class='submenu'>
						<li><a href='#'>Link #1</a></li>
						<li><a href='#'>Link #2</a></li>
						<li><a href='#'>Link #3</a></li>
						<li><a href='#'>Link #4</a></li>
						<li><a href='#'>Link #5</a></li>
					</ul>
				</li>-->
				<li id='userNavigation'>
					<div class='avatarWrap'>
						<img class='avatar' src='placeholders/35x35_avatar_index.jpg' alt='Avatar' />
					</div>
					<span class='username'>".$User->GetUsername($Session->getData("uid"))."</span>
					<ul class='submenu right'>
						<li><a href='/account'>Options</a></li>
						<li><a href='/logout'>Logout</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	";
$USER_PAY = "<input type='hidden' name='on0' value='Upgrade For User: ".$User->GetUsername($Session->getData("uid"))."'>";
}else{
$NAVBAR = "<nav id='mainNav'><ul class='inlineContainer'><li class=''><a href='/'>Login</a></li></ul></nav>";

}

$REPLACE = array("{NAVBAR}","{USER_PAY}","{BAR}","{RIGHTNAV}","{FBPOP}");
$VALUES = array($NAVBAR,$USER_PAY,$BAR,$RIGHTNAV,$FBPOP);
?>