import 'package:flutter/material.dart';

class TituloBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Material(
          color: Colors.pinkAccent,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '   Noticias',
              style: TextStyle(
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
