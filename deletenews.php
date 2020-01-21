<?php
	session_start();
	include_once "core/dbs.php";
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
			<h1 class="center">Remove news</h1>
			
			<?php
		$res = $pdo->query("SELECT newsid, title FROM news");
		
		while($news = $res->fetch(PDO::FETCH_ASSOC)){
			echo "<div><p>" . $news['newsid'] . ". " . $news['title'] ."</p>";
			echo "<a href='deleten.php?id=" . $news['newsid'] . "'><img src='img/del.png'></a></div>";
			echo "<hr>";
		}
	?>
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