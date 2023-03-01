import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/atoms/idiomas.dart';

class TraduccionIdiomaProvider with ChangeNotifier {
  String _idiomaActual = idiomas[0];
  String get getIdiomaActual => _idiomaActual;
  set setIdiomaActual(String dato) {
    _idiomaActual = dato;
    notifyListeners();
  }

  bool _traduccionActivada = false;
  bool get getTraduccionActivada => _traduccionActivada;
  set setTraduccionActivada(bool dato) {
    _traduccionActivada = dato;
    notifyListeners();
  }
}
