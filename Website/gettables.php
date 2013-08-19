<?php 
function getColoumn($table) { 
     $result = mysql_query("SHOW COLUMNS FROM ". $table); 
      if (!$result) { 
        echo 'Could not run query: ' . mysql_error(); 
      } 
      $fieldnames=array(); 
      if (mysql_num_rows($result) > 0) { 
        while ($row = mysql_fetch_assoc($result)) { 
          $fieldnames[] = $row['Field']; 
        } 
      } 

      return $fieldnames; 
} 
?>