<?php

     include 'config.inc.php';
	 
	 // Check whether username or password is set from android	
	 if(isset($_POST['username']) )
     {
		  // Innitialize Variable
		  $balance=0;
		  $result='';
	   	  $price = $_POST['price'];
		  $pid = $_POST['pid'];
		  $username = $_POST['username'];
		  // Query database for row exist or not
		  
		  $sql0 = 'Select balance FROM customer where username = :username';
		  $stmt0 = $conn->prepare($sql0);
		  $stmt0->bindParam(':username', $username, PDO::PARAM_STR);
          $stmt0->execute();
		  $row2 = $stmt0->fetch(PDO::FETCH_ASSOC);
			foreach($row2 as $key => $value)
			{
				$balance = $value;	
			}
		 
		  $price = $balance - $price;
		  
		  $sql =  'UPDATE customer SET balance = :price WHERE username = :username' ;
          $stmt = $conn->prepare($sql);
          $stmt->bindParam(':price', $price, PDO::PARAM_STR);
		  $stmt->bindParam(':username', $username, PDO::PARAM_STR);
          $stmt->execute();
		  
		  $sql2 =  'UPDATE customer_purchase_log SET state = "Success" WHERE product_id = :pid  ';
		  $stmt2 = $conn->prepare($sql2);
		  $stmt2->bindParam(':pid', $pid, PDO::PARAM_STR);
		  $stmt2->execute();
		  
		  
		  
		  
		  
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
  	}
	
?>