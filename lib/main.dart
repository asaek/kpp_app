import 'package:flutter/material.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:kyari_app/ui/pages/pages.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DrawerProvider>(create: (_) => DrawerProvider()),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MadreLienzoPage(),
      // initialRoute: '/Noticias_Propias',
      // routes: _routes,
    );
  }
}

final _routes = {
  '/Noticias_Propias': (context) => Noticias_Page(),
  '/Twitter': (context) => const TwitterPage(),
  '/Construccion': (context) => Noticias_Page(),
};
