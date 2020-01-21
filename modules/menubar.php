<ul id=white">
	<li><a href="index.php">Main page</a></li>;
<?php
		$res = $pdo->query("SELECT categoryid, categoryname FROM categories");
		
		while($category = $res->fetch(PDO::FETCH_ASSOC)){
			echo "<li><a href='categorylist.php?id=" . $category['categoryid'] . "'>" . $category['categoryname'] . "</a></li>";
		}
	?>
				</ul>