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
<title>Starline - Director</title>
</head>

<body>
<!-- begin #container -->
<div id="container">
	<!--Include the Website Header-->
    	<!-- begin #header -->
    <div id="header">
    	<div id="logo">
        	Starline Medical Center
        </div>
        <div id="author">
        	
        </div>
</div>
	<!--Include the Website Sidebar-->
    <!-- begin #sidebar1 -->
    <div id="sidebar1">
		<br>
	    <h2>Home</h2>
        <ul>
            <li><a href="index.php">Home</a></li>
			<li><a href="contact.php">Contact Us</a></li>        
        </ul>
        <br /><br />
	
        <h2>Team Members</h2>
        <ul>
        	<li> Christopher Mukherjee<br />6291929</li>
            <li>Cheng Cheng <br />9718648</li>
            <li>Alexander Vissa<br />6335241</li>
            <li>Karim Kaidbey<br />6354726</li>
        </ul>
    </div>
    <!-- begin #mainContent -->
    <div id="mainContent">
   <p>
   <?php
$con = mysql_connect("localhost","root","");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("hospital", $con);

$result = mysql_query("SELECT * FROM staff");

echo "<table border='1'>
<tr>
<th>unitname</th>
<th>name</th>
</tr>";

while($row = mysql_fetch_array($result))
  {
  echo "<tr>";
  echo "<td>" . $row['unitName'] . "</td>";
  echo "<td>" . $row['name'] . "</td>";
  echo "</tr>";
  }
echo "</table>";

mysql_close($con);
?>
        
        
        
        
        </p>
    </div>
<!-- end #mainContent -->
</div>
<!-- end #container -->
<div class="push"></div>
</div>
<!--Include the Website Footer-->

</body>
</html>

