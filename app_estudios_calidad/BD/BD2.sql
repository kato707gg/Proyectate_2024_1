-- Creación de la tabla TipoDeProductos
CREATE TABLE TipoDeProductos (
    idTipoProducto INT PRIMARY KEY,
    nombreTipoProducto VARCHAR(100)
);

-- Creación de las tablas de estudios
CREATE TABLE EstudioAtunes (
    idEstudioAtunes INT PRIMARY KEY,
    nombreProducto VARCHAR(50),
    descripcion VARCHAR(255),
    precio DECIMAL(10, 2),
    categoria VARCHAR(50),
    contNeto DECIMAL(10, 2),
    contNetoVeracidad boolean,
    masaDrenada DECIMAL(10, 2),
    masaDrenadaVeracidad boolean,
    proteina DECIMAL(10, 2),
    soya VARCHAR(25),
    infAlConsumidor boolean,
    presentacion boolean,
    observaciones TEXT,
    medioDeCobertura VARCHAR(50),
    excesoCalorias boolean,
    excesoAzucares boolean,
    excesoGrasasSaturadas boolean,
    excesoGrasasTrans boolean,
    excesoSodio boolean,
    idTipoProducto INT,
    FOREIGN KEY (idTipoProducto) REFERENCES TipoDeProductos(idTipoProducto)
);

CREATE TABLE EstudioCafeterasGoteo (
  idEstudioCafeterasGoteo INT,
  nombreProducto varchar(50),
  region varchar(50),
  precio INT,
  informacion varchar(100),
  garantia INT,
  calentamiento varchar(100),
  potenciaW INT,
  seguridad boolean,
  derramamientoCafe boolean,
  observaciones TEXT,
  calificacionGeneral varchar(5),
  idTipoProducto INT,
  FOREIGN KEY (idTipoProducto) REFERENCES TipoDeProductos(idTipoProducto)
);

CREATE TABLE EstudioServilletas (
  idServilletas int(11) NOT NULL,
  nombre varchar(100) DEFAULT NULL,
  descripcion varchar(100) DEFAULT NULL,
  region varchar(100) DEFAULT NULL,
  precio_paq int(11) NOT NULL,
  precio_10_paq int(11) NOT NULL,
  contenido_neto tinyint(1) NOT NULL,
  calificacion varchar(10) NOT NULL,
  acabados varchar(10) NOT NULL,
  Resistencia_servilleta varchar(10) NOT NULL,
  Absorción_total varchar(10) NOT NULL,
  observaciones TEXT,
  idtipoproducto int(11) NOT NULL,
  FOREIGN KEY (idTipoProducto) REFERENCES TipoDeProductos(idTipoProducto)
);

CREATE TABLE EstudioMayonesas (
  idEstudioMayonesas INT PRIMARY KEY,
  nombreProducto varchar(100),
  descripcion varchar(100),
  precio decimal(10,2),
  categoria VARCHAR(50),
  contenidoEnergetico INT,
  grasas decimal(10,2),
  sodio INT,
  infAlConsumidor varchar(100),
  contNeto varchar(100),
  carbohidratos decimal(10,2),
  proteina decimal(10,2),
  observaciones TEXT,
  excesoCalorias boolean,
  excesoAzucares boolean,
  excesoGrasasSaturadas boolean,
  excesoGrasasTrans boolean,
  excesoSodio boolean,
  idTipoProducto INT,
  FOREIGN KEY (idTipoProducto) REFERENCES TipoDeProductos(idTipoProducto)
);

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

