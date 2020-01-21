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
				<?php
					if(isset($_GET['id'])){
						$id = trim($_GET['id']);
						if(!empty($id)){
							$id = $pdo->quote($id);
							$res = $pdo->query("SELECT title, intro, img, content, publishtime FROM news WHERE newsid = {$id}");
							if($res->rowCount() != 1){
								echo "Error: There are no news with that search criteria.";
							}else{
							$news = $res->fetch(PDO::FETCH_ASSOC);
							echo "<div><h2 class='line'>" . $news['title'] . "</h2>";
							echo "<p>" . $news['intro'] . "</p>";
							echo "<img src='img/newsimg/" . $news['img'] . "'/>";
							echo "<p>" . $news['content'] . "</p>";
							echo "<p><i>" . $news['publishtime'] . "</i></p></div>";
							}
							if(isset($_SESSION['fname']) && isset($_SESSION['userid'])){
							echo '<form action="addcomment.php" method="post" id="comment">';
							echo '<textarea name="commentcontent" placeholder="Enter your comment..."></textarea><br/>';
							echo '<input type="hidden" name="userid" value="' . $_SESSION['userid'] . '">';
							echo '<input type="hidden" name="newsid" value="' . $_GET['id'] . '">';
							echo '<input type="submit" name="send" value="Send">';
							echo '</form>';
							echo "<hr>";
							$resc = $pdo->query("SELECT * FROM comment_details WHERE newsid = {$id}");
							if($resc->rowCount() > 0){
								while($com = $resc->fetch(PDO::FETCH_ASSOC)){
								echo "<div class='comment'>";
								echo "<p><b>" . $com['fname'] . "</b></p>";
								echo "<p class='comt'><i>" . $com['commenttime'] . "</i></p>";
								echo "<p>" . $com['commentcontent'] . "</p>";
								
									if($_SESSION['userid'] == $com['userid'] || $_SESSION['status'] == 9){
										echo "<a href='delcom.php?id=" . $com['commentid'] . "'>Delete comment</a>";
									}
								echo "</div>";
							}
							}
							}else{
								echo '<p class="logreq">If you want to post a comment please log in.</p>';
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
			</form>
			
			
		</aside>
		<footer>
			Design by: MMH
		</footer>
		</div><!-- wrapper end -->
	</body>
</html>