import 'package:flutter/material.dart';

class NoticiasProvider with ChangeNotifier {
  bool _cargando = true;
  bool get getCargando => _cargando;
  set setCargando(bool dato) {
    _cargando = dato;
    notifyListeners();
  }
}