-- INSERT para EstudioAtunes
INSERT INTO EstudioAtunes (idEstudioAtunes, nombreProducto, descripcion, precio, categoria, contNeto, contNetoVeracidad, masaDrenada, masaDrenadaVeracidad, proteina, soya, infAlConsumidor, presentacion, observaciones, medioDeCobertura, excesoCalorias, excesoAzucares, excesoGrasasSaturadas, excesoGrasasTrans, excesoSodio, idTipoProducto) VALUES 
(1, 'AGROMAR', 'Atún blanco sólido en aceite de oliva', 250, 'Sólido o compacto', 230, TRUE, 160, TRUE, 25, '0%', FALSE, TRUE, 'Le falta el sello exceso sodio', 'Aceite de oliva', FALSE, FALSE, FALSE, FALSE, FALSE, 1),
(2, 'DOLORES PREMIUM', 'Atún aleta amarilla sólido en aceite', 36, 'Sólido o compacto', 140, TRUE, 106, TRUE, 27.3, '0%', TRUE, TRUE, NULL, 'Aceite', FALSE, FALSE, FALSE, FALSE, FALSE, 1),
(3, 'CALMEX', 'Atún aleta amarilla sólido en aceite de oliva extra virgen', 57, 'Sólido o compacto', 140, TRUE, 105, TRUE, 25, '0%', FALSE, TRUE, 'Presenta el distintivo de cumplimiento de la NOM-235, pero no comprueba su uso', 'Aceite de oliva extra virgen', FALSE, FALSE, TRUE, FALSE, TRUE, 1),
(4, 'DOLORES PREMIUM', 'Atún aleta amarilla sólido en aceite de oliva', 45, 'Sólido o compacto', 140, TRUE, 106, TRUE, 26.8, '0%', TRUE, TRUE, NULL, 'Aceite de oliva', FALSE, FALSE, TRUE, FALSE, TRUE, 1),
(5, 'DOLORES PREMIUM', 'Atún aleta amarilla sólido en agua', 36, 'Sólido o compacto', 140, TRUE, 106, TRUE, 25.8, '0%', TRUE, TRUE, NULL, 'Agua', FALSE, FALSE, FALSE, FALSE, FALSE, 1),
(6, 'MARINA AZUL PREMIUM', 'Atún sólido en aceite de oliva extra virgen', 24, 'Sólido o compacto', 120, TRUE, 80, TRUE, 29, '0%', TRUE, TRUE, NULL, 'Aceite de oliva', FALSE, FALSE, FALSE, FALSE, FALSE, 1),
(7, 'EL VELERO ORTIZ', 'Atún blanco en sólido en aceite de oliva', 337, 'Sólido o compacto', 270, TRUE, 180, TRUE, 29, '0%', TRUE, TRUE, NULL, 'Aceite de oliva extra virgen', FALSE, FALSE, FALSE, FALSE, TRUE, 1),
(8, 'MARINA AZUL PREMIUM', 'Atún sólido en agua', 36, 'Sólido o compacto', 270, TRUE, 190, TRUE, 26.1, '0%', FALSE, FALSE, 'Rebasó el 18% de la proporción de hojuelas y trozos que establece la NOM-235 para denominarse atún sólido, ya que contiene de 20.5 a 21.6%', 'Agua', FALSE, FALSE, FALSE, FALSE, FALSE, 1),
(9, 'ORO DE ESPAÑA', 'Atún blanco en trozos en aceite de oliva', 232, 'Sólido o compacto', 230, TRUE, 150, TRUE, 18.2, '0%', TRUE, TRUE, NULL, 'Aceite de oliva', FALSE, FALSE, FALSE, FALSE, TRUE, 1),
(10, 'TUNY GOURMET', 'Atún aleta amarilla sólido en aceite con agua', 34, 'Sólido o compacto', 140, TRUE, 100, TRUE, 25, '0%', TRUE, TRUE, NULL, 'Aceite con agua', FALSE, FALSE, FALSE, FALSE, FALSE, 1),
(11, 'YURRITA', 'Atún blanco en sólido sin piel en aceite de oliva', 46, 'Sólido o compacto', 140, TRUE, 100, TRUE, 26, '0%', TRUE, TRUE, NULL, 'Aceite de oliva', FALSE, FALSE, FALSE, FALSE, FALSE, 1),
(12, 'TUNY GOURMET', 'Atún aleta amarilla sólido en aceite de oliva', 385, 'Sólido o compacto', 225, TRUE, 150, TRUE, 27.9, '0%', TRUE, TRUE, NULL, 'Aceite de oliva', FALSE, FALSE, TRUE, FALSE, TRUE, 1),
(13, 'DOLORES PREMIUM', 'Atún aleta amarilla en trozos en aceite de oliva', 21, 'En trozos', 78.00, true, 74.00, true, 22.8, '0%', false, true, NULL, 'Aceite de oliva', false, false, false, false, false, 1),
(14, 'GOLDEN HILLS', 'Atún en trozos en agua', 19, 'En trozos', 130.00, true, 90.00, true, 22.00, '0%', false, false, 'Rebasó el 30% de la proporción de hojuelas que establece la norma para denominarse atún en trozos, ya que tuvo 41.7% por lo que incumple la NOM-235', 'Agua', false, false, false, false, false, 1),
(15, 'GOLDEN HILLS', 'Atún en trozos en aceite con agua', 19, 'En trozos', 130.00, true, 90.00, true, 25.3, '0%', false, true, 'No es veraz en la declaración del Medio de cobertura, ya que indica: Aceite con agua, y es: Agua con aceite, es decir, más agua que aceite', 'Agua', false, false, false, false, false, 1),
(16, 'GREAT VALUE', 'Atún en trozos en agua', 15, 'En trozos', 74.00, true, 70.00, true, 19.00, '0%', true, true, NULL, 'Agua', false, false, false, false, false, 1),
(17, 'MARINA AZUL', 'Atún en trozos en aceite de oliva extra virgen', 24, 'En trozos', 74.00, true, 70.00, true, 28.2, '0%', false, true, 'La imagen en su empaque (atún sólido) no corresponde a su presentación (atún en trozos), por lo que no es veraz.', 'Aceite de oliva extra virgen', false, false, false, false, false, 1),
(18, 'MARINA AZUL', 'Atún en trozos en agua bajo en sodio', 39, 'En trozos', 180.00, true, 175.00, true, 26.6, '0%', false, true, 'Su denominación al frente del empaque está incompleta, ya que debería indicar: Atún en trozos en agua bajo en grasa, y solo indica: Atún en trozos en agua, y al reverso: Bajo en grasa, por lo que incumple la NOM-235 -La imagen en su empaque (atún sólido) no corresponde a su presentación (atún en trozos), por lo que no es veraz', 'Agua', false, false, false, false, false, 1),
(19, 'MARINA AZUL', 'Atún en trozos en agua', 38, 'En trozos', 180.00, true, 175.00, true, 22.8, '0%', false, true, 'Su denominación al frente del empaque está incompleta, ya que debería indicar: Atún en trozos en agua bajo en grasa, y solo indica: Atún en trozos en agua, y al reverso: Bajo en grasa, por lo que incumple la NOM-235 -La imagen en su empaque (atún sólido) no corresponde a su presentación (atún en trozos), por lo que no es veraz', 'Agua', false, false, false, false, false, 1),
(20, 'TUNY', 'Atún aleta amarilla en trozos en agua bajo en sodio', 38, 'En trozos', 180.00, true, NULL, NULL, 23.00, '0%', true, true, NULL, 'Agua', false, false, false, false, false, 1),
(21, 'TUNY CLÁSICO', 'Atún aleta amarilla en trozos en agua', 19, 'En trozos', 75.00, true, NULL, NULL, 22.00, '0%', true, true, NULL, 'Agua', false, false, false, false, false, 1),
(22, 'TUNY PREMIUM', 'Atún aleta amarilla en trozos en aceite con agua', 27, 'En trozos', 140.00, true, 100.00, true, 25.3, '0%', false, true, 'No es veraz en la declaración de Masa drenada, ya que indica 100 g y tuvo de 91.7 g a 98.2 g.', 'No es veraz', false, false, false, false, false, 1),
(23, 'TUNY', 'Atún en trozos en aceite de oliva', 23, 'En trozos', 75.00, true, NULL, NULL, 23.00, '0%', true, true, NULL, 'Aceite de oliva', false, false, false, false, false, 1),
(24, 'TUNY PREMIUM', 'Atún aleta amarilla en trozos en agua', 27, 'En trozos', 140.00, true, 100.00, true, 22.00, '0%', false, false, 'No es veraz en la declaración de Masa drenada, ya que indica 100 g y tuvo de 91.7 g a 98.2 g. Rebasó el 30% de la proporción de hojuelas que establece la norma para denominarse atún en trozos, ya que tuvo de 34.6 a 37.2%', 'Agua', false, false, false, false, false, 1),
(25, 'TUNY SPORT', 'Atún en trozos en agua adicionado de vitaminas', 24, 'En hojuelas', 75.00, true, NULL, NULL, 28.00, '0%', true, true, NULL, 'Agua', false, false, false, false, false, 1),
(26, 'ATÚN DOLORES', 'Atún aleta amarilla en hojuelas en agua', 41, 'En hojuelas', 295.00, true, 220.00, true, 22.00, '0%', true, true, NULL, 'Agua', false, false, false, false, true, 1),
(27, 'CALMEX', 'Atún aleta amarilla con 4% de soya en agua', 19, 'En hojuelas', 135.00, true, 90.00, true, 16.90, 'de 1 a 2%', false, false, '-No indica presentación, por lo que incumple la NOM-235, sin embargo, es en hojuelas. -Presenta el distintivo de cumplimiento de la NOM-235, pero no comprueba su uso -Le falta el sello exceso de sodio', 'Agua', false, false, false, false, false, 1),
(28, 'EL DORADO', 'Atún con 30% de soya en agua con aceite', 12, 'En hojuelas', 130.00, true, 90.00, false, 17.30, 'de 11 a 14%', true, true, NULL, 'Agua con aceite', false, false, false, false, true, 1),
(29, 'GREAT VALUE', 'Atún en hojuelas en agua', 38, 'En hojuelas', 295.00, true, 220.00, true, 20.30, '0%', false, true, '-Puede confundir al consumidor pues presenta fecha de caducidad y de consumo preferente -Le falta el sello exceso de sodio', 'Agua', false, false, false, false, false, 1),
(30, 'EL DORADO', 'Atún con 30% de soya en agua', 12, 'En hojuelas', 130.00, true, 90.00, true, 17.60, '18% a 23%', true, true, NULL, 'Agua', false, false, false, false, true, 1),
(31, 'GREAT VALUE', 'Atún en hojuelas en agua', 18, 'En hojuelas', 140.00, true, 100.00, false, 19.80, '0%', false, true, '-No es veraz en la declaración de Masa drenada, ya que indica 100 g y tuvo de 87 g a 95.4 g -Puede confundir al consumidor pues presenta fecha de caducidad y de consumo preferente', 'Agua', false, false, false, false, false, 1),
(32, 'HERDEZ', 'Atún aleta amarilla en Hojuelas en Aceite con agua', 18, 'En hojuelas', 130.00, true, 90.00, false, 22.00, '0%', false, true, '-No es veraz en la declaración de Masa drenada, indica 90 g y tuvo 83 g -No es veraz en la declaración del Medio de cobertura, ya que indica: Aceite con agua y es Agua con aceite, es decir, más agua que aceite', 'No es veraz', false, false, false, false, false, 1),
(33, 'HERDEZ', 'Atún aleta amarilla en Hojuelas en Agua', 42, 'En hojuelas', 280.00, true, 200.00, false, 19.00, '0%', false, true, '-No es veraz en la declaración de Masa drenada, ya que indica 200g y tuvo 197.3g', 'Agua', false, false, false, false, false, 1),
(34, 'HERDEZ', 'Atún aleta amarilla en Hojuelas en Aceite con agua', 42, 'En hojuelas', 280.00, true, 200.00, true, 19.40, '0%', false, true, 'No es veraz en la declaración de Medio de cobertura, ya que indica: Aceite con agua y es Agua con aceite, es decir, más agua que aceite', 'No es veraz', false, false, false, false, false, 1),
(35, 'KE PRECIO!', 'Atún con 14% de proteína de soya en agua con aceite', 12, 'En hojuelas', 140.00, true, 91.00, true, 19.00, 'de 8 a 12%', false, true, 'Le falta el sello exceso sodio', 'Agua con aceite', false, false, false, false, false, 1),
(36, 'MAZATÚN', 'Atún en hojuelas en agua con aceite', 17, 'En hojuelas', 130.00, true, 90.00, true, 17.10, '0%', false, true, '-La imagen en su etiqueta (atún sólido) no corresponde a su presentación (atún en hojuelas), por lo que no es veraz -Le falta el sello exceso de sodio', 'Agua con aceite', false, false, false, false, false, 1),
(37, 'NAIR', 'Atún en hojuelas en agua', 19, 'En hojuelas', 120.00, true, 80.00, true, 19.80, '0%', true, true, NULL, 'Agua', false, false, false, false, false, 1),
(38, 'MAZATÚN', 'Atún en hojuelas en agua', 18, 'En hojuelas', 130.00, true, 90.00, true, 22.00, '0%', true, true, NULL, 'Agua', false, false, false, false, true, 1),
(39, 'PRECISSIMO', 'Atún con 30% de soya en agua con aceite', 25, 'En hojuelas', 285.00, true, 205.00, false, 13.00, 'de 11 a 18%', false, true, 'No es veraz en la declaración de Masa drenada, ya que indica 205g y tuvo 201.4g -Le falta el sello exceso de sodio', 'Agua con aceite', false, false, false, false, false, 1),
(40, 'TUNY JUMBO', 'Atún Aleta amarilla en hojuelas en agua', 39, 'En hojuelas', 295.00, true, 220.00, true, 21.00, '0%', true, true, NULL, 'Agua', false, false, false, false, false, 1),
(41, 'VALLEY FOODS', 'Atún en hojuelas en agua', 18, 'En hojuelas', 140.00, true, 100.00, true, 20.00, '0%', false, true, 'Le falta el sello exceso sodio', 'Agua', false, false, false, false, false, 1),
(42, 'VALLEY FOODS', 'Atún en hojuelas en agua con aceite', 38, 'En hojuelas', 295.00, true, 220.00, true, 20.00, '0%', false, true, 'Le falta el sello exceso sodio', 'Agua con aceite', false, false, false, false, false, 1),
(43, 'ANCLA', 'Atún con 20% de proteína de soya en agua con aceite', 12, 'Desmenuzado', 120.00, true, 80.00, true, 8.00, '14%', true, true, NULL, 'Agua con aceite', false, false, false, false, true, 1),
(44, 'AURRERA', 'Atún con 14% de soya en agua con aceite', 31, 'Desmenuzado', 295.00, true, 220.00, true, 18.20, 'No es veraz', false, true, 'No es veraz en la declaración de Porcentaje de soya en masa drenada, ya que indica 14% y obtuvo de 21 a 22% -Puede confundir al consumidor pues presenta fecha de caducidad y de consumo preferente', 'Agua con aceite', false, false, false, false, true, 1),
(45, 'ANCLA', 'Atún con 20% de proteína de soya en agua', 12, 'Desmenuzado', 120.00, true, 80.00, true, 9.00, 'de 13 a 25%', true, true, NULL, 'Agua', false, false, false, false, true, 1),
(46, 'AURRERA', 'Atún con 14% de soya en agua', 29, 'Desmenuzado', 295.00, true, 220.00, true, 20.00, 'de 11 a 13%', false, true, 'Puede confundir al consumidor pues presenta fecha de caducidad y de consumo preferente', 'Agua', false, false, false, false, true, 1),
(47, 'CHEDRAUI', 'Atún con 20% de soya en agua', 12, 'Desmenuzado', 130.00, true, 90.00, true, 14.00, 'de 11 a 13%', true, true, NULL, 'Agua', false, false, false, false, true, 1),
(48, 'FRESH LABEL', 'Atún desmenuzado en aceite', 11, 'Desmenuzado', 140.00, true, 100.00, true, 21.00, '0%', false, true, '-Declara Medio de cobertura, en Aceite y tiene Agua con aceite, es decir, más agua que aceite. -Presenta el distintivo de cumplimiento de la NOM-235, pero no comprueba su uso -Puede confundir al consumidor pues presenta fecha de caducidad y de consumo preferente -Le falta el sello exceso sodio', 'No es veraz', false, false, true, true, true, 1),
(49, 'CHEDRAUI', 'Atún con 20% de soya en agua con aceite', 12, 'Desmenuzado', 130.00, true, 90.00, true, 16.00, 'de 10 a 12%', true, true, NULL, 'Agua con aceite', false, false, false, false, true, 1),
(50, 'FRESH LABEL', 'Atún desmenuzado en agua', 11, 'Desmenuzado', 140.00, true, 100.00, false, 21.00, '0%', false, true, '-No es veraz en la declaración de Masa drenada, ya que indica 100g y tuvo de 92.3g a 95.9g -Presenta el distintivo de cumplimiento de la NOM-235, pero no comprueba su uso -Puede confundir al consumidor pues presenta fecha de caducidad y de consumo preferente -Le falta el sello exceso sodio', 'Agua', false, false, false, false, false, 1),
(51, 'KE PRECIO!', 'Atún con 14% de proteína de soya en agua', 12, 'Desmenuzado', 130.00, true, 90.00, false, 20.00, 'de 9 a 12%', false, true, 'No es veraz en la declaración de Masa drenada ya que indica 90g y tuvo 86.6g', 'Agua', false, false, false, false, true, 1),
(52, 'PRECISSIMO', 'Atún con 30% de proteína en agua', 12, 'Desmenuzado', 140.00, true, 91.00, true, 11.00, 'de 15 a 19%', false, true, 'Le falta el sello exceso sodio', 'Agua', false, false, false, false, false, 1);

