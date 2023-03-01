import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/common_widgets.dart';
import 'package:kyari_app/ui/common/tokens/colores.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:kyari_app/ui/helpers/url_launcher.dart';
import 'package:kyari_app/ui/pages/twitter/widgets/Widgets_twitter.dart';
import 'package:provider/provider.dart';

class ListTweets extends StatefulWidget {
  const ListTweets({super.key});

  @override
  State<ListTweets> createState() => _ListTweetsState();
}

class _ListTweetsState extends State<ListTweets> {
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    print('Kyary que esta pasando');

    _scrollController.addListener(() {
      // print('Posicion Pixeles: ${_scrollController.position.pixels}');
      // print(_scrollController.position.maxScrollExtent);
      if (_scrollController.position.pixels + 500 >=
          _scrollController.position.maxScrollExtent) {
        cargandoDatos();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future cargandoDatos() async {
    if (isLoading) return;
    Provider.of<TwitterSDKKyary>(context, listen: false).setLoadingMoreTweets =
        true;

    await Future.delayed(const Duration(seconds: 2));

    print('Posicion Pixeles: ${_scrollController.position.pixels}');
    if (_scrollController.position.pixels + 100 <=
        _scrollController.position.maxScrollExtent) return;
    Provider.of<TwitterSDKKyary>(context, listen: false).setLoadingMoreTweets =
        false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<TwitterSDKKyary>(
      builder: (context, twitterSDKKyary, child) => Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            itemCount: twitterSDKKyary.getTweetsKyary?.length ?? 0,
            scrollDirection: Axis.vertical,
            physics: (twitterSDKKyary.getListViewSeMueve)
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final edgesImage = BorderRadius.circular(25);

              return Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                child: Column(
                  children: [
                    (index == 0)
                        ? const SizedBox(height: 60)
                        : const SizedBox(),
                    Consumer<ThemesTrajesProvider>(
                      builder: (context, themesTrajesProvider, child) {
                        final colorTheme =
                            themesTrajesProvider.getThemeTrajeObjeto;

                        return Column(
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                PageViewZOOMTweets(
                                  index: index,
                                ),
                                Row(
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
                                        child: const Icon(
                                          Icons.arrow_back,
                                          color: Color_All_Interface_X,
                                          size: 45,
                                        ),
                                        onTap: () {
                                          final listaControllers =
                                              twitterSDKKyary
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
                                        child: const Icon(
                                          Icons.arrow_forward,
                                          color: Color_All_Interface_X,
                                          size: 45,
                                        ),
                                        onTap: () {
                                          final listaControllers =
                                              twitterSDKKyary
                                                  .getPageControllerList;

                                          // print(
                                          //     'Pagina actual del controller $index --- ${listaControllers[index].page}');

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
                              ],
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
                                          text: twitterSDKKyary
                                              .getTweetsKyary![index]
                                              .textoTweet,
                                        )
                                      : TextNoticia(
                                          text: twitterSDKKyary
                                              .getTweetsKyary![index]
                                              .textoTweet,
                                        ),
                                );
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 25, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  (twitterSDKKyary.getTweetsKyary![index]
                                              .tweetURL ==
                                          null)
                                      ? const Text(
                                          'Sin URL',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 252, 198, 216),
                                            fontSize: 19,
                                          ),
                                        )
                                      : GestureDetector(
                                          child: Text(
                                            URLhost(
                                              urlString: twitterSDKKyary
                                                  .getTweetsKyary![index]
                                                  .tweetURL!,
                                            ),
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 0, 85),
                                              fontSize: 19,
                                            ),
                                          ),
                                          onTap: () => URLauncher(
                                            urlString: twitterSDKKyary
                                                .getTweetsKyary![index]
                                                .tweetURL!,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          if (Provider.of<TwitterSDKKyary>(context, listen: true)
              .getLoadingMoreTweets)
            Positioned(
              bottom: 40,
              left: size.width * 0.5 - 30,
              child: const _LoadingIcon(),
            )
        ],
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        child: const CircularProgressIndicator(color: Colors.amberAccent));
  }
}
