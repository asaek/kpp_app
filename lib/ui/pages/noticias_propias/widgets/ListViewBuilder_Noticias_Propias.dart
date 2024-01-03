import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/common_widgets.dart';
import 'package:kyari_app/ui/common/tokens/tiempo_animations.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:kyari_app/ui/helpers/url_launcher.dart';
import 'package:kyari_app/ui/pages/noticias_propias/widgets/widgets_noticias_page.dart';
import 'package:provider/provider.dart';

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
      print('maxScrollExtend:  ${_scrollController.position.maxScrollExtent} ');
      print('Pixeles:  ${_scrollController.position.pixels} ');

      // Para cargar mas elementos
      if (_scrollController.position.pixels + 200 >=
          _scrollController.position.maxScrollExtent) {
        cargandoDatosBlog();
      } else {
        Provider.of<ControlListViewProvider>(context, listen: false)
            .setLoadingMoreTweets = false;
      }

      print(_scrollController.position.pixels);
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    _scrollController.dispose();

    super.dispose();
  }

  Future cargandoDatosBlog() async {
    bool isLoading =
        Provider.of<ControlListViewProvider>(context, listen: false)
            .getLoadingMoreTweets;

    if (isLoading) return;
    Provider.of<ControlListViewProvider>(context, listen: false)
        .setLoadingMoreTweets = true;

    await Future.delayed(const Duration(milliseconds: 800));

    if (_scrollController.position.pixels + 100 <=
        _scrollController.position.maxScrollExtent) return;

    _scrollController.animateTo(
      _scrollController.position.pixels + 200,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );

    // final themeNow = Provider.of<ThemesTrajesProvider>(context, listen: false)
    //     .getThemeTrajeObjeto;

    // Fluttertoast.showToast(
    //   msg: 'Maximo 100 Tweets Por ahora',
    //   toastLength: Toast.LENGTH_SHORT,
    //   timeInSecForIosWeb: 1,
    //   backgroundColor: themeNow.secundarioColor,
    //   textColor: themeNow.textColor,
    //   fontSize: 22.0,
    // );

    Provider.of<ControlListViewProvider>(context, listen: false)
        .setLoadingMoreTweets = false;
  }

  Future refrescarBlog() async {
    await Future.delayed(const Duration(milliseconds: 1500));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Consumer<NoticiasPropiasProvider>(
          builder: (context, noticiasProvider, child) => RefreshIndicator(
            onRefresh: refrescarBlog,
            color: Provider.of<ThemesTrajesProvider>(context, listen: true)
                .getThemeTrajeObjeto
                .secundarioColor,
            displacement: 100,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: noticiasProvider.getNoticiasCargadas!.length,
              scrollDirection: Axis.vertical,
              physics: (noticiasProvider.getListViewSeMueve)
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: Column(
                    children: [
                      (index == 0)
                          ? const SizedBox(height: 60)
                          : const SizedBox(),
                      Consumer<ThemesTrajesProvider>(
                        builder: (context, themesTrajesProvider, child) {
                          final colorTheme =
                              themesTrajesProvider.getThemeTrajeObjeto;

                          return TweenAnimationBuilder(
                            duration: const Duration(
                                milliseconds: tiempoSecundarioColor),
                            tween: ColorTween(
                              begin: colorTheme.secundarioColor,
                              end: colorTheme.secundarioColor,
                            ),
                            builder: (context, colorSecundario, child) =>
                                Column(
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

                                                listaControllers[index]
                                                    .previousPage(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    200),
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
                                                listaControllers[index]
                                                    .nextPage(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    200),
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
                                  noticiasProvider
                                      .getNoticiasCargadas![index].titulo,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 90, 90, 90),
                                    fontSize: 30,
                                  ),
                                ),
                                Consumer<TraduccionIdiomaProvider>(
                                  builder: (context, traduccionIdiomaProvider,
                                      child) {
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
                                                  .getNoticiasCargadas![index]
                                                  .texto,
                                            )
                                          : TextNoticia(
                                              text: noticiasProvider
                                                  .getNoticiasCargadas![index]
                                                  .texto,
                                            ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 25, bottom: 20),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                      child: Text(
                                        URLhost(
                                          urlString: noticiasProvider
                                              .getNoticiasCargadas![index]
                                              .fuente,
                                        ),
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 255, 0, 85),
                                          fontSize: 19,
                                        ),
                                      ),
                                      onTap: () => URLauncher(
                                          urlString: noticiasProvider
                                              .getNoticiasCargadas![index]
                                              .fuente),
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
          ),
        ),
        if (Provider.of<ControlListViewProvider>(context, listen: true)
            .getLoadingMoreTweets)
          Consumer<ThemesTrajesProvider>(
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
                  child: CircularProgressIndicator(
                      color: themeNow.secundarioColor),
                ),
              );
            },
          ),
      ],
    );
  }
}
