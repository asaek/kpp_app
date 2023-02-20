import 'package:flutter/material.dart';
import 'package:kyari_app/domain/models/models.dart';
import 'package:kyari_app/ui/common/atoms/themes_trajes.dart';
import 'package:kyari_app/ui/common/tokens/tiempo_animations.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

class ConfiguracionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(top: 55),
        child: Consumer<ThemesTrajesProvider>(
          builder: (context, themesTrajesProvider, child) {
            final colorTheme = themesTrajesProvider.getThemeTrajeObjeto;

            return Column(
              children: [
                TweenAnimationBuilder(
                  duration: const Duration(milliseconds: tiempoSecundarioColor),
                  tween: ColorTween(
                    begin: colorTheme.secundarioColor,
                    end: colorTheme.secundarioColor,
                  ),
                  builder: (context, colorContainer, _) => Material(
                    color: colorContainer,
                    child: Container(
                      width: double.infinity,
                      height: 30,
                      alignment: Alignment.center,
                      // color: Colors.transparent,
                      child: TweenAnimationBuilder(
                        duration:
                            const Duration(milliseconds: tiempoTextoColor),
                        tween: ColorTween(
                          begin: colorTheme.textColor,
                          end: colorTheme.textColor,
                        ),
                        builder: (context, colorTexto, _) => Text(
                          'Temas',
                          style: TextStyle(
                            color: colorTexto,
                            fontSize: 21,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                RadioListTile<ThemeTrajeObjeto>(
                  value: themesTraje[0],
                  title: Text(themesTraje[0].nombreTraje),
                  activeColor: themesTraje[0].principalColor,
                  groupValue: themesTrajesProvider.getThemeTrajeObjeto,
                  onChanged: (valor) {
                    themesTrajesProvider.setThemeTrajeObjeto = valor!;
                  },
                ),
                RadioListTile<ThemeTrajeObjeto>(
                  value: themesTraje[1],
                  title: Text(themesTraje[1].nombreTraje),
                  activeColor: themesTraje[1].principalColor,
                  groupValue: themesTrajesProvider.getThemeTrajeObjeto,
                  onChanged: (valor) {
                    themesTrajesProvider.setThemeTrajeObjeto = valor!;
                  },
                ),
                RadioListTile<ThemeTrajeObjeto>(
                  value: themesTraje[2],
                  title: Text(themesTraje[2].nombreTraje),
                  activeColor: themesTraje[2].principalColor,
                  groupValue: themesTrajesProvider.getThemeTrajeObjeto,
                  onChanged: (valor) {
                    themesTrajesProvider.setThemeTrajeObjeto = valor!;
                  },
                ),
              ],
            );
          },
        ),
      ),
    ));
  }
}
