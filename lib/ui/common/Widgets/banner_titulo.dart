import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kyari_app/ui/common/atoms/themes_trajes.dart';
import 'package:kyari_app/ui/common/tokens/tiempo_animations.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

class TituloBanner extends StatelessWidget {
  final String titulo;

  const TituloBanner({super.key, required this.titulo});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Consumer<ThemesTrajesProvider>(
          builder: (context, themesTrajesProvider, child) {
            final colorTheme = themesTrajesProvider.getThemeTrajeObjeto;
            return TweenAnimationBuilder(
              duration: const Duration(milliseconds: tiempoPrincipalColor),
              tween: ColorTween(
                begin: colorTheme.principalColor,
                end: colorTheme.principalColor,
              ),
              builder: (context, value, _) => Material(
                color: value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      titulo,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                          top: 7,
                          bottom: 7,
                        ),
                        child: Image.asset('assets/btn_aleatorio.png'),
                      ),
                      onTap: () {
                        final Random cosaRandom = Random();
                        final itemSeleccionad =
                            themesTraje[cosaRandom.nextInt(themesTraje.length)];
                        // showToast(context, itemSeleccionad.nombreTraje);

                        Fluttertoast.showToast(
                          msg: itemSeleccionad.nombreTraje,
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIosWeb: 1,
                          backgroundColor: itemSeleccionad.principalColor,
                          textColor: itemSeleccionad.textColor,
                          fontSize: 22.0,
                        );

                        Provider.of<ThemesTrajesProvider>(context,
                                listen: false)
                            .setThemeTrajeObjeto = itemSeleccionad;
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// void showToast(BuildContext context, String message) {
//   OverlayState? overlayState = Overlay.of(context);
//   OverlayEntry overlayEntry = OverlayEntry(
//     builder: (context) => Positioned(
//       bottom: 50,
//       left: 0,
//       right: 0,
//       child: Container(
//         alignment: Alignment.center,
//         color: Colors.black54,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 24.0,
//             vertical: 12.0,
//           ),
//           child: Text(
//             message,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 16.0,
//               decoration: null,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
//   overlayState?.insert(overlayEntry);
//   Future.delayed(const Duration(seconds: 1), () {
//     overlayEntry.remove();
//   });
// }
