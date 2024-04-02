-- Creación de la tabla EstudiosDeCalidad
CREATE TABLE EstudiosDeCalidad (
    idEstudio INT PRIMARY KEY,
    nombreEstudio VARCHAR(100),
    fechaPublicacion DATE
);

-- Creación de la tabla TipoDeProductos
CREATE TABLE TipoDeProductos (
    idTipoProducto INT PRIMARY KEY,
    nombreTipoProducto VARCHAR(100)
);

-- Creación de la tabla Productos
CREATE TABLE Productos (
    idProducto INT PRIMARY KEY,
    nombreProducto VARCHAR(100),
    descripcion VARCHAR(100),
    precio DECIMAL(10, 2),
    categoria VARCHAR(100),
    otrosAtributos JSON,
    idTipoProducto INT,
    idEstudioCalidad INT,
    FOREIGN KEY (idTipoProducto) REFERENCES TipoDeProductos(idTipoProducto),
    FOREIGN KEY (idEstudioCalidad) REFERENCES EstudiosDeCalidad(idEstudio)
);

-- Inserts para los estudios de calidad del 2024
INSERT INTO EstudiosDeCalidad (idEstudio, nombreEstudio, fechaPublicacion) VALUES
(1, 'Atún Envasado', '2024-01-01'),
(2, 'Cafeteras De Goteo', '2024-01-01'),
(3, 'Servilletas', '2024-01-01'),
(4, 'Mayonesas Y Aderezos', '2024-01-01'),
(5, 'Termos Personales', '2024-01-01');

-- Inserts para los estudios de calidad del 2023
INSERT INTO EstudiosDeCalidad (idEstudio, nombreEstudio, fechaPublicacion) VALUES
(6, 'Yogur Griego', '2023-01-01'),
(7, 'Relojes Inteligentes', '2023-01-01'),
(8, 'Jabones De Tocador', '2023-01-01'),
(9, 'Trajes De Baño Tipo Short Para Caballero', '2023-01-01'),
(10, 'Mole Industrializado', '2023-01-01'),
(11, 'Mallas Deportivas Para Dama', '2023-01-01'),
(12, 'Tequila, Ron Y Vodka Con Sabor', '2023-01-01'),
(13, 'Contactos Y Clavijas', '2023-01-01'),
(14, 'Útiles Escolares', '2023-01-01'),
(15, 'Concentrados De Jamaica, Tamarindo Y Horchata', '2023-01-01'),
(16, 'Croquetas Para Perros', '2023-01-01'),
(17, 'Mochilas Escolares', '2023-01-01'),
(18, 'Cochinita Pibil, Chilorio, Chicharrón En Salsa', '2023-01-01'),
(19, 'Parrillas Eléctricas De Inducción', '2023-01-01'),
(20, 'Tops Deportivos Para Dama', '2023-01-01'),
(21, 'Refrescos', '2023-01-01'),
(22, 'Harinas Preparadas Para Hot Cakes', '2023-01-01'),
(23, 'Impermeabilizantes Categoría 3A Blancos', '2023-01-01'),
(24, 'Cereales Y Alimentos Para Bebés Y Niños De Corta Edad', '2023-01-01'),
(25, 'Audífonos Inalámbricos', '2023-01-01'),
(26, 'Almohadas', '2023-01-01'),
(27, 'Galletas Marías, Saladas Y De Animalitos', '2023-01-01'),
(28, 'Frutas Deshidratadas Y En Almíbar', '2023-01-01'),
(29, 'Básculas Portátiles De Uso Personal', '2023-01-01');

-- Inserts para los tipos de productos
INSERT INTO TipoDeProductos (idTipoProducto, nombreTipoProducto) VALUES
(1, 'Productos Alimenticios'),
(2, 'Electrodomésticos'),
(3, 'Accesorios de Cocina y Hogar'),
(4, 'Productos de Limpieza y Cuidado Personal'),
(5, 'Ropa y Accesorios'),
(6, 'Tecnología y Electrónica'),
(7, 'Útiles Escolares'),
(8, 'Belleza y Cuidado Personal');

INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (1, 'AGROMAR', 'Atún blanco sólido en aceite de oliva', 250, 'Sólido o compacto', '{ "ContNeto": "230", "ContNetoVeracidad": "TRUE", "MasaDrenada": "160", "MasaDrenadaVeracidad": "TRUE", "Proteina": "25", "Soya": "0%", "InfAlConsumidor": "FALSE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite de oliva", "Observaciones": "Le falta el sello exceso sodio", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1,);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (2, 'DOLORES PREMIUM', 'Atún aleta amarilla sólido en aceite', 36, 'Sólido o compacto', '{ "ContNeto": "140", "ContNetoVeracidad": "TRUE", "MasaDrenada": "106", "MasaDrenadaVeracidad": "TRUE", "Proteina": "27.3", "Soya": "0%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite", "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1,);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (3, 'CALMEX', 'Atún aleta amarilla sólido en aceite de oliva extra virgen', 57, 'Sólido o compacto', '{ "ContNeto": "140", "ContNetoVeracidad": "TRUE", "MasaDrenada": "105", "MasaDrenadaVeracidad": "TRUE", "Proteina": "25", "Soya": "0%", "InfAlConsumidor": "FALSE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite de oliva extra virgen", "Observaciones": "Presenta el distintivo de cumplimiento de la NOM-235, pero no comprueba su uso", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "TRUE", "excesoGrasasTrans": "FALSE", "excesoSodio": "TRUE" }', 1, 1,);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (4, 'DOLORES PREMIUM', 'Atún aleta amarilla sólido en aceite de oliva', 45, 'Sólido o compacto', '{ "ContNeto": "140", "ContNetoVeracidad": "TRUE", "MasaDrenada": "106", "MasaDrenadaVeracidad": "TRUE", "Proteina": "26.8", "Soya": "0%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite de oliva", "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "TRUE", "excesoGrasasTrans": "FALSE", "excesoSodio": "TRUE" }', 1, 1,);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (5, 'DOLORES PREMIUM', 'Atún aleta amarilla sólido en agua', 36, 'Sólido o compacto', '{ "ContNeto": "140", "ContNetoVeracidad": "Cumple", "MasaDrenada": "106", "MasaDrenadaVeracidad": "Cumple", "Proteina": "25.8", "Soya": "0%", "InfAlConsumidor": "Cumple", "Presentacion": "Cumple", "MedioDeCobertura":"Agua", "Observaciones":"NULL", "excesoCalorias":"FALSE", "excesoAzucares":"FALSE", "excesoGrasasSaturadas":"FALSE", "excesoGrasasTrans":"FALSE", "excesoSodio":"FALSE" }', 1, 1,);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (6, 'EL VELERO ORTIZ', 'Atún blanco en sólido en aceite de oliva', 45, 'Sólido o compacto', '{ "ContNeto": "120", "ContNetoVeracidad": "TRUE", "MasaDrenada": "80", "MasaDrenadaVeracidad": "TRUE", "Proteina": "29", "Soya": "0%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite de oliva extra virgen", "Observaciones": NULL, "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1,);

































