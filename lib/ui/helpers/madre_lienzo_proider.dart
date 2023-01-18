import 'package:flutter/material.dart';
import 'package:kyari_app/ui/pages/pages.dart';

class MadreLienzoProvider with ChangeNotifier {
  Widget _paginaActual = Noticias_Page();
  Widget get getPaginaActual => _paginaActual;
  set setPaginaActual(Widget dato) {
    _paginaActual = dato;
    notifyListeners();
  }
}
