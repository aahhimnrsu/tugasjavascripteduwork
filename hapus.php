<?php
include 'conn.php';

$id = $_GET['id'];

$result = mysqli_query($koneksi, "DELETE FROM customer WHERE id='$id'");

header("location:index.php");
?>