import 'package:flutter/material.dart';
import 'package:google_translator/google_translator.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:kyari_app/ui/pages/pages.dart';
import 'package:provider/provider.dart';

const String apiKey = "AIzaSyAR_UcgIsG3VLzybZSf7bW1fSaAzBs_HqE";

void main() {
  return runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DrawerProvider>(create: (_) => DrawerProvider()),
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
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
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
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MadreLienzoPage(),
      ),
    );
  }
}
