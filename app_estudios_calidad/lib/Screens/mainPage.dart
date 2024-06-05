import 'package:app_estudios_calidad/Screens/productInfo.dart';
import 'package:app_estudios_calidad/Screens/product_detailed.dart';
import 'package:flutter/material.dart';
import 'package:app_estudios_calidad/Screens/productSlider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showOverlaySlider = false;
  int _selectedIdTipoProducto = 0;
  List<Map<String, dynamic>> _productDetails = []; // Add this line

  @override
  void initState() {
    super.initState();
    // Fetch or initialize _productDetails here
  }

  void _toggleOverlaySlider(int idTipoProducto) {
    setState(() {
      _showOverlaySlider = !_showOverlaySlider;
      _selectedIdTipoProducto = idTipoProducto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 10),
              TitleWithButton(),
              SizedBox(height: 40),
              SearchBar(productDetails: _productDetails),
              SizedBox(height: 20),
              SubTitle(),
              Expanded(
                child: ProductCategory(
                  onProductCategoryTap: _toggleOverlaySlider,
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
          if (_showOverlaySlider)
            GestureDetector(
              onTap: () {
                setState(() {
                  _showOverlaySlider = false;
                });
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
          if (_showOverlaySlider)
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top * 0.5,
                ),
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width * 0.8,
                child: OverlaySlider(
                  selectedIdTipoProducto: _selectedIdTipoProducto,
                  onClose: () {
                    _toggleOverlaySlider(_selectedIdTipoProducto);
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class TitleWithButton extends StatelessWidget {
  const TitleWithButton({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ExitButton(),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Title(),
            ),
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(
              style: GoogleFonts.quicksand(
                letterSpacing: null,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
              children: const [
                TextSpan(
                  text: 'Poke',
                  style: TextStyle(color: Color.fromARGB(255, 27, 76, 82)),
                ),
                TextSpan(
                  text: 'Consumo',
                  style: TextStyle(color: Color.fromARGB(255, 101, 144, 150)),
                ),
              ],
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}

class ExitButton extends StatelessWidget {
  const ExitButton({Key? key}) : super(key: key);

  void _showExitConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            textAlign: TextAlign.center,
            'Confirmación de salida',
            style: TextStyle(
              color: Color.fromARGB(255, 41, 41, 41),
              fontSize: MediaQuery.of(context).size.width * 0.055,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            '¿Estás seguro de que deseas salir de la aplicación?',
            style: TextStyle(
              color: const Color.fromARGB(255, 68, 68, 68),
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
              },
              child: Text(
                'No',
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 110, 116),
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
                // Salir de la aplicación
                SystemNavigator.pop();
              },
              child: Text(
                'Sí',
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 110, 116),
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: FloatingActionButton(
        onPressed: () => _showExitConfirmationDialog(context),
        shape: const CircleBorder(),
        elevation: 0.0,
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        child: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Color.fromARGB(255, 27, 76, 82),
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  final List<Map<String, dynamic>> productDetails;

  const SearchBar({Key? key, required this.productDetails}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  void _onSearchPressed(BuildContext context) {
    showSearch(
      context: context,
      delegate: CustomSearchDelegate(widget.productDetails),
    );
  }

  @override
  Widget build(BuildContext context) {
    double paddingSearchBar = MediaQuery.of(context).size.height * 0.04;
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color.fromARGB(255, 27, 76, 82),
          selectionColor:
              const Color.fromARGB(255, 76, 139, 175).withOpacity(0.4),
          selectionHandleColor: const Color.fromARGB(255, 76, 139, 175),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: GestureDetector(
          onTap: () => _onSearchPressed(context),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromARGB(115, 70, 79, 80), width: 1.5),
              borderRadius: BorderRadius.circular(35.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Buscar producto...',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                    size: MediaQuery.of(context).size.width * 0.06,
                    Icons.search,
                    color: Color.fromARGB(255, 27, 76, 82)),
              ],
            ),
          ),
        ),
      ),
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

    return _buildProductList(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = productDetails.where((product) {
      final productName = product['nombreProducto']?.toLowerCase() ?? '';
      return productName.contains(query.toLowerCase());
    }).toList();

    return _buildProductList(suggestions);
  }

  Widget _buildProductList(List<Map<String, dynamic>> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildProductCard(context, product);
      },
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, dynamic> product) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailedPage(
              idTipoProducto: product['idTipoProducto'],
              idInfoRelevante: product['idInfoRelevante'],
              nombreProducto: product['nombreProducto'] ?? 'Sin nombre',
              precio: product['precio'] ?? 0,
              title: product['categoria'] ?? 'Sin categoría',
              globalIndex: 0,
              colorFondo: product['colorFondo'] ?? '#FFFFFF',
              product: product,
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
                'assets/${product['categoria']}/${product['nombreProducto']}.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  const SubTitle({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 25),
          Text(
            'Tipos de productos',
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width * 0.08,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 27, 76, 82),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            'Navega en las distintas categorías',
            style: GoogleFonts.poppins(
              fontSize: MediaQuery.of(context).size.width * 0.045,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 85, 85, 85),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}

class ProductCategory extends StatelessWidget {
  final void Function(int) onProductCategoryTap;

  const ProductCategory({Key? key, required this.onProductCategoryTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductCategoryCard(
            imagen: 'assets/TipoDeProducto/productosAlimenticios.jpg',
            texto: 'Productos Alimenticios',
            hasPadding: true,
            onTap: () {
              if (onProductCategoryTap != null) {
                onProductCategoryTap!(1); // pasa el ID del tipo de producto
              }
            },
          ),
          ProductCategoryCard(
            imagen: 'assets/TipoDeProducto/electrodomesticos.jpg',
            texto: 'Electrodomésticos',
            hasPadding: true,
            onTap: () {
              if (onProductCategoryTap != null) {
                onProductCategoryTap!(2);
              }
            },
          ),
          ProductCategoryCard(
            imagen: 'assets/TipoDeProducto/hogarCocina.jpg',
            texto: 'Accesorios de\nCocina y Hogar',
            hasPadding: true,
            onTap: () {
              if (onProductCategoryTap != null) {
                onProductCategoryTap!(3);
              }
            },
          ),
          ProductCategoryCard(
            imagen: 'assets/TipoDeProducto/limpiezaCuidadoPersonal.png',
            texto: 'Productos de Limpieza\ny Cuidado Personal',
            hasPadding: true,
            onTap: () {
              if (onProductCategoryTap != null) {
                onProductCategoryTap!(4);
              }
            },
          ),
          ProductCategoryCard(
            imagen: 'assets/TipoDeProducto/ropaAccesorios.jpg',
            texto: 'Ropa y Accesorios',
            hasPadding: true,
            onTap: () {
              if (onProductCategoryTap != null) {
                onProductCategoryTap!(5);
              }
            },
          ),
          ProductCategoryCard(
            imagen: 'assets/TipoDeProducto/tecnologiaElectronica.png',
            texto: 'Tecnología y Electrónica',
            hasPadding: true,
            onTap: () {
              if (onProductCategoryTap != null) {
                onProductCategoryTap!(6);
              }
            },
          ),
          ProductCategoryCard(
            imagen: 'assets/TipoDeProducto/utilesEscolares.jpg',
            texto: 'Útiles Escolares',
            hasPadding: true,
            onTap: () {
              if (onProductCategoryTap != null) {
                onProductCategoryTap!(7);
              }
            },
          ),
          ProductCategoryCard(
            imagen: 'assets/TipoDeProducto/bellezaCuidadoPersonal.jpg',
            texto: 'Belleza y Cuidado\nPersonal',
            hasPadding: false,
            onTap: () {
              if (onProductCategoryTap != null) {
                onProductCategoryTap!(8);
              }
            },
          ),
        ],
      ),
    );
  }
}

class ProductCategoryCard extends StatelessWidget {
  final String imagen;
  final String texto;
  final bool hasPadding; // Indica si se debe aplicar padding
  final VoidCallback? onTap; // Callback para manejar el evento onTap
  const ProductCategoryCard({
    Key? key,
    required this.imagen,
    required this.texto,
    required this.hasPadding,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Llamar al onTap si está definido
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30,
                hasPadding ? 20 : 0), // Aplicamos padding solo si es necesario
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(imagen),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      const Color.fromARGB(0, 143, 143, 143).withOpacity(0.1),
                      const Color.fromARGB(255, 59, 59, 59).withOpacity(0.4),
                      const Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        texto,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
