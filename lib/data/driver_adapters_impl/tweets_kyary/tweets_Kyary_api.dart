// import 'package:kyari_app/data/models/tweets_kyary/modelo_tweet_Kyary.dart';
// import 'package:twitter_api_v2/twitter_api_v2.dart';

// import '../../../domain/drivers_adapters/drivers_adapters.dart';
// import '../../../domain/entities/entities.dart';

// class GetTweetsKyary implements TwitterTweetsApi {
//   // int periodoMeses = 1;
//   final List<TweetKyaryObjetoModel> _listaTweets = [];
//   final List<TweetKyaryObjetoModel> _listaTweetsEnviar = [];
//   static const int _cantidadTweetsXCarga = 10;
//   // static const int _cantidadMaximaTweets = 100;

//   int _maxResultadosTweets = 0;
//   int get getMaxResultadosTweets => _maxResultadosTweets;
//   set setMaxResultadosTweets(int dato) {
//     _maxResultadosTweets = dato;
//     // notifyListeners();
//   }

//   refrescadoReset() {
//     _maxResultadosTweets = 0;
//     _listaTweetsEnviar.clear();
//   }
//   // List<TweetKyaryObjeto> get getListaTweets => _listaTweets;
//   // set setlistaTweets(List<TweetKyaryObjeto> dato) {
//   //   _listaTweets = dato;
//   //   notifyListeners();
//   // }

//   final TwitterApi twitter = TwitterApi(
//     bearerToken:
//         'AAAAAAAAAAAAAAAAAAAAALmzSQEAAAAAia7vo9Y4vlOXpzLtUbLGw%2F4Lq1A%3D2wEoy2HcIkY5vH8bCw7pleTaeQpXV0SMpVjNslw8nFmvNBHVnc',

//     oauthTokens: const OAuthTokens(
//       consumerKey: 'xF87nlcl9oeK2Yjq6U1ALfNjC',
//       consumerSecret: 'H4h77SXOluwXbzyJUivOSlch6e4VLIISZwnlACBZq7lehRNyRt',
//       accessToken: '232285960-KiOIEznuUnFpI94v2eCLQz9ngDsZHu5hKfZ2bZTl',
//       accessTokenSecret: 'suzBTWyzY3VVuIP72xHSns19bO7k1KeyOWiE8C1NRzkTu',
//     ),

//     retryConfig: RetryConfig(
//       maxAttempts: 5,
//       onExecute: (event) => print(
//         'Retry after ${event.intervalInSeconds} seconds... '
//         '[${event.retryCount} times]',
//       ),
//     ),

//     //! The default timeout is 10 seconds.
//     timeout: const Duration(seconds: 20),
//   );
//   // ! future para obtener los tweets de kyary
//   @override
//   Future<List<TweetKyaryEntitie>> getTweetsKyary() async {
//     // print(_listaTweets);
//     // final TweetsKyaryMapper tweetsKyaryMapper = TweetsKyaryMapper();

//     // final tweets = await twitter.tweets.searchRecent(
//     //   query: 'from:pamyurin',
//     //   mediaFields: [
//     //     MediaField.mediaKey,
//     //     MediaField.url,
//     //   ],
//     //   expansions: [
//     //     TweetExpansion.attachmentsMediaKeys,
//     //     TweetExpansion.attachmentsPollIds,
//     //   ],
//     //   userFields: [
//     //     UserField.location,
//     //     UserField.username,
//     //     UserField.description,
//     //   ],
//     //   tweetFields: [
//     //     TweetField.text,
//     //     TweetField.attachments,
//     //     TweetField.entities,
//     //     TweetField.geo,
//     //   ],
//     //   maxResults: 100,
//     // );

//     // final fechaActual = DateTime.now();

//     // int cantidadAnteriorResultados = _listaTweets.length;
//     _maxResultadosTweets = _maxResultadosTweets + _cantidadTweetsXCarga;

