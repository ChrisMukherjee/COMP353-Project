<?php session_start();

//if (isset($_SESSION['login'])) {
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
<title>Starline - Doctor</title>
</head>

<body>

<div id="container">
	<?php include 'header.php'; ?>
	<?php include 'sidebar.php'; ?>

    <div id="mainContent">
    	<p>
        	<strong>
					<?php

					include 'login.php';
					 					
					 if (mysql_error())
					  {
					  echo "Failed to connect to MySQL: " . mysql_error();
					  }
					  
					 //Doctors Table 
					 $result = mysql_query("SELECT * FROM viewonlydoctors");

					 echo "<h2>Doctors Table</h2><br>";
					 echo "<table border='2'>
								 <tr>	<th>Staff ID</th>
										<th>Name</th>
										<th>Unit Name</th>
										<th>Salary</th>
										<th>Years</th>
										<th>Specialty</th>
										<th>Visits</th>
										<th>Operations</th>
								 </tr>";

					 while($data = mysql_fetch_array($result)) 
					 	 echo("<tr>
								 <td width=\"70\">$data[0]</td>
								 <td width=\"70\">$data[1]</td>
								 <td width=\"70\">$data[2]</td>
								 <td width=\"70\">$data[3]</td>
								 <td width=\"70\">$data[4]</td>
								 <td width=\"70\">$data[5]</td>
								 <td width=\"70\">$data[6]</td>
								 <td width=\"70\">$data[7]</td>
							   </tr>");
					 					  
					 echo "</table>";
					  
					 //Doctors/Interns/Residents Table
					 $result2 = mysql_query("SELECT * FROM viewdoctors");

					 echo "<br><br><br><br><br><hr><br>";
					 echo "<h2>Doctors / Interns / Residents</h2><br>";
					 echo "<table border='2'>
								 <tr>	<th>Staff ID</th>
										<th>Name</th>
										<th>Unit Name</th>
										<th>Salary</th>
										<th>Years</th>
										<th>Specialty</th>
										<th>Visits</th>
										<th>Operations</th>
								 </tr>";

					 while($data = mysql_fetch_array($result2)) 
					 	 echo("<tr>
								 <td width=\"70\">$data[0]</td>
								 <td width=\"70\">$data[1]</td>
								 <td width=\"70\">$data[2]</td>
								 <td width=\"70\">$data[3]</td>
								 <td width=\"70\">$data[4]</td>
								 <td width=\"70\">$data[5]</td>
								 <td width=\"70\">$data[6]</td>
								 <td width=\"70\">$data[7]</td>
							   </tr>");
					 					  
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