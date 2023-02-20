import 'package:flutter/material.dart';
import 'package:kyari_app/domain/models/models.dart';
import 'package:kyari_app/ui/common/atoms/themes_trajes.dart';

class ThemesTrajesProvider with ChangeNotifier {
  // ThemeTrajeObjeto _themeTrajeObjeto = ThemeTrajeObjeto(
  //   nombreTraje: '',
  //   principalColor: Colors.black,
  //   secundarioColor: Colors.black,
  //   terceroColor: Colors.black,
  //   textColor: Colors.black,
  //   textStyle: const TextStyle(),
  //   titleColor: Colors.black,
  //   titleStyle: const TextStyle(),
  // );
  ThemeTrajeObjeto _themeTrajeObjeto = themesTraje[0];

  ThemeTrajeObjeto get getThemeTrajeObjeto => _themeTrajeObjeto;
  set setThemeTrajeObjeto(ThemeTrajeObjeto dato) {
    _themeTrajeObjeto = dato;
    notifyListeners();
  }
}
