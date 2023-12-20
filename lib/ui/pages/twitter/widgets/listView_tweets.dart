// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:kyari_app/ui/common/common_widgets.dart';
// import 'package:kyari_app/ui/common/tokens/colores.dart';
// import 'package:kyari_app/ui/helpers/helpers.dart';
// import 'package:kyari_app/ui/helpers/url_launcher.dart';
// import 'package:kyari_app/ui/pages/twitter/widgets/Widgets_twitter.dart';
// import 'package:provider/provider.dart';

// class ListTweets extends StatefulWidget {
//   const ListTweets({super.key});

//   @override
//   State<ListTweets> createState() => _ListTweetsState();
// }

// class _ListTweetsState extends State<ListTweets> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     print('Kyary que esta pasando');

//     _scrollController.addListener(() {
//       // print('Posicion Pixeles: ${_scrollController.position.pixels}');
//       // print(_scrollController.position.maxScrollExtent);

//       if (_scrollController.position.pixels + 200 >=
//           _scrollController.position.maxScrollExtent) {
//         cargandoDatosTwitter();
//       } else {
//         Provider.of<ControlListViewProvider>(context, listen: false)
//             .setLoadingMoreTweets = false;
//       }
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _scrollController.removeListener(() {});
//     _scrollController.dispose();
//   }

//   Future cargandoDatosTwitter() async {
//     bool isLoading =
//         Provider.of<ControlListViewProvider>(context, listen: false)
//             .getLoadingMoreTweets;

//     if (isLoading) return;
//     Provider.of<ControlListViewProvider>(context, listen: false)
//         .setLoadingMoreTweets = true;
//     final cantidadResultados =
//         Provider.of<TweetsKyaryApi>(context, listen: false)
//             .getMaxResultadosTweets;

//     if (cantidadResultados < 100) {
//       final twweets30Cargados =
//           await Provider.of<TweetsKyaryApi>(context, listen: false)
//               .getTweetsKyary();

//       Provider.of<TwitterSDKKyary>(context, listen: false)
//           .setPageControllerList = twweets30Cargados.length;

//       Provider.of<TwitterSDKKyary>(context, listen: false)
//           .setCantidadSlotsPageView = twweets30Cargados.length;

//       Provider.of<TwitterSDKKyary>(context, listen: false)
//           .agregandoTweetsKyary(twweets30Cargados);

//       if (_scrollController.position.pixels + 100 <=
//           _scrollController.position.maxScrollExtent) return;

//       _scrollController.animateTo(
//         _scrollController.position.pixels + 200,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.fastOutSlowIn,
//       );
//     } else {
//       final themeNow = Provider.of<ThemesTrajesProvider>(context, listen: false)
//           .getThemeTrajeObjeto;

//       Fluttertoast.showToast(
//         msg: 'Maximo 100 Tweets Por ahora',
//         toastLength: Toast.LENGTH_SHORT,
//         timeInSecForIosWeb: 1,
//         backgroundColor: themeNow.secundarioColor,
//         textColor: themeNow.textColor,
//         fontSize: 22.0,
//       );
//     }

//     // await Future.delayed(const Duration(seconds: 5));

//     print('MOVIMIENTO');

//     // isLoading = false;
//     Provider.of<ControlListViewProvider>(context, listen: false)
//         .setLoadingMoreTweets = false;
//   }

//   Future refrescarTweets() async {
//     // final cantidadResultados =
//     //     Provider.of<TweetsKyaryApi>(context, listen: false)
//     //         .getMaxResultadosTweets;

//     //  El numero 10 es referente a la variable de cantidad de carga de tweets _cantidadTweetsXCarga
//     //  Del provider
//     Provider.of<TweetsKyaryApi>(context, listen: false).refrescadoReset();

//     final twweets30Cargados =
//         await Provider.of<TweetsKyaryApi>(context, listen: false)
//             .getTweetsKyary();

//     Provider.of<TwitterSDKKyary>(context, listen: false).setPageControllerList =
//         twweets30Cargados.length;

//     Provider.of<TwitterSDKKyary>(context, listen: false)
//         .setCantidadSlotsPageView = twweets30Cargados.length;

//     Provider.of<TwitterSDKKyary>(context, listen: false).setTweetsKyary =
//         twweets30Cargados;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Stack(
//       children: [
//         Consumer<ControlListViewProvider>(
//           builder: (context, controlListViewProvider, child) =>
//               Consumer<TwitterSDKKyary>(
//             builder: (context, twitterSDKKyary, child) => RefreshIndicator(
//               onRefresh: refrescarTweets,
//               color: Provider.of<ThemesTrajesProvider>(context, listen: true)
//                   .getThemeTrajeObjeto
//                   .secundarioColor,
//               displacement: 100,
//               child: ListView.builder(
//                 controller: _scrollController,
//                 itemCount: twitterSDKKyary.getTweetsKyary?.length ?? 0,
//                 scrollDirection: Axis.vertical,
//                 physics: (controlListViewProvider.getListViewSeMueve)
//                     ? const BouncingScrollPhysics()
//                     : const NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   final edgesImage = BorderRadius.circular(25);

