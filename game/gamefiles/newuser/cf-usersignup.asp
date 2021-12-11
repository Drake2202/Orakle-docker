<?php
	require('../scripts/con_game.php');
//IMPORTANT STUFF
$username = mysql_real_escape_string(stripslashes($_POST["strUsername"]));
$password = mysql_real_escape_string(stripslashes($_POST["strPassword"]));
$pass1 = gen_token($password, $username);
$age = mysql_real_escape_string(stripslashes($_POST["intAge"]));
$dob = mysql_real_escape_string(stripslashes($_POST["strDOB"]));
$email = mysql_real_escape_string(stripslashes($_POST["strEmail"]));
$gender = mysql_real_escape_string(stripslashes($_POST["strGender"]));
$classid = mysql_real_escape_string(stripslashes($_POST["ClassID"]));
$eyecolor = mysql_real_escape_string(stripslashes($_POST["intColorEye"]));
$skincolor = mysql_real_escape_string(stripslashes($_POST["intColorSkin"]));
$haircolor = mysql_real_escape_string(stripslashes($_POST["intColorHair"]));
$hairid = $_POST['HairID'];
$ip = $_SERVER['REMOTE_ADDR'];




//Checks if Email has Already been used
$emailcheck = mysql_query("SELECT id FROM meh_users WHERE Email='$email'") or die("status=Error&strReason=" . mysql_error());
if (mysql_num_rows($emailcheck) != 0) {
	die("status=Taken&strReason=The email is already in used by another user.");
}

