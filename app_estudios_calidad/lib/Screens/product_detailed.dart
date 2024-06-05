import 'dart:convert';
import 'dart:ui';
import 'package:app_estudios_calidad/Components/attribute_mapping.dart';
import 'package:app_estudios_calidad/Screens/mainPage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ProductDetailedPage extends StatefulWidget {
  final int idTipoProducto;
  final int idInfoRelevante;
  final String title;
  final String nombreProducto;
  final int precio;
  final String colorFondo;
  final int globalIndex;
  final Map<String, dynamic> product; // Pasar el producto completo

  const ProductDetailedPage({
    Key? key,
    required this.idTipoProducto,
    required this.idInfoRelevante,
    required this.title,
    required this.globalIndex,
    required this.nombreProducto,
    required this.colorFondo,
    required this.product,
    required this.precio,
  }) : super(key: key);

  @override
  _ProductDetailedPageState createState() => _ProductDetailedPageState();
}

class _ProductDetailedPageState extends State<ProductDetailedPage> {
  late Future<Map<String, dynamic>> _productInfoFuture;
  late String idEstudioCampo;
  late int idEstudio;

  @override
  void initState() {
    super.initState();

    // Detectar el campo de identificación del estudio y su valor
    idEstudioCampo = getIdEstudioCampo(widget.product);
    idEstudio = widget.product[idEstudioCampo];

    _productInfoFuture =
        getProductInfo(widget.idTipoProducto, widget.idInfoRelevante);
  }

  Future<Map<String, dynamic>> getProductInfo(
      int idTipoProducto, int idInfoRelevante) async {
    final url = Uri.parse(
        'http://192.168.31.202/conexion.php?idTipoProducto=$idTipoProducto&idInfoRelevante=$idInfoRelevante');

    print('Consultando URL: $url');

    try {
      final response = await http.get(url);

      print('Código de estado: ${response.statusCode}');
      print('Cuerpo de la respuesta: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);

        if (!jsonData.containsKey('InfoCompleta')) {
          throw Exception('Respuesta JSON no contiene la clave "InfoCompleta"');
        }

        final List<dynamic> jsonDataList = jsonData['InfoCompleta'];
        final Map<String, dynamic> productInfo = {};

        // Buscar el producto específico por el campo de identificación
        for (final data in jsonDataList) {
          if (data.containsKey(idEstudioCampo) &&
              data[idEstudioCampo] == idEstudio) {
            productInfo.addAll(Map<String, dynamic>.from(data));
            break;
          }
        }

        return productInfo;
      } else {
        throw Exception(
            'Error al obtener la información del producto: ${response.statusCode}');
      }
    } catch (e) {
      print('Error al realizar la solicitud HTTP: $e');
      throw Exception('Error al obtener la información del producto');
    }
  }

  // Función para obtener el nombre del campo de identificación del estudio
  String getIdEstudioCampo(Map<String, dynamic> product) {
    const idEstudioMap = {
      1: 'idEstudioTermosPersonales',
      2: 'idEstudioMayonesas',
      3: 'idEstudioServilletas',
      4: 'idEstudioCafeterasGoteo',
      5: 'idEstudioAtunes',
      6: 'idEstudioPanDeCaja',
      7: 'idEstudioSalsasCatsup',
      8: 'idEstudioPijamas',
    };

    for (final entry in idEstudioMap.entries) {
      final estudioName = entry.value;

      if (product.containsKey(estudioName)) {
        return estudioName; // Return the estudioName if found
      }
    }

    return 'idEstudioDesconocido'; // Default value if no known field found
  }

