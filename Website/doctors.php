<?php session_start();

if (isset($_SESSION['login'])) {
	
if ($_SESSION['uType'] != 'admin' && $_SESSION['uType'] != 'director' && $_SESSION['uType'] != 'doctor') {
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
<title>Starline - Doctors</title>
</head>
<body>
<div id="container">
	<?php include 'header.php'; ?>
	<?php include 'sidebar.php'; ?>
	<div id="mainContent" align="center">
    	<p>
        	<strong>
					<?php

					include 'login.php';
					
					  if(isset($_POST['update'])) 
					 { 
						 $updateOP = $_POST['operSel'];
						 $updateAsst = $_POST['asstSel'];
						 $update = mysql_query("UPDATE scheduledservices SET assistantID = '$updateAsst'  WHERE serviceNb = '$updateOP'") or die(mysql_error());
						 unset($_SESSION['update']);
					 } 
					 
					 else if(isset($_POST['cancel'])) 
					 {
						 $cancelop = $_POST['operSel'];
						 $cancel = mysql_query("DELETE FROM scheduledservices WHERE serviceNb = '$cancelop'") or die(mysql_error());
						 unset($_SESSION['cancel']);
					 }
					  
					 //Patient's List Table 					 	 
					if($_SESSION['uType'] == 'doctor')
					 {
						 $result = mysql_query("SELECT * FROM doctor_patient WHERE DoctorID = '$uID'");

						 echo "<h2>Your Patients List<br>$uName - ID#: $uID</h2><br>";
						 echo "<table border='2'>
									 <tr>	<th>Service Number</th>
											<th>Patient's Name</th>
											<th>Service</th>
											<th>Assistant ID</th>
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
									 <td width=\"150\">$data[8]</td>
									 <td width=\"150\">$data[9]</td>
								   </tr>");
										  
						 echo "</table>";
					 }//End of if statement
					 
					 elseif($_SESSION['uType'] == 'admin' || $_SESSION['uType'] == 'director')
					 {
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
					 }//End of elseif statement
					 
					 
				 
					 mysql_close($con);
					?>
			 <br><div align="right">
			 <form name="form" action="" method="post">
			 Service Number: <input name="operSel" id="operSel" type="text" size="10"/><br>
			 Assistant ID: <input name="asstSel" id="asstSel" type="text" size="10"/><br>
			 <input type="submit" name="update" value="Update"/>
			 <input type="submit" name="cancel" value="Cancel Operation"/>
			 </div>
			 </form>
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