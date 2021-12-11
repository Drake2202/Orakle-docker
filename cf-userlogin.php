<?php
	require('scripts/con_game.php');
	
	header('Content-type: text/xml');
	$USER = array(
		'NAME' => mysql_real_escape_string(stripslashes($_POST['unm'])),
		'PASS' => strtoupper(substr(hash('sha512', $_POST['pwd'].strtolower($_POST['unm'])), strlen($_POST['unm']), 17)),
		'REST' => mysql_real_escape_string(stripslashes($_POST['rtc']))
	);
	//if(!empty($USER['REST'])){
		if(!empty($USER['NAME'])){
			$sql = mysql_query("SELECT * FROM meh_users WHERE Username = '{$USER['NAME']}'");
			if(mysql_num_rows($sql) > 0){
				$sql2 = mysql_query("SELECT * FROM meh_users WHERE Username = '{$USER['NAME']}' AND Password = '{$USER['PASS']}'");
				if(mysql_num_rows($sql2) > 0){
					$CHAR = mysql_fetch_assoc($sql2);
					//if($CHAR['RestrictionCode'] ==  $USER['REST']) {
						if($CHAR['ActivationFlag'] > 0){
							$UPG_DATE = preg_replace('/\s+/', 'T', $CHAR['UpgradeExpire']); 
							$UPG = ($CHAR['UpgradeDays'] >= 0) ? 1 : 0;
							echo '<login bSuccess="1" userid="'.$CHAR['id'].'" iAccess="'.$CHAR['Access'].'" iUpg="16" iAge="'.$CHAR['Age'].'" sToken="'.$CHAR['Password'].'" dUpgExp="2013-08-15T19:59:00" iUpgDays="110" strEmail="viperbros@live.com" bCCOnly="0" dCreated="2008-10-26T13:31:00" strCountryCode="US">';

							$sql3 = mysql_query("SELECT * FROM meh_servers");
							if(mysql_num_rows($sql3) > 1){
								while($SERVER = mysql_fetch_assoc($sql3)){
									echo '<servers sName="'.$SERVER['Name'].'" sPort="'.$SERVER['Port'].'" sIP="'.$SERVER['IP'].'"  iCount="'.$SERVER['Count'].'" iMax="'.$SERVER['Max'].'" bOnline="'.$SERVER['Online'].'" iChat="'.$SERVER['Chat'].'" bUpg="'.$SERVER['Upgrade'].'" sLang="'.$SERVER['sLang'].'"/>';
								}
							} else {
								$SERVER = mysql_fetch_assoc($sql3);
								echo '<servers sName="'.$SERVER['Name'].'" sPort="'.$SERVER['Port'].'" sIP="'.$SERVER['IP'].'" iCount="'.$SERVER['Count'].'" iMax="'.$SERVER['Max'].'" bOnline="'.$SERVER['Online'].'" iChat="'.$SERVER['Chat'].'" bUpg="'.$SERVER['Upgrade'].'" sLang="'.$SERVER['sLang'].'"/>';
								echo '<servers sName="'.$SERVER['Name'].'" sPort="'.$SERVER['Port'].'" sIP="'.$SERVER['IP'].'" iCount="'.$SERVER['Count'].'" iMax="'.$SERVER['Max'].'" bOnline="'.$SERVER['Online'].'" iChat="'.$SERVER['Chat'].'" bUpg="'.$SERVER['Upgrade'].'" sLang="'.$SERVER['sLang'].'"/>';
							}
							echo "</login>";
						} else {
							echo '<login bSuccess="0" sMsg="You have been banned. If this is a mistake, please contact the support staff immeadiately."/>';
						}
					/*} else {
						echo '<login bSuccess="0" sMsg="Your alpha code did not work. If you think this is a mistake, tell a staff member."/>';
					}*/
				} else {
					echo '<login bSuccess="0" sMsg="The username and password you entered did not match. Please check the spelling and try again. OR Try pressing Ctrl+A and typing your information again"/>';
				}
			} else {
				echo '<login bSuccess="0" sMsg="The username you typed was not found. Please check the spelling and try again."/>';
			}
		} else {
			die('<login bSuccess="0" sMsg="Invalid Input"/>');
		}
	/*} else {
		die('<login bSuccess="0" sMsg="You must have an alpha code to login. If you do not have one, and you are lucky, one will be emailed to you."/>');
	}*/ 