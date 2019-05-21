<?php

     include 'config.inc.php';
	 
	 // Check whether username or password is set from android	

	 
	 

		  // Innitialize Variable
		  $result='';
	//	  $id = rand(1,1000000000);
		  $id = $_POST['id'];
		  $username = $_POST['username'];
		  $password = $_POST['password'];
		  // Query database for row exist or not
		  $sql =  'INSERT INTO customer ( id , username, password , balance ) VALUES ( :id , :username, :password ,  0 )' ;
          $stmt = $conn->prepare($sql);
		  $stmt->bindParam(':id', $id, PDO::PARAM_STR);
		  $stmt->bindParam(':username', $username, PDO::PARAM_STR);
		  $stmt->bindParam(':password', $password, PDO::PARAM_STR);
          $stmt->execute();
		  
		  
          if($stmt->rowCount())
          {
			 $result="true";	
          }  
          elseif(!$stmt->rowCount())
          {
			  	$result="false";
          }
		  
		  // send result back to android
   		  echo $result;
  	
	
?>