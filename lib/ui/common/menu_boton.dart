import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Boton_menu extends StatefulWidget {
  @override
  State<Boton_menu> createState() => _Boton_menuState();
}

class _Boton_menuState extends State<Boton_menu>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final bool _estadoAnimacion = false;

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
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        final valorAnimacion = _estadoAnimacion
            ? Curves.elasticIn.transform(_animationController.value)
            : Curves.elasticOut.transform(_animationController.value);

        print(valorAnimacion);

        final paddinAnimate = EdgeInsets.lerp(
            const EdgeInsets.only(right: 30, bottom: 30),
            const EdgeInsets.only(right: 15, bottom: 15),
            valorAnimacion);

        final interiorContainer = lerpDouble(0, 60, valorAnimacion);
        final tamanoContainer = lerpDouble(40, 70, valorAnimacion);

        final colorIcono =
            Color.lerp(Colors.white, Colors.pinkAccent, valorAnimacion);

        // final sombra = lerpDouble(0, 24, valorAnimacion);
        final iconoSize = lerpDouble(25, 34, valorAnimacion);

        final giroAngulo = lerpDouble(0, -pi, valorAnimacion) ?? 0.0;

        return Padding(
          padding: paddinAnimate!,
          child: Material(
            color: Colors.pinkAccent,
            shape: const CircleBorder(),
            // elevation: sombra!,
            child: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTapDown: (details) {
                print('Se Toco');
                _animationController.forward(from: 0);

                // Scaffold.of(context).openEndDrawer();
              },
              onTapUp: (details) {
                print('Se Solto');
                _animationController.reverse();
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
        );
      },
    );
  }
}
