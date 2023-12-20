import 'package:flutter/material.dart';
import 'package:google_translator/google_translator.dart';
import 'package:kyari_app/config/go_router/go_router.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

//! que mierdas hace esto aqui sacarlo con el paquete  de  flutter_dotenv
const String apiKey = "AIzaSyAR_UcgIsG3VLzybZSf7bW1fSaAzBs_HqE";

void main() {
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
        ChangeNotifierProvider<NoticiasProvider>(
            create: (_) => NoticiasProvider()),
        ChangeNotifierProvider<ButtonDrawerProvider>(
            create: (_) => ButtonDrawerProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GoogleTranslatorInit(
      apiKey,
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
