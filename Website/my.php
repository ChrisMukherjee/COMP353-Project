<?php

session_start();

//check whether login or not; if not, go to the login field

if(!isset($_SESSION['userid']))
{
	echo "You did not login";
   
}
//connect to the local database and schema'hospital'

$link = mysql_connect('localhost','root',''); 
mysql_select_db('hospital');


$userid = $_SESSION['userid'];
$username = $_SESSION['username'];
$user_query = mysql_query("select * from staff where uid=$userid limit 1");
$row = mysql_fetch_array($user_query);
echo 'Info£º<br />';
echo 'ID£º',$userid,'<br />';
echo 'name£º',$username,'<br />';
echo '<a href="login.php?action=logout">logout</a> login<br />';

?>

<html>
Hi
</html>