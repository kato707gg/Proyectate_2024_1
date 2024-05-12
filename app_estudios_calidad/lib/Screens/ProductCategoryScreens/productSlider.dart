import 'dart:ui';

import 'package:flutter/material.dart';

class OverlaySlider extends StatelessWidget {
  final VoidCallback? onClose;

  OverlaySlider({Key? key, this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 5, sigmaY: 5), // Ajusta el desenfoque según sea necesario
        child: Scaffold(
          backgroundColor: Colors.transparent, // Fondo transparente
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                // Color de fondo deseado
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: PageView(
                scrollDirection: Axis.vertical,
                children: [
                  VerticalCard(
                    title: 'Card 1',
                    description: 'Description 1',
                    imagePath: 'assets/persona1.png',
                  ),
                  VerticalCard(
                    title: 'Card 2',
                    description: 'Description 2',
                    imagePath: 'assets/image2.jpg',
                  ),
                  VerticalCard(
                    title: 'Card 3',
                    description: 'Description 3',
                    imagePath: 'assets/image3.jpg',
                  ),
                ],
              ),
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
  final String imagePath;

  const VerticalCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 165, 202, 211), // Color de fondo de la tarjeta
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to another screen
                  },
                  child: Text('Ver más'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
