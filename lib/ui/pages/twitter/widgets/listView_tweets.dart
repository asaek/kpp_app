import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/common_widgets.dart';
import 'package:kyari_app/ui/common/tokens/colores.dart';
import 'package:kyari_app/ui/common/tokens/tiempo_animations.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:kyari_app/ui/helpers/url_launcher.dart';
import 'package:kyari_app/ui/pages/twitter/widgets/Widgets_twitter.dart';
import 'package:provider/provider.dart';

class ListTweets extends StatelessWidget {
  const ListTweets({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TwitterSDKKyary>(
      builder: (context, twitterSDKKyary, child) => ListView.builder(
        itemCount: twitterSDKKyary.getTweetsKyary?.length ?? 0,
        scrollDirection: Axis.vertical,
        physics: (twitterSDKKyary.getListViewSeMueve)
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final edgesImage = BorderRadius.circular(25);

          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Column(
              children: [
                (index == 0) ? const SizedBox(height: 60) : const SizedBox(),
                Consumer<ThemesTrajesProvider>(
                  builder: (context, themesTrajesProvider, child) {
                    final colorTheme = themesTrajesProvider.getThemeTrajeObjeto;

                    return TweenAnimationBuilder(
                      duration:
                          const Duration(milliseconds: tiempoPrincipalColor),
                      tween: ColorTween(
                        begin: colorTheme.secundarioColor,
                        end: colorTheme.secundarioColor,
                      ),
                      builder: (context, color, child) => Material(
                        color: color,
                        borderRadius: edgesImage,
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
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
                                          print(
                                              'Pagina actual del controller $index --- ${listaControllers[index].page}');

                                          listaControllers[index].previousPage(
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              curve: Curves.easeIn);

                                          print('Me precionaste');
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

                                          print(
                                              'Pagina actual del controller $index --- ${listaControllers[index].page}');
                                          listaControllers[index].nextPage(
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              curve: Curves.easeIn);
                                          print('Me precionaste');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // Text(
                            //   twitterSDKKyary.getTweetsKyary[index].titulo,
                            //   style:
                            //       const TextStyle(color: Colors.white, fontSize: 25),
                            // ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              child: TextNoticia(
                                text: twitterSDKKyary
                                    .getTweetsKyary![index].textoTweet,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 25, bottom: 20),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: (twitterSDKKyary
                                            .getTweetsKyary![index].tweetURL ==
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
                                            color:
                                                Color.fromARGB(255, 255, 0, 85),
                                            fontSize: 19,
                                          ),
                                        ),
                                        onTap: () => URLauncher(
                                          urlString: twitterSDKKyary
                                              .getTweetsKyary![index].tweetURL!,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
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
