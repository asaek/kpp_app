import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

class MenuDrawer extends StatelessWidget {
  final colorBackGound = const Color.fromARGB(176, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthDrawer = size.width * 0.65;

    return Drawer(
      elevation: 0,
      width: widthDrawer,
      shape: const RoundedRectangleBorder(),
      child: SizedBox(
        // width: 200,
        height: double.infinity,
        child: Material(
          // color: Colors.pinkAccent,
          // borderRadius: BorderRadius.circular(20),
          child: ClipRRect(
            child: Stack(
              // alignment: AlignmentDirectional.centerEnd,
              children: [
                Positioned(
                  right: 0,
                  top: 200,
                  child: Transform.rotate(
                    angle: -pi / 3.0,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(235, 98, 188, 1),
                            Color.fromRGBO(241, 142, 172, 1),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 0,
                  child: Transform.rotate(
                    angle: -pi / 10.0,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(235, 98, 188, 1),
                            Color.fromRGBO(241, 142, 172, 1),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Container(
                      height: double.infinity,
                      // color: Colors.pinkAccent,
                    ),
                  ),
                ),
                Column(
                  children: [
                    DrawerHeader(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(20)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://cdn-japantimes.com/wp-content/uploads/2015/05/z6-sp-expomilano1-a-20150501-e1430724912692.jpg'),
                        ),
                      ),
                      child: Stack(
                        children: const <Widget>[
                          Positioned(
                            bottom: 10.0,
                            left: 15.0,
                            child: Text(
                              "Kyary Pamyu Pamyu",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Aqui se creara las figuras  de colores el blur y mas -----------------
                    const _OpcionDeDrawer(
                      numeroBoton: 0,
                      seleccionado: true,
                      titulo: 'Noticias',
                    ),
                    const _OpcionDeDrawer(
                      numeroBoton: 1,
                      seleccionado: false,
                      titulo: 'Twitter',
                    ),
                    const _OpcionDeDrawer(
                      numeroBoton: 2,
                      seleccionado: false,
                      titulo: 'Reloj',
                    ),
                    const _OpcionDeDrawer(
                      numeroBoton: 3,
                      seleccionado: false,
                      titulo: 'Merca de la Patrona',
                    ),
                    const _OpcionDeDrawer(
                      numeroBoton: 4,
                      seleccionado: false,
                      titulo: 'Mmm Patas',
                    ),
                    const _OpcionDeDrawer(
                      numeroBoton: 5,
                      seleccionado: false,
                      titulo: 'Wallpapers Kyary',
                    ),
                    const _OpcionDeDrawer(
                      numeroBoton: 6,
                      seleccionado: false,
                      titulo: 'Evolucion Kyary',
                    ),
                    const _OpcionDeDrawer(
                      numeroBoton: 7,
                      seleccionado: false,
                      titulo: 'Enlaces Fans Mexico',
                    ),
                    Expanded(
                      child: Material(
                        color: colorBackGound,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OpcionDeDrawer extends StatelessWidget {
  final String titulo;
  final bool seleccionado;
  final int numeroBoton;

  const _OpcionDeDrawer({
    required this.titulo,
    required this.seleccionado,
    required this.numeroBoton,
  });

  @override
  Widget build(BuildContext context) {
    // const colorBackGound = Color.fromARGB(176, 0, 0, 0);
    const colorBackGound = Color.fromARGB(129, 255, 255, 255);

    return Consumer<ButtonDrawerProvider>(
      builder: (context, buttonDrawerProvider, _) {
        return Material(
          // color: (buttonDrawerProvider.getSeleccionado == numeroBoton)
          //     ? const Color.fromARGB(141, 255, 70, 70)
          //     : colorBackGound,
          color: Colors.transparent,
          child: InkWell(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              color: (buttonDrawerProvider.getSeleccionado == numeroBoton)
                  ? const Color.fromARGB(141, 255, 70, 70)
                  : colorBackGound,
              height: (buttonDrawerProvider.getSeleccionado == numeroBoton)
                  ? 80
                  : 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Center(
                      child: Text(
                        titulo,
                        style: TextStyle(
                          color: (buttonDrawerProvider.getSeleccionado ==
                                  numeroBoton)
                              ? Colors.white
                              : Colors.black,
                          fontSize: (buttonDrawerProvider.getSeleccionado ==
                                  numeroBoton)
                              ? 22
                              : 18,
                          fontWeight: (buttonDrawerProvider.getSeleccionado ==
                                  numeroBoton)
                              ? FontWeight.bold
                              : FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              buttonDrawerProvider.setSeleccionado = numeroBoton;
              // Navigator.pop(context);
              print('Sigue asi y tocaras a kyary');
            },
          ),
        );
      },
    );
  }
}
