<?php

class Parser{
 
 function Parse($s,$r,$tf){
  $epix = file_get_contents($_SERVER['DOCUMENT_ROOT']."/templates/".$tf.".baka");
  $epix = str_replace($s,$r,$epix);
  
  return $epix;
 }
 
 function GParse($s,$r,$tf){
  $epix = file_get_contents($_SERVER['DOCUMENT_ROOT']."/templates/".$tf.".baka");
  $epix = str_replace($s,$r,$epix);
  
  return $epix;
 }
 
}

?>