//     _listaTweets.clear();
//     final tweets = await twitter.tweets.lookupTweets(
//       userId: '220332457',
//       maxResults: _maxResultadosTweets,

//       // startTime:
//       //     DateTime(fechaActual.year, fechaActual.month - periodoMeses, 1),
//       // endTime:
//       //     DateTime(fechaActual.year, fechaActual.month, fechaActual.day + 1),

//       mediaFields: [
//         MediaField.mediaKey,
//         MediaField.url,
//       ],
//       expansions: [
//         TweetExpansion.attachmentsMediaKeys,
//         TweetExpansion.attachmentsPollIds,
//       ],
//       userFields: [
//         UserField.location,
//         UserField.username,
//         UserField.description,
//       ],
//       tweetFields: [
//         TweetField.text,
//         TweetField.attachments,
//         TweetField.entities,
//         TweetField.geo,
//       ],

//       // paging: (event) {
//       //   // event.hasPreviousPage;
//       //   return PaginationControl.forward();
//       // },
//     );

//     final tweetsKyaryData = tweets.data;
//     TweetKyaryObjetoModel tweetAdd = TweetKyaryObjetoModel(
//       textoTweet: '',
//       tweetId: '',
//       imagenesId: [],
//     );

//     final List<MediaData> imagenesTweetsMedia = tweets.includes!.media!;

//     for (var tweet in tweetsKyaryData) {
//       tweetAdd.tweetId = tweet.id;
//       tweetAdd.textoTweet = procesadoTextoTweet(tweet.text);
//       tweetAdd.tweetURL = sacandoLaURLdelTweet(tweet.text);
//       // Cuando no trae foto
//       if (tweet.attachments == null) {
//         tweetAdd.imagenesTweet = [
//           'https://m.media-amazon.com/images/I/81yO1W6s7iL._AC_SL1500_.jpg'
//         ];
//         _listaTweets.add(tweetAdd);
//         // Cuando si trae foto
//       } else {
//         final List<String> imagenesTweet = [];
//         final List<String>? mediaKeysData = tweet.attachments?.mediaKeys;
//         // Creo que es cuando era un retweet
//         if (mediaKeysData!.length == 1) {
//           for (MediaData imagenInclude in imagenesTweetsMedia) {
//             if (mediaKeysData[0] == imagenInclude.key) {
//               imagenesTweet.add((imagenInclude.url == null)
//                   ? 'https://m.media-amazon.com/images/I/81yO1W6s7iL._AC_SL1500_.jpg'
//                   : redimencionamientoImagenJPG(imagenInclude.url!));
//               tweetAdd.imagenesId!.add(imagenInclude.key);
//             }
//           }
//           tweetAdd.imagenesTweet = List<String>.from(imagenesTweet);
//           // print(tweetAdd);
//           imagenesTweet.clear();
//           _listaTweets.add(tweetAdd);
//           // trae fotos normales y mass de 2
//         } else {
//           for (var mediaKeyData in mediaKeysData) {
//             for (var imageKeyMedia in imagenesTweetsMedia) {
//               if (mediaKeyData == imageKeyMedia.key) {
//                 imagenesTweet
//                     .add(redimencionamientoImagenJPG(imageKeyMedia.url!));
//                 tweetAdd.imagenesId!.add(imageKeyMedia.key);
//               }
//             }
//           }

//           tweetAdd.imagenesTweet = List<String>.from(imagenesTweet);
//           imagenesTweet.clear();
//           _listaTweets.add(tweetAdd);
//         }
//       }

//       tweetAdd = TweetKyaryObjetoModel(
//         textoTweet: '',
//         tweetId: '',
//         imagenesId: [],
//         fechaTweet: null,
//       );
//     }
//     // periodoMeses = periodoMeses + 1;
//     // TwitterSDKKyary instanciaTwitterSDKKyary = TwitterSDKKyary();
//     // instanciaTwitterSDKKyary.setPageControllerList =
//     //     List.generate(_listaTweets.length, (index) => PageController());
//     print(_listaTweets);

