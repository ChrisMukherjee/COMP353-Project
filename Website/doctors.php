<?php session_start(); ?>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--Favicon (favorite icon)-->
<link rel="icon" type="image/ico" href="/images/tdxicon.ico"/>
<!--Normalize CSS-->
<link rel="stylesheet" type="text/css" href="/normalize.css" />
<!--External CSS-->
<link href="styles.css" rel="stylesheet" type="text/css" /><!--[if IE 5]>
<style type="text/css"> 
/* place css box model fixes for IE 5* in this conditional comment */
#sidebar1 { width: 230px; }
</style>
<![endif]--><!--[if IE]>
<style type="text/css"> 
/* place css fixes for all versions of IE in this conditional comment */
#sidebar1 { padding-top: 30px; }
#mainContent { zoom: 1; }
/* the above proprietary zoom property gives IE the hasLayout it needs to avoid several bugs */
</style>
<![endif]-->
<title>Starline - Doctor</title>
</head>

<body>
<!-- begin #container -->
<div id="container">
	<!--Include the Website Header-->
	<?php include 'header.php'; ?>
	<!--Include the Website Sidebar-->
	<?php include 'sidebar.php'; ?>
	<?php include 'logout.php'; ?>
    <!-- begin #mainContent -->
    <div id="mainContent">
    	<p>
        	<strong>
					<?php

					 include 'login.php';
					 include 'gettables.php';
					
					 if (mysql_error())
					  {
					  echo "Failed to connect to MySQL: " . mysql_error();
					  }

					//$result = mysql_query("SELECT * FROM Doctors_View");
				
					
					
					
					/*
					echo "<table border='1'>
					<tr>
					<th>Staff ID</th>
					<th>Name</th>
					<th>Specialty</th>
					<th>Visits</th>
					</tr>";
					*/
					
					//***************************************************
					/*
					$result = mysql_query("SHOW COLUMNS FROM users");
					if (!$result) 
					{
						echo 'Could not run query: ' . mysql_error();
						exit;
					}

					//  Scan through all the fields
					while ($field = mysql_fetch_object($result)) 
					{
						echo "$field->Field: <input type=\"text\" name=\"$field->Field\" size=\"40\" maxlength=\"256\" /><br>";
					}*/
					//***************************************************
						
					
					
					
					
					
					
					while($data = mysql_fetch_array($result)) {
						echo("<tr><td>$data[0]</td><td>$data[1]</td><td>$data[2]</td><td>$data[3]</td></tr>");
					 }
					  /*
					echo "</table>";
					*/
					mysql_close($con);

					?>
			</strong><br /><br />
		</p>
	</div>
    <!-- end #mainContent -->
	<br class="clearfloat" />
    <!--Include the Website Footer-->
	<?php include 'footer.php'; ?>
</div>
<!-- end #container -->
</body>
</html>

<?php
/*
else {
header("Location: login.php");
}
*/
?>