//Checks If Username has been Taken
$sql = mysql_query("SELECT * FROM meh_users WHERE Username = '$username'") or die("status=Error&strReason=" . mysql_error());
if (mysql_num_rows($sql) !=0) {
	die("status=Taken&strReason=The username is already in use by another character.");
} else {

switch ($hairid) {
	//MALE HAIR
	case 52:
		$hairname = 'Default';
		$hairfile = 'hair/M/Default.swf';
		break;
	case 396:
		$hairname = 'MQElegant';
		$hairfile = 'hair/M/MQElegant.swf';
		break;
	case 55:
		$hairname = 'Goku1';
		$hairfile = 'hair/M/Goku1.swf';
		break;
	case 58:
		$hairname = 'Goku2';
		$hairfile = 'hair/M/Goku2.swf';
		break;
	case 92:
		$hairname = 'Ponytail8';
		$hairfile = 'hair/M/Ponytail8.swf';
		break;
	case 64:
		$hairname = 'Normal2';
		$hairfile = 'hair/M/Normal2.swf';
		break;
	case 349:
		$hairname = 'SuggestedHair';
		$hairfile = 'hair/M/SuggestedHair.swf';
		break;
	case 284:
		$hairname = 'SandBoy';
		$hairfile = 'hair/M/SandBoy.swf';
		break;
	case 383:
		$hairname = 'AQDemonHunter1';
		$hairfile = 'hair/M/AQDemonHunter1.swf';
		break;
	case 390:
		$hairname = 'DFWarStyle';
		$hairfile = 'hair/M/DFWarStyle.swf';
		break;
	case 275:
		$hairname = 'FauxHawk';
		$hairfile = 'hair/M/FauxHawk3.swf';
		break;
	case 398:
		$hairname = 'MQSwift';
		$hairfile = 'hair/M/MQSwift.swf';
		break;
	case 324:
		$hairname = 'Troll3Human';
		$hairfile = 'hair/M/Troll3Human.swf';
		break;	
	//FEMALE HAIR
	case 14:
		$hairname = 'Pig1Bangs1';
		$hairfile = 'hair/F/Pig1Bangs1.swf';
		break;
	case 18:
		$hairname = 'Pig2Bangs2';
		$hairfile = 'hair/F/Pig2Bangs2.swf';
		break;
	case 26:
		$hairname = 'Pony2Bangs2';
		$hairfile = 'hair/F/Pony2Bangs2.swf';
		break;
	case 83:
		$hairname = 'Bangs2Long';
		$hairfile = 'hair/F/Bangs2Long.swf';
		break;
	case 84:
		$hairname = 'Bangs3Long';
		$hairfile = 'hair/F/Bangs3Long.swf';
		break;
	case 285:
		$hairname = 'SandHairGirl';
		$hairfile = 'hair/F/SandHairGirl.swf';
		break;
	case 379:
		$hairname = 'MQGalaxyBuns';
		$hairfile = 'hair/F/MQGalaxyBuns.swf';
		break;
	case 375:
		$hairname = 'AQCasual';
		$hairfile = 'hair/F/AQCasual.swf';
		break;
	case 380:
		$hairname = 'MQRibbon';
		$hairfile = 'hair/F/MQRibbon.swf';
		break;
	case 277:
		$hairname = 'Dragonhawk';
		$hairfile = 'hair/F/Dragonhawk.swf';
		break;
	case 328:
		$hairname = 'TrollFem1HumanFix';
		$hairfile = 'hair/F/TrollFem1HumanFix.swf';
		break;
}
$time = date("Y-m-d");
//Inserts Character Info into DB
$randomString = substr(str_shuffle("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, 5);	
$sql2 = mysql_query("INSERT INTO `meh_users` (`Username`, `Password`, `Access`, `ActivationFlag`, `Age`, `Gender`, `Email`, `Level`, `Gold`, `Coins`, `Exp`, `ColorHair`, `ColorSkin`, `ColorEye`, `ColorBase`, `ColorTrim`, `ColorAccessory`, `DateCreated`, `UpgradeExpire`, `UpgradeDays`, `BankSlots`, `HouseSlots`, `BagSlots`, `HairID`, `HairFile`, `HairName`, `Permamute`, `Quests`, `Settings`, `Achievement`, `LastArea`, `Country`, `AchievementID`, `CurrentServer`, `ip`, `RestrictionCode`) VALUES ('$username', '$pass1', '0', '5', '15', '$gender', '$email', '1', '0', '1000', '0', '$haircolor', '$skincolor', '$eyecolor', '0', '0', '0', '$time', '$time', '-1', '20', '20', '150', '$hairid', '$hairfile', '$hairname', '0', '00000000000000000000000000000000000000000000000000', '0', '0', 'teleport-1|Enter|Spawn', 'US', '', 'Offline', '$ip', '$randomString');")  or die("status=Error&strReason=" . mysql_error());

//Selects New User ID
$sql3 = mysql_query("SELECT * FROM meh_users WHERE Username='$username'") or die("status=Error&strReason=" . mysql_error());
$user = mysql_fetch_assoc($sql3) or die("status=Error&strReason=" . mysql_error());
$userId = $user['id'];
$Level = $user['Level'];

//Add's Starting Armor
switch ($classid) {
	case 2:
		mysql_query("INSERT INTO meh_users_items (itemid, userid, equipped, equipment, level, enhid) VALUES ('2', '".$user['id']."', '1', 'ar', '1', '1')");//btnWarrior
		break;
	case 3:
		mysql_query("INSERT INTO meh_users_items (itemid, userid, equipped, equipment, level, enhid) VALUES ('3', '".$user['id']."', '1', 'ar', '1', '1')");//btnMage
		break;
	case 4:
		mysql_query("INSERT INTO meh_users_items (itemid, userid, equipped, equipment, level, enhid) VALUES ('4', '".$user['id']."', '1', 'ar', '1', '1')");//btnRogue
		break;
	case 5:
		mysql_query("INSERT INTO meh_users_items (itemid, userid, equipped, equipment, level, enhid) VALUES ('5', '".$user['id']."', '1', 'ar', '1', '1')");//btnHealer
		break;
	} 

// ADDS DEFAULT WEAPON 
$addweapon = mysql_query("INSERT INTO meh_users_items (itemid, userid, equipped, equipment, level, enhid) VALUES ('1', '$userId', '1', 'Weapon', '1','1')" );


//s$addclass = mysql_query("INSERT INTO meh_users_items (itemid, userid, equipped, equipment, level) VALUES ('2', '$userId', '1', 'ar', '1')" );
		
// ADDS USERS FRIEND LIST 
$addfriends = mysql_query("INSERT INTO meh_users_friends (userid, friends) VALUES ($userId, '')" );

// Start SESSION
$_SESSION['user_id'] 	= $userId;
$_SESSION['user_name'] 	= $username;
$_SESSION['user_level'] = $Level;
$_SESSION['signed_in'] = true;
$isLoged = 1;

//SUCCESS	
echo "status=Success";
/*
		require 'C:\Onedrive\php\phpmailer\PHPMailerAutoload.php';
		$mail = new PHPMailer;
		$mail->isSMTP();                                      // Set mailer to use SMTP
		$mail->Host = 'smtp.live.com';  // Specify main and backup SMTP servers
		$mail->SMTPAuth = true;                               // Enable SMTP authentication
		$mail->Username = 'bakalands@outlook.com';                 // SMTP username
		$mail->Password = 'Legend(^*!';                           // SMTP password
		$mail->SMTPSecure = 'tls';                            // Enable TLS encryption, `ssl` also accepted
		$mail->Port = 587;                                    // TCP port to connect to

		$mail->From = 'frombigdickdaddy@yomouth.com';
		$mail->FromName = 'Mailer';
		//$mail->addAddress('joe@example.net', 'Joe User');     // Add a recipient
		$mail->addAddress($email);               // Name is optional
		$mail->addReplyTo('NO-REPLY@example.com', 'Information');
		//$mail->addCC('cc@example.com');
		//$mail->addBCC('bcc@example.com');

		$mail->WordWrap = 50;                                 // Set word wrap to 50 characters
	//	$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
	//	$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name
		$mail->isHTML(true);                                  // Set email format to HTML

		$mail->Subject = 'Welcome to Orakle!';
		$mail->Body    = "<table cellpadding='0' cellspacing='0' border='0' style='margin:0 auto;background-color:#98989c;width:500px' align='center'>
			<tbody><tr>
				<td colspan='3' valign='top'>
					<table width='500' cellpadding='0px' style='margin:0 auto;border-spacing:0px'>
						<tbody><tr>
						</tr>
						<tr>
							<td><img border='0' src='http://imageshack.com/a/img540/9696/Zf6nwI.png' width='500' height='93' alt'></td>
						</tr>
					</tbody></table>
				</td>                
			</tr>
			<tr>
				<td valign='top' style='width:16px;border-left:1px solid #575641'>&nbsp;</td>
				<td valign='top' style='text-align:left;font-family:arial;font-size:13px'>
					<br>
					<h2>All hail {$username}, the world's greatest hero!</h2>
					<p>
					Welcome to Orakle! 
					Your free game account at Orakle has been successfully created. 
					Brandish your broadsword, conjure up your spells, and Battle On towards victory!
					</p>
					<p>
					User Name: {$username}<br>
					Password: {$password}<br>
					Date Created: {$time}<br>
					</p>
					<h2>New Adventures Every Week!</h2>
					<p>
					Brand new items, quests, monsters, zones, and features are added every week to Orakle. 
					Endless adventures await you and your friends in an ever-expanding world full of fantasy, magic, and ferocious monsters! 
					</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
				</td>
				<td valign='top' style='width:16px;border-right:1px solid #575641'>&nbsp;</td>
			</tr>
			<tr>
				<td colspan='3' valign='top' style='width:16px;border-bottom:1px solid #575641'></td>
			</tr>
		</tbody></table>
		";
		$mail->AltBody = "
	**************************************************
	**                                              **
	**             Welcome to Orakle!            **                                                                             
	**                                              **
	**************************************************

	Your free game account at Orakle has been successfully created. 
	Brandish your broadsword, conjure up your spells, and Battle On towards victory!

	  User Name: {$username}
	  Password: {$password}
	  Date Created:{$time}
		
		";
		$mail->send();
		
	*/	
}
function gen_token($pass, $salt) {
	$salt = strtolower($salt);
	$str = hash("sha512", $pass.$salt);
	$len = strlen($salt);
	return strtoupper(substr($str, $len, 17));
}
?>