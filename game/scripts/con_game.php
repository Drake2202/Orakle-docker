<?php
	$MySQL = array(
		'HOSTNAME' => 'localhost', //Host name (Default: 'localhost')
		'USERNAME' => 'root', //MySQL Username (Default: 'root')
		'PASSWORD' => 'yourxampppasswordhere', //MySQL Password (Default: NULL)
		'DATABASE' => 'meh' //MySQL Database (Default: 'meh')
	);

	mysql_select_db($MySQL['DATABASE'], mysql_connect($MySQL['HOSTNAME'], $MySQL['USERNAME'], $MySQL['PASSWORD'])) or die('Error when connecting to the database, please check your "<i><b>scripts/MySQL_Connector.php</b></i>" to fix this problem.');