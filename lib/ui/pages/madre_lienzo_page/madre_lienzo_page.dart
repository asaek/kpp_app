import 'package:flutter/material.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

import 'widgets/widgets.dart';

class MadreLienzoPage extends StatelessWidget {
  static const routerName = '/Madre_Lienzo_Page';

  const MadreLienzoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerProvider>(
      builder: (context, drawerProvider, child) => Scaffold(
        endDrawer: const MenuDrawer(),
        floatingActionButton: const BotonMenu(),
        drawerScrimColor: Colors.transparent,
        onEndDrawerChanged: (isOpened) {
          drawerProvider.setIsOpenDrawer = isOpened;
          if (isOpened) {
            drawerProvider.getAnimationController.forward(from: 0);
          } else {
            drawerProvider.getAnimationController.reverse(from: 1);
          }
        },
        body: Consumer<MadreLienzoProvider>(
          builder: (context, madreLienzoProvider, child) => Stack(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: child,
                ),
                child: madreLienzoProvider.getPaginaActual,
              ),
              TituloBanner(
                titulo: madreLienzoProvider.getNOmbrePagActual,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
