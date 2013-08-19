	<!-- begin #header -->
    <div id="header">
    	<div id="logo">
        	Starline Medical Center
        </div>
        <div id="author">
        	
        </div>
<?php
$currpage = $_SERVER['PHP_SELF'];
if (strpos($currpage, 'index.php') == FALSE) {
	echo '<div class="floatRight whiteBack">';
	 if(isset($_SESSION['uName']))
	 	 echo '<p>Welcome '.$_SESSION['uName'].' | <a href="index.php?logout=99">Logout</a></p>';

	 else
		 echo '<p>Welcome Patient | <a href="index.php?logout=99">Logout</a></p>';
}
?>
</div>
    <!-- end #header -->