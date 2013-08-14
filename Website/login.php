<?php session_start();
if (!isset($_SESSION['login'])) {

if (isset($_POST["username"])) {

$username = "";
$password = "";
$db_uname = "root";
$db_pw = "admin";

$host = "localhost";
$db_name = "hospital";
$tbl_name = "staff";

// Connect to the local database and schema 'hospital'
mysql_connect("$host", "$db_uname", "$db_pw") or die("Error: Cannot connect to MySQL Server");
mysql_select_db("$db_name")or die("Error: Cannot select database \"$db_name\"");

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
	echo $result['staffID']. " - ". $result['password'];
	// Login successful
	$_SESSION['userid'] = $result['staffID'];
	$_SESSION['login']=true;
	header('Location: index.php');
	exit;
}

else {
	// Login unsuccessful
	$_SESSION['error']=true;
}

}
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
<title>Starline Login</title>
</head>

<body>
<!-- begin #container -->
<div id="container">
	<!--Include the Website Header-->
	<?php include 'header.php'; ?>
    <!-- begin #mainContent -->
    	<p><br/>Please login below to access the Starline Medical Center Database</p>
		<br/>
<form method="post" onsubmit="window.location.reload()" action="?">
<table>
<tr>
<td>User ID:</td>
<td><input name="username" id="username" type="text" size="30"/></td>
</tr>
<tr>
<td>Password:</td>
<td><input name="password" id="password" type="password" size="30"/></td>
</tr>
<tr>
<td><input type="submit" value="Login"/>
	<input type="submit" value="Guest"/>
</td>
</tr>
</table>
</form>
<?php
if (isset($_SESSION['error'])) {
	echo '<p class="error">Error: Invalid username or password</p>';
	UNSET($_SESSION['error']);
}
?>
<!-- end #mainContent -->
	<br class="clearfloat" />
	<!--Include the Website Footer-->
	<?php include 'footer.php'; ?>
<!-- end #container -->
</body>
</html>
<?php
}
else {
header("Location: index.php");
}
?>