<?php

     include 'config.inc.php';
	 
	 // Check whether username or password is set from android	


 
	 if(isset($_POST['username']) )
     {
		  // Innitialize Variable
		  $result='';
		  $number=0;
		  $username = $_POST['username'];
		  // Query database for row exist or not
		  $sql =  'Select name,description,price,stock FROM product WHERE stock >= :number' ;
          $stmt = $conn->prepare($sql);
		  $stmt->bindParam(':number', $number, PDO::PARAM_STR);
          $stmt->execute();
		   
			
		while (  $row = $stmt->fetch(PDO::FETCH_ASSOC) ) {
			
			foreach($row as $key => $value)
			{
				echo "%".$value;
				
				
				
			//	if ( $num == 3)
			//		$pid = 1;
				
			}					
		}
				
		  // send result back to android
   		  echo $result;
  	}
	
?>