import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kyari_app/ui/helpers/drawer_provider.dart';
import 'package:provider/provider.dart';

class Boton_menu extends StatefulWidget {
  @override
  State<Boton_menu> createState() => _Boton_menuState();
}

class _Boton_menuState extends State<Boton_menu>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widthMoveButon = MediaQuery.of(context).size.width * 0.63;

    return Consumer<DrawerProvider>(
      builder: (context, drawerProvider, child) {
        drawerProvider.setAnimationController = _animationController;

        return AnimatedBuilder(
          animation: drawerProvider.getAnimationController,
          builder: (context, _) {
            final valorAnimacion = drawerProvider.getIsOpenDrawer()
                ? Curves.elasticOut.transform(_animationController.value)
                : Curves.easeInCubic.transform(_animationController.value);

            final paddinAnimate = EdgeInsets.lerp(
                const EdgeInsets.only(right: 30),
                const EdgeInsets.only(right: 10),
                valorAnimacion);

            final interiorContainer =
                lerpDouble(0, 60, valorAnimacion)?.clamp(0, 60).toDouble();
            final tamanoContainer = lerpDouble(40, 70, valorAnimacion);

            final colorIcono =
                Color.lerp(Colors.white, Colors.pinkAccent, valorAnimacion);

            // final sombra = lerpDouble(0, 24, valorAnimacion);
            final iconoSize = lerpDouble(25, 34, valorAnimacion);
            final offsetX = lerpDouble(0, -widthMoveButon, valorAnimacion);

            final giroAngulo = lerpDouble(0, -pi, valorAnimacion) ?? 0.0;

            return Transform.translate(
              offset: Offset(offsetX!, 0),
              child: Padding(
                padding: paddinAnimate!,
                child: Material(
                  color: Colors.pinkAccent,
                  shape: const CircleBorder(),
                  // elevation: sombra!,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      print('Se Toco');
                      Scaffold.of(context).openEndDrawer();

                      _animationController.forward(from: 0);

                      // if (!drawerProvider.getIsOpenDrawer()) {
                      //   _animationController.forward(from: 0);
                      //   Scaffold.of(context).openEndDrawer();
                      // } else {
                      //   _animationController.reverse(from: 1);
                      //   Scaffold.of(context).closeEndDrawer();
                      //   // Navigator.pop(context);
                      // }
                      // drawerProvider.setIsOpenDrawer =
                      //     !drawerProvider.getIsOpenDrawer();
                    },
                    child: SizedBox(
                      // margin: paddinAnimate!,
                      width: tamanoContainer,
                      height: tamanoContainer,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: interiorContainer,
                            height: interiorContainer,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Transform.rotate(
                            angle: giroAngulo,
                            child: Icon(
                              Icons.menu,
                              color: colorIcono,
                              size: iconoSize,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
