<?php

 require_once "classes/class.parser.php";
 require_once "classes/class.mysqli.php";
 require_once "classes/class.user.php";
 require_once "classes/class.sessions.php";
 require_once "classes/define.var.php";
 require_once "classes/define.db.php";
 
 global $parser,$EpixSQL,$User,$Session;
 
 $parser = new Parser();
 $EpixSQL = new EpixSQL(HOST,USERNAME,PASSWORD,DATABASE);
 $User = new User(SESSIONID);
 $Session = new Sessions(SESSIONID);
?>