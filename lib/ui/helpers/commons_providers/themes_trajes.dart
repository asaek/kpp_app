import 'package:flutter/material.dart';
import 'package:kyari_app/data/models/models.dart';
import 'package:kyari_app/ui/common/atoms/themes_trajes.dart';

class ThemesTrajesProvider with ChangeNotifier {
  ThemeTrajeObjeto _themeTrajeObjeto = themesTraje[0];

  ThemeTrajeObjeto get getThemeTrajeObjeto => _themeTrajeObjeto;
  set setThemeTrajeObjeto(ThemeTrajeObjeto dato) {
    _themeTrajeObjeto = dato;
    notifyListeners();
  }
}
