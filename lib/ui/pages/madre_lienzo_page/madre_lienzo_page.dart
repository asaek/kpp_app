import 'package:flutter/material.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

class MadreLienzoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MadreLienzoProvider>(
      builder: (context, madreLienzoProvider, child) => Scaffold(
        body: madreLienzoProvider.getPaginaActual,
      ),
    );
  }
}