  // Función para obtener el mapeo de atributos basado en el nombre del estudio
  Map<String, String> getAttributeMapping(String title) {
    if (attributeMapping.containsKey(title)) {
      return attributeMapping[title]!;
    }
    return {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        idInfoRelevante: widget.idInfoRelevante,
        nombreProducto: widget.nombreProducto,
        colorFondo: widget.colorFondo,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _productInfoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error al cargar la información del producto'));
          } else {
            final productInfo = snapshot.data ?? {};
            // Filtrar los atributos que no queremos mostrar en la visualización
            final attributeMap = getAttributeMapping(widget.title);
            final unwantedAttributes = [
              'excesoCalorias',
              'excesoAzucares',
              'excesoGrasasSaturadas',
              'excesoGrasasTrans',
              'excesoSodio',
              idEstudioCampo,
              'idTipoProducto',
              'idInfoRelevante',
              'nombreProducto',
              'descripcion',
              'precio',
              'categoria',
              'contNetoVeracidad',
              'masaDrenadaVeracidad',
            ];
            final filteredProductInfo = Map<String, dynamic>.from(productInfo)
              ..removeWhere((key, value) =>
                  unwantedAttributes.contains(key) || key == 'observaciones');
            final entries = filteredProductInfo.entries.toList();
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nombre del producto y descripción
                  Text(
                    widget.nombreProducto,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    productInfo['descripcion'] ?? '',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Imagen del producto y precio
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          // Mostrar los iconos de advertencia
                          ..._buildSellosIcons(widget.product),
                        ],
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/${widget.title}/${widget.nombreProducto} ${widget.globalIndex}.png'),
                              fit: BoxFit.contain, // Use BoxFit.contain
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.17,
                              height: MediaQuery.of(context).size.width * 0.17,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellow,
                              ),
                              child: Center(
                                child: Text(
                                  '\$${widget.precio ?? 'N/A'}',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.055,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Mostrar observaciones si existen
                  if (productInfo.containsKey('observaciones') &&
                      productInfo['observaciones'] != null)
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Observaciones:',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.left,
                            '${productInfo['observaciones'].isEmpty ? "No hay observaciones" : productInfo['observaciones']}',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),

                  // Mostrar los atributos en un GridView
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Número de columnas
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: entries.length,
                    itemBuilder: (context, index) {
                      final entry = entries[index];
                      final attributeName =
                          attributeMap[entry.key] ?? entry.key;
                      String displayValue = entry.value.toString();
                      String statusText = '';
                      String statusImage = '';

                      // Verificar atributos específicos para mostrar el estado
                      if (entry.key == 'contNeto' &&
                          productInfo.containsKey('contNetoVeracidad')) {
                        displayValue = productInfo[
                            'contNeto']; // mostrar el valor original
                        statusText = productInfo['contNetoVeracidad'] == 1
                            ? 'Cumple'
                            : 'No Cumple';
                      } else if (entry.key == 'masaDrenada' &&
                          productInfo.containsKey('masaDrenadaVeracidad')) {
                        displayValue = productInfo[
                            'masaDrenada']; // mostrar el valor original
                        statusText = productInfo['masaDrenadaVeracidad'] == 1
                            ? 'Cumple'
                            : 'No Cumple';
                      } else if (entry.key == 'informacion' ||
                          entry.key == 'contNeto' ||
                          entry.key == 'infAlConsumidor' ||
                          entry.key == 'presentacion' ||
                          entry.key == 'seguridad' ||
                          entry.key == 'identificacionDeFibras') {
                        displayValue = ''; // No mostrar el valor original
                        statusText = entry.value == 1 ? 'Cumple' : 'No Cumple';
                        statusImage = entry.value == 1
                            ? 'assets/verdadero.png'
                            : 'assets/falso.png';
                      }
                      // Lista de colores para bordes
                      final colors = [
                        Colors.red,
                        Colors.green,
                        Colors.blue,
                        Colors.orange,
                        Colors.teal,
                        Colors.purple,
                        Colors.cyan,
                        Colors.pink,
                        Colors.amber,
                        Colors.indigo,
                      ];

                      return Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: colors[index % colors.length],
                            width: 2.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: AutoSizeText(
                                '$attributeName: ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                  fontWeight: FontWeight.bold,
                                  height: 1.0,
                                ),
                                softWrap: true,
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            if (displayValue.isNotEmpty)
                              Flexible(
                                child: AutoSizeText(
                                  displayValue,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.035,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            if (statusText.isNotEmpty)
                              AutoSizeText(
                                statusText,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            if (statusImage.isNotEmpty)
                              Image.asset(
                                statusImage,
                                height:
                                    MediaQuery.of(context).size.width * 0.06,
                                width: MediaQuery.of(context).size.width * 0.06,
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  // Función para construir los iconos de advertencia
  List<Widget> _buildSellosIcons(Map<String, dynamic> product) {
    List<Widget> icons = [];
    final sellos = [
      'excesoCalorias',
      'excesoAzucares',
      'excesoGrasasSaturadas',
      'excesoGrasasTrans',
      'excesoSodio'
    ];

    for (String sello in sellos) {
      if (product[sello] == 1) {
        icons.add(
          Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Sellos/$sello.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      }
    }
    return icons;
  }
}

class Header extends StatelessWidget implements PreferredSizeWidget {
  final int idInfoRelevante;
  final String nombreProducto;
  final String colorFondo;

  const Header({
    Key? key,
    required this.idInfoRelevante,
    required this.nombreProducto,
    required this.colorFondo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + 20),
      child: Container(
        decoration: BoxDecoration(
          color: Color(int.parse(colorFondo.replaceFirst('#', '0xff'))),
        ),
        padding: EdgeInsets.fromLTRB(15, 15, 30, 15),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color.fromARGB(255, 27, 76, 82),
                  size: 23,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                'Detalles del producto',
                style: TextStyle(
                  color: Color.fromARGB(255, 27, 76, 82),
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20);
}
