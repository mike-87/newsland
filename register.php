<?php
	session_start();
	include_once "core/dbs.php";
	if(isset($_POST['send'])) {
    $fname = strip_tags($_POST['fname']);
	$lname = strip_tags($_POST['lname']);
    $email = strip_tags($_POST['email']);
    $password = strip_tags($_POST['password']);
	$stmtInsert = $pdo->prepare("INSERT INTO users (fname,lname,email,password) VALUES (?,?,?,?)");
	$stmtInsert->bindValue(1, $fname);
	$stmtInsert->bindValue(2, $lname);
	$stmtInsert->bindValue(3, $email);
	$stmtInsert->bindValue(4, $password);
	
	$stmtInsert->execute();
	}
?>

<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="description" content="NewsLand Official Page">
		<meta name="keywords" content="news, world">
		<title>NewsLand | Home</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	<body>
	<div id="wrapper">
		<header>
		
			<a href="index.php"><img src="img/newsland.png" alt="newsLand Logo"></a>
			
		</header>
		<nav>
			<?php
			require_once "modules/menubar.php"	
			?>
		</nav>
		<div id="main">
			<h1 class="center">Registration</h1>
			<p>Please fill out all fields in order to register!</p>
			
			<form action="register.php" method="post" id="register">
				<label for="fname">Name:<br>
					<input type="text" name="fname" id="fname">
				</label><br><br>
				<label for="lname">Family Name:<br>
					<input type="text" name="lname" id="fname">
				</label><br><br>
				<label for="email">E-mail:<br>
					<input type="text" name="email" id="email">
				</label><br><br>
				<label for="password">Password:<br>
					<input type="password" name="password" id="password">
				</label><br><br>
				<input type="submit" name="send" id="send" value="Send">
				<input type="reset" name="reset" id="reset" value="Reset">
			</form>
			
		</div><!-- main end -->
		<aside>
			<?php
				if(isset($_SESSION['w'])){
					include_once "modules/" . $_SESSION['w'] . ".php";
				}else{
					include_once "modules/loginW.php";
				}
			?>
		</aside>
		<footer>
			Design by: MMH
		</footer>
		</div><!-- wrapper end -->
	</body>
</html>