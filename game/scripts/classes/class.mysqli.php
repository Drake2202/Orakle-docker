<?php
	//MySQLi Class
	//Author: Epixors
	class EpixSQL{
		var $db;
		
		public function __construct($HOST,$USER,$PASS,$DATABASE){
			if($this->db = new mysqli($HOST,$USER,$PASS,$DATABASE)){
			 //Successfully connected
			} else {
			echo "yeah can't connect to database ;|";
			exit(0);
			}
		}

		
		public function ReturnDataArray($COLUMNS,$TABLE,$CLAUSE = null){
			 $COLUMNS = implode(",",$COLUMNS);
			
			if($stmt = $this->db->prepare("SELECT $COLUMNS FROM $TABLE $CLAUSE")){
			 $stmt->execute();
			 $meta = $stmt->result_metadata();

			 $results = null;
			 
			while ($field = $meta->fetch_field()) {
			  $parameters[] = &$row[$field->name];
			}

			call_user_func_array(array($stmt, 'bind_result'), $parameters);

			while ($stmt->fetch()) {
			  foreach($row as $key => $val) {
				$x[$key] = $val;
			  }
			  $results[] = $x;
			}

				return $results;
			}

		}
		
		public function ReturnData($COLUMN,$TABLE,$CLAUSE = null){
		 if($stmt = $this->db->prepare("SELECT $COLUMN FROM $TABLE $CLAUSE")){
		  $stmt->execute();
		  $stmt->bind_result($result);
		  $stmt->fetch();
		  
		  return $result;
		 } else {
		  return NULL;
		 }
		}
		
		public function DeleteData($table,$clause){
   if($stmt = $this->db->prepare("DELETE FROM $table $clause")){
    $stmt->execute();
    
   } 
   
  } 
		
		public function UpdateData($TABLE,$COLUMN,$VALUE,$CLAUSE = null){
		 if($stmt = $this->db->prepare("UPDATE $TABLE SET $COLUMN=$VALUE $CLAUSE")){
		  $stmt->execute();
		 } else {
		  return null;
		 }
		
		}
		
		public function UpdataData($data,$table,$clause = null){
   //Gonna do this a bit ugly style
   
   $i = 0;
   foreach($data as $key => $value){
    $i++;
	
	if($i != count($data)){
    $string .= $key."='".$value."', ";
	} else {
	$string .= $key."='".$value."'";
	}
   }
   
   if($stmt = $this->db->prepare("UPDATE $table SET $string $clause")){
    $stmt->execute();
   } 
  } 
		
		public function InsertData($datas,$table){

		   
		   //Loop over the array of arrays (we accept multiple rows for insertion)
		   foreach($datas as $data){
			//Get the columns
			$columns = implode(",",array_keys($data));
			//Get the values

			foreach($data as $key => $value){
			 $data[$key] = $this->db->real_escape_string($value);
			}
	      
			$values = implode("','",$data);
			
			
			//Note: It's possible to use real_escape_string when handling with specific user input but it's not great for this method, thus we are not using it
			//Remember to wrap the values in quote's else poop can go wrong!
			
			if($stmt = $this->db->prepare("INSERT INTO $table($columns) VALUES ("."'"."$values"."'".")")){
			 $stmt->execute();
			 $stmt->close();
			 
			}
		   
		   }
		   
		  } 


	}

	?>