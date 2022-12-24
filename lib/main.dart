import 'package:flutter/material.dart';
import 'package:kyari_app/ui/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Noticias_Page(),
    );
  }
}
