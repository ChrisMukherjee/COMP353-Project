<?php session_start(); ?>
<?php
if (isset($_SESSION['login'])) {
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
<title>Starline - Contact Us</title>
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
                If you have questions , please do not hestitate to contact us!<br/><br/>
                <strong>
                <p class="spaced">Karim Kaidbey - <a href="mailto:kkaidbey@yahoo.ca">kkaidbey@yahoo.ca</a><br/>
                Alexander Vissa - <a href="mailto:alexvissa@gmail.com">alexvissa@gmail.com</a><br/>
                Christopher Mukherjee - <a href="mailto:chris.mukherjee@gmail.com">chris.mukherjee@gmail.com</a><br/>
                Cheng Cheng - <a href="mailto:cheng.cheng@hotmail.ca">cheng.cheng@hotmail.ca</a></p>
				</strong>

               
        </p>
    </div>
    <!-- end #mainContent -->
	<br class="clearfloat" />
    
    <!--Include the Website Footer-->
	<?php include 'footer.php'; ?>
</div>
<!-- end #container -->
</body>
</html>

<?php
}
else {
header("Location: login.php");
}
?>