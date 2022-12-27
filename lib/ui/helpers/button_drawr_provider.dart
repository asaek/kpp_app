import 'package:flutter/material.dart';

class ButtonDrawerProvider with ChangeNotifier {
  int _seleccionado = 0;
  int get getSeleccionado => _seleccionado;
  set setSeleccionado(int dato) {
    _seleccionado = dato;
    notifyListeners();
  }
}