//                   return Padding(
//                     padding:
//                         const EdgeInsets.only(bottom: 15, left: 10, right: 10),
//                     child: Column(
//                       children: [
//                         (index == 0)
//                             ? const SizedBox(height: 60)
//                             : const SizedBox(),
//                         Consumer<ThemesTrajesProvider>(
//                           builder: (context, themesTrajesProvider, child) {
//                             final colorTheme =
//                                 themesTrajesProvider.getThemeTrajeObjeto;

//                             return Column(
//                               children: [
//                                 Stack(
//                                   alignment: AlignmentDirectional.center,
//                                   children: [
//                                     PageViewZOOMTweets(
//                                       index: index,
//                                       // getTweetsKyary:
//                                       //     twitterSDKKyary.getTweetsKyary!,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Material(
//                                           elevation: 0,
//                                           color: Colors.transparent,
//                                           shape: const CircleBorder(),
//                                           child: InkWell(
//                                             borderRadius:
//                                                 BorderRadius.circular(100),
//                                             child: const Icon(
//                                               Icons.arrow_back,
//                                               color: Color_All_Interface_X,
//                                               size: 45,
//                                             ),
//                                             onTap: () {
//                                               final listaControllers =
//                                                   twitterSDKKyary
//                                                       .getPageControllerList;
//                                               // print(
//                                               //     'Pagina actual del controller $index --- ${listaControllers[index].page}');

//                                               listaControllers[index]
//                                                   .previousPage(
//                                                 duration: const Duration(
//                                                     milliseconds: 200),
//                                                 curve: Curves.easeIn,
//                                               );
//                                               // print('Me precionaste');
//                                             },
//                                           ),
//                                         ),
//                                         Material(
//                                           elevation: 0,
//                                           color: Colors.transparent,
//                                           shape: const CircleBorder(),
//                                           child: InkWell(
//                                             borderRadius:
//                                                 BorderRadius.circular(100),
//                                             child: const Icon(
//                                               Icons.arrow_forward,
//                                               color: Color_All_Interface_X,
//                                               size: 45,
//                                             ),
//                                             onTap: () {
//                                               final listaControllers =
//                                                   twitterSDKKyary
//                                                       .getPageControllerList;

//                                               // print(
//                                               //     'Pagina actual del controller $index --- ${listaControllers[index].page}');

//                                               // listaControllers[index].nextPage(
//                                               //   duration: const Duration(
//                                               //       milliseconds: 200),
//                                               //   curve: Curves.easeIn,
//                                               // );
//                                               if (_scrollController
//                                                   .hasClients) {
//                                                 listaControllers[index]
//                                                     .nextPage(
//                                                   duration: const Duration(
//                                                       milliseconds: 200),
//                                                   curve: Curves.easeIn,
//                                                 );
//                                               }
//                                               // listaControllers[index].animateToPage(
//                                               //   1,
//                                               //   duration: const Duration(
//                                               //       milliseconds: 300),
//                                               //   curve: Curves.easeIn,
//                                               // );
//                                               // print('Me precionaste');
//                                             },
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 Consumer<TraduccionIdiomaProvider>(
//                                   builder: (context, traduccionIdiomaProvider,
//                                       child) {
//                                     final activadaTraduccion =
//                                         traduccionIdiomaProvider
//                                             .getTraduccionActivada;
//                                     return Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 10,
//                                         vertical: 10,
//                                       ),
//                                       child: (activadaTraduccion)
//                                           ? TextNoticiaTraducidad(
//                                               text: twitterSDKKyary
//                                                   .getTweetsKyary![index]
//                                                   .textoTweet,
//                                             )
//                                           : TextNoticia(
//                                               text: twitterSDKKyary
//                                                   .getTweetsKyary![index]
//                                                   .textoTweet,
//                                             ),
//                                     );
//                                   },
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       right: 25, bottom: 20),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       (twitterSDKKyary.getTweetsKyary![index]
//                                                   .tweetURL ==
//                                               null)
//                                           ? const Text(
//                                               'Sin URL',
//                                               style: TextStyle(
//                                                 color: Color.fromARGB(
//                                                     255, 252, 198, 216),
//                                                 fontSize: 19,
//                                               ),
//                                             )
//                                           : GestureDetector(
//                                               child: Text(
//                                                 URLhost(
//                                                   urlString: twitterSDKKyary
//                                                       .getTweetsKyary![index]
//                                                       .tweetURL!,
//                                                 ),
//                                                 style: const TextStyle(
//                                                   color: Color.fromARGB(
//                                                       255, 255, 0, 85),
//                                                   fontSize: 19,
//                                                 ),
//                                               ),
//                                               onTap: () => URLauncher(
//                                                 urlString: twitterSDKKyary
//                                                     .getTweetsKyary![index]
//                                                     .tweetURL!,
//                                               ),
//                                             ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ),
//         if (Provider.of<ControlListViewProvider>(context, listen: true)
//             .getLoadingMoreTweets)
//           Consumer<ThemesTrajesProvider>(
//             builder: (context, themesTrajesProvider, child) {
//               final themeNow = themesTrajesProvider.getThemeTrajeObjeto;
//               return Positioned(
//                 bottom: 40,
//                 left: size.width * 0.5 - 30,
//                 child: Container(
//                   padding: const EdgeInsets.all(10),
//                   height: 60,
//                   width: 60,
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.9),
//                     shape: BoxShape.circle,
//                   ),
//                   child: CircularProgressIndicator(
//                       color: themeNow.secundarioColor),
//                 ),
//               );
//             },
//           ),
//       ],
//     );
//   }
// }
