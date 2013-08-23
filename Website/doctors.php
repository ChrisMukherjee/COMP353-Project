<?php session_start();

if (isset($_SESSION['login'])) {
if ($_SESSION['uType'] != 'admin' && $_SESSION['uType'] != 'director' && $_SESSION['uType'] != 'doctor') {
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

					  if(isset($_POST['update'])) { 
						 $updateop = $_POST['operSel'];
						 $updateAsst = $_POST['asstSel'];
						 $update = mysql_query("UPDATE scheduledservices SET assistantID = '$updateAsst' WHERE serviceNum = '$updateop'") or die(mysql_error());
						 unset($_POST['update']);
					 }
					 else if(isset($_POST['cancel'])) {
						 $cancelop = $_POST['cancelSel'];
						 $cancel = mysql_query("DELETE FROM scheduledservices WHERE serviceNum = '$cancelop'") or die(mysql_error());
						 unset($_POST['cancel']);
					 }
					 else if(isset($_POST['schedUpdate'])) {
						 $schedNew = $_POST['schedSel'];
						 if(isset($_POST['schedDate']) && $_POST['schedDate'] != "") {
							 $newDate = $_POST['schedDate'];
							 $update1 = mysql_query("UPDATE scheduledservices SET date = '$newDate' WHERE serviceNum = '$schedNew'") or die(mysql_error());
						 }
						 if(isset($_POST['schedSTime']) && $_POST['schedSTime'] != "") {
							 $newSTime = $_POST['schedSTime'];
							 $update2 = mysql_query("UPDATE scheduledservices SET startTime = '$newSTime' WHERE serviceNum = '$schedNew'") or die(mysql_error());
						 }
						 if(isset($_POST['schedETime']) && $_POST['schedETime'] != "") {
							 $newETime = $_POST['schedETime'];
							 $update3 = mysql_query("UPDATE scheduledservices SET endTime = '$newETime' WHERE serviceNum = '$schedNew'") or die(mysql_error());
						 }
						 if(isset($_POST['schedRoom']) && $_POST['schedRoom'] != "") {
							 $newRoom = $_POST['schedRoom'];
							 $update4 = mysql_query("UPDATE scheduledservices SET roomNumber = '$newRoom' WHERE serviceNum = '$schedNew'") or die(mysql_error());
						 }
						 unset($_POST['schedUpdate']);
					 }
					  
					 //Doctor Table
					if($_SESSION['uType'] == 'doctor') {
						 $result = mysql_query("SELECT * FROM doctor_patient WHERE DoctorID = '$uID'");
						 echo "<h2>Your Schedule<br>$uName - ID#: $uID</h2><br>";
						 echo "<table border='2'>
									 <tr>	<th>Service Number</th>
											<th>Service</th>
											<th>Patient's Name</th>
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
					 }
					 else if($_SESSION['uType'] == 'admin' || $_SESSION['uType'] == 'director') {
						 $result2 = mysql_query("SELECT * FROM doctor_patient");
						 echo "<h2>All Doctors &amp; their Schedules</h2><br>";
						 echo "<table border='2'>
									 <tr>	<th>Staff ID</th>
											<th>Name</th>
											<th>Service Number</th>
											<th>Service</th>
											<th>Patient's Name</th>
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
			 <br><div class="center">
<br><br><br><br><br><hr><br>
<?php
if($_SESSION['uType'] == 'doctor') {
?>
<form name="form" action="?" method="post">
<p class="spaced">Use the option below to select an intern or resident to work with you:</p>
<div class="centerTable">
<table style="margin: 0px auto;">
<tr>
<td class="center spaced">Service Number:</td>
<td class="center spaced"><input name="operSel" id="operSel" type="text" size="10"/></td>
</tr>
<tr>
<td class="center spaced">Assistant ID:</td>
<td class="center spaced"><input name="asstSel" id="asstSel" type="text" size="10"/></td>
</tr>
<tr>
<td class="center spaced"><input type="submit" name="update" value="Update"/></td>
</tr>
</table>
</div>
<div class="centerTable">
<p class="spaced"><br/>Use the option below to cancel a service:</p>
<table style="margin: 0px auto;">
<tr>
<td class="center spaced">Service Number:</td>
<td class="center spaced"><input name="cancelSel" id="cancelSel" type="text" size="10"/></td>
</tr>
<tr>
<td class="center spaced"><input type="submit" name="cancel" value="Cancel Operation"/></td>
</tr>
</table>
</div>
</form>
<?php
}
else if($_SESSION['uType'] == 'admin' || $_SESSION['uType'] == 'director') {
?>
<form name="form" action="?" method="post">
<p class="spaced">Use the option below to reschedule a service:</p>
<div class="centerTable">
<table style="margin: 0px auto;">
<tr>
<td class="center spaced">Service Number:</td>
<td class="center spaced"><input name="schedSel" id="schedSel" type="text" size="10"/></td>
</tr>
<tr>
<td class="center spaced">New date:</td>
<td class="center spaced"><input name="schedDate" id="schedDate" type="text" size="10"/></td>
</tr>
<tr>
<td class="center spaced">New start time:</td>
<td class="center spaced"><input name="schedSTime" id="schedSTime" type="text" size="10"/></td>
</tr>
<tr>
<td class="center spaced">New end time:</td>
<td class="center spaced"><input name="schedETime" id="schedETime" type="text" size="10"/></td>
</tr>
<tr>
<td class="center spaced">New room:</td>
<td class="center spaced"><input name="schedRoom" id="schedRoom" type="text" size="10"/></td>
</tr>
<tr>
<td class="center spaced"><input type="submit" name="schedUpdate" value="Update"/></td>
</tr>
</table>
</div>
</form>
<?php
}
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