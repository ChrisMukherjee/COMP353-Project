<?php session_start(); ?>
<?php
// By Christopher Mukherjee
// PHP code to login registered users

if (!isset($_SESSION['login'])) {

if (isset($_POST["username"])) {
	if ($_POST["username"] != null && file_exists("members.txt")) {
		$username = $_POST["username"];
		$password = $_POST["password"];
		$file = fopen("members.txt", 'r');

		while(!feof($file)) {
			$line = fgets($file);
			$line = trim($line);
			if (empty($line)) {
				continue;
			}
			else {
				$array = explode("#", $line);
				if ($username == $array[0] && $password == $array[1]) {
					$_SESSION['login']=true;
					header('Location: index.php');
					fclose($file);
					break;
				}
			}
		}
		fclose($file);
	}
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<!--Favicon (favorite icon)-->
<link rel="icon" type="image/ico" href="/images/tdxicon.ico"/>
<!--Normalize CSS-->
<link rel="stylesheet" type="text/css" href="/normalize.css" />
<!--External CSS-->
<link rel="stylesheet" type="text/css" href="/style.css" />
<title>Starline Login</title>
</head>

<body>


</body>
</html>
