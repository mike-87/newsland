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
						$id = strip_tags($_GET['id']);
						if(!empty($id)){
							$stmtDelete = $pdo->prepare("DELETE FROM news WHERE newsid = {$id}");
							
							$stmtDelete->bindValue(1, $id);
							
							$stmtDelete->execute();
							
							if($stmtDelete->rowCount() > 0){
								header('Location: deletenews.php');
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