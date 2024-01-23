import 'package:flutter/material.dart';

class ThemeTrajeObjeto {
  ThemeTrajeObjeto(
      {required this.principalColor,
      required this.secundarioColor,
      this.terceroColor,
      this.titleColor,
      required this.textColor,
      required this.nombreTraje,
      this.titleStyle,
      this.textStyle});

  Color principalColor;
  Color secundarioColor;
  Color? terceroColor;
  Color? titleColor;
  Color textColor;
  String nombreTraje;
  TextStyle? titleStyle;
  TextStyle? textStyle;
}
