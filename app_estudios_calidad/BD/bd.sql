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

-- Inserts para el estudio de calidad de los atunes
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (1, 'AGROMAR', 'Atún blanco sólido en aceite de oliva', 250, 'Sólido o compacto', '{ "ContNeto": "230", "ContNetoVeracidad": "TRUE", "MasaDrenada": "160", "MasaDrenadaVeracidad": "TRUE", "Proteina": "25", "Soya": "0%", "InfAlConsumidor": "FALSE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite de oliva", "Observaciones": "Le falta el sello exceso sodio", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1,);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (2, 'DOLORES PREMIUM', 'Atún aleta amarilla sólido en aceite', 36, 'Sólido o compacto', '{ "ContNeto": "140", "ContNetoVeracidad": "TRUE", "MasaDrenada": "106", "MasaDrenadaVeracidad": "TRUE", "Proteina": "27.3", "Soya": "0%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite", "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1,);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (3, 'CALMEX', 'Atún aleta amarilla sólido en aceite de oliva extra virgen', 57, 'Sólido o compacto', '{ "ContNeto": "140", "ContNetoVeracidad": "TRUE", "MasaDrenada": "105", "MasaDrenadaVeracidad": "TRUE", "Proteina": "25", "Soya": "0%", "InfAlConsumidor": "FALSE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite de oliva extra virgen", "Observaciones": "Presenta el distintivo de cumplimiento de la NOM-235, pero no comprueba su uso", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "TRUE", "excesoGrasasTrans": "FALSE", "excesoSodio": "TRUE" }', 1, 1,);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (4, 'DOLORES PREMIUM', 'Atún aleta amarilla sólido en aceite de oliva', 45, 'Sólido o compacto', '{ "ContNeto": "140", "ContNetoVeracidad": "TRUE", "MasaDrenada": "106", "MasaDrenadaVeracidad": "TRUE", "Proteina": "26.8", "Soya": "0%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite de oliva", "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "TRUE", "excesoGrasasTrans": "FALSE", "excesoSodio": "TRUE" }', 1, 1,);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (5, 'DOLORES PREMIUM', 'Atún aleta amarilla sólido en agua', 36, 'Sólido o compacto', '{ "ContNeto": "140", "ContNetoVeracidad": "Cumple", "MasaDrenada": "106", "MasaDrenadaVeracidad": "Cumple", "Proteina": "25.8", "Soya": "0%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura":"Agua", "Observaciones":"NULL", "excesoCalorias":"FALSE", "excesoAzucares":"FALSE", "excesoGrasasSaturadas":"FALSE", "excesoGrasasTrans":"FALSE", "excesoSodio":"FALSE" }', 1, 1,);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (6, 'MARINA AZUL PREMIUM', 'Atún sólido en aceite de oliva extra virgen', 24, 'Sólido o compacto', '{ "ContNeto": "120", "ContNetoVeracidad": "TRUE", "MasaDrenada": "80", "MasaDrenadaVeracidad": "TRUE", "Proteina": "29", "Soya": "0%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite de oliva", "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (7, 'EL VELERO ORTIZ', 'Atún blanco en sólido en aceite de oliva', 337, 'Sólido o compacto', '{ "ContNeto": "270", "ContNetoVeracidad": "TRUE", "MasaDrenada": "180", "MasaDrenadaVeracidad": "TRUE", "Proteina": "29", "Soya": "0%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite de oliva extra virgen", "Observaciones": NULL, "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "TRUE" }', 1, 1,);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (8, 'MARINA AZUL PREMIUM', 'Atún sólido en agua', 36, 'Sólido o compacto', '{ "ContNeto": "270", "ContNetoVeracidad": "TRUE", "MasaDrenada": "190", "MasaDrenadaVeracidad": "TRUE", "Proteina": "26.1%", "Soya": "0%", "InfAlConsumidor": "FALSE", "Presentacion": "FALSE", "MedioDeCobertura": "Agua", "Observaciones": "Rebasó el 18% de la proporción de hojuelas y trozos que establece la NOM-235 para denominarse "atún sólido", ya que contiene de 20.5 a 21.6%", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (9, 'ORO DE ESPAÑA', 'Atún blanco en trozos en aceite de oliva', 232, 'Sólido o compacto', '{ "ContNeto": "230", "ContNetoVeracidad": "TRUE", "MasaDrenada": "150", "MasaDrenadaVeracidad": "TRUE", "Proteina": "18.2", "Soya": "0%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite de oliva", "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "TRUE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (10, 'TUNY GOURMET', 'Atún aleta amarilla sólido en aceite con agua', 34, 'Sólido o compacto', '{ "ContNeto": "140", "ContNetoVeracidad": "TRUE", "MasaDrenada": "100", "MasaDrenadaVeracidad": "TRUE", "Proteina": "25", "Soya": "0%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite con agua", "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (11, 'YURRITA', 'Atún blanco en sólido sin piel en aceite de oliva', 46, 'Sólido o compacto', '{ "ContNeto": "140", "ContNetoVeracidad": "TRUE", "MasaDrenada": "100", "MasaDrenadaVeracidad": "TRUE", "Proteina": "26", "Soya": "0%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite de oliva", "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (12, 'TUNY GOURMET', 'Atún aleta amarilla sólido en aceite de oliva', 385, 'Sólido o compacto', '{ "ContNeto": "225", "ContNetoVeracidad": "TRUE", "MasaDrenada": "150", "MasaDrenadaVeracidad": "TRUE", "Proteina": "27.9", "Soya": "0%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite de oliva", "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "TRUE", "excesoGrasasTrans": "FALSE", "excesoSodio": "TRUE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (13, 'DOLORES PREMIUM', 'Atún aleta amarilla en trozos en aceite de oliva', 21, 'En trozos', '{ "ContNeto": "78", "ContNetoVeracidad": "TRUE", "MasaDrenada": "74", "MasaDrenadaVeracidad": "TRUE", "Proteina": "22.8", "Soya": "0%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite de oliva", "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (14, 'GOLDEN HILLS', 'Atún en trozos en agua', 19, 'En trozos', '{ "ContNeto": "130", "ContNetoVeracidad": "TRUE", "MasaDrenada": "90", "MasaDrenadaVeracidad": "TRUE", "Proteina": "22%", "Soya": "0%", "InfAlConsumidor": "FALSE", "Presentacion": "FALSE", "MedioDeCobertura": "Agua", "Observaciones": "Rebasó el 30% de la proporción de hojuelas que establece la norma para denominarse atún en trozos, ya que tuvo 41.7% por lo que incumple la NOM-235.", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (15, 'GOLDEN HILLS', 'Atún en trozos en aceite con agua', 19, 'En trozos', '{ "ContNeto": "130", "ContNetoVeracidad": "TRUE", "MasaDrenada": "90", "MasaDrenadaVeracidad": "TRUE", "Proteina": "25.3", "Soya": "0%", "InfAlConsumidor": "FALSE", "Presentacion": "TRUE", "MedioDeCobertura": "Agua", "Observaciones": "No es veraz en la declaración del Medio de cobertura, ya que indica "Aceite con agua" y es "Agua con aceite", es decir, más agua que aceite.", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (16, 'GREAT VALUE', 'Atún en trozos en agua', 15, 'En trozos', '{ "ContNeto": "74", "ContNetoVeracidad": "TRUE", "MasaDrenada": "70", "MasaDrenadaVeracidad": "TRUE", "Proteina": "19%", "Soya": "0%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Agua", "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (17, 'MARINA AZUL', 'Atún en trozos en aceite de oliva extra virgen', 24, 'En trozos', '{ "ContNeto": "74", "ContNetoVeracidad": "TRUE", "MasaDrenada": "70", "MasaDrenadaVeracidad": "TRUE", "Proteina": "28.2", "Soya": "0%", "InfAlConsumidor": "FALSE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite de oliva extra virgen", "Observaciones": "La imagen en su empaque (atún sólido) no corresponde a su presentación (atún en trozos), por lo que no es veraz.", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (18, 'MARINA AZUL', 'Atún en trozos en agua bajo en sodio', 39, 'En trozos', '{ "ContNeto": "180", "ContNetoVeracidad": "TRUE", "MasaDrenada": "175", "MasaDrenadaVeracidad": "TRUE", "Proteina": "26.6", "Soya": "0%", "InfAlConsumidor": "FALSE", "Presentacion": "TRUE", "MedioDeCobertura": "Agua", "Observaciones":  "Su denominación al frente del empaque está incompleta, ya que debería indicar: Atún en trozos en agua bajo en grasa, y solo indica: Atún en trozos en agua, y al reverso: Bajo en grasa, por lo que incumple la NOM-235 -La imagen en su empaque (atún sólido) no corresponde a su presentación (atún en trozos), por lo que no es veraz", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (19, 'MARINA AZUL', 'Atún en trozos en agua', 38, 'En trozos', '{ "ContNeto": "180", "ContNetoVeracidad": "TRUE", "MasaDrenada": "175", "MasaDrenadaVeracidad": "TRUE", "Proteina": "22.8", "Soya": "0%", "InfAlConsumidor": "FALSE", "Presentacion": "TRUE", "MedioDeCobertura": "Agua", "Observaciones": "Su denominación al frente del empaque está incompleta, ya que debería indicar: Atún en trozos en agua bajo en grasa, y solo indica: Atún en trozos en agua, y al reverso: Bajo en grasa, por lo que incumple la NOM-235 -La imagen en su empaque (atún sólido) no corresponde a su presentación (atún en trozos), por lo que no es veraz", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (20, 'TUNY', 'Atún aleta amarilla en trozos en agua bajo en sodio', 38, 'En trozos', '{ "ContNeto": "180", "ContNetoVeracidad": "TRUE", "MasaDrenada": "NULL", "MasaDrenadaVeracidad": "NULL", "Proteina": "23", "Soya": "0%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Agua", "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (21, 'TUNY CLÁSICO', 'Atún aleta amarilla en trozos en agua', 19, 'En trozos', '{ "ContNeto": "75", "ContNetoVeracidad": "TRUE", "MasaDrenada": "NULL", "MasaDrenadaVeracidad": "NULL", "Proteina": "22", "Soya": "0%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Agua", "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (22, 'TUNY PREMIUM', 'Atún aleta amarilla en trozos en aceite con agua', 27, 'En trozos', '{ "ContNeto": "140", "ContNetoVeracidad": "TRUE", "MasaDrenada": "100", "MasaDrenadaVeracidad": "TRUE", "Proteina": "25.3", "Soya": "0%", "InfAlConsumidor": "FALSE", "Presentacion": "TRUE", "MedioDeCobertura": "No es veraz", "Observaciones": "No es veraz en la declaración de Masa drenada, ya que indica 100 g y tuvo de 91.7 g a 98.2 g.", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (23, 'TUNY GOURMET', 'Atún en trozos en aceite de oliva', 23, 'En trozos', '{ "ContNeto": "75", "ContNetoVeracidad": "TRUE", "MasaDrenada": "NULL", "MasaDrenadaVeracidad": "NULL", "Proteina": "23", "Soya": "0%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Aceite de oliva", "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (24, 'TUNY PREMIUM', 'Atún aleta amarilla en trozos en agua', 27, 'En trozos', '{ "ContNeto": "140", "ContNetoVeracidad": "TRUE", "MasaDrenada": "100", "MasaDrenadaVeracidad": "TRUE", "Proteina": "22", "Soya": "0%", "InfAlConsumidor": "FALSE", "Presentacion": "FALSE", "MedioDeCobertura": "Agua", "Observaciones": "-No es veraz en la declaración de Masa drenada, ya que indica 100 g y tuvo de 91.7 g a 98.2 g. -Rebasó el 30% de la proporción de hojuelas que establece la norma para denominarse "atún en trozos", ya que tuvo de 34.6 a 37.2%", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (25, 'TUNY SPORT', 'Atún en trozos en agua adicionado de vitaminas', 24, 'En trozos', '{ "ContNeto": "75", "ContNetoVeracidad": "Cumple", "MasaDrenada": NULL, "MasaDrenadaVeracidad": NULL, "Proteina": 28, "Soya": "0%", "InfAlConsumidor": TRUE, "Presentacion": TRUE, "MedioDeCobertura": Agua, "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (26, 'ATÚN DOLORES', 'Atún aleta amarilla en hojuelas en agua', 41, 'En hojuelas', '{ "ContNeto": "295", "ContNetoVeracidad": "Cumple", "MasaDrenada": "220", "MasaDrenadaVeracidad": "TRUE", "Proteina": 22, "Soya": "0%", "InfAlConsumidor": TRUE, "Presentacion": TRUE, "MedioDeCobertura": Agua, "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "TRUE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (27, 'CALMEX', 'Atún aleta amarilla con 4% de soya en agua', 19, 'En hojuelas', '{ "ContNeto": "135", "ContNetoVeracidad": "Cumple", "MasaDrenada": "90, "MasaDrenadaVeracidad": "TRUE", "Proteina": 16.9, "Soya": "de 1 a 2%", "InfAlConsumidor": FALSE, "Presentacion": FALSE, "MedioDeCobertura": Agua, "Observaciones": "-No indica presentación, por lo que incumple la NOM-235, sin embargo, es en hojuelas. -Presenta el distintivo de cumplimiento de la NOM-235, pero no comprueba su uso -Le falta el sello exceso de sodio", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (28, 'EL DORADO', 'Atún con 30% de soya en agua con aceite', 12, 'En hojuelas', '{ "ContNeto": "130", "ContNetoVeracidad": "TRUE", "MasaDrenada": "90", "MasaDrenadaVeracidad": "FALSE", "Proteina": "17.3", "Soya": "de 11 a 14%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Agua con aceite", "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "TRUE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (29, 'GREAT VALUE', 'Atún en hojuelas en agua', 38, 'En hojuelas', '{ "ContNeto": "295", "ContNetoVeracidad": "TRUE", "MasaDrenada": "220", "MasaDrenadaVeracidad": "TRUE", "Proteina": "20.3", "Soya": "0%", "InfAlConsumidor": "FALSE", "Presentacion": "TRUE", "MedioDeCobertura": "Agua", "Observaciones": "-Puede confundir al consumidor pues presenta fecha de caducidad y de consumo preferente -Le falta el sello exceso de sodio", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (30, 'EL DORADO', 'Atún con 30% de soya en agua', 12, 'En hojuelas', '{ "ContNeto": "130", "ContNetoVeracidad": "TRUE", "MasaDrenada": "90", "MasaDrenadaVeracidad": "TRUE", "Proteina": "17.6", "Soya": "18% a 23%", "InfAlConsumidor": "TRUE", "Presentacion": "TRUE", "MedioDeCobertura": "Agua", "Observaciones": "NULL", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "TRUE" }', 1, 1);
INSERT INTO Productos (idProducto, NombreProducto, Descripcion, Precio, Categoria, OtrosAtributos, idTipoProducto, idEstudioCalidad) VALUES (31, 'GREAT VALUE', 'Atún en hojuelas en agua', 18, 'En hojuelas', '{ "ContNeto": "140", "ContNetoVeracidad": "TRUE", "MasaDrenada": "100", "MasaDrenadaVeracidad": "FALSE", "Proteina": "19.8", "Soya": "0%", "InfAlConsumidor": "FALSE", "Presentacion": "TRUE", "MedioDeCobertura": "Agua", "Observaciones": "-No es veraz en la declaración de Masa drenada, ya que indica 100 g y tuvo de 87 g a 95.4 g -Puede confundir al consumidor pues presenta fecha de caducidad y de consumo preferente", "excesoCalorias": "FALSE", "excesoAzucares": "FALSE", "excesoGrasasSaturadas": "FALSE", "excesoGrasasTrans": "FALSE", "excesoSodio": "FALSE" }', 1, 1);








































