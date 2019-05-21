<?php

     include 'config.inc.php';
	 
	 // Check whether username or password is set from android	

 
	 if(isset($_POST["username"]) )
     {
		  // Innitialize Variable
		  $result='';
		  $username = $_POST['username'];
		  // Query database for row exist or not
		  $sql =  'Select balance,score FROM customer WHERE username = :username' ;
          $stmt = $conn->prepare($sql);
		  $stmt->bindParam(':username', $username, PDO::PARAM_STR);
          $stmt->execute();

		  $row = $stmt->fetch(PDO::FETCH_ASSOC);
			foreach($row as $key => $value)
			{
			//	echo $value;
				
				echo "%".$value;
			}	
				

		  // send result back to android
   		  echo $result;
  	}
	
?>