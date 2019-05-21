<?php

     include 'config.inc.php';
	 
	 // Check whether username or password is set from android	


 
	 if(isset($_POST['username']) )
     {
		  // Innitialize Variable
		  $result='';
		  $id='';
		  $num=0;
		  $username = $_POST['username'];
		
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
		  $sql =  'Select id , status FROM membership_card WHERE customer_id = :id' ;
          $stmt = $conn->prepare($sql);
		  $stmt->bindParam(':id', $id, PDO::PARAM_INT);
          $stmt->execute();
		   
	   
			
		while (  $row = $stmt->fetch(PDO::FETCH_ASSOC) ) {;
			
			foreach($row as $key => $value)
			{
				
				echo '%'.$value;
								
			}	

		}
			
		  // send result back to android
   		  echo $result;
  	}
	
?>