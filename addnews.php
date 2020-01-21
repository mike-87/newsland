<?php
	session_start();
	include_once "core/dbs.php";
	if(isset($_POST['send'])) {
    $title = strip_tags($_POST['title']);
	$intro = strip_tags($_POST['intro']);
    $img =($_FILES['img']);
	if($_FILES['img']['type'] == "image/jpeg" || $_FILES['img']['type'] == "image/png"){
		move_uploaded_file($_FILES['img']['tmp_name'],"img/newsimg/" . $_FILES['img']['name']);
		$imgf = ($_FILES['img']['name']);
	}else{
		echo "<p>Invalid image format. You can upload only jpg and png images.</p>";
	}
    $content = strip_tags($_POST['content']);
	$categoryid = strip_tags($_POST['categoryid']);
	$stmtInsert = $pdo->prepare("INSERT INTO news (title,intro,img,content,categoryid) VALUES (?,?,?,?,?)");
	$stmtInsert->bindValue(1, $title);
	$stmtInsert->bindValue(2, $intro);
	$stmtInsert->bindValue(3, $imgf);
	$stmtInsert->bindValue(4, $content);
	$stmtInsert->bindValue(5, $categoryid);
	
	$stmtInsert->execute();
	echo "<script>alert('News has been succesfully added!');</script>";
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
			<h1 class="center">Add news</h1>
			<p>Please fill out all fields in order to add new post!</p>
			
			<form action="addnews.php" method="post" enctype="multipart/form-data" id="addnews">
				<label for="title">Title:<br>
					<input type="text" name="title" id="title">
				</label><br><br>
				<label for="intro">Intro:<br>
					<input type="text" name="intro" id="intro">
				</label><br><br>
				<label for="img">Image:<br>
					<input type="file" name="img" id="img">
				</label><br><br>
				<label for="content">Content:<br>
					<textarea name="content"></textarea>
				</label><br><br>
				<label for="select">Category:<br>
					<select name="categoryid" id="categoryid">
						<option value="1">Economics</option>
						<option value="2">Sports</option>
						<option value="3">Culture</option>
						<option value="4">Entertainment</option>
						<option value="5">Lifestyle</option>
					</select>
				</label><br><br>
				<input type="submit" name="send" id="send" value="Add">
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