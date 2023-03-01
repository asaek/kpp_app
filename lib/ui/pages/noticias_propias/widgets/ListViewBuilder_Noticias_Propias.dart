import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/common_widgets.dart';
import 'package:kyari_app/ui/common/tokens/tiempo_animations.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:kyari_app/ui/helpers/url_launcher.dart';
import 'package:kyari_app/ui/pages/noticias_propias/widgets/widgets_noticias_page.dart';
import 'package:provider/provider.dart';

class ListViewBuilderNoticiasPropias extends StatelessWidget {
  const ListViewBuilderNoticiasPropias({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NoticiasProvider>(
      builder: (context, noticiasProvider, child) => ListView.builder(
        itemCount: noticiasProvider.getNoticiasCargadas.length,
        scrollDirection: Axis.vertical,
        physics: (noticiasProvider.getListViewSeMueve)
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final edgesTarjeta = BorderRadius.circular(10);

          return Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
            child: Column(
              children: [
                (index == 0) ? const SizedBox(height: 60) : const SizedBox(),
                Consumer<ThemesTrajesProvider>(
                  builder: (context, themesTrajesProvider, child) {
                    final colorTheme = themesTrajesProvider.getThemeTrajeObjeto;

                    return TweenAnimationBuilder(
                      duration:
                          const Duration(milliseconds: tiempoSecundarioColor),
                      tween: ColorTween(
                        begin: colorTheme.secundarioColor,
                        end: colorTheme.secundarioColor,
                      ),
                      builder: (context, colorSecundario, child) => Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              // TweenAnimationBuilder(
                              //   duration: const Duration(
                              //       milliseconds: tiempoSecundarioColor),
                              //   tween: ColorTween(
                              //     begin: colorTheme.secundarioColor,
                              //     end: colorTheme.secundarioColor,
                              //   ),
                              //   builder: (context, color, child) => Container(
                              //     height: 550,
                              //     // width: double.infinity,
                              //     decoration: BoxDecoration(
                              //       boxShadow: [
                              //         BoxShadow(
                              //           color: color!,
                              //           blurRadius: 40,
                              //           spreadRadius: 100,
                              //           offset: const Offset(0, 0),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              PageViewZOOMNoticias(
                                index: index,
                              ),
                              TweenAnimationBuilder(
                                duration: const Duration(
                                    milliseconds: tiempoSecundarioColor),
                                tween: ColorTween(
                                  begin: colorTheme.secundarioColor,
                                  end: colorTheme.secundarioColor,
                                ),
                                builder: (context, color, child) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Material(
                                      elevation: 0,
                                      color: Colors.transparent,
                                      shape: const CircleBorder(),
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: color!,
                                          size: 45,
                                        ),
                                        onTap: () {
                                          final listaControllers =
                                              noticiasProvider
                                                  .getPageControllerList;
                                          // print(
                                          //     'Pagina actual del controller $index --- ${listaControllers[index].page}');

                                          listaControllers[index].previousPage(
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              curve: Curves.easeIn);

                                          // print('Me precionaste');
                                        },
                                      ),
                                    ),
                                    Material(
                                      elevation: 0,
                                      color: Colors.transparent,
                                      shape: const CircleBorder(),
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: color,
                                          size: 45,
                                        ),
                                        onTap: () {
                                          final listaControllers =
                                              noticiasProvider
                                                  .getPageControllerList;

                                          // print(
                                          // 'Pagina actual del controller $index --- ${listaControllers[index].page}');
                                          listaControllers[index].nextPage(
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              curve: Curves.easeIn);
                                          // print('Me precionaste');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            noticiasProvider.getNoticiasCargadas[index].titulo,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 90, 90, 90),
                              fontSize: 30,
                            ),
                          ),
                          Consumer<TraduccionIdiomaProvider>(
                            builder:
                                (context, traduccionIdiomaProvider, child) {
                              final activadaTraduccion =
                                  traduccionIdiomaProvider
                                      .getTraduccionActivada;
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: (activadaTraduccion)
                                    ? TextNoticiaTraducidad(
                                        text: noticiasProvider
                                            .getNoticiasCargadas[index].texto,
                                      )
                                    : TextNoticia(
                                        text: noticiasProvider
                                            .getNoticiasCargadas[index].texto,
                                      ),
                              );
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 25, bottom: 20),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                child: Text(
                                  URLhost(
                                    urlString: noticiasProvider
                                        .getNoticiasCargadas[index].fuente,
                                  ),
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 0, 85),
                                    fontSize: 19,
                                  ),
                                ),
                                onTap: () => URLauncher(
                                    urlString: noticiasProvider
                                        .getNoticiasCargadas[index].fuente),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
