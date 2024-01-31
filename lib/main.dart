import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_translator/google_translator.dart';
import 'package:kyari_app/config/go_router/go_router.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

import 'data/driver_adapters_impl/firebase_noticias_propias_impl/noticias_propias_api_impl.dart';
import 'data/driver_adapters_impl/tweets_kyary/tweets_Kyary_api.dart';
import 'data/repositories/firebase_noticias_repo_impl/firebase_noticias_repo_impl.dart';
import 'data/repositories/tweets_kyary_repo_impl/tweets_kyary_repo_impl.dart';
import 'ui/helpers/commons_providers/commons_providers.dart';
import 'ui/helpers/madre_lienzo_page/madre_lienzo_page.dart';

Future<void> main() async {
  await dotenv.load(
    fileName: ".env",
  );

  return runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //! Inyeccion de dependencias
        Provider<FirebaseNoticiasRepoImpl>(create: (_) {
          return FirebaseNoticiasRepoImpl(NoticiaPropiaDriverAdapterImpl());
        }),

        //! Este Provider depende de la injeccion de FirebaseNoticiasRepoImpl para obtener la instancia del repo
        ChangeNotifierProvider<NoticiasPropiasProvider>(
          create: (context) =>
              NoticiasPropiasProvider(context.read<FirebaseNoticiasRepoImpl>()),
        ),

        // //! Inyeccion de dependencias
        Provider<TweetsKyaryRepoImpl>(
          create: (context) {
            return TweetsKyaryRepoImpl(TwitterTweetsDriverAdapterImpl());
          },
        ),

        // //! Este Provider depende de la injeccion de FirebaseNoticiasRepoImpl para obtener la instancia del repo
        ChangeNotifierProvider<TwitterKyaryProvider>(
          create: (context) =>
              TwitterKyaryProvider(context.read<TweetsKyaryRepoImpl>()),
        ),

        ChangeNotifierProvider<MadreLienzoPageProviders>(
            create: (_) => MadreLienzoPageProviders()),

        // * Providers viejos
        ChangeNotifierProvider<DrawerProvider>(create: (_) => DrawerProvider()),
        ChangeNotifierProvider<ControlListViewProvider>(
            create: (_) => ControlListViewProvider()),
        ChangeNotifierProvider<TraduccionIdiomaProvider>(
            create: (_) => TraduccionIdiomaProvider()),
        ChangeNotifierProvider<ThemesTrajesProvider>(
            create: (_) => ThemesTrajesProvider()),

        ChangeNotifierProvider<MadreLienzoProvider>(
            create: (_) => MadreLienzoProvider()),
        // ChangeNotifierProvider<BlogPropioProvider>(
        //     create: (_) => BlogPropioProvider()),
        ChangeNotifierProvider<ButtonDrawerProvider>(
            create: (_) => ButtonDrawerProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final String googleTranslate = dotenv.env['API_KEY_GOOGLE_TRANSLATE']!;
  @override
  Widget build(BuildContext context) {
    return GoogleTranslatorInit(
      googleTranslate,
      translateFrom: const Locale('ja'),
      translateTo: const Locale('es'),
      automaticDetection: true,
      cacheDuration: const Duration(days: 2),

      // automaticDetection: , In case you don't know the user language will want to traslate,
      // cacheDuration: Duration(days: 13), The duration of the cache translation.
      builder: () => MaterialApp.router(
        title: 'Kyari App',
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
