import 'package:flutter/material.dart';
import 'package:kyari_app/data/models/themes_trajes/themes_trajes_modelo.dart';
import 'package:kyari_app/ui/common/common_widgets.dart';
import 'package:kyari_app/ui/common/tokens/tiempo_animations.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:kyari_app/ui/helpers/url_launcher.dart';
import 'package:kyari_app/ui/pages/noticias_propias/widgets/widgets_noticias_page.dart';
import 'package:provider/provider.dart';

import '../../../../domain/entities/entities.dart';
import '../../../common/atoms/border_radius.dart';
import '../../../helpers/commons_providers/commons_providers.dart';

class ListViewBuilderNoticiasPropias extends StatefulWidget {
  const ListViewBuilderNoticiasPropias({super.key});

  @override
  State<ListViewBuilderNoticiasPropias> createState() =>
      _ListViewBuilderNoticiasPropiasState();
}

class _ListViewBuilderNoticiasPropiasState
    extends State<ListViewBuilderNoticiasPropias> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      // print('maxScrollExtend:  ${_scrollController.position.maxScrollExtent} ');
      // print('Pixeles:  ${_scrollController.position.pixels} ');

      // Para cargar mas elementos
      if (_scrollController.position.pixels + 200 >=
          _scrollController.position.maxScrollExtent) {
        // cargandoTweets();
      } else {
        Provider.of<ControlListViewProvider>(context, listen: false)
            .setLoadingMoreTweets = false;
      }

      // print(_scrollController.position.pixels);
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    _scrollController.dispose();

    super.dispose();
  }

  //! Esto se tiene que sacar de aqui x2 XD
  Future refrescarNoticiasPropias() async {
    await Future.delayed(const Duration(milliseconds: 1500));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: circularProgressIndicator,
    );
  }

  List<Widget> get circularProgressIndicator {
    return [
      Consumer<NoticiasPropiasProvider>(
        builder: (context, noticiasProvider, child) => RefreshIndicator(
          onRefresh: refrescarNoticiasPropias,
          color: Provider.of<ThemesTrajesProvider>(context, listen: true)
              .getThemeTrajeObjeto
              .secundarioColor,
          displacement: 100,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            controller: _scrollController,
            itemCount: noticiasProvider.getNoticiasCargadas!.length,
            scrollDirection: Axis.vertical,
            physics: (noticiasProvider.getListViewSeMueve)
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: Column(
                  children: [
                    (index == 0)
                        ? const SizedBox(height: 12)
                        : const SizedBox(),
                    Consumer<ThemesTrajesProvider>(
                      builder: (context, themesTrajesProvider, child) {
                        final colorTheme =
                            themesTrajesProvider.getThemeTrajeObjeto;

                        return TweenAnimationBuilder(
                          duration: const Duration(
                            milliseconds: tiempoSecundarioColor,
                          ),
                          tween: ColorTween(
                            begin: colorTheme.secundarioColor,
                            end: colorTheme.secundarioColor,
                          ),
                          builder: (context, colorSecundario, child) => Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              ImagenesNoticia(
                                colorTheme: colorTheme,
                                index: index,
                                listaControllers:
                                    noticiasProvider.getPageControllerList,
                              ),
                              const SizedBox(height: 8),
                              ContenedorNoticia(
                                noticia: noticiasProvider
                                    .getNoticiasCargadas![index],
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
        ),
      ),
      if (Provider.of<ControlListViewProvider>(context, listen: true)
          .getLoadingMoreTweets)
        const CicrulaProgresIndicator(),
    ];
  }
}

class ContenedorNoticia extends StatelessWidget {
  final NoticiaPropiaEntitie noticia;

  const ContenedorNoticia({
    super.key,
    required this.noticia,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeTrajeObjeto trajeSeleccionado =
        Provider.of<ThemesTrajesProvider>(context, listen: false)
            .getThemeTrajeObjeto;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: borderRadiusCuadroTextoNoticia,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: tiempoSecundarioColor),
            color: Provider.of<ThemesTrajesProvider>(context, listen: true)
                .getThemeTrajeObjeto
                .terceroColor!
                .withOpacity(0.7),
            child: Column(
              children: [
                const SizedBox(height: 10),
                TituloNoticia(
                  titulo: noticia.titulo,
                  colorText: trajeSeleccionado.textColor,
                ),
                ContenidoTraduccionNoticia(
                  texto: noticia.texto,
                  colorText: trajeSeleccionado.textColor,
                ),
                // FuenteNoticia(
                //   fuente: noticiasProvider
                //       .getNoticiasCargadas![index].fuente,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImagenesNoticia extends StatelessWidget {
  final int index;
  final List<PageController> listaControllers;
  const ImagenesNoticia({
    super.key,
    required this.colorTheme,
    required this.index,
    required this.listaControllers,
  });

  final ThemeTrajeObjeto colorTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        PageViewZOOMNoticias(
          index: index,
        ),
        TweenAnimationBuilder(
          duration: const Duration(milliseconds: tiempoSecundarioColor),
          tween: ColorTween(
            begin: colorTheme.secundarioColor,
            end: colorTheme.secundarioColor,
          ),
          builder: (context, color, child) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlechaCambioImagen(
                colorFlecha: color!,
                listaControllers: listaControllers,
                index: index,
                izquierdaDerecha: false,
              ),
              FlechaCambioImagen(
                colorFlecha: color,
                listaControllers: listaControllers,
                index: index,
                izquierdaDerecha: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TituloNoticia extends StatelessWidget {
  final String titulo;
  final Color colorText;
  const TituloNoticia({
    super.key,
    required this.titulo,
    required this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: colorText,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}

class ContenidoTraduccionNoticia extends StatelessWidget {
  final Color colorText;
  final String texto;
  const ContenidoTraduccionNoticia({
    super.key,
    required this.texto,
    required this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TraduccionIdiomaProvider>(
      builder: (context, traduccionIdiomaProvider, child) {
        final activadaTraduccion =
            traduccionIdiomaProvider.getTraduccionActivada;
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: (activadaTraduccion)
              ? TextNoticiaTraducidad(
                  text: texto,
                  colorText: colorText,
                )
              : TextNoticia(
                  text: texto,
                  colorText: colorText,
                ),
        );
      },
    );
  }
}

class FuenteNoticia extends StatelessWidget {
  final String fuente;
  const FuenteNoticia({
    super.key,
    required this.fuente,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, bottom: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          child: Text(
            URLhost(
              urlString: fuente,
            ),
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 0, 85),
              fontSize: 19,
            ),
          ),
          onTap: () => URLauncher(
            urlString: fuente,
          ),
        ),
      ),
    );
  }
}

class CicrulaProgresIndicator extends StatelessWidget {
  const CicrulaProgresIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer<ThemesTrajesProvider>(
      builder: (context, themesTrajesProvider, child) {
        final themeNow = themesTrajesProvider.getThemeTrajeObjeto;
        return Positioned(
          bottom: 40,
          left: size.width * 0.5 - 30,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              shape: BoxShape.circle,
            ),
            child: CircularProgressIndicator(color: themeNow.secundarioColor),
          ),
        );
      },
    );
  }
}

class FlechaCambioImagen extends StatelessWidget {
  final bool izquierdaDerecha;
  final Color colorFlecha;
  final List<PageController> listaControllers;
  final int index;

  const FlechaCambioImagen({
    super.key,
    required this.colorFlecha,
    required this.listaControllers,
    required this.index,
    required this.izquierdaDerecha,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        child: Icon(
          (izquierdaDerecha) ? Icons.arrow_forward : Icons.arrow_back,
          color: colorFlecha,
          size: 45,
        ),
        onTap: () {
          if (!izquierdaDerecha) {
            listaControllers[index].previousPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn);
          } else {
            listaControllers[index].nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn);
          }

          // print('Me precionaste');
        },
      ),
    );
  }
}
