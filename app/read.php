<?php
require __DIR__ . '/db.php';

try {
    $stmt = $pdo->prepare("
        SELECT
            c.FirstName,
            c.LastName,
            o.OrderDate,
            o.OrderStatus,
            br.BrandName,
            s.SeriesName
        FROM Customers c
        INNER JOIN Orders o
            ON c.CustomerID = o.CustomerID
        INNER JOIN OrderItems oi
            ON o.OrderID = oi.OrderID
        INNER JOIN Box b
            ON oi.BoxID = b.BoxID
        INNER JOIN Brand br
            ON b.BrandID = br.BrandID
        INNER JOIN Series s
            ON b.SeriesID = s.SeriesID
        ORDER BY o.OrderDate DESC
    ");

    $stmt->execute();
    $rows = $stmt->fetchAll();

} catch (PDOException $e) {
    error_log($e->getMessage());
    $rows = [];
    $err = 'DB error.';
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Orders | Baseball Card Shop</title>

<style>
body {
    font-family: Arial;
    margin: 2rem;
}

table {
    border-collapse: collapse;
    width: 100%;
}

th {
    background: #065a82;
    color: #fff;
    padding: .5rem 1rem;
    text-align: left;
}

td {
    padding: .5rem 1rem;
    border-bottom: 1px solid #ddd;
}

tr:nth-child(even) {
    background: #f5f5f5;
}
</style>

</head>
<body>

<h1>Order History</h1>

<?php if (isset($err)): ?>
    <p style="color:red"><?= htmlspecialchars($err) ?></p>

<?php elseif (empty($rows)): ?>
    <p>No orders found.</p>

<?php else: ?>

    <p><?= count($rows) ?> record(s) found.</p>

    <table>
        <thead>
            <tr>
                <th>Customer</th>
                <th>Brand</th>
                <th>Series</th>
                <th>Order Date</th>
                <th>Status</th>
            </tr>
        </thead>

        <tbody>
        <?php foreach ($rows as $r): ?>
            <tr>
                <td><?= htmlspecialchars($r['FirstName'] . ' ' . $r['LastName']) ?></td>
                <td><?= htmlspecialchars($r['BrandName']) ?></td>
                <td><?= htmlspecialchars($r['SeriesName']) ?></td>
                <td><?= htmlspecialchars($r['
