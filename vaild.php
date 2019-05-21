<?php

     include 'config.inc.php';
	 
	 // Check whether username or password is set from android	


 
	 if(isset($_POST['username']) )
     {
		  // Innitialize Variable
		  $result='';
		  $id='';
		  $username = $_POST['username'];
		  $prodno=0;
		  
		  
		  $sql2 = 'Select id FROM customer where username = :username';
		  $stmt2 = $conn->prepare($sql2);
		  $stmt2->bindParam(':username', $username, PDO::PARAM_STR);
          $stmt2->execute();
		  
		   $row2 = $stmt2->fetch(PDO::FETCH_ASSOC);
			foreach($row2 as $key => $value)
			{
				$id = $value;
				
			}
		  
		  // Query database for row exist or not
		  $sql =  'Select * FROM customer_purchase_log WHERE customer_id = :id' ;
          $stmt = $conn->prepare($sql);
		  $stmt->bindParam(':id', $id, PDO::PARAM_INT);
          $stmt->execute();
		   
	   
			
		while (  $row = $stmt->fetch(PDO::FETCH_ASSOC) ) {;
			
			foreach($row as $key => $value)
			{
				$prodno++;				
				echo "&".$value;
			
			}					
		}
			
		  // send result back to android
   		  echo $result;
  	}
	
?>