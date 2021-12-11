<?php
$config['mysql']['host'] = "db";	// MySQL Server IP/Hostname
$config['mysql']['user'] = "root";		// MySQL Username.
$config['mysql']['pass'] = "$Rafa1234";		// MySQL Password.
$config['mysql']['name'] = "meh"; 		// MySQL Database name.

mysql_connect($config['mysql']['host'], $config['mysql']['user'], $config['mysql']['pass']) or die(mysql_error());
mysql_select_db($config['mysql']['name']) or die(mysql_error());
?>