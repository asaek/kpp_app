import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/common_widgets.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

class Noticias_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<DrawerProvider>(
      builder: (context, drawerProvider, _) => Scaffold(
        endDrawer: MenuDrawer(),
        floatingActionButton: Boton_menu(),
        drawerScrimColor: Colors.transparent,
        onEndDrawerChanged: (isOpened) {
          drawerProvider.setIsOpenDrawer = isOpened;
          if (isOpened) {
            drawerProvider.getAnimationController.forward(from: 0);
          } else {
            drawerProvider.getAnimationController.reverse(from: 1);
          }
        },
        body: Stack(
          children: [
            MiddleScreen(),
            TituloBanner(),
          ],
        ),
        // drawer: MenuDrawer(),
      ),
    );
  }
}
