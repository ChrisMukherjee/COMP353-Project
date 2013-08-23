<?php session_start();

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

					 //Pay
					 if($_SESSION['uType'] == 'doctor')
						 echo "<h2>Your pay for this period (one week)<br>$uName - ID#: $uID</h2><br>";
					 else
					 	 echo "<h2>Your Pay for this period (two weeks)<br>$uName - ID#: $uID</h2><br>";

					echo '<br><hr><br><br><p class="spaced">';
					if($_SESSION['uType'] == 'nurse') {
						$base = 24.50;
						echo "Base Hourly Salary: \$$base<br/>";
						$years = mysql_query("SELECT numYears FROM staff WHERE staffID = '$uID'");
						 while($data1 = mysql_fetch_array($years)) {
						 	 $yearPay = $data1[0];
							 echo "Years of Seniority: $yearPay<br/>";
						 }
						$extra = mysql_query("SELECT overtimeHours, parttimeHours FROM nurses WHERE staffID = '$uID'");
						 while($data2 = mysql_fetch_array($extra)) {
							 if ($data2[0] == null)
							 	$data2[0] = 0;
							 if ($data2[1] == null)
							 	$data2[1] = 0;
							 $overtime = $data2[0];
							 $parttime = $data2[1];
							 echo "Overtime Hours: $overtime<br/>";
							 echo "Part Time Hours: $parttime<br/>";
						 }
						 $extraPay = ($overtime * (1.25 * $base)) + ($parttime * (1.25 * $base));
						 $raise = (floor($yearPay / 5)) * 1.50;
						 $sum = (($base + $raise) * 36) + $extraPay;
						 echo "This period's pay = \$$sum";
					 }
					 else if($_SESSION['uType'] == 'supnurse') {
						$base = 24.50;
						echo "Base Hourly Salary: \$$base<br/>";
						$years = mysql_query("SELECT numYears FROM staff WHERE staffID = '$uID'");
						 while($data1 = mysql_fetch_array($years)) {
						 	 $yearPay = $data1[0];
						 	 echo "Years of Seniority: $yearPay<br/>";
						 }
						$extra = mysql_query("SELECT overtimeHours, parttimeHours FROM nurses WHERE staffID = '$uID'");
						 while($data2 = mysql_fetch_array($extra)) {
							 if ($data2[0] == null)
							 	$data2[0] = 0;
							 if ($data2[1] == null)
							 	$data2[1] = 0;
							 $overtime = $data2[0];
							 $parttime = $data2[1];
							 echo "Overtime Hours: $overtime<br/>";
							 echo "Part Time Hours: $parttime<br/>";
						 }
						 $extraPay = ($overtime * (1.25 * $base)) + ($parttime * (1.25 * $base));
						 $raise = (floor($yearPay / 5)) * 1.50;
						 $sum = (($base + $raise + 3.25) * 36) + $extraPay;
						 echo "This period's pay = \$$sum";
					 }
					 else if($_SESSION['uType'] == 'admin') {
						 $seniors = mysql_query("SELECT seniorAdminID1, seniorAdminID2 FROM facility");
						 while($data1 = mysql_fetch_array($seniors)) {
						 	if($data1[0] == $uID || $data1[1] == $uID) {
						 	 $base = 98000;
							 $senior = true;
							}
							else {
						 	 $base = 78500;
							 $senior = false;
							}
					 	 }
						 echo "Base Hourly Salary: \$$base<br/>";
						$years = mysql_query("SELECT numYears FROM staff WHERE staffID = '$uID'");
						 while($data2 = mysql_fetch_array($years)) {
						 	 $yearPay = $data2[0];
						 	 echo "Years of Seniority: $yearPay<br/>";
						 }
						 if($senior == true)
					 		 $raise = pow(1.0115,$yearPay);
						 else
					 		 $raise = pow(1.01,$yearPay);					 
						 $sum = $base * $raise;
						 echo "This period's pay = \$$sum";
					 }
					 else if($_SESSION['uType'] == 'director') {
					 	 $base = 125000;
						 echo "Base Hourly Salary: \$$base<br/>";
						$years = mysql_query("SELECT numYears FROM staff WHERE staffID = '$uID'");
						 while($data2 = mysql_fetch_array($years)) {
						 	 $yearPay = $data2[0];
						 	 echo "Years of Seniority: $yearPay<br/>";
						 }
					 	 $raise = pow(1.015,$yearPay);
						 $sum = $base * $raise;
						 echo "This period's pay = \$$sum";
					 }
					  else if($_SESSION['uType'] == 'intern') {
					 	 $base = 40000;
						 $sum = $base;
						 echo "This period's pay = \$$sum";
					 }
					  else if($_SESSION['uType'] == 'resident') {
						$years = mysql_query("SELECT numYears FROM staff WHERE staffID = '$uID'");
						 while($data1 = mysql_fetch_array($years)) {
						 	 $yearPay = $data1[0];
							 if ($yearPay == 1)
							 	$base = 42000;
							 if ($yearPay == 2)
							 	$base = 44000;
							 if ($yearPay == 3)
							 	$base = 46000;
						 	 echo "Years of Seniority: $yearPay<br/>";
						 }
						 $sum = $base;
						 echo "This period's pay = \$$sum";
					 }
					  else if($_SESSION['uType'] == 'doctor') {
						$pays = mysql_query("SELECT visits, operations FROM doctor WHERE staffID = '$uID'");
						while($data1 = mysql_fetch_array($pays)) {
						 	 $visitNum = $data1[0];
							 $operationNum = $data1[1];
						 	 echo "Visits: $visitNum<br/>";
						 	 echo "Operations: $visitNum<br/>";
						 }
						 $sum = $visitNum * 1500 + $operation * 2000;
						 echo "This period's pay = \$$sum";
					 }

					 echo '</p>';
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