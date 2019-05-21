<?php

     include 'config.inc.php';
	 
	 // Check whether username or password is set from android	


 
	 if(isset($_POST['username']) )
     {
		  // Innitialize Variable
		  $result='';
		  $id='';
		  $username = $_POST['username'];
		  $pid=1;
		  $pname='';
			$num=0;
		
		
		
		
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
				echo "%".$key." : ".$value;
				$result = "true";
				$num++;
				
			//	if ( $num == 3)
			//		$pid = 1;
				
			}					
		}
		
	/*	  $sql3 = 'Select name FROM product where id = :pid';
		  $stmt3 = $conn->prepare($sql3);
		  $stmt3->bindParam(':pid', $pid, PDO::PARAM_STR);
          $stmt3->execute();
		  
		   $row3 = $stmt3->fetch(PDO::FETCH_ASSOC);
			foreach($row3 as $key => $value)
			{
				$result += $value;
				
			}
		*/
		
		
		
		  // send result back to android
   		  echo $result;
  	}
	
?>