<?php session_start();
// If the logout variable has been retrieved using the GET method:
if (isset($_GET['logout'])) 
{
	// Get logout value
	$logout = $_GET['logout'];
	
	// If logout is equal to 99, logout the user by destroying the session
	if ($logout == 99) 
	{
		 session_destroy();
		 unset($_SESSION['login']);
	}
}

if (!isset($_SESSION['login'])) 
{
	if (isset($_POST["username"])) 
	{
	 //Include login credentials for the MySQL Server
	 include 'login.php';
			
	 //Gets user name and password from user
	 $username = $_POST['username'];
	 $password = $_POST['password'];

	 // To protect MySQL injection
	 $username = stripslashes($username);
	 $password = stripslashes($password);
	 $username = mysql_real_escape_string($username);
	 $password = mysql_real_escape_string($password);
	 
	 $sql="SELECT * FROM $tbl_name WHERE staffID = '$username' and password = '$password'";
	 $result = mysql_query($sql) or die ('Unable to run query: '.mysql_error());
	 $count = mysql_num_rows($result);
	
	 $_SESSION['uID'] = $username;
     // Login successful
	 if($count == 1) {
	 
		 //Counts the number of times "staffID" appears in each table (should only be 1 ID in 1 table)
		 $adm="SELECT * FROM administrators WHERE staffID='$username'";
		 $admCount = mysql_num_rows(mysql_query($adm));
		
		 $dir="SELECT * FROM director WHERE staffID='$username'";
		 $dirCount = mysql_num_rows(mysql_query($dir));
		
		 $res="SELECT * FROM residents WHERE staffID='$username'";
		 $resCount = mysql_num_rows(mysql_query($res));
		
		 $int="SELECT * FROM interns WHERE staffID='$username'";
		 $intCount = mysql_num_rows(mysql_query($int));
		
		 $doc="SELECT * FROM doctor WHERE staffID='$username'";
		 $docCount = mysql_num_rows(mysql_query($doc));
		
		 $nur="SELECT * FROM nurses WHERE staffID='$username' AND isShiftSupervisor = 0";
		 $nurCount = mysql_num_rows(mysql_query($nur));
		
		 $sup="SELECT * FROM nurses WHERE staffID='$username' AND isShiftSupervisor = 1";
		 $supCount = mysql_num_rows(mysql_query($sup));
		 
		 //Gets Username's Name
		 $uName= mysql_query("SELECT name FROM staff WHERE staffID='$username'");
		 $row = mysql_fetch_assoc($uName);
		 		
		 //Determines which table has the "staffID" and redirects to the appropriate page
		 if($admCount >= 1)
		 {
			 $_SESSION['uType'] = 'admin';
			 $_SESSION['uName'] = $row['name'];
			 $_SESSION['login']=true;
			 header('Location: dir_admin.php');
			 exit;
		 }//End of administrators count
		
		 else if($dirCount >= 1)
		 {
			 $_SESSION['uType'] = 'director';
			 $_SESSION['uName'] = $row['name'];
			 $_SESSION['login']=true;
		     header('Location: dir_admin.php');
		 	 exit;
		 }//End of director count
		
		 else if($resCount >= 1)
		 {
			 $_SESSION['uType'] = 'resident';
			 $_SESSION['uName'] = $row['name'];
			 $_SESSION['login']=true;
			 header('Location: res_int.php');
			 exit;
		 }//End of residents count
		
		 else if($intCount >= 1)
		 {
			 $_SESSION['uType'] = 'intern';
			 $_SESSION['uName'] = $row['name'];
			 $_SESSION['login']=true;
			 header('Location: res_int.php');
			 exit;
		 }//End of interns count
		
		 else if($docCount >= 1)
		 {
			 $_SESSION['uType'] = 'doctor';
			 $_SESSION['uName'] = $row['name'];
			 $_SESSION['login']=true;
			 header('Location: doctors.php');
			 exit;
		 }//End of doctor count
		
		 else if($nurCount >= 1)
		 {
			 $_SESSION['uType'] = 'nurse';
			 $_SESSION['uName'] = $row['name'];
			 $_SESSION['login']=true;
			 header('Location: nurses.php');
			 exit;
		 }//End of nurse count
		
		 else if($supCount >= 1)
		 {
			 $_SESSION['uType'] = 'supnurse';
			 $_SESSION['uName'] = $row['name'];
			 $_SESSION['login']=true;
			 header('Location: nurses_sup.php');
			 exit;
		 }//End of supervisor count
		
		 else
		 {
			 $_SESSION['uType'] = 'patient';
			 $_SESSION['uName'] = $row['name'];
			 $_SESSION['login']=true;
			 header('Location: patients.php');
			 exit;
		 }//End of default
	 }//End of if($count == 1)
	 
	 else if(isset($_POST['LoginAsPatient'])) 
	 {
		 $_SESSION['uType'] = 'patient';
		 $_SESSION['login']=true;
		 header('Location: patients.php');
	 }//End of else if(isset($_POST["Login as Patient"])) 

	 else 
	 {
		// Login unsuccessful
		//$_SESSION['uType'] = 'patient';
		$_SESSION['error']=true;
	 }//End of else

	 mysql_close($con);
}//End of if (isset($_POST["username"]))
?>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!--Favicon (favorite icon)-->
<link rel="icon" type="image/ico" href="/images/starlinelogo.ico"/>
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
<title>Starline - Login</title>
</head>

<body>
<div class="wrapper">
<!-- begin #container -->
<div id="container">
	<!--Include the Website Header-->
	<?php include 'header.php'; ?>
<!-- begin #mainContent -->
<h2><br/>Please login below to access the Starline Medical Center Database.<br/><br/></h2>
<form method="post" onsubmit="window.location.reload()" action="?">
<div class="loginLeft">
<table>
<tr>
<td>User ID:</td>
<td><input name="username" id="username" type="text" size="20"/></td>
</tr>
<tr>
<td>Password:</td>
<td><input name="password" id="password" type="password" size="20"/></td>
</tr>
<tr>
<td><input type="submit" value="Login"/></td>
</tr>
</table>
</div>
<div class="loginRight"><p>OR</p><input type="submit" value="Login as Patient" name="LoginAsPatient" style="width: 100px"></div>
<?php
if (isset($_SESSION['error'])) {
	echo '<div class="absolute"><p class="error"><br/><br/><br/><br/><br/>Error: Invalid username or password</p></div>';
	UNSET($_SESSION['error']);
}
?>
<p><br><br><br><br><br><br><br>Admin = 1<br>Director = 5<br>Intern = 4<br>Resident = 9<br>Doctor = 18<br>Nurse = 17<br>Sup Nurse = 19<br>
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
	header("Location: contact.php");
}
?>