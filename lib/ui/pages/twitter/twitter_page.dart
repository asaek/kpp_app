import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/common_widgets.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

class TwitterPage extends StatelessWidget {
  const TwitterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerProvider>(
      builder: (context, drawerProvider, child) => Scaffold(
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
        body: const Center(
          child: Text(
            'Hola Mundo',
          ),
        ),
      ),
    );
  }
}
