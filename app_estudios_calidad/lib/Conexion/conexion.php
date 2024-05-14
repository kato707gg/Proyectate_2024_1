<?php

// Conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "7";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
  die("Conexión fallida: " . $conn->connect_error);
}

// Obtener la categoría del producto desde la solicitud
$category = $_GET['category'];

// Consulta SQL para obtener la información del producto basada en la categoría
$sql = "SELECT * FROM InfoRelevante WHERE idTipoProducto = (
    SELECT idTipoProducto FROM TipoDeProductos WHERE nombreTipoProducto = '$category'
)";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // Convertir los resultados a un array asociativo
  $row = $result->fetch_assoc();
  
  // Crear un array con la información del producto
  $productInfo = array(
    'title' => $row['descripcionEstudio'],
    'colorTitulo' => $row['colorTitulo'],
    'colorFondo' => $row['colorFondo']
  );

  // Devolver la información del producto como JSON
  echo json_encode($productInfo);
} else {
  echo "No se encontraron resultados para la categoría especificada.";
}

$conn->close();
?>
