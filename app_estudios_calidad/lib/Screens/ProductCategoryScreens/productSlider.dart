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
      onTap: () {
        if (onClose != null) {
          onClose!();
        }
      },
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
                  return GestureDetector(
                    onTap: () {
                      if (onClose != null) {
                        onClose!();
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(200, 0, 0, 0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 50,
                            ),
                            SizedBox(height: 10),
                            AutoSizeText(
                              textAlign: TextAlign.center,
                              'No se encontraron productos para la categoría especificada',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 30),
                            AutoSizeText(
                              textAlign: TextAlign.center,
                              'Toca para intentar nuevamente',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
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
                    return GestureDetector(
                      onTap: () {
                        if (onClose != null) {
                          onClose!();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                'Error al cargar la información',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              AutoSizeText(
                                'Toca para intentar nuevamente',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
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

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    double buttonWidth = 200;
    if (screenWidth < 400) {
      buttonWidth = screenWidth * 0.6;
      ;
    }

    return Card(
      color: Color(int.parse(colorFondo.replaceFirst('#', '0xff'))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                padding: EdgeInsets.only(top: 10, right: 10),
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
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: AutoSizeText(
                      title,
                      style: TextStyle(
                        color: Color(
                            int.parse(colorTitulo.replaceFirst('#', '0xff'))),
                        fontSize: 50,
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
                        fontSize: 30.0,
                        height: 1.5,
                        overflow: TextOverflow.visible,
                      ),
                      softWrap: true,
                    ),
                  ),
                  SizedBox(height: 15.0),
                ],
              ),
            ),
          ),
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
              width: buttonWidth, // Ancho deseado
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
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
