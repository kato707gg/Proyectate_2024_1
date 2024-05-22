import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:app_estudios_calidad/Screens/productSlider.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showOverlaySlider = false;
  int _selectedIdTipoProducto =
      0; // Nuevo campo para almacenar el ID del tipo de producto

  void _toggleOverlaySlider(int idTipoProducto) {
    setState(() {
      _showOverlaySlider = !_showOverlaySlider;
      _selectedIdTipoProducto =
          idTipoProducto; // Guarda el ID del tipo de producto seleccionado
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 5),
              TitleWithButton(),
              SizedBox(height: 40),
              SearchBar(),
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
  final void Function(String)? onSearch;

  const SearchBar({Key? key, this.onSearch}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _submitSearch(String value) {
    if (widget.onSearch != null) {
      widget.onSearch!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color.fromARGB(255, 27, 76, 82), // Color del cursor
          selectionColor: const Color.fromARGB(255, 76, 139, 175)
              .withOpacity(0.4), // Color de la selección del texto
          selectionHandleColor: const Color.fromARGB(
              255, 76, 139, 175), // Color del indicador de selección del texto
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Buscar producto...',
            prefixIcon:
                Icon(Icons.search, color: Color.fromARGB(255, 27, 76, 82)),
            border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(35.0) // Color del borde normal
                ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(35.0),
              borderSide: BorderSide(
                  color: Color.fromARGB(
                      255, 58, 119, 129)), // Color del borde enfocado
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.send_rounded,
                color: Color.fromARGB(255, 27, 76, 82),
              ),
              onPressed: () {
                _submitSearch(_searchController.text);
              },
            ),
          ),
          onChanged: _submitSearch,
          onSubmitted: _submitSearch,
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
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 27, 76, 82),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            'Navega en las distintas categorías',
            style: GoogleFonts.poppins(
              fontSize: 15,
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
            imagen: 'assets/productosAlimenticios.jpg',
            texto: 'Productos Alimenticios',
            hasPadding: true,
            onTap: () {
              if (onProductCategoryTap != null) {
                onProductCategoryTap!(
                    1); // Por ejemplo, pasa el ID del tipo de producto
              }
            },
          ),
          ProductCategoryCard(
            imagen: 'assets/electrodomesticos.jpg',
            texto: 'Electrodomésticos',
            hasPadding: true,
            onTap: () {
              if (onProductCategoryTap != null) {
                onProductCategoryTap!(2);
              }
            },
          ),
          ProductCategoryCard(
            imagen: 'assets/hogarCocina.jpg',
            texto: 'Accesorios de\nCocina y Hogar',
            hasPadding: true,
            onTap: () {
              if (onProductCategoryTap != null) {
                onProductCategoryTap!(3);
              }
            },
          ),
          ProductCategoryCard(
            imagen: 'assets/limpiezaCuidadoPersonal.png',
            texto: 'Productos de Limpieza\ny Cuidado Personal',
            hasPadding: true,
            onTap: () {
              if (onProductCategoryTap != null) {
                onProductCategoryTap!(4);
              }
            },
          ),
          ProductCategoryCard(
            imagen: 'assets/ropaAccesorios.jpg',
            texto: 'Ropa y Accesorios',
            hasPadding: true,
            onTap: () {
              if (onProductCategoryTap != null) {
                onProductCategoryTap!(5);
              }
            },
          ),
          ProductCategoryCard(
            imagen: 'assets/tecnologiaElectronica.png',
            texto: 'Tecnología y Electrónica',
            hasPadding: true,
            onTap: () {
              if (onProductCategoryTap != null) {
                onProductCategoryTap!(6);
              }
            },
          ),
          ProductCategoryCard(
            imagen: 'assets/utilesEscolares.jpg',
            texto: 'Útiles Escolares',
            hasPadding: true,
            onTap: () {
              if (onProductCategoryTap != null) {
                onProductCategoryTap!(7);
              }
            },
          ),
          ProductCategoryCard(
            imagen: 'assets/bellezaCuidadoPersonal.jpg',
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
                height: 150,
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
                          fontSize: 17,
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
