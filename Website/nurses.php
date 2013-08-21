<?php session_start();

if (isset($_SESSION['login'])) {
include 'login.php';

if ($_SESSION['uType'] != 'admin' && $_SESSION['uType'] != 'director' && $_SESSION['uType'] != 'supnurse' && $_SESSION['uType'] != 'nurse') {
	header("Location: index.php");
}
else
{
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
<title>Starline - Nurse</title>
</head>

<body>
<!-- begin #container -->
<div id="container">
	<!--Include the Website Header-->
	<?php include 'header.php'; ?>
	<!--Include the Website Sidebar-->
	<?php include 'sidebar.php'; ?>
<!-- begin #mainContent -->
<div id="mainContent">
    	<p>
        	<strong>All website template is released under a Creative Commons Attribution 2.5 License</strong><br /><br />
We request you retain the full copyright notice below including the link to www.facebookpagetemplates.com. This not only gives respect to the large amount of time given freely by the developers but also helps build interest, traffic and use of our free and paid designs. If you cannot (for good reason) retain the full copyright we request you at least leave in place the Website Templates line, with Website Templates linked to www.facebookpagetemplates.com. If you refuse to include even this then support may be affected.<br /><br />

<strong>You are allowed to use this design only if you agree to the following conditions:</strong><br />
- You can not remove copyright notice from any our template without our permission.<br />
- If you modify any our template it still should contain copyright because it is based on our work.<br />
- You may copy, distribute, modify, etc. any our template as long as link to our website remains untouched.<br /><br />

For support please visit www.cssmoban.com<br /><br /><br /><br />
<strong>What does Flash Template mean?</strong><br /><br />

Flash Template is a ready-made Flash Site that you can download and use for free! Flash Template was created by professional and independent designers for you. You need only to make your adjustments and your flash site is ready. If you open .fla file you can easily change the text information and graphics of the site. There's no need to make animation - our designers already did it. After your text and graphics adjustments you need only to upload .swf file to your server and enjoy your ready Flash Site! Using Free Flash Templates you can save your time and money! 
        </p>
    </div>
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
}
else {
header("Location: index.php");
}
?>