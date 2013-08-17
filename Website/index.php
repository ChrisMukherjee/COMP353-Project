<?php session_start();

// If the logout variable has been retrieved using the GET method:
if (isset($_GET["logout"])) {
	// Get logout value
	$logout = $_GET['logout'];
	// If logout is equal to 99, logout the user by destroying the session
	if ($logout == 99) {
		session_destroy();
		unset($_SESSION["login"]);
	}
}

include 'login.php';

if (!isset($_SESSION['login'])) {

if (isset($_POST["username"])) {

$username = $_POST['username'];
$password = $_POST['password'];

// To protect MySQL injection
$username = stripslashes($username);
$password = stripslashes($password);
$username = mysql_real_escape_string($username);
$password = mysql_real_escape_string($password);
$sql="SELECT * FROM $tbl_name WHERE staffID='$username' and password='$password'";
$result = mysql_query($sql) or die ('Unable to run query: '.mysql_error());

$count = mysql_num_rows($result);

if($count == 1) {
	// Login successful
	
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
	
	$nur="SELECT * FROM nurse WHERE staffID='$username'";
	$nurCount = mysql_num_rows(mysql_query($nur));
	
	$sup="SELECT * FROM supervisor WHERE staffID='$username'";
	$supCount = mysql_num_rows(mysql_query($sup));
	
	if($admCount >= 1){
	$_SESSION['userid'] = $result['staffID'];
	$_SESSION['login']=true;
	header('Location: dir_admin.php');
	exit;
	}//End of administrators count
	
	elseif($dirCount >= 1){
	$_SESSION['userid'] = $result['staffID'];
	$_SESSION['login']=true;
	header('Location: dir_admin.php');
	exit;
	}//End of director count
	
	elseif($resCount >= 1){
	$_SESSION['userid'] = $result['staffID'];
	$_SESSION['login']=true;
	header('Location: res_int.php');
	exit;
	}//End of residents count
	
	elseif($intCount >= 1){
	$_SESSION['userid'] = $result['staffID'];
	$_SESSION['login']=true;
	header('Location: res_int.php');
	exit;
	}//End of interns count
	
	elseif($docCount >= 1){
	$_SESSION['userid'] = $result['staffID'];
	$_SESSION['login']=true;
	header('Location: doctors.php');
	exit;
	}//End of doctor count
	
	elseif($nurCount >= 1){
	$_SESSION['userid'] = $result['staffID'];
	$_SESSION['login']=true;
	header('Location: nurses.php');
	exit;
	}//End of nurse count
	
	elseif($supCount >= 1){
	$_SESSION['userid'] = $result['staffID'];
	$_SESSION['login']=true;
	header('Location: nurses_sup.php');
	exit;
	}//End of supervisor count
	else{
	$_SESSION['userid'] = $result['staffID'];
	$_SESSION['login']=true;
	header('Location: patients.php');
	exit;
	}//End of default
}
else {
	// Login unsuccessful
	$_SESSION['error']=true;
}

mysql_close($con);
}
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
<title>Starline Login</title>
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
<div class="floatLeft">
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
<div class="floatRight"><p>OR</p><input type="submit" value="Login as Patient"></div>
</form>
<?php
if (isset($_SESSION['error'])) {
	echo "<p class=\"error\">Error: Invalid username or password</p>";
	UNSET($_SESSION['error']);
}
?>
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