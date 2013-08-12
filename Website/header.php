	<!-- begin #header -->
    <div id="header">
    	<div id="logo">
        	Starline Medical Center
        </div>
        <div id="author">
        	
        </div>
<?php
$currpage = $_SERVER['PHP_SELF'];
if (strpos($currpage, 'login.php') == FALSE) {
echo '<div id="menu"><ul id="navlist">';
echo '<li id="active"><a href="index.php">Home</a></li>';
echo '<li id="active1"><a href="patients.php">Patients&Vistors</a></li>';
echo '<li id="active2"><a href="doctors.php">Doctors</a></li>';
echo '<li id="active3"><a href="interns.php">Residents&Interns</a></li>';
echo '<li id="active4"><a href="nurses.php">Nurses</a></li>';
echo '<li id="active5"><a href="contact.php">Contact Us</a></li>';
echo '</ul></div>'; }
?>
    </div>
    <!-- end #header -->