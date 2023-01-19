import 'package:flutter/material.dart';
import 'package:kyari_app/ui/pages/pages.dart';

class MadreLienzoProvider with ChangeNotifier {
  Widget _paginaActual = BlogNoticiasPage();
  Widget get getPaginaActual => _paginaActual;
  set setPaginaActual(Widget dato) {
    _paginaActual = dato;
    notifyListeners();
  }

  String _nombrePagActual = '   Blog Noticias';
  String get getNOmbrePagActual => _nombrePagActual;
  set setNombrePagActual(String dato) {
    _nombrePagActual = dato;
    notifyListeners();
  }

  int _paginaSeleccionada = 0;
  int get getPaginaSeleccionada => _paginaSeleccionada;
  set setPaginaSeleccionada(int dato) {
    _paginaSeleccionada = dato;
    notifyListeners();
  }

  List<String> paginasList = [
    '   Blog Noticias',
    '   Twitter',
  ];
}
