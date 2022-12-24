import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/common_widgets.dart';

class Noticias_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MenuDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Boton_menu(),
            ],
          ),
        ],
      ),
      // drawer: MenuDrawer(),
    );
  }
}
