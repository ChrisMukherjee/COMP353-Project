<?php session_start();

if (isset($_SESSION['login'])) 
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
<title>Starline - Patients</title>
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
<?php

					 include 'login.php';

					 //Patients Table
					 $result = mysql_query("SELECT * FROM viewpatients");
					 
					 echo "<h2>Patients' List</h2><br>";
					 echo "<table border='2'>
								 <tr>	<th>Patient Name</th>
										<th>Medicare Card #</th>
										<th>Symptoms/Treatment</th>
								 </tr>";

					 while($data = mysql_fetch_array($result)) 
					 	 echo("<tr>
								 <td width=\"150\">$data[0]</td>
								 <td width=\"150\">$data[1]</td>
								 <td width=\"150\">$data[2]</td>
							   </tr>");
					 					  
					 echo "</table>";
				 
					 mysql_close($con);
?>
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
else {
header("Location: index.php");
}
?>