import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/tokens/tiempo_animations.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

import '../../../../helpers/madre_lienzo_page/madre_lienzo_page.dart';

class TituloBanner extends StatelessWidget {
  final String titulo;

  const TituloBanner({super.key, required this.titulo});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Banner(titulo: titulo),
      ),
    );
  }
}

class Banner extends StatelessWidget {
  final String titulo;

  const Banner({
    super.key,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemesTrajesProvider>(
      builder: (context, themesTrajesProvider, child) {
        final colorTheme = themesTrajesProvider.getThemeTrajeObjeto;
        return TweenAnimationBuilder(
          duration: const Duration(milliseconds: tiempoPrincipalColor),
          tween: ColorTween(
            begin: colorTheme.principalColor,
            end: colorTheme.principalColor,
          ),
          builder: (context, value, _) => Material(
            color: value,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const IconoBanner(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class IconoBanner extends StatelessWidget {
  const IconoBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(
          right: 10,
          top: 7,
          bottom: 7,
        ),
        child: Image.asset('assets/btn_aleatorio.png'),
      ),
      onTap: () {
        final trajeSiguiente =
            Provider.of<MadreLienzoPageProviders>(context, listen: false)
                .mostrarToastYActualizarTraje();
        PaginationControl.forward();
        Provider.of<ThemesTrajesProvider>(context, listen: false)
            .setThemeTrajeObjeto = trajeSiguiente;
      },
    );
  }
}
