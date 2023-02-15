import 'package:flutter/material.dart';
import 'package:kyari_app/domain/models/models.dart';

final List<ThemeTrajeObjeto> themesTraje = [
  ThemeTrajeObjeto(
    nombreTraje: 'Koachella',
    principalColor: Colors.pinkAccent,
    secundarioColor: Colors.lightBlue,
    terceroColor: const Color.fromARGB(255, 254, 117, 163),
    textColor: Colors.white,
  ),
  ThemeTrajeObjeto(
    nombreTraje: 'Fashion Monsta',
    principalColor: Colors.black,
    secundarioColor: const Color.fromARGB(255, 255, 0, 0),
    terceroColor: const Color.fromARGB(255, 254, 117, 163),
    textColor: Colors.white,
  ),
  ThemeTrajeObjeto(
    nombreTraje: 'Candy Racer',
    principalColor: const Color.fromARGB(255, 0, 59, 159),
    secundarioColor: const Color.fromARGB(255, 255, 218, 246),
    terceroColor: const Color.fromARGB(255, 3, 246, 165),
    textColor: Colors.black,
  ),
];
