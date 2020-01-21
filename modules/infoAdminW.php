      <h1>G R E E T I N G S!</h1>
		<p>Name: <?php echo $_SESSION['fname'] ?></p>
		<p>Family name: <?php echo $_SESSION['lname'] ?></p>
		<p>E-mail: <?php echo $_SESSION['email'] ?></p>
		<p><a href="addnews.php">Insert news</a></p>
		<p><a href="deletenews.php">Delete news</a></p>
		<a href="logout.php">Logout</a>