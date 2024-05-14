import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error al cargar la información');
                } else {
                  return PageView(
                    scrollDirection: Axis.vertical,
                    children: [
                      VerticalCard(
                        title: snapshot.data?['title'] ?? '',
                        description: snapshot.data?['description'] ?? '',
                        onClose: onClose,
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>> getProductInfo(String categoryName) async {
  final url = Uri.parse(
      'http://localhost/Conexion/conexion.php?category=$categoryName');

  try {
    final response = await http.get(url);

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // Decodificar la respuesta JSON
      final Map<String, dynamic> data = json.decode(response.body);

      return data;
    } else {
      throw Exception(
          'Error al obtener la información del producto: ${response.statusCode}');
    }
  } catch (e) {
    print('Error al realizar la solicitud HTTP: $e');
    throw Exception('Error al obtener la información del producto');
  }
}

class VerticalCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onClose;

  const VerticalCard({
    Key? key,
    required this.title,
    required this.description,
    this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> WordsNum = title.split(' ');
    final bool OneWord = WordsNum.length == 1;
    final bool MultWords = WordsNum.length > 5;

    int maxLinesForTitle =
        2; // Por defecto, permitimos hasta 2 líneas para el título
    if (OneWord) {
      maxLinesForTitle = 1;
    } else if (MultWords) {
      maxLinesForTitle = 3;
    }

    return Card(
      color: Color.fromARGB(255, 255, 245, 225),
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
                  color: Color.fromARGB(255, 148, 148, 148),
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
                            color: Color.fromARGB(255, 216, 46, 46),
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
                            color: const Color.fromARGB(255, 94, 94, 94),
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
                        backgroundColor: Color.fromARGB(255, 68, 68, 68),
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
