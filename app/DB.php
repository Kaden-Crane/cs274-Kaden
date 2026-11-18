<?php // db.php
$dsn = 'mysql:host=localhost;dbname=baseballcarddb;charset=utf8mb4';
$pdo = new PDO($dsn, 'root', 'root', [
PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
PDO::ATTR_EMULATE_PREPARES => false,
]);
// SELECT with named parameter
$stmt = $pdo->prepare('SELECT col1, col2 FROM Table WHERE col = :val');
$stmt->execute([':val' => $value]);
$rows = $stmt->fetchAll(); // array of associative arrays
// SELECT with positional parameter
$stmt = $pdo->prepare('SELECT * FROM Table WHERE col = ?');
$stmt->execute([$value]);
$row = $stmt->fetch(); // one row only
// No parameters (hardcoded SQL)
$rows = $pdo->query('SELECT * FROM Table')->fetchAll();