-- INSERT para EstudioCafeterasGoteo
INSERT INTO EstudioCafeterasGoteo (idEstudioCafeterasGoteo, nombreProducto, region, precio, informacion, garantia, calentamiento, potenciaW, seguridad, derramamientoCafe, observaciones, calificacionGeneral, idTipoProducto) VALUES
(1, 'BLACK+DECKER', 'China', 752, 'Completa', 2, 'Excelente', 650, TRUE, TRUE, NULL, 'MB', 3),
(2, 'PROCTOR SILEX', 'China', 369, 'Completa', 3, 'Suficiente', 700, TRUE, FALSE, 'No cuenta con filtro', 'B', 3),
(3, 'OSTER', 'China', 384, 'Completa', 1, 'Muy Bueno', 600, TRUE, TRUE, NULL, 'B', 3),
(4, 'CUISINART', 'China', 1198, 'Completa', 3, 'Bueno', 600, TRUE, FALSE, 'Tanque de agua y portafiltros removible', 'B,', 3),
(5, 'TAURUS', 'China', 349, 'Completa', 2, 'Suficiente', 650, TRUE, FALSE, NULL, 'B', 3),
(6, 'TAURUS', 'China', 650, 'Completa', 2, 'Suficiente', 600, TRUE, FALSE, NULL, 'B', 3),
(7, 'OSTER', 'China', 2899, 'Completa', 1, 'Excelente', 1300, TRUE, FALSE, NULL, 'E', 3),
(8, 'KRUPS', 'China', 900, 'Completa', 2, 'Suficiente', 600, TRUE, FALSE, NULL, 'MB', 3),
(9, 'KRUPS', 'China', 1839, 'Completa', 2, 'Excelente', 900, TRUE, FALSE, NULL, 'MB', 3),
(10, 'SMEG', 'China', 4172, 'Completa', 1, 'Suficiente', 1050, TRUE, FALSE, NULL, 'MB', 3),
(11, 'KRUPS', 'China', 2799, 'Completa', 2, 'Muy Bueno', 1000, TRUE, TRUE, 'Cuenta con contenedor y dispensador de café', 'MB', 3),
(12, 'PROCTOR SILEX', 'China', 699, 'Completa', 3, 'Muy Bueno', 900, TRUE, TRUE, 'No cuenta con filtro', 'B', 3),
(13, 'T-FAL', 'China', 999, 'Completa', 1, 'Muy Bueno', 1000, TRUE, TRUE, NULL, 'MB', 3),
(14, 'PROCTOR SILEX', 'China', 499, 'Completa', 3, 'Excelente', 900, TRUE, TRUE, NULL, 'E', 3),
(15, 'HAMILTON BEACH', 'China', 761, 'Completa', 1, 'Muy Bueno', 950, TRUE, FALSE, NULL, 'MB', 3),
(16, 'KALORIK', 'China', 1096, 'Completa', 1, 'Muy Bueno', 900, TRUE, FALSE, NULL, 'MB', 3),
(17, 'TAURUS', 'China', 412, 'Completa', 2, 'Muy Bueno', 700, TRUE, FALSE, 'Sistema de fácil llenado de agua', 'B', 3),
(18, 'BLACK+DECKER', 'China', 919, 'Completa', 2, 'Muy Bueno', 1000, TRUE, TRUE, NULL, 'B', 3),
(19, 'HAMILTON BEACH', 'China', 2124, 'Completa', 5, 'Excelente', 1350, TRUE, FALSE, 'No cuenta con filtro', 'MB', 3),
(20, 'POWER XL', 'China', 1005, 'Completa', 2, 'Bueno', 1000, TRUE, TRUE, 'Declara tener la función de preparar café helado (percolado con agua fría agregándole hielo a la', 'MB', 3),
(11, 'KRUPS', 'China', 2799, 'Completa', 2, 'Muy Bueno', 1000, TRUE, TRUE, 'Cuenta con contenedor y dispensador de café', 'MB', 3),
(12, 'PROCTOR SILEX', 'China', 699, 'Completa', 3, 'Muy Bueno', 900, TRUE, TRUE, 'No cuenta con filtro', 'B', 3),
(13, 'T-FAL', 'China', 999, 'Completa', 1, 'Muy Bueno', 1000, TRUE, TRUE, NULL, 'MB', 3),
(14, 'PROCTOR SILEX', 'China', 499, 'Completa', 3, 'Excelente', 900, TRUE, TRUE, NULL, 'E', 3),
(15, 'HAMILTON BEACH', 'China', 761, 'Completa', 1, 'Muy Bueno', 950, TRUE, FALSE, NULL, 'MB', 3),
(16, 'KALORIK', 'China', 1096, 'Completa', 1, 'Muy Bueno', 900, TRUE, FALSE, NULL, 'MB', 3),
(17, 'TAURUS', 'China', 412, 'Completa', 2, 'Muy Bueno', 700, TRUE, FALSE, 'Sistema de fácil llenado de agua', 'B', 3),
(18, 'BLACK+DECKER', 'China', 919, 'Completa', 2, 'Muy Bueno', 1000, TRUE, TRUE, NULL, 'B', 3),
(19, 'HAMILTON BEACH', 'China', 2124, 'Completa', 5, 'Excelente', 1350, TRUE, FALSE, 'No cuenta con filtro', 'MB', 3),
(20, 'POWER XL', 'China', 1005, 'Completa', 2, 'Bueno', 1000, TRUE, TRUE, 'Declara tener la función de preparar café helado (percolado con agua fría agregándole hielo a la', 'MB', 3),
(21, 'ATVIO HOME', 'China', 308, 'Completa', 1, 'Muy Bueno', 900, TRUE, FALSE, NULL, 'B', 3),
(22, 'CHEFMAN ', 'China', 1399, 'Completa', 1, 'Bueno', 950, TRUE, FALSE, NULL, 'B', 3),
(23, 'ATVIO ', 'China', 308, 'Completa', 1, 'Muy Bueno', 900, TRUE, FALSE, NULL, 'B', 3),
(24, 'HAMILTON BEACH ', 'China', 1019, 'Completa', 1, 'Bueno', 1025, TRUE, FALSE, NULL, 'B', 3),
(25, 'T-FAL', 'China', 731, 'Completa', 1, 'Suficiente', 900, TRUE, TRUE, NULL, 'B', 3),
(26, 'KOBLENZ', 'China', 991, 'Completa', 2, 'Bueno', 1000, TRUE, FALSE, NULL, 'D', 3);

