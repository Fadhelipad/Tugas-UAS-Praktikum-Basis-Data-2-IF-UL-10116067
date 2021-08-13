<?php
	// (nama server, user, password, database)
	$mysqli = new mysqli("localhost", "root", "", "10116067_kepegawaian");
	/* check connection */
	if (mysqli_connect_errno()) {
		printf("Connect failed: %s\n", mysqli_connect_error());
		exit();
	}
?>
