import 'package:flutter/material.dart';

class TituloBanner extends StatelessWidget {
  final String titulo;

  const TituloBanner({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Material(
          color: Colors.pinkAccent,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              titulo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
