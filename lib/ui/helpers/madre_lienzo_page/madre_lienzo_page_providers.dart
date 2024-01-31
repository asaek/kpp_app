import 'package:flutter/material.dart';

import '../../../data/models/models.dart';
import '../../common/atoms/themes_trajes.dart';
import 'madre_lienzo_page_helpers/on_tap_icon_banner.dart';

class MadreLienzoPageProviders extends ChangeNotifier {
  ThemeTrajeObjeto mostrarToastYActualizarTraje() {
    final ThemeTrajeObjeto trajeSiguiente =
        seleccionarTrajeAlAzar(trajes: themesTraje);

    mostrarToast(
      mensaje: trajeSiguiente.nombreTraje,
      backgroundColor: trajeSiguiente.principalColor,
      textColor: trajeSiguiente.textColor,
    );
    return trajeSiguiente;
  }
}
