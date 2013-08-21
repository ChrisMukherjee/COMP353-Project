<?php session_start();

// ** THIS PAGE IS DONE! **

if (isset($_SESSION['login'])) {
include 'login.php';

if ($_SESSION['uType'] != 'resident' && $_SESSION['uType'] != 'intern' && $_SESSION['uType'] != 'admin' && $_SESSION['uType'] != 'director' && $_SESSION['uType'] != 'doctor') {
	header("Location: index.php");
}
else
{
?>

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
<title>Starline - Intern/Resident</title>
</head>

<body>
<!-- begin #container -->
<div id="container">
	<!--Include the Website Header-->
	<?php include 'header.php'; ?>
	<!--Include the Website Sidebar-->
	<?php include 'sidebar.php'; ?>
    <!-- begin #mainContent -->
    <div id="mainContent">
    	<p>
        	<strong>
					<?php

					 include 'login.php';
					 					
					 if (mysql_error())
					  {
					  echo "Failed to connect to MySQL: " . mysql_error();
					  }

					 //Intern Table
					 $result = mysql_query("SELECT * FROM int_res_schedule  WHERE staff = '$uID'");
					 
					 echo "<h2>Schedule<br> $uName - ID#: $uID</h2><br>";
					 echo "<table border='2'>
								 <tr>	<th>Patient Name</th>
										<th>Service</th>
										<th>Date</th>
										<th>Start Time</th>
										<th>End Time</th>
										<th>Room Number</th>
								 </tr>";

					 while($data = mysql_fetch_array($result)) 
					 	 echo("<tr>
								 <td width=\"90\">$data[1]</td>
								 <td width=\"90\">$data[2]</td>
								 <td width=\"90\">$data[3]</td>
								 <td width=\"90\">$data[4]</td>
								 <td width=\"90\">$data[5]</td>
								 <td width=\"90\">$data[6]</td>
							   </tr>");
					 					  
					 echo "</table>";
				 
					 mysql_close($con);
					?>
			</strong><br /><br />
		</p>
<!-- end #mainContent -->
</div>
<!-- end #container -->
<div class="push"></div>
</div>
<!--Include the Website Footer-->
<?php include 'footer.php'; ?>
</body>
</html>
<?php
}
}
else {
header("Location: index.php");
}
?>