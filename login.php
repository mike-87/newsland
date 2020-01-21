<?php
if(isset($_POST['email'], $_POST['password'])){
	$email = strip_tags($_POST['email']);
	$password = strip_tags($_POST['password']);
	if(!empty($email) && !empty($password)){
		include_once "core/dbs.php";
		$stmtUserCheck = $pdo->prepare("SELECT * FROM users WHERE email=? AND password = ?");
		$stmtUserCheck->bindValue(1, $email);
		$stmtUserCheck->bindValue(2, $password);
		$stmtUserCheck->execute();
		if($stmtUserCheck->rowCount() > 1){
			die("Error: Something went wrong.");
		}else if($stmtUserCheck->rowCount() == 0){
			header('Location: register.php');
		}else{
		$user = $stmtUserCheck->fetch(PDO::FETCH_ASSOC);
		session_start();
		$_SESSION['userid'] = $user['userid'];
		$_SESSION['fname'] = $user['fname'];
		$_SESSION['lname'] = $user['lname'];
		$_SESSION['email'] = $user['email'];
		$_SESSION['status'] = $user['status'];
		if($user['status'] == 9){
			$_SESSION['w'] = "infoAdminW";;
		}else{
		$_SESSION['w'] = "infoUserW";
		}
		header('Location: ' . $_SERVER['HTTP_REFERER']);
		}
	}
}
