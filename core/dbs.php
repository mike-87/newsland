<?php
$conn = "mysql:host=127.0.0.1;charset=utf8;dbname=newsland";

try{
	$pdo = new PDO($conn,"ita","12345");
}catch(PDOException $e){
	die("Error: " . $e->getMessage());
}