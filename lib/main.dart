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
        ChangeNotifierProvider<ButtonDrawerProvider>(
            create: (_) => ButtonDrawerProvider()),
        // Provider<ImageBackgroundWee>(
        //   create: (context) => ImageBackgroundWee(),
        // )
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
      home: Noticias_Page(),
    );
  }
}
