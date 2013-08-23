<?php session_start();

if (isset($_SESSION['login'])) {
if ($_SESSION['uType'] != 'admin' && $_SESSION['uType'] != 'director') {
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

					  if(isset($_POST['add'])) { 
						 $servName = $_POST['serviceName'];
						 $unitName = $_POST['unitName'];
						 $servCost = $_POST['cost'];
						 $add = mysql_query("INSERT INTO services(serviceName, unitName, cost) values ('$servName', '$unitName', '$servCost')") or die(mysql_error());
						 unset($_POST['delete']);
					  }
					  else if(isset($_POST['delete'])) {
						 $del = $_POST['delNum'];
						 $delete = mysql_query("DELETE FROM services WHERE serviceID = '$del'") or die("Specified Service ID cannot be deleted because it is currently scheduled for one or more patients.");
						 unset($_POST['delete']);
					  }

					 //Services Table
					 $result = mysql_query("SELECT * FROM viewservices");
					 echo "<h2>All Directors</h2><br>";
					 echo "<table border='2'>
								 <tr>	<th>Service ID</th>
										<th>Service Name</th>
										<th>Unit Name</th>
										<th>Cost</th>
								 </tr>";
					 while($data = mysql_fetch_array($result)) 
					 	 echo("<tr>
								 <td width=\"150\">$data[0]</td>
								 <td width=\"150\">$data[1]</td>
								 <td width=\"150\">$data[2]</td>
								 <td width=\"150\">$data[3]</td>
							   </tr>");		  
					 echo "</table>";
					 mysql_close($con);
					?>
			 <br><div class="center">
<br><br><br><br><br><hr><br>
<form name="form" action="?" method="post">
<p class="spaced">Use the option below to add a service:</p>
<div class="centerTable">
<table style="margin: 0px auto;">
<tr>
<td class="center spaced">Service Name: <input name="serviceName" id="serviceName" type="text" size="10"/><br>
Unit Name: <input name="unitName" id="unitName" type="text" size="10"/><br>
Cost: <input name="cost" id="cost" type="text" size="10"/><br>
<input type="submit" name="add" value="Add"/></td>
</tr>
</table>
</div>
<div class="centerTable">
<p class="spaced"><br/>Use the option below to delete a service:</p>
<table style="margin: 0px auto;">
<tr>
<td class="center spaced">Service ID: <input name="delNum" id="delNum" type="text" size="10"/><br>
<input type="submit" name="delete" value="Delete"/></td>
</tr>
</table>
</div>
</form>
</div>
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