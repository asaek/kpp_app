import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/atoms/border_radius.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

import '../../../data/models/models.dart';
import '../../common/tokens/tiempo_animations.dart';
import '../../helpers/commons_providers/commons_providers.dart';
import 'widgets/widgets.dart';

class MadreLienzoPage extends StatelessWidget {
  static const routerName = '/Madre_Lienzo_Page';

  const MadreLienzoPage({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeTrajeObjeto trajeSeleccionado =
        Provider.of<ThemesTrajesProvider>(context, listen: false)
            .getThemeTrajeObjeto;
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
        body: AnimatedContainer(
          duration: const Duration(milliseconds: tiempoSecundarioColor),
          color: Provider.of<ThemesTrajesProvider>(context, listen: true)
              .getThemeTrajeObjeto
              .principalColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<MadreLienzoProvider>(
              builder: (context, madreLienzoProvider, child) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TituloBanner(
                    titulo: madreLienzoProvider.getNOmbrePagActual,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 5),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        trajeSeleccionado.nombreTraje,
                        style: TextStyle(
                          fontSize: 20,
                          color: trajeSeleccionado.terceroColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder: (child, animation) => FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                      child: ClipRRect(
                        borderRadius: borderRadiusList,
                        child: AnimatedContainer(
                          duration: const Duration(
                              milliseconds: tiempoSecundarioColor),
                          color: Provider.of<ThemesTrajesProvider>(context,
                                  listen: true)
                              .getThemeTrajeObjeto
                              .secundarioColor,
                          child: madreLienzoProvider.getPaginaActual,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
