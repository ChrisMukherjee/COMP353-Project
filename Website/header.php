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
	echo '<div id="floatRight">';
	echo '<p>Welcome <a href="index.php?logout=99">Logout</a></p>';
}
?>
</div>
    <!-- end #header -->