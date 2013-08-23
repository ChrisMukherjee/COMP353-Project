    <!-- begin #sidebar1 -->
    <div id="sidebar1">
		<br>
	    <h2>Pages</h2>
        <ul>
        <?php
			if ($_SESSION['uType'] == 'admin' || $_SESSION['uType'] == 'director') {
				echo '<li><a href="dir_admin.php">Directors/Administrators</a></li>';
				echo'<li><a href="doctors.php">Doctors</a></li>';
				echo '<li><a href="res_int.php">Residents/Interns</a></li>';
				echo '<li><a href="nurses_sup.php">Nurse - Shift Supervisor</a></li>';
				echo '<li><a href="technicians.php">Technicians</a></li>';
				echo '<li><a href="patients.php">Patients</a></li>';
				echo '<li><a href="contact.php">Contact Us</a></li>';
			}
			else if ($_SESSION['uType'] == 'doctor') {
				echo'<li><a href="doctors.php">Doctors</a></li>';
				echo '<li><a href="res_int.php">Residents/Interns</a></li>';
				echo '<li><a href="patients.php">Patients</a></li>';
				echo '<li><a href="contact.php">Contact Us</a></li>';
			}
			else if ($_SESSION['uType'] == 'resident' || $_SESSION['uType'] == 'intern') {
				echo '<li><a href="res_int.php">Residents/Interns</a></li>';
				echo '<li><a href="contact.php">Contact Us</a></li>';
			}
			else if ($_SESSION['uType'] == 'nurse') {
				echo '<li><a href="nurses.php">Nurses</a></li>';
				echo '<li><a href="patients.php">Patients</a></li>';
				echo '<li><a href="contact.php">Contact Us</a></li>';
			}
			else if ($_SESSION['uType'] == 'supnurse') {
				echo '<li><a href="nurses.php">Nurses</a></li>';
				echo '<li><a href="nurses_sup.php">Nurse - Shift Supervisor</a></li>';
				echo '<li><a href="patients.php">Patients</a></li>';
				echo '<li><a href="contact.php">Contact Us</a></li>';
			}
			else {
				echo '<li><a href="patients.php">Patients</a></li>';
				echo '<li><a href="contact.php">Contact Us</a></li>';
			}
		?>
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
    <!-- end #sidebar1 -->