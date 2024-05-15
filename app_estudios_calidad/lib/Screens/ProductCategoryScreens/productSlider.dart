import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> getProductInfo(String categoryName) async {
  final url =
      Uri.parse('http://192.168.31.202/conexion.php?category=$categoryName');

  try {
    final response = await http.get(url);

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // Decodificar la respuesta JSON
      final List<dynamic> jsonDataList = json.decode(response.body);
      final List<Map<String, dynamic>> dataList = [];

      // Iterar sobre los datos decodificados y agregar cada mapa a la lista
      jsonDataList.forEach((jsonData) {
        dataList.add(Map<String, dynamic>.from(jsonData));
      });

      return dataList;
    } else {
      throw Exception(
          'Error al obtener la información del producto: ${response.statusCode}');
    }
  } catch (e) {
    print('Error al realizar la solicitud HTTP: $e');
    throw Exception('Error al obtener la información del producto');
  }
}

class OverlaySlider extends StatelessWidget {
  final String selectedCategory;
  final VoidCallback? onClose;

  OverlaySlider({Key? key, required this.selectedCategory, this.onClose})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: FutureBuilder(
              future: getProductInfo(selectedCategory),
              builder: (context,
                  AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error al cargar la información');
                } else {
                  final List<Map<String, dynamic>> productInfoList =
                      snapshot.data ?? [];
                  if (productInfoList.isNotEmpty) {
                    return PageView(
                      scrollDirection: Axis.vertical,
                      children: productInfoList.map((productInfo) {
                        return VerticalCard(
                          title: productInfo['titulo'] ?? '',
                          description: productInfo['descripcionEstudio'] ?? '',
                          onClose: onClose,
                          colorTitulo: productInfo['colorTitulo'] ?? '',
                          colorFondo: productInfo['colorFondo'] ?? '',
                        );
                      }).toList(),
                    );
                  } else {
                    return Text(
                        'No se encontraron productos para la categoría especificada');
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class VerticalCard extends StatelessWidget {
  final String title;
  final String description;
  final String colorTitulo;
  final String colorFondo;
  final VoidCallback? onClose;

  const VerticalCard({
    Key? key,
    required this.title,
    required this.description,
    required this.colorTitulo,
    required this.colorFondo,
    this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> wordsNum = title.split(' ');
    final bool oneWord = wordsNum.length == 1;
    final bool multWords = wordsNum.length > 5;
    int colorInt = int.parse(colorTitulo.replaceFirst('#', '0xff'));
    double opacityFactor = 0.8;
    int modifiedColorInt =
        (colorInt & 0x00FFFFFF) | ((0xFF * opacityFactor).toInt() << 24);
    Color modifiedColor = Color(modifiedColorInt);
    int maxLinesForTitle =
        2; // Por defecto, permitimos hasta 2 líneas para el título
    if (oneWord) {
      maxLinesForTitle = 1;
    } else if (multWords) {
      maxLinesForTitle = 3;
    }

    return Card(
      color: Color(int.parse(colorFondo.replaceFirst('#', '0xff'))),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                padding: EdgeInsets.all(15),
                alignment: Alignment.topRight,
                icon: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
                onPressed: () {
                  if (onClose != null) {
                    onClose!();
                  }
                },
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        child: AutoSizeText(
                          title,
                          style: TextStyle(
                            color: Color(int.parse(
                                colorTitulo.replaceFirst('#', '0xff'))),
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            height: 1.0,
                          ),
                          softWrap: true,
                          maxLines: maxLinesForTitle, // Ajuste de maxLines
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Flexible(
                        child: AutoSizeText(
                          textAlign: TextAlign.justify,
                          description,
                          style: TextStyle(
                            color: Color.fromARGB(255, 94, 94, 94),
                            fontSize: 25.0,
                            height: 1.5,
                            overflow: TextOverflow.visible,
                          ),
                          softWrap: true,
                          maxFontSize: 25.0, // Tamaño máximo de fuente
                          minFontSize: 15.0, // Tamaño mínimo de fuente
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        backgroundColor: modifiedColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        // Navigate to another screen
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 6),
                        width: 200, // Ancho deseado
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ver productos  ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 235, 235),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                height: 1.0,
                              ),
                            ),
                            Icon(
                              Icons.arrow_circle_right_rounded,
                              color: Color.fromARGB(255, 235, 235, 235),
                              size: 30.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
