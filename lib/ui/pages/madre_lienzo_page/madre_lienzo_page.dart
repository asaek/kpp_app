import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/common_widgets.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

class MadreLienzoPage extends StatelessWidget {
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
        body: Consumer<MadreLienzoProvider>(
          builder: (context, madreLienzoProvider, child) => Stack(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
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
        // body: (madreLienzoProvider.getPaginaSeleccionada == 0)
        //     ? Stack(
        //         children: [
        //           BlogNoticiasPage(),
        //           const TituloBanner(
        //             titulo: '   Blog Noticias',
        //           ),
        //         ],
        //       )
        //     : const TwitterPage(),
      ),
    );
  }
}
