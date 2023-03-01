import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/tokens/tiempo_animations.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:kyari_app/ui/pages/pages.dart';
import 'package:provider/provider.dart';

class MenuDrawer extends StatelessWidget {
  final colorBackGound = const Color.fromARGB(176, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthDrawer = size.width * 0.65;

    return Drawer(
      elevation: 20,
      width: widthDrawer,
      shape: const RoundedRectangleBorder(),
      child: SizedBox(
        // width: 200,
        height: double.infinity,
        child: Material(
          // color: Colors.pinkAccent,
          // borderRadius: BorderRadius.circular(20),
          child: ClipRRect(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/Kyary_mexicanoen_casa.png',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Positioned(
                      bottom: 10.0,
                      left: 15.0,
                      child: Text(
                        "Kyary Pamyu Pamyu",
                        style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: (size.height - 200),
                  width: widthDrawer,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 30,
                        top: 30,
                        child: Consumer<ThemesTrajesProvider>(
                          builder: (context, themesTrajesProvider, child) {
                            final colorTheme =
                                themesTrajesProvider.getThemeTrajeObjeto;
                            return TweenAnimationBuilder(
                              duration: const Duration(
                                  milliseconds: tiempoPrincipalColor),
                              tween: ColorTween(
                                begin: colorTheme.principalColor,
                                end: colorTheme.principalColor,
                              ),
                              builder: (context, colorPrincipal, child) =>
                                  Transform.rotate(
                                angle: -pi / 1.1,
                                child: Container(
                                  width: 110,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(20.0),
                                    gradient: LinearGradient(
                                      colors: [
                                        colorPrincipal!,
                                        colorTheme.secundarioColor,
                                        // Color.fromRGBO(235, 98, 188, 1),
                                        // Color.fromRGBO(241, 142, 172, 1),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        left: 65,
                        bottom: 365,
                        child: Consumer<ThemesTrajesProvider>(
                          builder: (context, themesTrajesProvider, child) {
                            final colorTheme =
                                themesTrajesProvider.getThemeTrajeObjeto;
                            return TweenAnimationBuilder(
                              duration: const Duration(
                                  milliseconds: tiempoPrincipalColor),
                              tween: ColorTween(
                                begin: colorTheme.principalColor,
                                end: colorTheme.principalColor,
                              ),
                              builder: (context, colorPrincipal, child) =>
                                  Transform.rotate(
                                angle: -pi / 0.6,
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(20.0),
                                    gradient: LinearGradient(
                                      colors: [
                                        colorPrincipal!,
                                        colorTheme.secundarioColor,
                                        // Color.fromRGBO(235, 98, 188, 1),
                                        // Color.fromRGBO(241, 142, 172, 1),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        right: 35,
                        bottom: 40,
                        child: Consumer<ThemesTrajesProvider>(
                          builder: (context, themesTrajesProvider, child) {
                            final colorTheme =
                                themesTrajesProvider.getThemeTrajeObjeto;
                            return TweenAnimationBuilder(
                              duration: const Duration(
                                  milliseconds: tiempoPrincipalColor),
                              tween: ColorTween(
                                begin: colorTheme.principalColor,
                                end: colorTheme.principalColor,
                              ),
                              builder: (context, colorPrincipal, child) =>
                                  Transform.rotate(
                                angle: -pi / 3.0,
                                child: Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(20.0),
                                    gradient: LinearGradient(
                                      colors: [
                                        colorPrincipal!,
                                        colorTheme.secundarioColor,
                                        // Color.fromRGBO(235, 98, 188, 1),
                                        // Color.fromRGBO(241, 142, 172, 1),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                          child: Container(
                            height: double.infinity,
                            // color: Colors.pinkAccent,
                          ),
                        ),
                      ),
                      Consumer<ButtonDrawerProvider>(
                        builder: (context, buttonDrawerProvider, _) => Column(
                          children: [
                            //Aqui se creara las figuras  de colores el blur y mas -----------------
                            const _OpcionDeDrawer(
                              numeroBoton: 0,
                              titulo: 'Blog Mexicano',
                              key: ValueKey(0),
                            ),
                            const _OpcionDeDrawer(
                              numeroBoton: 1,
                              titulo: 'Twitter',
                              key: ValueKey(1),
                            ),
                            const _OpcionDeDrawer(
                              numeroBoton: 2,
                              titulo: 'Configuracion',
                              key: ValueKey(2),
                            ),

                            Expanded(
                              child: Material(
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Consumer<TraduccionIdiomaProvider>(
                                            builder: (context,
                                                traduccionIdiomaProvider,
                                                child) {
                                              final traduccionActiada =
                                                  traduccionIdiomaProvider
                                                      .getTraduccionActivada;

                                              return Consumer<
                                                  ThemesTrajesProvider>(
                                                builder: (context,
                                                    themesTrajesProvider,
                                                    child) {
                                                  final colorTheme =
                                                      themesTrajesProvider
                                                          .getThemeTrajeObjeto;
                                                  return TweenAnimationBuilder(
                                                    duration: const Duration(
                                                      milliseconds:
                                                          tiempoSecundarioColor,
                                                    ),
                                                    tween: ColorTween(
                                                      begin: colorTheme
                                                          .secundarioColor,
                                                      end: colorTheme
                                                          .secundarioColor,
                                                    ),
                                                    builder: (context, coolor,
                                                            child) =>
                                                        Switch(
                                                      activeColor: coolor,
                                                      inactiveThumbColor:
                                                          coolor,
                                                      value: traduccionActiada,
                                                      onChanged: (value) {
                                                        traduccionIdiomaProvider
                                                                .setTraduccionActivada =
                                                            value;
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          const Text(
                                            'Traduccion',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OpcionDeDrawer extends StatelessWidget {
  final String titulo;
  final int numeroBoton;

  @override
  const _OpcionDeDrawer({
    required this.titulo,
    required this.numeroBoton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // const colorBackGound = Color.fromARGB(176, 0, 0, 0);
    const colorBackGound = Color.fromARGB(129, 255, 255, 255);

    return Consumer<ButtonDrawerProvider>(
      key: key,
      builder: (context, buttonDrawerProvider, _) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            child: Consumer<ThemesTrajesProvider>(
              builder: (context, themesTrajesProvider, child) {
                final colorTheme = themesTrajesProvider.getThemeTrajeObjeto;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  color: (buttonDrawerProvider.getSeleccionado == numeroBoton)
                      ? colorTheme.principalColor.withOpacity(0.4)
                      : colorBackGound,
                  height: (buttonDrawerProvider.getSeleccionado == numeroBoton)
                      ? 80
                      : 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Center(
                          child: Text(
                            titulo,
                            style: TextStyle(
                              color: (buttonDrawerProvider.getSeleccionado ==
                                      numeroBoton)
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: (buttonDrawerProvider.getSeleccionado ==
                                      numeroBoton)
                                  ? 22
                                  : 18,
                              fontWeight:
                                  (buttonDrawerProvider.getSeleccionado ==
                                          numeroBoton)
                                      ? FontWeight.bold
                                      : FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            onTap: () {
              buttonDrawerProvider.setSeleccionado = numeroBoton;

              if (numeroBoton == 0) {
                Provider.of<MadreLienzoProvider>(context, listen: false)
                    .setPaginaActual = BlogNoticiasPage();

                Provider.of<MadreLienzoProvider>(context, listen: false)
                    .setNombrePagActual = '   Blog Noticias';
                // Navigator.pop(context);
              }
              if (numeroBoton == 1) {
                Provider.of<MadreLienzoProvider>(context, listen: false)
                    .setPaginaActual = TwitterPage();

                Provider.of<MadreLienzoProvider>(context, listen: false)
                    .setNombrePagActual = '   Tweets';

                // Navigator.pop(context);
              }

              if (numeroBoton == 2) {
                Provider.of<MadreLienzoProvider>(context, listen: false)
                    .setPaginaActual = ConfiguracionPage();

                Provider.of<MadreLienzoProvider>(context, listen: false)
                    .setNombrePagActual = '   Configuracion Pamyu';

                // Navigator.pop(context);
              }
            },
          ),
        );
      },
    );
  }
}
