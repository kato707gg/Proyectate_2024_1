-- Creación de la tabla TipoDeProductos
CREATE TABLE TipoDeProductos (
    idTipoProducto INT PRIMARY KEY,
    nombreTipoProducto VARCHAR(100)
);

CREATE TABLE InfoRelevante (
    idInfoRelevante INT PRIMARY KEY,
    titulo VARCHAR(255),
    descripcionEstudio TEXT,
    colorTitulo VARCHAR(20),
    colorFondo VARCHAR(20),
    idTipoProducto INT,
    FOREIGN KEY (idTipoProducto) REFERENCES TipoDeProductos(idTipoProducto)
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


CREATE TABLE EstudioSalsasCatsup (
  idEstudioSalsasCatsup INT PRIMARY KEY,
  nombreProducto varchar(100),
  descripcion varchar(100),
  precio decimal(10,2),
  categoria VARCHAR(50),
  contenidoEnergetico INT,
  sodio INT,
	azucaresTotales decimal(10,2),
  infAlConsumidor varchar(100),
  contNeto varchar(100),
  carbohidratos decimal(10,2),
  observaciones TEXT,
	colorante boolean,
	saborizante boolean,
  excesoCalorias boolean,
  excesoAzucares boolean,
  excesoGrasasSaturadas boolean,
  excesoGrasasTrans boolean,
  excesoSodio boolean,
  idTipoProducto INT,
  FOREIGN KEY (idTipoProducto) REFERENCES TipoDeProductos(idTipoProducto)
);

CREATE TABLE EstudioPijamas (
  idEstudioPijamas INT PRIMARY KEY,
  nombreProducto varchar(100),
  descripcion varchar(100),
  precio decimal(10,2),
  categoria VARCHAR(50),
  infAlConsumidor varchar(100),
	calificacionGeneral varchar(50),
	acabados varchar(50),
	verificacionDeTallas varchar(50),
	identificacionDeFibras varchar(50),
	solidezDelColor varchar(50),
  idTipoProducto INT,
  FOREIGN KEY (idTipoProducto) REFERENCES TipoDeProductos(idTipoProducto)
);

CREATE TABLE `estudiopandecaja` (
  idPancaja int(11) NOT NULL,
  nombre varchar(100) DEFAULT NULL,
  descripcion varchar(100) DEFAULT NULL,
  gramos int(100) NOT NULL,
  precio int(11) DEFAULT NULL,
  informacionconsumidor varchar(100) DEFAULT NULL,
  azucarestotales float DEFAULT NULL,
  sodio int(11) DEFAULT NULL,
  Calidadsanitaria tinyint(1) DEFAULT NULL,
  Proteina float DEFAULT NULL,
  grasa float DEFAULT NULL,
  fibra float DEFAULT NULL,
  carbohidratos float DEFAULT NULL,
  contenidoenergetico float DEFAULT NULL,
  observacion text DEFAULT NULL,
  excesoCalorias tinyint(1) DEFAULT NULL,
  excesoAzucares tinyint(1) DEFAULT NULL,
  excesoGrasasSaturadas tinyint(1) DEFAULT NULL,
  excesoGrasasTrans tinyint(1) DEFAULT NULL,
  excesoSodio tinyint(1) DEFAULT NULL,
  idtipoproducto int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `termos_personales` (
  `idtermospersonales` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `informacion` tinyint(1) DEFAULT NULL,
  `calificacion` varchar(10) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `Diseño` text DEFAULT NULL,
  `Dimensiones` varchar(100) DEFAULT NULL,
  `Ensambledelatapa` varchar(10) DEFAULT NULL,
  `Verificada` varchar(100) DEFAULT NULL,
  `Peso` float DEFAULT NULL,
  `Hermeticidad` varchar(100) DEFAULT NULL,
  `Aguafria` varchar(10) DEFAULT NULL,
  `Aguacaliente` varchar(10) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `idtipoproductos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- Inserts para la info relevante
INSERT INTO InfoRelevante (idInfoRelevante, titulo, descripcionEstudio, colorTitulo, colorFondo, idTipoProducto) VALUES
(1, 'Mayonesas y aderezos', 'Al parecer, hacer en casa tu propia mayonesa tradicional ha perdido lugar ante la comodidad de simplemente abrir un envase de mayonesa industrializada. Elaborar tu mayonesa es un hábito sano, fácil y rápido. Sin embargo, si buscas solo abrir un envase para agregar sabor a tus platillos, conoce de qué están realmente hechas las mayonesas y aderezos para que consideres agregarlos o no a lo que comes.','#C01F22','#EFEBE2', 1),
(2, 'Atún envasado', 'El atún envasado es una fuente de proteína accesible, por ello es importante conocer las diferentes presentaciones que existen en el mercado, cuánta soya y proteína contienen y cómo le afecta la entrada en vigor de la nueva regulación a la que está sujeto.\nDe nuevo pusimos a prueba a algunos de estos productos para que no te den soya por atún. Entérate de lo que encontramos.','#C4AC6A','#DEEBF1', 1),
(3, 'Salsa cátsup', 'La cátsup es un aderezo tan cotidiano que pocas veces nos detenemos a revisar con ojo crítico sus ingredientes y creemos que solo está elaborada con jitomate, pero esto no es tan cierto como parece. Pusimos a prueba estos productos, entérate de lo que encontramos.','#9F231D','#F5F5F5', 1),
(4, 'Termos personales', 'Ya sea que lleves café o té es importante conocer las características que ofrecen estos recipientes, pues en el mercado existe una amplia variedad de modelos con precios y calidades muy diferentes. Checa los resultados y elige el que no se derrame y, sobre todo, que sea seguro.','#312F30','#DDDDEA', 3),
(5, 'Servilletas', 'Las servilletas de papel son necesarias todos los días, ya sea durante el desayuno, la comida o la cena. Por ello, el laboratorio de la Profeco analizó la calidad de algunos modelos y así ayudarte a elegir de forma adecuada.','#4D7DBF','#F4F7FE', 3),
(6, 'Cafeteras de goteo', 'Las cafeteras de goteo, también conocidas como cafeteras de filtro, continúan siendo muy populares, pues el resultado de su desempeño es un café con:\n• Cuerpo más ligero\n• Mayor cantidad de cafeína\n• Aromas y matices más acentuados (en los modelos mejor calificados en este Estudio de Calidad)','#7A4036','#F6F6F6', 3),
(7, 'Pan de caja', 'El pan es un alimento común en la dieta de los consumidores mexicanos. Proporciona energía al organismo, ya que contiene carbohidratos. También, aporta proteínas de origen vegetal, así como grasa, sodio y, según el cereal con el que se elabore, puede aportar fibra.\nPusimos a prueba algunas marcas de pan de caja industrializado','#FF9013','#F0E9DF', 1),
(8, 'Pijamas para niñas y niños', 'Conoce las características de estas prendas y haz rendir tu presupuesto.\n Pusimos a prueba la calidad, resistencia, durabilidad, entre otras características, que presentan las principales marcas y modelos de pijamas para niñas y niños y así orientarte en tu compra','#1E304E','#A9D2FF', 5);

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
INSERT INTO EstudioMayonesas (idEstudioMayonesas, nombreProducto, descripcion, precio, categoria, contenidoEnergetico, grasas, sodio, infAlConsumidor, contNeto, carbohidratos, proteina, observaciones, excesoCalorias, excesoAzucares, excesoGrasasSaturadas, excesoGrasasTrans, excesoSodio, idTipoProducto) VALUES
(1, 'BEST FOODS REAL', 'Mayonesa / México / 473 ml ', 67.00, 'Mayonesas', 719, 78.9, 589, FALSE, FALSE, 1, 1.2, 'Declara 473 ml de contenido neto y contiene 428 ml', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(2, 'LA COSTEÑA', 'Mayonesa con jugo de limón / México / 190 g', 27.00, 'Mayonesas', 746, 81.9, 580, TRUE, TRUE, 1, 1.4, 'No demostró las frases:\n-"Ingredientes de la mejor calidad"\n-"Su sabor único Heinz"\nNo coloca al jugo de limón dentro de azúcares añadidos, por lo que incumple norma de etiquetado', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(3, 'HEINZ', 'Mayonesa con limón / México / 370 g', 53.00, 'Mayonesas', 641, 69.9, 483, FALSE, TRUE, 2.2, 0.9, 'No demostró las frases:\n-"Especialmente elaborada con ingredientes de la más alta calidad"\n-"Su sabor único Heinz"\nNo coloca al jugo de limón dentro de los azúcares añadidos, por lo que incumple norma de etiquetado\nNo cumple con el mínimo de proteína indicado en la norma mexicana de mayonesa para ser una mayonesa reducida en grasa', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(4, 'HEINZ', 'Mayonesa / México / 170 g', 26.00, 'Mayonesas', 651, 65.5, 411, FALSE, TRUE, 14.7, 0.8, '', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(5, 'GREAT VALUE', 'Mayonesa con jugo de limón / México / 870 g', 76.00, 'Mayonesas', 617, 67.2, 650, TRUE, TRUE, 1.8, 1.3, '', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(6, 'MCCORMICK', 'Mayonesa con jugo de limones / México / 190 g', 28.00, 'Mayonesas', 745, 81.3, 600, FALSE, TRUE, 2, 1.3, '', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(7, 'MAILLE', 'Mayonesa Fina / Francia / 320 g', 126.00, 'Mayonesas', 725, 79.3, 440, TRUE, TRUE, 1.1, 1.8, '', TRUE, FALSE, FALSE, FALSE, TRUE, 1),
(8, 'MAILLE', 'Mayonesa Fina Gourmet / Francia / 320 g', 126.00, 'Mayonesas', 717, 78.5, 560, TRUE, TRUE, 0.5, 2.1 , '', TRUE, FALSE, FALSE, FALSE, TRUE, 1),
(9, 'MEMBER´S MARK', 'Mayonesa / México / 3.35 kg', 262.00, 'MAYONESA REDUCIDA EN GRASA', 768, 84, 534, TRUE, TRUE, 2.1, 0.9, '', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(10, 'AURRERA', 'Mayonesa con jugo de limón / México / 870 g', 75.00, 'MAYONESA REDUCIDA EN GRASA', 450, 47.7, 610, TRUE, TRUE, 3.8, 1.4, '', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(11, 'HEINZ', 'Mayonesa reducida en grasa / México / 390 g', 52.00, 'MAYONESA REDUCIDA EN GRASA', 318, 34.5, 547, FALSE, TRUE, 1.4, 0.4, 'No demostró la frase:\n"El sabor de nuestra mayonesa que conoces"\nNo coloca al jugo de limón dentro de los azúcares añadidos, por lo que incumple norma de etiquetado\nSu nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado\nNo cumple con el mínimo de proteína indicado en la norma mexicana de mayonesa para ser una mayonesa reducida en grasa', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(12, 'HELLMANNS ', 'Mayonesa reducida en grasa, Clásica / México / 190 g*', 25.00, 'MAYONESA REDUCIDA EN GRASA', 399, 41.4, 737, TRUE, TRUE, 5.4, 1.1, '', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(13, 'KRAFT ', 'Mayonesa reducida en grasa, con jugo de limón / México / 650 g', 61.00, 'MAYONESA REDUCIDA EN GRASA', 326, 33.1, 775, TRUE, TRUE, 6.2, 1, '', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(14, 'KRAFT ', 'Mayonesa reducida en grasa, tipo casero / México / 650 g', 61.00, 'MAYONESA REDUCIDA EN GRASA', 327, 33.5, 755, FALSE, TRUE, 5.8, 0.7, 'No demostró la frase:\n"Tipo Casero"\nNo cumple con el mínimo de proteína indicado en la norma mexicana de mayonesa para ser una mayonesa reducida en grasa', TRUE, FALSE, TRUE, FALSE, TRUE, 1),
(15, 'HELLMANNS', 'Aderezo con Aceite de Canola Liviana / México / 220 g', 31.00, 'ADEREZOS', 174, 15.2, 299, FALSE, TRUE, 8.5, 0.8, 'Usa el término "LIVIANA", el cual es potencialmente engañoso pues carece de sentido, por lo que incumple norma de etiquetado', FALSE, FALSE, FALSE, FALSE, TRUE, 1),
(16, 'HELLMANNS ', 'Aderezo LIGHT / México / 355 g', 44.00, 'ADEREZOS', 201, 18.1, 734, FALSE, TRUE, 9, 0.5, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', FALSE, FALSE, TRUE, FALSE, TRUE, 1),
(17, 'HELLMANNS', 'Aderezo sabor Mayonesa, ligera, con jugo de limón / México / 190 g', 20.00, 'ADEREZOS', 236, 21.8, 748, FALSE, TRUE, 8.6, 1.3, 'Presenta la leyenda "PRECIO ESPECIAL" la cual, al no ser clara, es potencialmente engañosa pues no especifica a qué se refiere, por lo que incumple la norma de etiquetado\nSu nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', FALSE, FALSE, TRUE, FALSE, TRUE, 1),
(18, 'HELLMANNS VEGANA', 'Aderezo 100% Vegetal / Polonia / 280 ml', 95.00, 'ADEREZOS', 336, 35.6, 543, TRUE, TRUE, 3.7, 0.18, '', TRUE, FALSE, FALSE, FALSE, TRUE, 1),
(19, 'MCCORMICK BALANCE', 'Aderezo con Aceite de almendras / México / 315 g', 51.00, 'ADEREZOS', 260, 24.1, 242, FALSE, TRUE, 10.1, 0.7, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', FALSE, FALSE, FALSE, FALSE, FALSE, 1),
(20, 'MCCORMICK BALANCE', 'Aderezo con Aceite de ajonjolí / México / 315g', 51.00, 'ADEREZOS', 263, 24.4, 241, FALSE, TRUE, 10, 0.9, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', FALSE, FALSE, FALSE, FALSE, FALSE, 1),
(21, 'MCCORMICK BALANCE ', 'Aderezo con Aceite de aguacate / México / 315 g', 51.00, 'ADEREZOS', 268, 25, 239, FALSE, TRUE, 9.9, 0.8, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', FALSE, FALSE, FALSE, FALSE, FALSE, 1),
(22, 'MCCORMICK BALANCE', 'Aderezo con Aceite de canola / México / 315 g', 51.00, 'ADEREZOS', 261, 24.2, 242, FALSE, TRUE, 10, 0.8, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', FALSE, FALSE, FALSE, FALSE, FALSE, 1),
(23, 'MCCORMICK ', 'Aderezo con jugo de limones light / México / 425 g', 51.00, 'ADEREZOS', 273, 25.1, 684, FALSE, TRUE, 11.1, 0.7, 'Su nombre en la etiqueta no tiene el mismo tipo y tamaño de letra, incumpliendo la norma de etiquetado', FALSE, FALSE, TRUE, FALSE, TRUE, 1),
(24, 'LA COSTEÑA', 'Aderezo de Mayonesa Light / México / 420 g', 35.00, 'ADEREZO DE MAYONESA', 350, 34.4, 780, FALSE, TRUE, 9, 0.9, 'Usa el término "Light" para comparar el contenido de calorías entre "Aderezo de mayonesa" y "Mayonesa"; sin embargo, al ser un Aderezo, debería compararse con un Aderezo de mayonesa, por lo que incumple la norma de etiquetado', TRUE, FALSE, TRUE, FALSE, TRUE, 1);


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


-- INSERT para EstudioSalsasCatsup
INSERT INTO EstudioSalsasCatsup (
  idEstudioSalsasCatsup,
  nombreProducto,
  descripcion,
  precio,
  categoria,
  contenidoEnergetico,
  sodio,
	azucaresTotales,
  infAlConsumidor,
  contNeto,
  carbohidratos,
  observaciones,
	colorante,
	saborizante,
  excesoCalorias,
  excesoAzucares,
  excesoGrasasSaturadas,
  excesoGrasasTrans,
  excesoSodio,
  idTipoProducto
) VALUES 
(1, 'Clemente Jacques', 'Salsa catsup', 24, 'Catsup', 93, 991, 19.7, false, 620, 22.5, 'No deberia denominarse salsa catsup', false, true, false, true, false, false, true, 1),
(2, 'First Street', 'Salsa de tomate catsup', 39, 'Catsup', 115, 941, 23.2, false, 567, 28.7, 'No demostro solidos provenientes del tomate', false, true, false, true, false, false, true, 1),
(3, 'Clemente Jacques', 'Salsa catsup', 38, 'Catsup', 96, 991, 18.7, false, 970, 23.3, 'No deberia denominarse salsa catsup', false, true, false, true, false, false, true, 1),
(4, 'Heinz', 'Tomate ketchup', 25, 'Catsup', 112, 741, 22.8, false, 397, 26.9, 'No deberia denominarse salsa catsup', false, true, false, true, false, false, true, 1),
(5, 'Heinz', 'Tomate ketchup', 21, 'Catsup', 111, 741, 21.4, false, 397, 26.7, 'No deberia denominarse salsa catsup', false, true, false, true, false, false, true, 1),
(6, 'La Selva', 'Salsa de tomate ketchup', 161, 'Catsup', 105, 1200, 22.3, false, 340, 23.6, 'No identifica azucares entre su lista de ingredientes', false, true, false, true, false, false, true, 1),
(7, 'La Constena', 'Salsa catsup', 15, 'Catsup', 101, 1300, 21.6, false, 220, 23.3, 'No deberia denominarse salsa catsup', false, false, false, true, false, false, true, 1),
(8, 'Sun Harvest', 'Salsa de tomate catsup', 59, 'Catsup', 105, 941, 22.7, false, 567, 26.3, 'Declara 94.12 kcal y contiene 105 kcal', false, false, false, true, false, false, true, 1),
(9, 'Walden Farms', 'Salsa catsup', 164, 'Catsup', 9, 1133, 2.3, false, 355, 2.3, 'Declara 2.68 kcal y contiene 9 kcal', true, true, false, true, false, false, true, 1),
(10, 'Campo Vivo', 'Salsa catsup organica', 44, 'Organica', 57, 220, 16.8, false, 380, 12.3, 'Declara 10g de azucar y contiene 16.8', false, false, false, true, false, false, true, 1),
(11, 'Heinz', 'Tomate ketchup sin sal anadida', 42, 'Sin sal', 124, 22, 22.2, false, 397, 29.7, 'No deberia denominarse salsa catsup', false, true, false, true, false, false, false, 1),
(12, 'Heinz', 'Salsa de tomate ketchup organica', 72, 'Organica', 120, 1100, 25.3, false, 397, 29.9, 'No deberia denominarse salsa catsup', false, true, false, true, false, false, true, 1),
(13, 'Heinz', 'Tomate ketchup sin azucar anadida', 45, 'Sin azucar anadida', 37, 1212, 4, false, 369, 7.5, 'No deberia denominarse salsa catsup', false, true, false, false, false, false, true, 1),
(14, 'Clemente Jacques', 'Salsa habanero con chile habanero molido', 13, 'Con chile', 97, 977, 18.9, false, 220, 24.3, 'No deberia denominarse salsa catsup', false, true, false, true, false, false, true, 1),
(15, 'Yo mamas', 'Salsa de tomate catsup', 95, 'Sin azucar anadida', 37, 490, 5.5, false, 397, 9.2, 'Declara 0g de azucares y contiene 5.5g', false, false, false, false, false, false, true, 1),
(16, 'Clemente Jacques', 'Salsa catsup con japalepeno en trocitos', 14, 'Con chile', 83, 868, 17.1, false, 220, 19.8, 'No deberia denominarse salsa catsup', false, true, false, true, false, false, true, 1),
(17, 'Red Gold', 'Salsa catsup estilo Siracha', 77, 'Catsup', 98, 941, 21.9, false, 567, 24.4, 'Se denomina salsa tipo catsup, pero es imitacion salsa catsup', false, true, false, true, false, false, true, 1),
(18, 'Embasa', 'Salsa de tomate para aderezar', 28, 'Salsa de tomate para aderezar', 79, 596, 15.2, true, 1000, 19.4, 'Ninguna', true, false, false, true, false, false, true, 1),
(19, 'Mi Catsup', 'Salsa de tomate para aderezar', 28, 'Salsa de tomate para aderezar', 86, 869, 16.5, false, 1000, 21.2, 'No es catsup, es salsa de tomate para aderezar', true, true, false, true, false, false, true, 1),
(20, 'Aurrera', 'Imitacion salsa de tomate', 22, 'Imitacion Salsa catsup', 70, 460, 11.8, false, 1000, 15.3, 'Declara 1kg pero su contenido neto es 976g', true, true, false, true, false, false, true, 1),
(21, 'Members Mark', 'Imitacion salsa de catsup', 114, 'Imitacion Salsa catsup', 104, 1144, 20.5, true, 3800, 25.3, 'Ninguna', true, true, false, true, false, false, true, 1),
(22, 'Del Monte Calidad', 'Imitacion salsa de tomate catsup', 18, 'Imitacion Salsa catsup', 95, 890, 21.2, true, 370, 22.9, 'Ninguna', false, false, false, true, false, false, true, 1),
(23, 'Tasty DBS', 'Salsa de tomate imitacion catsup', 50, 'Imitacion Salsa catsup', 47, 323, 9.5, false, 280, 9, 'Contiene fructosa que no declara en sus ingredientes', true, true, false, false, false, false, true, 1);

-- INSERT para EstudioPijamas
INSERT INTO EstudioPijamas (
  idEstudioPijamas,
  nombreProducto,
  descripcion,
  precio,
  categoria,
  infAlConsumidor,
	calificacionGeneral,
	acabados,
	verificacionDeTallas,
	identificacionDeFibras,
	solidezDelColor,
  idTipoProducto
) VALUES 
(1, 'Carters', 'Talla 8', 399, 'Pijamas para ninos y ninas', true, 'Excelente', 'Excelente', 'Excelente', 'Cumple', 'Excelente', 5),
(2, 'Marvel - Spider Man', 'Talla 10', 229, 'Pijamas para ninos y ninas', true, 'Excelente', 'Muy bueno', 'Excelente', 'Cumple', 'Excelente', 5),
(3, 'Secret Treasures Girls', 'Talla 8', 234, 'Pijamas para ninos y ninas', true, 'Muy bueno', 'Excelente', 'Excelente', 'No cumple', 'Excelente', 5),
(4, 'Paw Patrol', 'Talla 6', 149, 'Pijamas para ninos y ninas', true, 'Muy bueno', 'Excelente', 'Excelente', 'Cumple', 'Excelente', 5),
(5, 'One for you by Creysi', 'Talla 8', 259, 'Pijamas para ninos y ninas', true, 'Muy bueno', 'Excelente', 'Excelente', 'Cumple', 'Muy bueno', 5),
(6, 'Hello Kitty', 'Talla 6', 150, 'Pijamas para ninos y ninas', true, 'Muy bueno', 'Excelente', 'Excelente', 'No cumple', 'Excelente', 5),
(7, 'Marvel Avengers', 'Talla 6', 359, 'Pijamas para ninos y ninas', true, 'Muy bueno', 'Muy bueno', 'Excelente', 'Cumple', 'Excelente', 5),
(8, 'Space Exploring', 'Talla G', 149, 'Pijamas para ninos y ninas', true, 'Muy bueno', 'Excelente', 'Excelente', 'No cumple', 'Bueno', 5),
(9, 'CN We bare bears', 'Talla 8', 199, 'Pijamas para ninos y ninas', true, 'Muy bueno', 'Excelente', 'Excelente', 'Cumple', 'Excelente', 5),
(10, 'Disney Tim Burtons', 'Talla 6', 200, 'Pijamas para ninos y ninas', true, 'Muy bueno', 'Excelente', 'Excelente', 'No cumple', 'Bueno', 5),
(11, 'My little pony', 'Talla 8', 219, 'Pijamas para ninos y ninas', true, 'Muy bueno', 'Excelente', 'Excelente', 'Cumple', 'Excelente', 5),
(12, 'Barbie', 'Talla 10', 220, 'Pijamas para ninos y ninas', true, 'Bueno', 'Muy bueno', 'Excelente', 'Cumple', 'Bueno', 5),
(13, 'Hello Kitty', 'Talla 6', 210, 'Pijamas para ninos y ninas', true, 'Bueno', 'Muy bueno', 'Excelente', 'No cumple', 'Muy bueno', 5);




--INSERT de estudio de caja
INSERT INTO `estudiopandecaja` (`idPancaja`, `nombre`, `descripcion`, `gramos`, `precio`, `informacionconsumidor`, `azucarestotales`, `sodio`, `Calidadsanitaria`, `Proteina`, `grasa`, `fibra`, `carbohidratos`, `contenidoenergetico`, `observacion`, `excesoCalorias`, `excesoAzucares`, `excesoGrasasSaturadas`, `excesoGrasasTrans`, `excesoSodio`, `idtipoproducto`) VALUES
(1, 'BIMBO CERO CERO MULTIGRANO', 'Pan de harina de trigo integral', 610, 65, NULL, 4.3, 225, 1, 13.7, 2.2, 4.3, 39.9, 234, 'Declara 1.2 g de azúcares totales y contiene 4.3 g', 0, 0, 0, 0, 0, 1),
(2, 'ELIZONDO', 'Pan multigrano', 500, 55, NULL, 4.7, 435, 1, 11, 7.4, 4.3, 46.6, 297, 'No cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado', 0, 0, 0, 0, 1, 1),
(3, 'EL MOLINO BLANCO DE MATEO', 'Pan de linaza', 610, 37, NULL, 7.7, 393, 1, 11.1, 6.3, 6.9, 38.5, 255, 'Se denomina \"Pan de linaza\", pero en su lista de ingredientes la linaza está en décimo lugar\nPresenta el distintivo de la NOM-247, pero no comprueba su uso', 0, 0, 0, 0, 1, 1),
(4, 'EXTRA SPECIAL', 'Pan de harina de trigo con 12 granos', 640, 75, NULL, 5.7, 212, 1, 9.3, 8.6, 2.8, 47.7, 305, 'Declara 3 g de azúcares totales y contiene 5.7 g', 1, 0, 0, 0, 0, 1),
(5, 'FIILLER', 'Pan de siete granos', 260, 35, NULL, 3, 252, 1, 9.4, 2.6, 3.9, 47, 249, 'Declara 0.9 g de azúcares totales y contiene 3 g.\nNo indica país de origen, por lo que incumple la NOM-051.\nNo declara al azúcar como azúcar añadido, por lo que incumple la NOM-051.\nOstenta que contiene avena y soya, pero no las declara en la lista de ingredientes', 0, 0, 0, 0, 0, 1),
(6, 'FIILLER', 'Pan rebanado con nuez y pasas', 640, 45, NULL, 8.9, 31, 1, 8.8, 3.6, 2.2, 60.4, 310, 'Su declaración de fibra está en las unidades incorrectas, por lo que incumple la NOM-051.', 0, 1, 0, 0, 0, 1),
(7, 'FIILLER', 'Pan rebanado combigrano', 640, 46, NULL, 3.6, 297, 1, 9.6, 5.1, 2.7, 51.5, 290, 'NoDeclara 0.5 g de azúcares totales y contiene 3.6 g.\nDeclara 2 g de grasa y contiene 5.1 g.\nFalta de sello Exceso de Sodio ', 0, 0, 0, 0, 0, 1),
(8, 'LECAROZ', 'Pan de caja multigrano', 550, 34, NULL, 6, 270, 1, 10.2, 2.5, 4, 53.4, 277, 'Declara 50 g de azúcares totales y contiene 6 g.\nEl orden de sus ingredientes no está presentado de mayor a menor contenido, por lo que incumple la NOM-051.\nFalta de sello Exceso de Sodio', 0, 0, 0, 0, 0, 1),
(9, 'PAN EUROPEO ARTESANAL', 'Pan rústico 14 granos', 200, 33, NULL, 9.3, 280, 1, 9.3, 8, 4, 45.8, 293, 'Declara 7 g de azúcares totales y contiene 9.3 g.\nNo declara al azúcar como azúcar añadido, por lo que incumple la NOM-051.\nNo cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado.', 1, 0, 0, 0, 0, 1),
(10, 'NEW YORK DELI & BAGEL PREMIUM GOLDEN GRAIN GRANOS Y SEMILLAS', 'Pan de harina de trigo y multicereales', 625, 74, NULL, 5, 263, 1, 9.9, 8.2, 2.7, 48.7, 308, 'Declara 3.6 g de azúcares totales y contiene 5 g', 0, 0, 0, 0, 0, 1),
(11, 'OROWEAT MULTIGRANO', 'Pan con granos enteros', 680, 74, NULL, 10.2, 422, 1, 10.8, 5.4, 3.2, 44.2, 268, 'Declara 7.1 g de azúcares totales y contiene 10.2 g.\nResalta tener miel, pero solo contiene 3%.', 0, 0, 0, 0, 1, 1),
(12, 'OROWEAT 12 GRANOS Y SEMILLAS', 'Pan con granos enteros y un toque de miel', 680, 69, NULL, 11.6, 424, 1, 11.6, 5.3, 4.1, 43.2, 267, 'Declara 7.2 g de azúcares totales y contiene 11.6 g.\nResalta tener miel, pero solo contiene 0.2%', 0, 0, 0, 0, 1, 1),
(13, 'BIMBO CERO CERO', 'Pan de harina de trigo integral', 305, 38, NULL, 5.7, 215, 1, 12.4, 2, 5.8, 38.9, 223, 'Declara 1.5 g de azúcares totales y contiene 5.7 g.\nDeclara 15 g de proteína y contiene 12.4 g.', 0, 0, 0, 0, 0, 1),
(14, 'BIMBO INTEGRAL', 'Pan de harina de trigo integral', 620, 54, NULL, 8.2, 605, 1, 12.9, 3.6, 5.6, 40.2, 245, 'Declara 6 g de azúcares totales y contiene 8.2 g.', 0, 0, 0, 0, 1, 1),
(15, 'CANADIAN BAGELS', 'Pan extra fibra', 625, 97, NULL, 3.7, 375, 1, 9.9, 2.4, 8.9, 41.1, 226, 'Presenta pilas en la superficie frontal de exhibición las cuales no son vigentes en la actual norma de etiquetado.\nNo cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado.', 0, 1, 0, 0, 1, 1),
(16, 'ESPERANZA INTEGRAL', 'Pan de harina de trigo y salvado', 640, 37, NULL, 6.9, 2457, 1, 9, 5.7, 5, 46.4, 273, 'Se denomina \"pan de harina de trigo y salvado\", pero no indica el contenido de salvado, por lo que incumple la NOM 051.', 0, 0, 0, 0, 0, 1),
(17, 'EL MOLINO BLANCO DE MATEO', 'Pan integral', 640, 37, NULL, 6.6, 445, 1, 9.9, 5.3, 7.1, 41.3, 252, 'Presenta el distintivo de la NOM-247, pero no comprueba su uso.\nNo indica cómo conservarlo, por lo que incumple la NOM 051', 0, 0, 0, 0, 1, 1),
(18, 'GREAT VALUE PAN INTEGRAL', 'Pan de harina de trigo integral', 610, 48, NULL, 7.9, 345, 1, 11.3, 3.5, 5.5, 41.4, 243, 'Declara 4.6 g de azúcares totales y contiene 7.9 g', 0, 0, 0, 0, 1, 1),
(19, 'LECAROZ', 'Pan de caja integral', 550, 34, NULL, 5.2, 250, 1, 11, 2.6, 4, 52.6, 277, 'Declara 51 g de azúcares totales y contiene 5.2 g.\nEl orden de sus ingredientes no está presentado de mayor a menor contenido, por lo que incumple la NOM-051.\nNo cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado.', 0, 0, 0, 0, 0, 1),
(20, 'NEW YORK DELI & BAGEL GOLDEN GRAIN PREMIUM INTEGRAL', 'Pan con harina de trigo integral', 625, 74, NULL, 5.6, 261, 1, 9.3, 7.5, 2.5, 53, 317, 'Declara 3.8 g de azúcares totales y contiene 5.6 g.\nDeclara 625 g de contenido neto y contiene 572 g.', 0, 0, 0, 0, 0, 1),
(21, 'MEMBERS MARK PAN INTEGRAL', 'Pan de harina de trigo integral', 610, 39, NULL, 9.7, 345, 1, 11.2, 3.9, 5.5, 40.4, 241, 'Declara 4.6 g de azúcares totales y contiene 9.7 g.', 0, 0, 0, 0, 1, 1),
(22, 'WONDER', 'Pan de harina de trigo integral', 567, 53, NULL, 10.3, 500, 1, 11.3, 4.6, 7.6, 38.2, 240, 'Declara 6 g de azúcares totales y contiene 10.3 g.', 0, 0, 0, 0, 1, 1),
(23, 'PAN EUROPEO ARTESANAL', 'Pan de salvado integral', 750, 56, NULL, 8, 625, 1, 9.7, 4.7, 4.9, 47, 269, 'Declara 3.4 g de azúcares totales y contiene 8 g.\nSe denomina \"Pan de salvado integral\", pero en su lista de ingredientes el salvado está en tercer lugar.\nNo declara contenido energético por envase, por lo que incumple la NOM-051.\r\nNo comprobó las leyendas:\n\"Alto valor nutricional\"\n\"Alto de fibra\"\n\"Nuestros productos son elaborados con MASAS MADRE bajo la más fina tradición europea\".', 0, 0, 0, 0, 0, 1),
(24, 'ESPERANZA CENTENO', 'Pan de harina de trigo con centeno', 640, 37, NULL, 7.2, 240, 1, 9.9, 4.9, 2, 48.8, 279, 'Declara 2 g de azúcares totales y contiene 7.2 g', 0, 0, 0, 0, 0, 1),
(25, 'NEW YORK DELI & BAGEL PUMPERNICKEL CON MASA MADRE', 'Pan de harinas de trigo y centeno', 625, 74, NULL, 6.1, 247, 1, 8.9, 5.8, 3.4, 50, 287, 'Declara 2.9 g de azúcares totales y contiene 6.1 g.', 0, 0, 0, 0, 0, 1),
(26, 'FIILLER', 'Pan de centeno con linaza', 550, 49, NULL, 5.4, 304, 1, 9.9, 4.6, 4.3, 48, 273, 'Declara 0.6 g de azúcares totales y contiene 5.4 g.\nNo indica país de origen, por lo que incumple la NOM-051. ', 0, 0, 0, 0, 1, 1),
(27, 'FIILLER', 'Pan de centeno ligero con ajonjolí', 375, 37, NULL, 6.3, 327, 1, 9.7, 3.8, 4.5, 48.8, 268, 'Declara 1.6 g de azúcares totales y contiene 6.3 g.\nSe denomina pan de centeno ligero con ajonjolí, pero en su lista de ingredientes el ajonjolí está en noveno lugar', 0, 0, 0, 0, 0, 1),
(28, 'FIILLER', 'Pan negro tipo rústico', 250, 41, NULL, 4.9, 227, 1, 9.1, 1.9, 3.5, 47.4, 243, 'Declara 1 g de azúcares totales y contiene 4.9 g.\nNo indica país de origen, por lo que incumple la NOM-051.', 0, 0, 0, 0, 1, 1),
(29, 'FIILLER', 'Pan de centeno y cebolla', 250, 48, NULL, 3.3, 250, 1, 8.9, 2, 5.2, 49.5, 252, '• Declara 1 g de azúcares totales y contiene 3.3 g.\nSe denomina \"Pan de centeno y cebolla\", pero en su lista de ingredientes, el harina de centeno está en tercer lugar.\nNo indica país de origen, por lo que incumple la NOM 051.', 0, 0, 0, 0, 0, 1),
(30, 'NEW YORK DELI & BAGEL DELI EUROPEO RYE BREAD', 'Pan de harinas de trigo y centeno', 625, 74, NULL, 5.5, 247, 1, 8.9, 5.6, 3.4, 49.2, 283, 'Declara 2.9 g de azúcares totales y contiene 5.5 g', 0, 0, 0, 0, 0, 1),
(31, 'FIILLER PAN UNICORNIO', 'Pan de caja sabor neutro con colorantes a base de verduras como: betabel,zanahoria,achiote,clorofila', 500, 48, NULL, 4.8, 202, 1, 9.1, 4.3, 1.2, 51, 279, 'Declara 2 g de azúcares totales y contiene 4.8 g', 0, 0, 0, 0, 0, 1),
(32, 'CANYON BAKEHOUSE GLUTEN FREE COUNTRY WHITE', '100% whole grain bread', 425, 131, NULL, 12.3, 393, 1, 5.8, 5.7, 0, 49.3, 272, 'No presenta su información en español, por lo que incumple la NOM-051.\nNo cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado.', 0, 0, 0, 0, 0, 1),
(33, 'BIMBO SIN GLUTEN', 'Pan sin gluten con chía y linaza', 430, 170, NULL, 5.1, 340, 1, 3.6, 7.5, 7.3, 45, 262, NULL, 0, 0, 0, 0, 1, 1),
(34, 'OROWEAT HOGAZA BLANCA', 'Pan con masa madre de centeno', 680, 86, NULL, 11.9, 387, 1, 8.9, 5.2, 2.8, 44.3, 259, 'Declara 4.7 g de azúcares totales y contiene 11.9 g.\nDeclara 12.2 g de proteína y contiene 8.9 g', 0, 0, 0, 0, 1, 1),
(35, 'BIMBO ARTESANO', 'Pan de harina de trigo', 567, 54, NULL, 9.6, 440, 1, 8.4, 3.5, 2.3, 49.4, 263, 'Declara 5.9 g de azúcares totales y contiene 9.6 g', 0, 0, 0, 0, 1, 1),
(36, 'BIMBO NATURAL', 'Pan de harina de trigo', 610, 61, NULL, 4.2, 222, 1, 15.5, 1.5, 2.2, 40.2, 237, 'Declara 0.9 g de azúcares totales y contiene 4.2 g.', 0, 0, 0, 0, 0, 1),
(37, 'BIMBO BLANCO', 'Pan de harina de trigo', 680, 49, NULL, 10.2, 470, 1, 8.9, 2.9, 2.3, 47.3, 251, 'Declara 4.9 g de azúcares totales y contiene 10.2 g', 0, 0, 0, 0, 1, 1),
(38, 'EL MOLINO BLANCO DE MATEO', 'Pan blanco', 640, 37, NULL, 8.3, 454, 1, 8.8, 4.9, 2.6, 47.4, 269, 'Presenta el distintivo de la NOM-247, pero no comprueba su uso.\nNo indica condiciones para su conservación, por lo que incumple la NOM-051.', 0, 0, 0, 0, 1, 1),
(39, 'ELIZONDO', 'Pan blanco', 510, 42, NULL, 5.8, 422, 1, 10.6, 5.7, NULL, 54, 309, 'No cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado', 0, 0, 0, 0, 0, 1),
(40, 'GREAT VALUE PAN BLANCO', 'Pan blanco', 567, 42, NULL, 9.4, 303, 1, 9.1, 3.2, 1.6, 48.4, 259, 'Declara 4.5 g de azúcares totales y contiene 9.4 g.', 0, 0, 0, 0, 1, 1),
(41, 'LECAROZ PAN BLANCO', 'Pan de caja blanco', 550, 38, NULL, 3.9, 600, 1, 10.2, 5.7, 2, 53.5, 307, 'Declara 64 g de azúcares totales y contiene 3.9 g.\nDeclara 71 g de carbohidratos y contienen 53.5 g.\nDeclara 550 g de contenido neto y contiene 456 g.\nNo declara al azúcar como azúcar añadido, por lo que incumple la NOM-051.\nNo cumple con todos los requisitos de información comercial de la norma de etiquetado.', 1, 0, 0, 0, 1, 1),
(42, 'MEMBERS MARK PAN BLANCO', 'Pan de harina de trigo', 567, 34, NULL, 6.3, 303, 1, 10.1, 3.3, 1.6, 48.1, 262, 'Declara 4.5 g de azúcares totales y contiene 6.3 g.', 0, 0, 0, 0, 1, 1),
(43, 'NATURES OWN', 'Thick sliced white', 624, 72, NULL, 11.4, 548, 1, 9.5, 4.2, 2.4, 46.8, 263, 'Su información no está en español, por lo que incumple la NOM-051.\nNo cumple con todos los requisitos de información comercial y sanitaria de la norma de etiquetado.', 0, 0, 0, 0, 0, 1),
(44, 'NATURES OWN THICK SLICED BRIOCHE STYLE BREAD', 'Brioche style bread', 624, 81, NULL, 15, 405, 1, 9.6, 3.5, 2.4, 50.9, 273, 'Su información no está en español, por lo que incumple la NOM 051.\nNo presenta su información nutrimental por 100 g de producto, por lo que incumple la NOM 051.', 0, 0, 0, 0, 0, 1),
(45, 'PAN BUENO', 'Pan blanco', 500, 39, NULL, 13, 335, 1, 8.5, 4.4, 2.3, 51.3, 278, 'Declara 6.2 g de azúcares totales y contiene 13 g\n Le falta el sello de exceso de sodio', 0, 0, 0, 0, 0, 1),
(46, 'WONDER', 'Pan de harina de trigo con ajonjolí', 567, 58, NULL, 7.2, 497, 1, 10.6, 3.6, 2.3, 46.7, 262, 'Declara 5.6 g de azúcares totales y contiene 7.2 g', 0, 0, 0, 0, 1, 1);


-- Indices de la tabla `estudiopandecaja`
--
ALTER TABLE `estudiopandecaja`
  ADD PRIMARY KEY (`idPancaja`),
  ADD KEY `fk_idtipoproducto` (`idtipoproducto`);

-- Filtros para la tabla `estudiopandecaja`
--
ALTER TABLE `estudiopandecaja`
  ADD CONSTRAINT `fk_idtipoproducto` FOREIGN KEY (`idtipoproducto`) REFERENCES `tipodeproductos` (`idTipoProducto`);
COMMIT;

 -------------------------------------------------
 --INSERT TERMOS_PERSONALES
INSERT INTO `termos_personales` (`idtermospersonales`, `nombre`, `descripcion`, `capacidad`, `precio`, `informacion`, `calificacion`, `region`, `Diseño`, `Dimensiones`, `Ensambledelatapa`, `Verificada`, `Peso`, `Hermeticidad`, `Aguafria`, `Aguacaliente`, `observaciones`, `idtipoproductos`) VALUES
(1, 'TEFAL', 'BLUDROP 0.7 L SLVE BLACK TEF1', 700, 799, 1, 'E', 'China', 'Acero inoxidable con tapa de rosca para beber,con una funda de silicona en la base.', '26.4 x 8 cm', 'E', 'Es veraz y ofrece más 706 m', 420.7, 'E\nNo presenta fugas', 'E', 'E', NULL, 3),
(2, 'STANLEY + STARBUCKS', '51406', 591, 720, 1, 'E', 'China', 'Acero inoxidable con aislamiento al vacío, con tapa de rosca y tapa exterior que se puede usar como taza con capacidad de 160 m', '29.7 x 7.7 cm', 'E', 'Es veraz y ofrece más 628 ml', 560.4, 'E\nNo presenta fugas', 'E', 'E', 'Ofrece garantía de la empresa STANLEY, sin embargo, no cumple con la Ley Federal de Protección al Consumido', 3),
(3, 'EKCO', 'TERMO BURBUJA DE CRISTAL AZUL 17682', 600, 259, 1, 'E', 'China', 'Plástico con ampolla de vidrio, con tapa de rosca exterior y tapa exterior que se puede usar como taza con capacidad de 100 ml.', '25.9 x 9.9 cm', 'E', 'Es veraz\r\n600 ml', 362.4, 'E\nNo presenta fugas', 'E', 'MB', NULL, 3),
(4, 'MR. COFFEE', '131005.01', NULL, 309, 1, 'MB', 'China', 'Acero inoxidable de doble pared con tapa interior de polipropileno de rosca y silicón. Tapa exterior que se puede usar como taza con capacidad de 100 ml y funda completa sintética con asa', '28.1 x 7.7 cm', 'E', '720 m', 479.1, 'E\nNo presenta fugas', 'E', 'E', NULL, 3),
(5, 'BUILT', 'TERMO ACERO INOXIDABLE 74173', 591, 511, 1, 'MB', 'China', 'Acero inoxidable con tapa de rosca y asa de transporte', '22.9 x 7.3 cm', 'E', 'Es veraz y ofrece más\n624 ml', 346.3, 'E\nNo presenta fugas', 'MB', 'MB', NULL, 3),
(6, 'EKCO', 'GARRAFA DE ACERO INOXIDABLE 96823', 500, 189, 1, 'MB', 'China', 'Acero inoxidable con tapa de rosca', '27 x 7.16 cm', 'E', 'Es veraz y ofrece más\n515 ml', 301, 'E\nNo presenta fugas', 'MB', 'MB', NULL, 3),
(7, 'EKCO', 'TERMO DE DOBLE PARED 57848', 500, 449, 1, 'MB', 'China', 'Acero inoxidable de doble pared con tapa de rosca de polipropileno, silicón con boquilla para beber y seguro de abrir y cerrar.', '23.2 x 7.6 cm', 'E', 'Es veraz\n500 ml', 313.2, 'E\nNo presenta fugas', 'MB', 'MB', NULL, 3),
(8, 'EKCO', 'TERMO ACERO INOXIDABLE DE DOBLE PARED 93617', 528, 325, 1, 'MB', 'China', 'Acero inoxidable de doble pared con tapa de rosca Flip Top y con boquilla para beber.', '21 x 7.2 cm', 'E', 'Es veraz y ofrece más\n530 ml', 283.4, 'E\nNo presenta fugas', 'MB', 'MB', NULL, 3),
(9, 'MAINSTAYS', 'KB05AF', 500, 199, 1, 'MB', 'China', 'Acero inoxidable, tapa interior de polipropileno tipo rosca. Tapa exterior que se puede usar como taza con capacidad de 100 ml.', '24.4 x 6.9 cm', 'E', 'Es veraz\n500 ml', 309.3, 'E\nNo presenta fugas', 'MB', 'MB', NULL, 3),
(10, 'MAINSTAYS', 'KB05A-SC', 500, 161, 1, 'MB', 'China', 'Acero inoxidable, tapa interior de polipropileno tipo rosca. Tapa exterior que se puede usar como taza con capacidad de 100 ml.', '24.5 x 6.9 cm ', 'E', 'Es veraz\n500 ml', 303.2, 'E\nNo presenta fugas', 'MB', 'MB', NULL, 3),
(11, 'MR. COFFEE', '91879.03', 458, 328, 1, 'MB', 'China', 'Acero inoxidable con aislamiento de doble pared. Tapa interior de polipropileno de rosca y silicón. Tapa exterior que se puede usar como taza con capacidad de 100 ml.', '24.2 x 7 cm', 'E', 'y ofrece más\n475 m', 328.5, 'E\nNo presenta fugas', 'MB', 'MB', NULL, 3),
(12, 'VIVA HYDRATE', 'VHTH-9580', 500, 299, 1, 'MB', 'China', 'Acero inoxidable, tapa de rosca de polipropileno y silicón con asa para transportar.', '24.8 x 7.2 cm', 'E', 'Es veraz y ofrece más\n541 ml', 326.9, 'E\nNo presenta fugas', 'MB', 'B', NULL, 3),
(13, 'STEINER', 'GL-VF50ZY', 500, 369, 1, 'B', 'China', 'Acero inoxidable de doble pared con tapa interior de polipropileno, de rosca y silicón. Tapa exterior que se puede usar como taza con capacidad de 75 ml.', '24.8 x 6.9 cm', 'E', 'No es veraz\n486 ml', 284, 'E\nNo presenta fugas', 'MB', 'MB', NULL, 3),
(14, 'MINISO', 'AB-289R-T21', 500, 180, 1, 'B', 'China', 'Acero inoxidable de doble pared con tapa de rosca.', '26.6 x 7.1 cm', 'E', 'No es veraz\n490 ml', 292.9, 'E\nNo presenta fugas', 'MB', 'MB', 'Le caben 10 ml menos de los que declara.', 3),
(15, 'VIVA HYDRATE', 'VHTH-9771', 500, 229, 1, 'B', 'China', 'Acero inoxidable, tapa interior de polipropileno de rosca y silicón. Tapa exterior que se puede usar como taza con capacidad de 100 ml.', '24.6 x 7.1 cm', 'E', 'No es veraz\n482 ml', 305.3, 'E\nNo presenta fugas', 'MB', 'MB', 'Le caben 18 ml menos de los que declara.', 3),
(16, 'VIVA HYDRATE', 'VHTH-4185', 500, 209, 1, 'B', 'China', 'Acero inoxidable, tapa interior de polipropileno de rosca y silicón. Tapa exterior que se puede usar como taza con capacidad de 160 ml.', '23.7 x 6.7 cm', 'E', 'No es veraz\n451 m', 266.3, 'E\nNo presenta fugas', 'MB', 'MB', 'Le caben 49 ml menos de los que declara', 3),
(17, 'CONTIGO', 'MATTERHORN', 591, 410, 1, 'B', 'China', 'Acero inoxidable aislado al vacío, tapa de rosca con boquilla removible y asa para transportar.', '26 x 7.3 cm', 'E', 'Es veraz\r\n y ofrece más\n623 ml', 309, 'E\nNo presenta fugas', 'B', 'B', NULL, 3),
(18, 'TEFAL', 'TRAVEL MUG GR 0.5 L BLUE SLV TEF', 500, 899, 1, 'B', 'China', 'Acero inoxidable con tapa de rosca y botón para beber con una funda de silicona en el cuerpo del termo', '24 x 7.8 cm', 'E', 'Es veraz\n500 ml', 438.4, 'E\nNo presenta fugas', 'B', 'S', NULL, 3),
(19, 'QUOKKA', '304', 630, 299, 1, 'E', 'China', 'Acero inoxidable de doble pared aislada al vacío con tapa de rosca.', '24.9 x 7.3 cm', 'E', 'No es veraz\n614 ml', 320.2, 'E\nNo presenta fugas', 'B', 'B', 'Le caben 16 ml menos de los que declara.', 3),
(20, 'FUN KIDS', 'JY-1500D', 500, 263, 1, 'D', 'China', 'Doble pared con material exterior de plástico e interior de acero inoxidable. Tapa interior de polipropileno de rosca y tapa exterior que se puede usar como taza con capacidad de 100 ml', '23.5 x 7 cm', 'E', 'No es veraz\n420 m', 296.5, 'E\nNo presenta fugas', 'D', 'D', 'Le caben 80 ml menos de los que declara', 3),
(21, 'SK SIMPLE KITCHEN', 'XD-6810A', 500, 149, 1, 'D', 'China', 'Acero inoxidable, tapa interior de polipropileno de rosca. Tapa exterior que se puede usar como taza con capacidad de 100 ml.', '24.1 x 7.1 cm', 'E', 'No es veraz\n482 ml', 301.3, 'E\nNo presenta fugas', 'D', 'D', 'Le caben 18 ml menos de los que declara.', 3),
(22, 'NUVÓ', 'H165-QB', NULL, 379, 1, 'D', 'China', 'Acero inoxidable de doble pared, con tapa de polipropileno de rosca con boquilla para beber, de botón abrir/cerrar y correa para transporte', '28.3 x 7.5 cm', 'E', '628 ml', 372.9, 'E\nNo presenta fugas', 'D', 'D', NULL, 3),
(23, 'RUNNING', 'TERMOLATA THERMOCAN', 500, 479, 0, 'D', 'China', 'Acero inoxidable con tapa de rosca y boquilla para beber', '18.8 x 7.2 cm', 'E', 'No es veraz\n473 ml', 259.5, 'Dpresenta fugas', 'S', 'D', '• Le caben 27 ml menos de los que declara.\nPresenta fugas con agua caliente y fría.\nEl producto de venta a granel no cuenta con la información comercial de acuerdo con la Ley Federal de Protección al Consumidor.', 3);

-- Indices de la tabla `termos_personales`
--
ALTER TABLE `termos_personales`
  ADD PRIMARY KEY (`idtermospersonales`),
  ADD KEY `fk_idtipoproductos` (`idtipoproductos`);

--Filtros para la tabla `termos_personales`
--
ALTER TABLE `termos_personales`
  ADD CONSTRAINT `fk_idtipoproductos` FOREIGN KEY (`idtipoproductos`) REFERENCES `tipodeproductos` (`idTipoProducto`);
COMMIT;










