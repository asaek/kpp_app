import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_translator/google_translator.dart';
import 'package:kyari_app/config/go_router/go_router.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider<DrawerProvider>(create: (_) => DrawerProvider()),
        // ChangeNotifierProvider<TwitterTweetsApi>(
        //     create: (_) => TwitterTweetsApi()),
        // ChangeNotifierProvider<NoticiaPropiaApi>(
        //     create: (_) => NoticiaPropiaApi()),
        ChangeNotifierProvider<ControlListViewProvider>(
            create: (_) => ControlListViewProvider()),
        ChangeNotifierProvider<TraduccionIdiomaProvider>(
            create: (_) => TraduccionIdiomaProvider()),
        ChangeNotifierProvider<ThemesTrajesProvider>(
            create: (_) => ThemesTrajesProvider()),
        ChangeNotifierProvider<TwitterSDKKyary>(
            create: (_) => TwitterSDKKyary()),
        ChangeNotifierProvider<MadreLienzoProvider>(
            create: (_) => MadreLienzoProvider()),
        ChangeNotifierProvider<BlogPropioProvider>(
            create: (_) => BlogPropioProvider()),
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
