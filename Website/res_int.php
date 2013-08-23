﻿<?php session_start();

if (isset($_SESSION['login'])) {
if ($_SESSION['uType'] != 'resident' && $_SESSION['uType'] != 'intern' && $_SESSION['uType'] != 'admin' && $_SESSION['uType'] != 'director' && $_SESSION['uType'] != 'doctor') {
	header("Location: index.php");
}
else {
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
<title>Starline - Interns/Residents</title>
</head>

<body>
<!-- begin #container -->
<div id="container">
<!--Include the Website Header-->
<?php include 'header.php'; ?>
<!--Include the Website Sidebar-->
<?php include 'sidebar.php'; ?>
<!-- begin #mainContent -->
<div id="mainContent" align="center">
    	<p>
        	<strong>
					<?php
					 include 'login.php';

					 //Intern Table
					 if ($_SESSION['uType'] == 'admin' || $_SESSION['uType'] == 'director' || $_SESSION['uType'] == 'doctor') {
						 $result = mysql_query("SELECT * FROM viewinterns");
					 echo "<h2>All Interns &amp; their Schedules</h2><br>";
					 echo "<table border='2'>
								 <tr>	<th>Staff ID</th>
										<th>Name</th>
										<th>Patient Name</th>
										<th>Service</th>
										<th>Date</th>
										<th>Start Time</th>
										<th>End Time</th>
										<th>Room Number</th>
								 </tr>";
					 while($data = mysql_fetch_array($result)) 
					 	 echo("<tr>
								 <td width=\"150\">$data[0]</td>
								 <td width=\"150\">$data[1]</td>
								 <td width=\"150\">$data[2]</td>
								 <td width=\"150\">$data[3]</td>
								 <td width=\"150\">$data[4]</td>
								 <td width=\"150\">$data[5]</td>
								 <td width=\"150\">$data[6]</td>
								 <td width=\"150\">$data[7]</td>
							   </tr>");
					 echo "</table>";

					 //Resident Table
					 $result2 = mysql_query("SELECT * FROM viewresidents");
					 echo "<br><br><br><br><br><hr><br>";
					 echo "<h2>All Residents &amp; their schedules</h2><br>";
					 echo "<table border='2'>
								 <tr>	<th>Staff ID</th>
										<th>Name</th>
										<th>Patient Name</th>
										<th>Service</th>
										<th>Date</th>
										<th>Start Time</th>
										<th>End Time</th>
										<th>Room Number</th>
								 </tr>";
					 while($data = mysql_fetch_array($result2)) 
					 	 echo("<tr>
								 <td width=\"150\">$data[0]</td>
								 <td width=\"150\">$data[1]</td>
								 <td width=\"150\">$data[2]</td>
								 <td width=\"150\">$data[3]</td>
								 <td width=\"150\">$data[4]</td>
								 <td width=\"150\">$data[5]</td>
								 <td width=\"150\">$data[6]</td>
								 <td width=\"150\">$data[7]</td>
							   </tr>");
					 echo "</table>";
					 }
					else if($_SESSION['uType'] == 'resident' || $_SESSION['uType'] == 'intern') {
						 $result = mysql_query("SELECT * FROM int_res_schedule  WHERE StaffID = '$uID'");
					 echo "<h2>Your Schedule<br>$uName - ID#: $uID</h2><br>";
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
								 <td width=\"150\">$data[2]</td>
								 <td width=\"150\">$data[3]</td>
								 <td width=\"150\">$data[4]</td>
								 <td width=\"150\">$data[5]</td>
								 <td width=\"150\">$data[6]</td>
								 <td width=\"150\">$data[7]</td>
							   </tr>");
					 echo "</table>";
					 }
					 mysql_close($con);
					?>
			</strong><br /><br />
		</p>
<!-- end #mainContent -->
</div>
<!-- end #container -->
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