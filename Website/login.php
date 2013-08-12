
<?php 
session_start();
if(!isset($_POST['submit']))
{
    exit('invalid!');
}
$username = $_POST['username'];
$password = $_POST['password'];

//connect to the local database and schema'hospital'
$link = mysql_connect('localhost','root',''); 
mysql_select_db('hospital');
//check the username and password


$check_query = mysql_query("select uid from staff where username='$username' and password='$password'  limit 1");
if($result = mysql_fetch_array($check_query))
{
    // success in login
    $_SESSION['username'] = $username;
    $_SESSION['userid'] = $result['uid'];
    echo $username,' Welcome <a href="my.php">Acoount</a><br />';
    echo 'click <a href="login.php?action=logout">logout</a> login <br />';
    exit;
} 
else {
    exit('cannot login. click <a href="javascript:history.back(-1);">go back </a> try again');
}




?>


