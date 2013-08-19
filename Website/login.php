<?php

$username = "";
$password = "";
$db_uname = "root";
$db_pw = "root";

$host = "localhost";
$db_name = "Hospital";
$tbl_name = "Staff";

// Connect to the local database and schema 'hospital'
$con = mysql_connect("$host", "$db_uname", "$db_pw") or die("Error: Cannot connect to MySQL Server");
mysql_select_db("$db_name")or die("Error: Cannot select database \"$db_name\"");
?>