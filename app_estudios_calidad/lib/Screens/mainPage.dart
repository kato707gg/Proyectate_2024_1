import 'package:flutter/material.dart';
import 'package:app_estudios_calidad/Components/sidebar.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackGround(),
          Homebody(),
        ],
      ),
      drawer: Sidebar(),
    );
  }
}

class BackGround extends StatelessWidget {
  const BackGround({Key? key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.5],
          colors: [
            Color.fromARGB(255, 218, 249, 255),
            Color.fromARGB(255, 255, 255, 255),
          ],
        ),
      ),
    );
  }
}

class Homebody extends StatelessWidget {
  const Homebody({Key? key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          TitleWithButton(),
          SubTitle(),
          InvestmentTable(),
        ],
      ),
    );
  }
}

class TitleWithButton extends StatelessWidget {
  const TitleWithButton({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SidebarButton(),
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

class SidebarButton extends StatelessWidget {
  const SidebarButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: ElevatedButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: const Color.fromARGB(255, 240, 237, 255),
          padding: const EdgeInsets.all(12),
          elevation: 5,
        ),
        child: const Icon(
          Icons.menu,
          color: Color.fromARGB(255, 56, 56, 56),
        ),
      ),
    );
  }
}

//EN ESTA BRANCH VOY A ESTAR HACIENDO CAMBIOS
class Title extends StatelessWidget {
  const Title({Key? key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(
              style: GoogleFonts.quicksand(
                letterSpacing: null,
                fontSize: 35,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
              children: const [
                TextSpan(
                  text: 'A',
                  style: TextStyle(color: Color.fromARGB(255, 131, 33, 243)),
                ),
                TextSpan(text: 'UR'),
                TextSpan(
                  text: 'I',
                  style: TextStyle(color: Color.fromARGB(255, 131, 33, 243)),
                ),
              ],
            ),
            textAlign: TextAlign.end,
          ),
          SizedBox(
            height: 60,
            child: Image.asset(
              'assets/rana.png',
              fit: BoxFit.contain,
            ),
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
            'Descubre el poder de la IA',
            style: GoogleFonts.poppins(
              fontSize: 35,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 45, 45, 85),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            'Obten las mejores fotos y aumenta\ntu productividad',
            style: GoogleFonts.poppins(
              fontSize: 18,
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

class InvestmentTable extends StatelessWidget {
  const InvestmentTable({Key? key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyInvestmentsCard(
            imagen: 'assets/photo_edit.jpg',
            texto: 'Editar fotos',
          ),
          /*MyInvestmentsCard(
            imagen: 'assets/noche_estrellada.jpg',
            texto: 'Estilo Artístico',
          ),*/
          MyInvestmentsCard(
            imagen: 'assets/foto_antigua.jpg',
            texto: 'Recuerdos\ndel Pasado',
          ),
          MyInvestmentsCard(
            imagen: 'assets/modificar_imagen.jpg',
            texto: 'Modificar objetos\nen imagen',
          ),
        ],
      ),
    );
  }
}

class MyInvestmentsCard extends StatelessWidget {
  final String imagen;
  final String texto;
  const MyInvestmentsCard({
    super.key,
    required this.imagen,
    required this.texto,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      /*onTap: () {
        // Determina la pantalla a la que debe navegar según la tarjeta clicada
        if (texto == 'Editar fotos') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PhotoEditor()),
          );
        } else if (texto == 'Estilo Artístico') {
        } else if (texto == 'Recuerdos\ndel Pasado') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditPhotoScreen(),
            ),
          );
        } else if (texto == 'Modificar objetos\nen imagen') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ModificarObjetos(),
            ),
          );
        }
      },*/
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(imagen),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              height: 120,
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
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color.fromARGB(255, 255, 255, 255),
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
