<?php

 class User{
  
  public $SESSIONID;
  
  public function __construct($SESSIONID){
   $this->SESSIONID = $SESSIONID;
  }
  public function UserToken($username,$password){
    $username = strtolower($username);
	$str = hash("sha512", $password . $username);
	$len = strlen($username);

	return strtoupper(substr($str, $len, 17));
  }
  
  public function ReturnLevel($uid){
   global $EpixSQL;
   
   $AccessLevel = $EpixSQL->ReturnData("Access","meh_users","WHERE id='$uid'");
   
   if($AccessLevel <= 30){
    return "Normal";
   } else if($AccessLevel > 30 && $AccessLevel < 60){
    return "Mod";
   } else if($AccessLevel >= 60){
    return "Admin";
   } 
  }
  
  public function IsLogged(){
   global $Session;
   
   if($Session->getData("uid") != null){
    return true;
   } else {
    return false;
   }
  }
  
  public function GetUsername($id){
   global $EpixSQL;
   
   $Username = $EpixSQL->ReturnData("Username","meh_users","WHERE id='$id'");
   return $Username;
  }
 
 
 
 }
?>