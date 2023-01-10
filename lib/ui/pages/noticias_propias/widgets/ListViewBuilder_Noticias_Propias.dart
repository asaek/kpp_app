import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/tokens/colores.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:kyari_app/ui/pages/noticias_propias/widgets/widgets_noticias_page.dart';
import 'package:provider/provider.dart';

class ListViewBuilderNoticiasPropias extends StatelessWidget {
  const ListViewBuilderNoticiasPropias({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NoticiasProvider>(
      builder: (context, noticiasProvider, child) => ListView.builder(
        itemCount: noticiasProvider.getNoticiasCargadas.length,
        scrollDirection: Axis.vertical,
        physics: (noticiasProvider.getListViewSeMueve)
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final edgesImage = BorderRadius.circular(25);

          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Column(
              children: [
                (index == 0) ? const SizedBox(height: 60) : const SizedBox(),
                Material(
                  color: Color_Panel_Noticia,
                  borderRadius: edgesImage,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          PageViewZOOM(
                            index: index,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FloatingActionButton(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Color_All_Interface_X,
                                  size: 45,
                                ),
                                onPressed: () {
                                  final listaControllers =
                                      noticiasProvider.getPageControllerList;
                                  print(
                                      'Pagina actual del controller $index --- ${listaControllers[index].page}');

                                  listaControllers[index].previousPage(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeIn);

                                  print('Me precionaste');
                                },
                              ),
                              FloatingActionButton(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Color_All_Interface_X,
                                  size: 45,
                                ),
                                onPressed: () {
                                  final listaControllers =
                                      noticiasProvider.getPageControllerList;

                                  print(
                                      'Pagina actual del controller $index --- ${listaControllers[index].page}');
                                  listaControllers[index].nextPage(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeIn);
                                  print('Me precionaste');
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                      Text(
                        noticiasProvider.getNoticiasCargadas[index].titulo,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Text(
                          noticiasProvider.getNoticiasCargadas[index].texto,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(noticiasProvider
                              .getNoticiasCargadas[index].fuente),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
