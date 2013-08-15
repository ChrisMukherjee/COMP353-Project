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

    <!-- begin #mainContent -->
    <div id="mainContent">
    	<p>
        	<strong>
					<?php

					$username = "";
					$password = "";
					$db_uname = "root";
					$db_pw = "admin";

					$host = "localhost";
					$db_name = "hospital";
					$tbl_name = "staff";


					$con = mysql_connect("$host", "$db_uname", "$db_pw") or die("Error: Cannot connect to MySQL Server");
					mysql_select_db("$db_name")or die("Error: Cannot select database \"$db_name\"");
					// Check connection
					if (mysql_error())
					  {
					  echo "Failed to connect to MySQL: " . mysql_error();
					  }

					$result = mysql_query("SELECT * FROM staff INNER JOIN doctor WHERE staff.staffID = doctor.staffID");
					echo "<table border='1'>
					<tr>
					<th>Staff ID</th>
					<th>Name</th>
					<th>Specialty</th>
					<th>Visits</th>
					<th>Operaions</th>
					<th>Schedule</th>
					</tr>";

					while($row = mysql_fetch_array($result))
					  {
					  echo "<tr>";
					  echo "<td>" . $row['staffID'] . "</td>";
					  echo "<td>" . $row['name'] . "</td>";
					  echo "<td>" . $row['specialty'] . "</td>";
					  echo "<td>" . $row['visits'] . "</td>";
					  echo "<td>" . $row['operations'] . "</td>";
					  echo "<td>" . $row['Schedule'] . "</td>";
					  echo "</tr>";
					  }
					echo "</table>";

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