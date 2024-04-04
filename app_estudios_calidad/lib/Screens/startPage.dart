import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height / 1.7,
            child: Background(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.6,
            left: 0,
            right: 0,
            bottom: 0,
            child: Homebody(),
          ),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Fondooo.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Homebody extends StatefulWidget {
  const Homebody({super.key});

  @override
  State<Homebody> createState() => _HomebodyState();
}

class _HomebodyState extends State<Homebody> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
