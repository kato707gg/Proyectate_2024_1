import 'package:app_estudios_calidad/Screens/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductInfoPage extends StatefulWidget {
  const ProductInfoPage({Key? key});

  @override
  _ProductInfoPageState createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 10),
              Header(),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
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
