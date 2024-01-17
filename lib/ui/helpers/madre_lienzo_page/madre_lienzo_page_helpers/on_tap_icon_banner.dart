import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../data/models/models.dart';

ThemeTrajeObjeto seleccionarTrajeAlAzar(
    {required List<ThemeTrajeObjeto> trajes}) {
  final Random random = Random();
  return trajes[random.nextInt(trajes.length)];
}

void mostrarToast({
  required String mensaje,
  required Color backgroundColor,
  required Color textColor,
}) {
  Fluttertoast.showToast(
    msg: mensaje,
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 22.0,
  );
}
