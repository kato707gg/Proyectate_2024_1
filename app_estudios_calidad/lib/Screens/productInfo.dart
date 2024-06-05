import 'dart:convert';
import 'dart:ui';
import 'package:app_estudios_calidad/Screens/mainPage.dart';
import 'package:app_estudios_calidad/Screens/product_detailed.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ProductInfoPage extends StatefulWidget {
  final int idTipoProducto;
  final int idInfoRelevante;
  final String categoria;

  const ProductInfoPage({
    Key? key,
    required this.idTipoProducto,
    required this.categoria,
    required this.idInfoRelevante,
  }) : super(key: key);

  @override
  _ProductInfoPageState createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  late Future<List<Map<String, dynamic>>> _productDetailsFuture;
  late String _selectedCategory; // Cambiado a late

  @override
  void initState() {
    super.initState();
    _productDetailsFuture =
        fetchProductDetails(widget.idTipoProducto, widget.idInfoRelevante);

    // Inicializar _selectedCategory con el nombre de la primera categoría
    _selectedCategory = widget.categoria;
  }

  Future<List<Map<String, dynamic>>> fetchProductDetails(
      int idTipoProducto, int idInfoRelevante) async {
    final url = Uri.parse(
        'http://192.168.31.202/conexion.php?idTipoProducto=$idTipoProducto&idInfoRelevante=$idInfoRelevante');

    // Imprimir la URL que se va a enviar en la solicitud HTTP
    print('URL enviada: $url');

    try {
      final response = await http.get(url);

      print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Decodificar la respuesta JSON
        final Map<String, dynamic> jsonData = json.decode(response.body);

        // Asegurarse de que la clave "InfoCompleta" existe en el JSON
        if (!jsonData.containsKey('InfoCompleta')) {
          throw Exception('Respuesta JSON no contiene la clave "InfoCompleta"');
        }

        // Acceder a la lista "InfoCompleta" dentro del objeto JSON
        final List<dynamic> jsonDataList = jsonData['InfoCompleta'];
        final List<Map<String, dynamic>> dataList = [];

        // Iterar sobre los datos decodificados y agregar cada mapa a la lista
        jsonDataList.forEach((jsonData) {
          dataList.add(Map<String, dynamic>.from(jsonData));
        });

        // Seleccionar la primera categoría encontrada predeterminadamente
        if (dataList.isNotEmpty && dataList.first.containsKey('categoria')) {
          _selectedCategory = dataList.first['categoria'] ?? '';
        }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _productDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar la información'));
          } else {
            final productDetails = snapshot.data ?? [];
            return Scaffold(
              appBar: Header(
                idInfoRelevante: widget.idInfoRelevante,
                productDetails: productDetails,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    MoreInfo(
                      productDetails: productDetails,
                      idInfoRelevante: widget.idInfoRelevante,
                    ),
                    CategoryTable(
                      productDetails: productDetails,
                      onCategorySelected: (category) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                      selectedCategory: _selectedCategory,
                      idInfoRelevante: widget.idInfoRelevante,
                    ),
                    ProductList(
                      productDetails: productDetails,
                      selectedCategory: _selectedCategory,
                      idInfoRelevante: widget.idInfoRelevante,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class Header extends StatelessWidget implements PreferredSizeWidget {
  final int idInfoRelevante;
  final List<Map<String, dynamic>> productDetails;

  const Header({
    Key? key,
    required this.idInfoRelevante,
    required this.productDetails,
  }) : super(key: key);

  String getColorFondo(int idInfoRelevante) {
    for (final product in productDetails) {
      if (product['idInfoRelevante'] == idInfoRelevante) {
        return product['colorFondo'] ?? '#FFFFFF';
      }
    }
    return '#FFFFFF';
  }

  @override
  Widget build(BuildContext context) {
    final colorFondo = getColorFondo(idInfoRelevante);

    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + 20),
      child: Container(
        decoration: BoxDecoration(
          color: Color(int.parse(colorFondo.replaceFirst('#', '0xff'))),
        ),
        padding: EdgeInsets.all(15),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                },
              ),
              SearchIcon(productDetails: productDetails),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20);
}

class SearchIcon extends StatelessWidget {
  final List<Map<String, dynamic>> productDetails;

  const SearchIcon({Key? key, required this.productDetails}) : super(key: key);

  void _onSearchPressed(BuildContext context) {
    showSearch(
      context: context,
      delegate: CustomSearchDelegate(productDetails), // Pasar productDetails
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search, size: 29.0),
      onPressed: () => _onSearchPressed(context),
      color: Color.fromARGB(255, 27, 76, 82),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> productDetails;

  CustomSearchDelegate(this.productDetails);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        padding: EdgeInsets.only(right: 25, top: 20),
        icon: Icon(
          color: Color.fromARGB(255, 27, 76, 82),
          Icons.clear_rounded,
          size: 27.0,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.only(left: 20, top: 20),
      icon: Icon(
        color: Color.fromARGB(255, 27, 76, 82),
        Icons.arrow_back_ios_new_rounded,
        size: 23,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = productDetails.where((product) {
      final productName = product['nombreProducto']?.toLowerCase() ?? '';
      return productName.contains(query.toLowerCase());
    }).toList();

    return ProductList(
      productDetails: results,
      selectedCategory: '', // Asignar categoría si es necesario
      idInfoRelevante: 0, // Asignar idInfoRelevante si es necesario
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = productDetails.where((product) {
      final productName = product['nombreProducto']?.toLowerCase() ?? '';
      return productName.contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index]['nombreProducto'] ?? 'Sin nombre';
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}

class MoreInfo extends StatelessWidget {
  final List<Map<String, dynamic>> productDetails;
  final int idInfoRelevante;

  const MoreInfo(
      {Key? key, required this.productDetails, required this.idInfoRelevante})
      : super(key: key);

  // Función para obtener el color de fondo basado en el idInfoRelevante
  String getColorFondo(int idInfoRelevante) {
    for (final product in productDetails) {
      if (product['idInfoRelevante'] == idInfoRelevante) {
        return product['colorFondo'] ?? '#FFFFFF';
      }
    }
    return '#FFFFFF';
  }

  @override
  Widget build(BuildContext context) {
    // Obtener el color de fondo basado en el idInfoRelevante proporcionado
    final colorFondo = getColorFondo(idInfoRelevante);

    return Container(
      padding: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(int.parse(colorFondo.replaceFirst('#', '0xff'))),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.36,
                  child: Image.asset('assets/moreinfo.png'),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        textAlign: TextAlign.center,
                        '¿Quieres saber más acerca de este estudio de calidad?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 27, 76, 82),
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(height: 10), // Agregar un espacio vertical
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          // Acción para el botón "Ver detalles"
                        },
                        child: Text(
                          'Ver detalles',
                          style: TextStyle(
                            color: Color.fromARGB(255, 70, 75, 75),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryTable extends StatelessWidget {
  final List<Map<String, dynamic>> productDetails;
  final int idInfoRelevante;
  final Function(String) onCategorySelected;
  final String selectedCategory;

  const CategoryTable({
    Key? key,
    required this.productDetails,
    required this.onCategorySelected,
    required this.selectedCategory,
    required this.idInfoRelevante,
  }) : super(key: key);

  // Función para calcular la altura máxima de los botones
  double getMaxButtonHeight(List<String> categories, BuildContext context) {
    int maxWordCount = 0;
    for (var category in categories) {
      int wordCount = category.split(' ').length;
      if (wordCount > maxWordCount) {
        maxWordCount = wordCount;
      }
    }

    // Determinar la altura basada en la cantidad máxima de palabras
    switch (maxWordCount) {
      case 1:
        return MediaQuery.of(context).size.height * 0.05;
      case 2:
        return MediaQuery.of(context).size.height * 0.06;
      case 3:
        return MediaQuery.of(context).size.height * 0.07;
      default:
        return MediaQuery.of(context).size.height * 0.08;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Filtrar los productos según idInfoRelevante
    final relevantProducts = productDetails
        .where((product) => product['idInfoRelevante'] == idInfoRelevante)
        .toList();

    // Verificar si existe al menos un atributo "categoria"
    final hasCategory =
        relevantProducts.any((product) => product.containsKey('categoria'));

    // Generar la lista de categorías o títulos
    final categories = hasCategory
        ? relevantProducts
            .map((product) => product['categoria'])
            .whereType<String>()
            .toSet()
            .toList()
        : relevantProducts
            .map((product) => product['titulo'])
            .whereType<String>()
            .toSet()
            .toList();

    // Verificar si selectedCategory está vacío y asignarle la primera categoría
    final defaultCategory =
        selectedCategory.isEmpty ? categories.first : selectedCategory;

    // Llamar a onCategorySelected con la primera categoría
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onCategorySelected(defaultCategory);
    });

    // Obtener la altura máxima de los botones
    final maxButtonHeight = getMaxButtonHeight(categories, context);

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 25, 20, 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            return GestureDetector(
              onTap: () => onCategorySelected(category),
              child: CategoryCard(
                titulo: category,
                isSelected: selectedCategory == category,
                productDetails: relevantProducts,
                idInfoRelevante: idInfoRelevante,
                buttonHeight:
                    maxButtonHeight, // Pasar la altura máxima calculada
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final List<Map<String, dynamic>> productDetails;

  final int idInfoRelevante;
  final String titulo;
  final bool isSelected;
  final double buttonHeight;

  const CategoryCard({
    Key? key,
    required this.titulo,
    required this.isSelected,
    required this.productDetails,
    required this.idInfoRelevante,
    required this.buttonHeight,
  }) : super(key: key);

  String getColorFondo(int idInfoRelevante) {
    for (final product in productDetails) {
      if (product['idInfoRelevante'] == idInfoRelevante) {
        return product['colorFondo'] ?? '#FFFFFF';
      }
    }
    return '#FFFFFF';
  }

  String getColorTitulo(int idInfoRelevante) {
    for (final product in productDetails) {
      if (product['idInfoRelevante'] == idInfoRelevante) {
        return product['colorTitulo'] ?? '#FFFFFF';
      }
    }
    return '#FFFFFF';
  }

  @override
  Widget build(BuildContext context) {
    final List<String> wordsNum = titulo.split(' ');
    int wordCount = wordsNum.length;
    int maxLinesForCategory;
    double buttonWidth;

    // Determinar el número máximo de líneas y el ancho del botón basado en la cantidad de palabras
    switch (wordCount) {
      case 1:
        maxLinesForCategory = 1;
        buttonWidth = MediaQuery.of(context).size.width * 0.5;
        break;
      case 2:
        maxLinesForCategory = 1;
        buttonWidth = MediaQuery.of(context).size.width * 0.5;
      case 3:
        maxLinesForCategory = 2;
        buttonWidth = MediaQuery.of(context).size.width * 0.6;
        break;
      default:
        maxLinesForCategory = 3;
        buttonWidth = MediaQuery.of(context).size.width * 0.6;
        break;
    }

    final colorFondo = getColorFondo(idInfoRelevante);
    final colorTitulo = getColorTitulo(idInfoRelevante);
    return Container(
      width: buttonWidth,
      height: buttonHeight, // Usar la altura máxima calculada
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected
            ? Color(int.parse(colorTitulo.replaceFirst('#', '0xff')))
            : Color(int.parse(colorFondo.replaceFirst('#', '0xff'))),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: AutoSizeText(
          textAlign: TextAlign.center,
          titulo.toUpperCase(),
          style: TextStyle(
            fontSize: 20,
            color: isSelected
                ? Color(int.parse(colorFondo.replaceFirst('#', '0xff')))
                : Color(int.parse(colorTitulo.replaceFirst('#', '0xff'))),
            overflow: TextOverflow.visible,
            height: 1.0,
          ),
          maxLines: maxLinesForCategory,
          softWrap: true,
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final int idInfoRelevante;
  final List<Map<String, dynamic>> productDetails;
  final String selectedCategory;

  const ProductList({
    Key? key,
    required this.productDetails,
    required this.selectedCategory,
    required this.idInfoRelevante,
  }) : super(key: key);

  // Función para obtener el título basado en el idInfoRelevante
  String getTitle(int idInfoRelevante) {
    for (final product in productDetails) {
      if (product['idInfoRelevante'] == idInfoRelevante) {
        return product['titulo'] ?? 'Sin título';
      }
    }
    return 'Sin título';
  }

  String getColorFondo(int idInfoRelevante) {
    for (final product in productDetails) {
      if (product['idInfoRelevante'] == idInfoRelevante) {
        return product['colorFondo'] ?? '#FFFFFF';
      }
    }
    return '#FFFFFF';
  }

  @override
  Widget build(BuildContext context) {
    final colorFondo = getColorFondo(idInfoRelevante);
    // Filtrar los productos por la categoría seleccionada
    final filteredProducts = productDetails.where((product) {
      if (product.containsKey('nombreProducto') &&
          product.containsKey('precio')) {
        if (!product.containsKey('categoria')) {
          return true;
        }
        return product['categoria'] == selectedCategory;
      }
      return false;
    }).toList();

    final allProducts = productDetails
        .where((product) =>
            product.containsKey('nombreProducto') &&
            product.containsKey('precio'))
        .toList();

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        final globalIndex = allProducts.indexOf(product) + 1;
        final String title = getTitle(product['idInfoRelevante']);

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailedPage(
                  idTipoProducto: product['idTipoProducto'],
                  idInfoRelevante: product['idInfoRelevante'],
                  nombreProducto: product['nombreProducto'],
                  precio: product['precio'],
                  title: title,
                  globalIndex: globalIndex,
                  colorFondo: colorFondo,
                  product: product, // Pasar el producto completo
                ),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['nombreProducto'] ?? 'Sin nombre',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(product['descripcion'] ?? ''),
                          Text('Precio: \$${product['precio'] ?? 'N/A'}'),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Image.asset(
                    'assets/$title/${product['nombreProducto']}${' '}$globalIndex.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
