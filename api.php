<?php
// api.php
require_once 'db.php';

header('Content-Type: application/json');

$action = isset($_GET['action']) ? $_GET['action'] : '';

// 1. Fetch Categories
if ($action == 'categories') {
    $result = $conn->query("SELECT * FROM categories");
    $categories = [];
    while ($row = $result->fetch_assoc()) {
        $categories[] = $row;
    }
    echo json_encode($categories);
    exit;
}

// 2. Fetch Products (with optional filtering and searching)
if ($action == 'products') {
    $category_id = isset($_GET['category']) ? intval($_GET['category']) : 0;
    $search = isset($_GET['search']) ? $conn->real_escape_string($_GET['search']) : '';

    $sql = "SELECT * FROM products WHERE 1=1";
    
    if ($category_id > 0) {
        $sql .= " AND category_id = $category_id";
    }
    if (!empty($search)) {
        $sql .= " AND (name LIKE '%$search%' OR description LIKE '%$search%')";
    }

    $result = $conn->query($sql);
    $products = [];
    while ($row = $result->fetch_assoc()) {
        $products[] = $row;
    }
    echo json_encode($products);
    exit;
}

// If no valid action is given
echo json_encode(['message' => 'Invalid API Action']);
?>