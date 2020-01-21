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
					if(isset($_POST['send'])){
						$newsid = strip_tags($_POST['newsid']);
						$userid = strip_tags($_SESSION['userid']);
						$cmcnt = strip_tags($_POST['commentcontent']);
							if(!empty($newsid) && !empty($userid) && !empty($cmcnt)){
								$stmtInsert = $pdo->prepare("INSERT INTO comments (newsid,userid,commentcontent) VALUES (?,?,?)");
								
								$stmtInsert->bindValue(1, $newsid);
								$stmtInsert->bindValue(2, $userid);
								$stmtInsert->bindValue(3, $cmcnt);
								$stmtInsert->execute();
								
									if($stmtInsert->rowCount() > 0){
									header('Location: '  . $_SERVER['HTTP_REFERER']);
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