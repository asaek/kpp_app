import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/tokens/tiempo_animations.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

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
        child: Consumer<ThemesTrajesProvider>(
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
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    titulo,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
