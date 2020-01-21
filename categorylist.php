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
			<h1 class="center">News</h1>
			
			<?php
				if(isset($_GET['id'])){
					$id = trim($_GET['id']);
					if(!empty($id)){
						$id = $pdo->quote($id);
						$res = $pdo->query("SELECT newsid, title, intro, publishtime FROM news WHERE categoryid = {$id}");
						if($res->rowCount() == 0){
							echo "Error: There are no news with that search criteria.";
						}else{
						while($news = $res->fetch(PDO::FETCH_ASSOC)){
						echo "<div><h2>" . $news['title'] . "</h2>";
						echo "<p>" . $news['intro'] . "</p>";
						echo "<p><i>" . $news['publishtime'] . "</i></p>";
						echo "<a href='readmore.php?id=" . $news['newsid'] . "'>Read more...</a></div>";
						echo "<hr>";
						}
						}
					}
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