//     for (int i = 0; i < _maxResultadosTweets - _cantidadTweetsXCarga; i++) {
//       _listaTweets.removeAt(0);
//     }

//     _listaTweetsEnviar.addAll(_listaTweets);
//     print('Cantidad de Tweets:        ${_listaTweetsEnviar.length}');
//     // !  Nesecito retornar una lista  de TweetKyaryEntitie
//     return _listaTweetsEnviar;
//   }
// }

// // Quitando urls de los tweets text
// String procesadoTextoTweet(String texto) {
//   final pattern = RegExp(r' https?://\S+');
//   texto = texto.replaceAll(pattern, '');
//   return texto;
// }

// // String? sacandoLaURLdelTweet(String texto) {
// //   final pattern = RegExp(r'https?://\S+');
// //   final String? url = pattern.stringMatch(texto);
// //   return url;
// // }

// String? sacandoLaURLdelTweet(String texto) {
//   final inicio = texto.indexOf("https://");
//   if (inicio == -1) return null;
//   // final fin = texto.indexOf(" ", inicio);
//   final fin = texto.length;
//   texto = texto.substring(inicio, fin);
//   return texto;
// }

// //Quita .jpg y Agreega ?format=jpg&name=large a la URL de la imagen
// String redimencionamientoImagenJPG(String urlImagen) {
//   final pattern = RegExp(r'.jpg');
//   urlImagen = urlImagen.replaceAll(pattern, '?format=jpg&name=large');
//   return urlImagen;
// }

// // tweets_Kyary() async {
// //   final twitter = TwitterApi(
// //     bearerToken:
// //         'AAAAAAAAAAAAAAAAAAAAALmzSQEAAAAAbklyR2aDd%2BZr6XX6YToyG7rltJs%3D1SZ9qO7APcKBlGioeMLPDLa0zbtO2sxO6ASDkyZV8S2Hq3jCtW',

// //     oauthTokens: const OAuthTokens(
// //       consumerKey: 'jK7I5oz3Ydg6DuQyHEyyl7eD6',
// //       consumerSecret: 'BeG5Ywf5YgB9lgKzyonYT1YpjcQY0vbMCXYUqEm0SvaS9XeSwz',
// //       accessToken: 'GwPXrgz6tZ8mj1cieddHy4YPEnOauDksu3OohZugHwZmr',
// //       accessTokenSecret: '232285960-xhafiE6Y54rPFHxk0T7N7lCorvQ0vnIJ782oMpwm',
// //     ),

// //     retryConfig: RetryConfig(
// //       maxAttempts: 5,
// //       onExecute: (event) => print(
// //         'Retry after ${event.intervalInSeconds} seconds... '
// //         '[${event.retryCount} times]',
// //       ),
// //     ),

// //     //! The default timeout is 10 seconds.
// //     timeout: const Duration(seconds: 20),
// //   );
// //   try {
// //     // final me = await twitter.usersService.lookupMe();
// //     // final tweets = await twitter.tweets.searchAll(query: '@pamyurin');
// //     final tweets = await twitter.tweets.searchRecent(
// //       query: 'from:pamyurin',
// //       mediaFields: [
// //         MediaField.mediaKey,
// //         MediaField.url,
// //         MediaField.previewImageUrl,
// //         MediaField.altText,
// //       ],
// //       expansions: [
// //         TweetExpansion.attachmentsMediaKeys,
// //         TweetExpansion.attachmentsPollIds,
// //       ],
// //       // tweetFields: [
// //       //   TweetField.text,
// //       //   TweetField.attachments,
// //       // ],
// //       maxResults: 10,
// //     );

// //     print(tweets);
// //   } catch (e) {
// //     print(e);
// //   }
// // }