-- INSERT para EstudioServilletas
INSERT INTO EstudioServilletas (idServilletas, nombre, descripcion, region, precio_paq, precio_10_paq, contenido_neto, calificacion, acabados, Resistencia_servilleta, Absorción_total, observaciones, idtipoproducto) VALUES
(1, 'BOUNTY', 'Paquete de 100 servilletas hoja sencilla', 'EUA', 117, 12, 1, 'MB', 'MB', 'B', 'E', 'Presenta agujeros (defecto mayor)\nAcumulación de celulosa (defecto menor)', 3),
(2, 'RENOVA', 'Paquete de 40 servilletas hoja doble ', 'Portugal', 49, 12, 1, 'E', 'MB', 'E', 'E', 'Sin defectos', 3),
(3, 'GOLDEN HILLS', 'Paquete de 200 servilletas hoja doble', 'México', 86, 4, 1, 'MB', 'MB', 'MB', 'MB', 'Dobleces no paralelos (defecto mayor)', 3),
(4, 'ELITE', 'Paquete de 200 servilletas hoja doble', 'México ', 93, 5, 1, 'MB', 'B', 'MB', 'MB', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3),
(5, 'KLEENEX', 'Paquete de 200 servilletas hoja doble', 'México', 96, 5, 1, 'MB', 'MB', 'B', 'MB', 'Dobleces no paralelos (defecto mayor)\nCortes con rebabas o sobrantes (defecto menor)', 3),
(6, 'QUALITY DAY', 'Paquete de 100 servilletas hoja doble', 'México', 84, 8, 1, 'MB', 'B', 'MB', 'MB', 'Con manchas ajenas al papel (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3),
(7, 'ELITE', 'Paquete de 225 servilletas hoja sencilla', 'México', 35, 2, 1, 'MB', 'MB', 'MB', 'MB', 'Dobleces no paralelos (defecto mayor)', 3),
(8, 'GREAT VALUE', 'Paquete de 100 servilletas hoja doble', 'México', 60, 6, 1, 'MB', 'S', 'MB', 'B', 'Con manchas ajenas al papel (defecto mayor)\nPresenta agujeros (defecto mayor)\nDobleces no paralelos ', 3),
(9, 'SUAVEL', 'Paquete de 180 servilletas hoja sencilla', 'México', 24, 1, 1, 'B', 'B', 'B', 'E', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3),
(10, 'CHEDRAUI', 'Paquete de 360 servilletas hoja sencilla', 'México', 25, 1, 1, 'B', 'MB', 'S', 'E', 'Presenta agujeros (defecto mayor)', 3),
(11, 'SELECTO', 'Paquete de 400 servilletas hoja sencilla', 'México', 46, 1, 1, 'B', 'MB', 'S', 'E', 'Presenta agujeros (defecto mayor)\nAcumulación de celulosa (defecto menor)', 3),
(12, 'FANCY', 'Paquete de 360 servilletas hoja sencilla', 'México', 34, 1, 1, 'B', 'B', 'S', 'E', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3),
(13, 'PÉTALO', 'Paquete de 420 servilletas hoja sencilla', 'México', 52, 1, 1, 'B', 'MB', 'MB', 'B', 'Dobleces no paralelos (defecto mayor)', 3),
(14, 'ADORABLE', 'Paquete de 450 servilletas hoja sencilla', 'México', 42, 1, 1, 'B', 'B', 'B', 'B', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)\nAcumulación de celulosa (defecto menor)', 3),
(15, 'GREAT VALUE', 'Paquete de 400 servilletas hoja sencilla', 'México', 51, 1, 1, 'B', 'S', 'MB', 'E', 'Con manchas ajenas al papel (defecto mayor)\nPresenta agujeros (defecto mayor),Dobleces no paralelos ', 3),
(16, 'PRECISSIMO', 'Paquete de 350 servilletas hoja sencilla', 'México', 30, 1, 1, 'B', 'B', 'MB', 'E', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3),
(17, 'GOLDEN HILLS', 'Paquete de 220 servilletas hoja sencilla', 'México', 30, 1, 1, 'B', 'B', 'B', 'E', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3),
(18, 'QUALITY DAY', 'Paquete de 400 servilletas hoja sencilla', 'México', 51, 1, 1, 'B', 'MB', 'S', 'E', 'Dobleces no paralelos (defecto mayor)', 3),
(19, 'CLOUDY', 'Paquete de 200 servilletas hoja sencilla', 'México', 49, 2, 1, 'B', 'MB', 'S', 'B', 'Dobleces no paralelos (defecto mayor)', 3),
(20, 'REGIO', 'Paquete de 250 servilletas hoja sencilla', 'México', 50, 2, 1, 'B', 'B', 'B', 'B', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3),
(21, 'BIO', 'Paquete de 250 servilletas hoja sencilla', 'México', 34, 1, 0, 'B', 'B', 'MB', 'E', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3),
(22, 'HORTENSIA', 'Paquete de 300 servilletas hoja sencilla', 'México', 30, 1, 0, 'B', 'MB', 'MB', 'E', 'Dobleces no paralelos (defecto mayor)', 3),
(23, 'KE PRECIO', 'Paquete de 200 servilletas hoja sencilla', 'No presenta', 15, 1, 1, 'B', 'B', 'S', 'E', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3),
(24, 'SUBLIME', 'Paquete de 200 servilletas hoja sencilla', 'México', 20, 1, 0, 'B', 'B', 'B', 'MB', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3),
(25, 'CHEDRAUI', 'Paquete de 360 servilletas hoja sencilla', 'México', 22, 1, 1, 'B', 'S', 'S', 'MB', NULL, 3),
(26, 'AURRERA', 'Paquete de 360 servilletas hoja sencilla', 'México', 31, 1, 1, 'B', 'B', 'MB', 'B', NULL, 3),
(27, 'REGIO', 'Paquete de 250 servilletas hoja sencilla', 'México', 37, 1, 1, 'S', 'B', 'B', 'B', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3),
(28, 'CLOUDY', 'Paquete de 400 servilletas hoja sencilla', 'México', 21, 1, 0, 'S', 'B', 'S', 'S', 'Presenta agujeros (defecto mayor)\nDobleces no paralelos (defecto mayor)', 3);

-- INSERT para EstudioMayonesas
INSERT INTO EstudioMayonesas (idEstudioMayonesas, nombreProducto, descripcion, precio, categoria, contenidoEnergético, grasas, sodio, infAlConsumidor, contNeto, carbohidratos, proteina, observaciones, excesoCalorias, excesoAzucares, excesoGrasasSaturadas, excesoGrasasTrans, excesoSodio, idTipoProducto) VALUES
(1, 'BEST FOODS REAL', 'Mayonesa / México / 473 ml ', 67.00, 'Mayonesas' 719, 78.9, 589, FALSE, FALSE, 1, 1.2, 'Declara 473 ml de contenido neto y contiene 428 ml', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(2, 'LA COSTEÑA', 'Mayonesa con jugo de limón / México / 190 g', 27.00, 'Mayonesas' 746, 81.9, 580, TRUE, TRUE, 1, 1.4, 'No demostró las frases:\n-"Ingredientes de la mejor calidad"\n-"Su sabor único Heinz"\nNo coloca al jugo de limón dentro de azúcares añadidos, por lo que incumple norma de etiquetado', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(3, 'HEINZ', 'Mayonesa con limón / México / 370 g', 53.00, 'Mayonesas' 641, 69.9, 483, FALSE, TRUE, 2.2, 0.9, 'No demostró las frases:\n-"Especialmente elaborada con ingredientes de la más alta calidad"\n-"Su sabor único Heinz"\nNo coloca al jugo de limón dentro de los azúcares añadidos, por lo que incumple norma de etiquetado\nNo cumple con el mínimo de proteína indicado en la norma mexicana de mayonesa para ser una mayonesa reducida en grasa', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(4, 'HEINZ', 'Mayonesa / México / 170 g', 26.00, 'Mayonesas' 651, 65.5, 411, FALSE, TRUE, 14.7, 0.8, '', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(5, 'GREAT VALUE', 'Mayonesa con jugo de limón / México / 870 g', 76.00, 'Mayonesas' 617, 67.2, 650, TRUE, TRUE, 1.8, 1.3, '', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(6, 'MCCORMICK', 'Mayonesa con jugo de limones / México / 190 g', 28.00, 'Mayonesas' 745, 81.3, 600, FALSE, TRUE, 2, 1.3, '', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(7, 'MAILLE', 'Mayonesa Fina / Francia / 320 g', 126.00, 'Mayonesas' 725, 79.3, 440, TRUE, TRUE, 1.1, 1.8, '', TRUE, FALSE, FALSE, FALSE, TRUE, 1),
(8, 'MAILLE', 'Mayonesa Fina Gourmet / Francia / 320 g', 126.00, 'Mayonesas' 717, 78.5, 560, TRUE, TRUE, 0.5, 2.1 , '', TRUE, FALSE, FALSE, FALSE, TRUE, 1),
(9, 'MEMBER´S MARK', 'Mayonesa / México / 3.35 kg', 262.00, 'MAYONESA REDUCIDA EN GRASA' 768, 84, 534, TRUE, TRUE, 2.1, 0.9, '', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(10, 'AURRERA', 'Mayonesa con jugo de limón / México / 870 g', 75.00, 'MAYONESA REDUCIDA EN GRASA' 450, 47.7, 610, TRUE, TRUE, 3.8, 1.4, '', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(11, 'HEINZ', 'Mayonesa reducida en grasa / México / 390 g', 52.00, 'MAYONESA REDUCIDA EN GRASA' 318, 34.5, 547, FALSE, TRUE, 1.4, 0.4, 'No demostró la frase:\n"El sabor de nuestra mayonesa que conoces"\nNo coloca al jugo de limón dentro de los azúcares añadidos, por lo que incumple norma de etiquetado\nSu nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado\nNo cumple con el mínimo de proteína indicado en la norma mexicana de mayonesa para ser una mayonesa reducida en grasa', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(12, 'HELLMANNS ', 'Mayonesa reducida en grasa, Clásica / México / 190 g*', 25.00, 'MAYONESA REDUCIDA EN GRASA' 399, 41.4, 737, TRUE, TRUE, 5.4, 1.1, '', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(13, 'KRAFT ', 'Mayonesa reducida en grasa, con jugo de limón / México / 650 g', 61.00, 'MAYONESA REDUCIDA EN GRASA' 326, 33.1, 775, TRUE, TRUE, 6.2, 1, '', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(14, 'KRAFT ', 'Mayonesa reducida en grasa, tipo casero / México / 650 g', 61.00, 'MAYONESA REDUCIDA EN GRASA' 327, 33.5, 755, FALSE, TRUE, 5.8, 0.7, 'No demostró la frase:\n"Tipo Casero"\nNo cumple con el mínimo de proteína indicado en la norma mexicana de mayonesa para ser una mayonesa reducida en grasa', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(15, 'HELLMANNS', 'Aderezo con Aceite de Canola Liviana / México / 220 g', 31.00, 'ADEREZOS' 174, 15.2, 299, FALSE, TRUE, 8.5, 0.8, 'Usa el término "LIVIANA", el cual es potencialmente engañoso pues carece de sentido, por lo que incumple norma de etiquetado', FALSE, FALSE, FALSE, FALSE, TRUE, 1),
(16, 'HELLMANNS ', 'Aderezo LIGHT / México / 355 g', 44.00, 'ADEREZOS' 201, 18.1, 734, FALSE, TRUE, 9, 0.5, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', FALSE, FALSE, TRUE, FALSE, TRUE, 1),
(17, 'HELLMANNS', 'Aderezo sabor Mayonesa, ligera, con jugo de limón / México / 190 g', 20.00, 'ADEREZOS' 236, 21.8, 748, FALSE, TRUE, 8.6, 1.3, 'Presenta la leyenda "PRECIO ESPECIAL" la cual, al no ser clara, es potencialmente engañosa pues no especifica a qué se refiere, por lo que incumple la norma de etiquetado\nSu nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', FALSE, FALSE, TRUE, FALSE, TRUE, 1),
(18, 'HELLMANNS VEGANA', 'Aderezo 100% Vegetal / Polonia / 280 ml', 95.00, 'ADEREZOS' 336, 35.6, 543, TRUE, TRUE, 3.7, 0.18, '', TRUE, FALSE, FALSE, FALSE, TRUE, 1),
(19, 'MCCORMICK BALANCE', 'Aderezo con Aceite de almendras / México / 315 g', 51.00, 'ADEREZOS' 260, 24.1, 242, FALSE, TRUE, 10.1, 0.7, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', FALSE, FALSE, FALSE, FALSE, FALSE, 1),
(20, 'MCCORMICK BALANCE', 'Aderezo con Aceite de ajonjolí / México / 315g', 51.00, 'ADEREZOS' 263, 24.4, 241, FALSE, TRUE, 10, 0.9, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', FALSE, FALSE, FALSE, FALSE, FALSE, 1),
(21, 'MCCORMICK BALANCE ', 'Aderezo con Aceite de aguacate / México / 315 g', 51.00, 'ADEREZOS' 268, 25, 239, FALSE, TRUE, 9.9, 0.8, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', FALSE, FALSE, FALSE, FALSE, FALSE, 1),
(22, 'MCCORMICK BALANCE', 'Aderezo con Aceite de canola / México / 315 g', 51.00, 'ADEREZOS' 261, 24.2, 242, FALSE, TRUE, 10, 0.8, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', FALSE, FALSE, FALSE, FALSE, FALSE, 1),
(23, 'MCCORMICK ', 'Aderezo con jugo de limones light / México / 425 g', 51.00, 'ADEREZOS' 273, 25.1, 684, FALSE, TRUE, 11.1, 0.7, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', FALSE, FALSE, TRUE, FALSE, TRUE, 1),
(24, 'LA COSTEÑA', 'Aderezo de Mayonesa Light / México / 420 g', 35.00, 'ADEREZO DE MAYONESA' 350, 34.4, 780, FALSE, TRUE, 9, 0.9, 'Usa el término "Light" para comparar el contenido de calorías entre "Aderezo de mayonesa" y "Mayonesa"; sin embargo, al ser un Aderezo, debería compararse con un Aderezo de mayonesa, por lo que incumple la norma de etiquetado', TRUE, FALSE, TRUE, FALSE, TRUE, 1);