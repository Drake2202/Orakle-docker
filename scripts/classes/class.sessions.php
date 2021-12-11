<?php

class Sessions
{
    var $SessionId;
   
    public function __construct($sid)
    {
      session_start();
      $this->SessionId = $sid;
    }
   

   public function setData($key,$data){
      $_SESSION[$this->SessionId][$key] = $data;
   }
   

   public function getData($key){
      $data = (isset($_SESSION[$this->SessionId][$key])) ? $_SESSION[$this->SessionId][$key] : null ;
      return $data;
   }
   

   public function unsetData($key){
      $_SESSION[$this->SessionId][$key] = '';

      if($_SESSION[$this->SessionId][$key] == ''){
         return true;
      } else {
         return false;
      }
   }

   public function PurgeData(){

      $_SESSION = array();

      if (ini_get("session.use_cookies")) {
         $params = session_get_cookie_params();
         setcookie(session_name(), '', time() - 42000,
            $params["path"], $params["domain"],
            $params["secure"], $params["httponly"]
         );
      }

      // Finally, destroy the session.
      session_destroy();
   }

  
}
?>