﻿<?php session_start();

if (isset($_SESSION['login'])) {
if ($_SESSION['uType'] != 'admin' && $_SESSION['uType'] != 'director' && $_SESSION['uType'] != 'doctor' && $_SESSION['uType'] != 'supnurse' && $_SESSION['uType'] != 'nurse' && $_SESSION['uType'] != 'intern' && $_SESSION['uType'] != 'resident') {
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
<title>Starline - Doctors</title>
</head>
<body>
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

					 //Pay Table
					if($_SESSION['uType'] == 'nurse') {
						$result = mysql_query("SELECT * FROM viewpay WHERE Staff = '$uID'");
						 echo "<h2>Your Patients List<br>$uName - ID#: $uID</h2><br>";
						 while($data = mysql_fetch_array($result))
							 echo 'Years of Seniority: $data[1]<br/>';
						 	$sum = mysql_query("SELECT sum($data[3]) FROM viewpay WHERE Staff = '$uID'");
							echo 'Hours worked this week: $sum[0]';
						 echo "</table>";
					 }
					 elseif($_SESSION['uType'] == 'admin' || $_SESSION['uType'] == 'director') {
						 $result2 = mysql_query("SELECT * FROM doctor_patient");
						 echo "<h2>Doctors/Patients List<br>$uName - ID#: $uID</h2><br>";
						 echo "<table border='2'>
									 <tr>	<th>Doctor ID</th>
											<th>Doctor Name</th>
											<th>Service Number</th>
											<th>Patient's Name</th>
											<th>Service</th>
											<th>Assistant ID</th>
											<th>Date</th>
											<th>Start Time</th>
											<th>End Time</th>
											<th>Room Number</th>
									 </tr>";
						 while($data = mysql_fetch_array($result2))
							 echo("<tr>
									 <td width=\"100\">$data[0]</td>
									 <td width=\"150\">$data[1]</td>
									 <td width=\"150\">$data[2]</td>
									 <td width=\"150\">$data[3]</td>
									 <td width=\"150\">$data[4]</td>
									 <td width=\"150\">$data[5]</td>
									 <td width=\"150\">$data[6]</td>
									 <td width=\"150\">$data[7]</td>
									 <td width=\"150\">$data[8]</td>
									 <td width=\"150\">$data[9]</td>
								   </tr>");
						 echo "</table>";
					 }
					 mysql_close($con);
					?>
		</strong><br/><br/>
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