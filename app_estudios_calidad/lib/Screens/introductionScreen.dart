import 'package:flutter/material.dart';
import 'package:app_estudios_calidad/Screens/mainPage.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _showIntro = false;

  final List<String> _titles = [
    "Bienvenido",
    "Acceso rápido a los estudios de calidad",
    "Organización y búsqueda",
    "Comparte con otros"
  ];

  final List<String> _descriptions = [
    "Con PokeConsumo, puedes visualizar los resultados de los estudios de calidad de forma sencilla y ordenada, facilitando la toma de decisiones informadas sobre los productos que compras y utilizas",
    "Obtén información detallada sobre los estudios de calidad de Profeco sin necesidad de buscar en la web",
    "Encuentra fácilmente tus productos preferidos gracias a su organización y la barra de búsqueda",
    "Si encuentras información útil, compártela con amigos y familiares para que también puedan tomar decisiones informadas"
  ];

  final List<String> _imagePaths = [
    'assets/persona1.png',
    'assets/persona2.png',
    'assets/persona3.png',
    'assets/persona4.png'
  ];

  @override
  void initState() {
    super.initState();
    _checkShowIntro();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  void _checkShowIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showIntro = prefs.getBool('show_intro') ?? false;
    setState(() {
      _showIntro = !showIntro;
    });
  }

  void _onIntroEnd(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('show_intro', true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  void _onSkip(BuildContext context) {
    _onIntroEnd(context);
  }

  Widget _buildPage(String title, String description, String imagePath) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final imageSize = screenHeight * 0.4; // Ajusta el tamaño de la imagen
    final titleFontSize =
        screenWidth * 0.06; // Ajusta el tamaño de la fuente del título
    final descriptionFontSize =
        screenWidth * 0.045; // Ajusta el tamaño de la fuente de la descripción

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 35.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Image.asset(
            imagePath,
            height: imageSize,
          ),
        ),
        SizedBox(height: 35.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Text(
            title,
            style:
                TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Text(
            description,
            style: TextStyle(fontSize: descriptionFontSize),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_showIntro) {
      return const HomePage();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _titles.length,
                itemBuilder: (context, index) {
                  return _buildPage(
                    _titles[index],
                    _descriptions[index],
                    _imagePaths[index],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => _onSkip(context),
                    child: Text(
                      'Saltar',
                      style: TextStyle(
                        color: Color.fromARGB(255, 29, 110, 116),
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  DotsIndicator(
                    dotsCount: _titles.length,
                    position: _currentPage,
                    decorator: const DotsDecorator(
                      size: Size(8.0, 8.0),
                      color: Color(0xFFBDBDBD),
                      activeColor: Color.fromARGB(255, 29, 110, 116),
                      activeSize: Size(22.0, 10.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _currentPage == _titles.length - 1
                        ? () => _onIntroEnd(context)
                        : () => _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            ),
                    child: Text(
                      _currentPage == _titles.length - 1
                          ? 'Comenzar'
                          : 'Siguiente',
                      style: TextStyle(
                        color: _currentPage == _titles.length - 1
                            ? Color.fromARGB(
                                255, 0, 113, 158) // Color para "Comenzar"
                            : Color.fromARGB(
                                255, 29, 110, 116), // Color para "Siguiente"
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
