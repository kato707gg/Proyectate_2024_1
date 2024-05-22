import 'dart:convert';
import 'dart:ui';
import 'package:app_estudios_calidad/Screens/mainPage.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductInfoPage extends StatefulWidget {
  final int idTipoProducto;
  final String categoria;

  const ProductInfoPage({
    Key? key,
    required this.idTipoProducto,
    required this.categoria,
  }) : super(key: key);

  @override
  _ProductInfoPageState createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  late Future<List<Map<String, dynamic>>> _productDetailsFuture;
  String _selectedCategory = 'Mayonesas'; // Default category

  @override
  void initState() {
    super.initState();
    _productDetailsFuture = fetchProductDetails(widget.idTipoProducto);
  }

  Future<List<Map<String, dynamic>>> fetchProductDetails(
      int idTipoProducto) async {
    final response = await http.get(Uri.parse(
        'http://192.168.31.202/conexion.php?idTipoProducto=$idTipoProducto'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> infoRelevante = jsonData['InfoRelevante'];

      return List<Map<String, dynamic>>.from(infoRelevante);
    } else {
      throw Exception('Error al cargar la información');
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
            print(
                'Cantidad de detalles del producto: ${productDetails.length}');
            print('Detalles del producto: $productDetails');
            return SingleChildScrollView(
              child: Column(
                children: [
                  MoreInfo(productDetails: productDetails),
                  CategoryTable(
                    productDetails: productDetails,
                    onCategorySelected: (category) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    selectedCategory: _selectedCategory,
                  ),
                  ProductList(
                    productDetails: productDetails,
                    selectedCategory: _selectedCategory,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              color: Color.fromARGB(255, 27, 76, 82),
              Icons.arrow_back_ios_new_rounded,
              opticalSize: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
          ),
          SearchIcon(),
        ],
      ),
    );
  }
}

class SearchIcon extends StatelessWidget {
  const SearchIcon({Key? key}) : super(key: key);

  void _onSearchPressed(BuildContext context) {
    // Implementa la acción de búsqueda aquí
    showSearch(
      context: context,
      delegate:
          CustomSearchDelegate(), // Definir un SearchDelegate personalizado
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search, size: 30.0),
      onPressed: () => _onSearchPressed(context),
      color: Color.fromARGB(255, 27, 76, 82),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        padding: EdgeInsets.only(right: 22, top: 12),
        icon: Icon(
          color: Color.fromARGB(255, 27, 76, 82),
          Icons.clear_rounded,
          size: 25.0,
          opticalSize: 25,
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
      padding: EdgeInsets.only(left: 22, top: 12),
      icon: Icon(
        color: Color.fromARGB(255, 27, 76, 82),
        Icons.arrow_back_ios_new_rounded,
        opticalSize: 30,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Aquí se pueden mostrar los resultados de la búsqueda
    return Container(
      margin: EdgeInsets.only(
          top: 20), // Agrega un espacio arriba de la barra de búsqueda
      child: Center(
        child: Text('Resultados de búsqueda para "$query"'),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Aquí se pueden mostrar sugerencias mientras el usuario escribe
    return Center(
      child: Text('Sugerencias para "$query"'),
    );
  }
}

class MoreInfo extends StatelessWidget {
  final List<Map<String, dynamic>> productDetails;

  const MoreInfo({Key? key, required this.productDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorFondo =
        productDetails.isNotEmpty && productDetails[0]['colorFondo'] != null
            ? productDetails[0]['colorFondo']
            : '#FFFFFF';
    return Container(
      padding: EdgeInsets.only(top: 40, bottom: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(int.parse(colorFondo.replaceFirst('#', '0xff'))),
      ),
      child: Column(
        children: [
          Header(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Image.asset('assets/moreinfo.png'),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        textAlign: TextAlign.center,
                        '¿Quieres saber mas acerca de este estudio de calidad?',
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
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          // Acción para el botón "más información"
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
  final Function(String) onCategorySelected;
  final String selectedCategory;

  const CategoryTable({
    Key? key,
    required this.productDetails,
    required this.onCategorySelected,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = productDetails
        .map((product) => product['categoria'])
        .whereType<String>() // Filter out null values and non-String values
        .toSet()
        .toList();

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            return GestureDetector(
              onTap: () => onCategorySelected(category),
              child: CategoryCard(
                texto1: category,
                isSelected: selectedCategory == category,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String texto1;
  final bool isSelected;

  const CategoryCard({Key? key, required this.texto1, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        texto1,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> productDetails;
  final String selectedCategory;

  const ProductList(
      {Key? key, required this.productDetails, required this.selectedCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredProducts = productDetails
        .where((product) => product['categoria'] == selectedCategory)
        .toList();

    print("Selected Category: $selectedCategory");
    print("Filtered Products Length: ${filteredProducts.length}");

    // Print each category in filtered products
    for (var product in filteredProducts) {
      print("Category: ${product['categoria']}");
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        return Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product['nombreProducto'] ?? 'Sin nombre',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(product['descripcion'] ?? 'Sin descripción'),
              Text('Precio: \$${product['precio'] ?? 'N/A'}'),
            ],
          ),
        );
      },
    );
  }
}
