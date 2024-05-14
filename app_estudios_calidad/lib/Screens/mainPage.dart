import 'package:flutter/material.dart';
import 'package:app_estudios_calidad/Screens/ProductCategoryScreens/productSlider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showOverlaySlider = false;
  String _selectedCategory = ''; // Aquí almacenarás la categoría seleccionada

  void _toggleOverlaySlider([String? categoryName]) {
    // Cambiar la definición de la función
    setState(() {
      _showOverlaySlider = !_showOverlaySlider;
      _selectedCategory = categoryName ??
          ''; // Usar categoryName si está presente, de lo contrario, usar una cadena vacía
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
              SearchBar(),
              SizedBox(height: 20),
              SubTitle(),
              Expanded(
                child: ProductCategory(
                  onProductCategoryTap: () {
                    _toggleOverlaySlider();
                  },
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
                  selectedCategory:
                      _selectedCategory, // Pasa la categoría seleccionada
                  onClose: () {
                    _toggleOverlaySlider();
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

class ExitButton extends StatelessWidget {
  const ExitButton({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        elevation: 0.0,
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        child: const Icon(Icons.arrow_back_ios_rounded,
            color: Color.fromARGB(255, 27, 76, 82)),
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
                color: const Color.fromARGB(255, 0, 0, 0),
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
  final VoidCallback? onProductCategoryTap;

  const ProductCategory({Key? key, this.onProductCategoryTap})
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
            onTap: onProductCategoryTap,
          ),
          ProductCategoryCard(
            imagen: 'assets/electrodomesticos.jpg',
            texto: 'Electrodomésticos',
            hasPadding: true,
            onTap: onProductCategoryTap,
          ),
          ProductCategoryCard(
            imagen: 'assets/hogarCocina.jpg',
            texto: 'Accesorios de\nCocina y Hogar',
            hasPadding: true,
            onTap: onProductCategoryTap,
          ),
          ProductCategoryCard(
            imagen: 'assets/limpiezaCuidadoPersonal.png',
            texto: 'Productos de Limpieza\ny Cuidado Personal',
            hasPadding: true,
            onTap: onProductCategoryTap,
          ),
          ProductCategoryCard(
            imagen: 'assets/ropaAccesorios.jpg',
            texto: 'Ropa y Accesorios',
            hasPadding: true,
            onTap: onProductCategoryTap,
          ),
          ProductCategoryCard(
            imagen: 'assets/tecnologiaElectronica',
            texto: 'Tecnología y Electrónica',
            hasPadding: true,
            onTap: onProductCategoryTap,
          ),
          ProductCategoryCard(
            imagen: 'assets/utilesEscolares.jpg',
            texto: 'Útiles Escolares',
            hasPadding: true,
            onTap: onProductCategoryTap,
          ),
          ProductCategoryCard(
            imagen: 'assets/bellezaCuidadoPersonal.jpg',
            texto: 'Belleza y Cuidado\nPersonal',
            hasPadding: false,
            onTap: onProductCategoryTap,
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
