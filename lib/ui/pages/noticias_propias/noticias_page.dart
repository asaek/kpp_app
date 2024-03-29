import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/common_widgets.dart';
import '../../helpers/helpers.dart';
import 'widgets/widgets_noticias_page.dart';

class BlogNoticiasPage extends StatelessWidget {
  const BlogNoticiasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<NoticiasPropiasProvider>(context, listen: false)
          .getAllNoticias(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Fijo la cantidad de los datos de la lista
          Provider.of<NoticiasPropiasProvider>(context, listen: false)
              .setPageControllerList = snapshot.data!.length;
          Provider.of<NoticiasPropiasProvider>(context, listen: false)
              .setCatidadSlotsPageViewList = snapshot.data!.length;
        }

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (widgetListBuilder, animation) => FadeTransition(
            opacity: animation,
            child: widgetListBuilder,
          ),
          child: (snapshot.hasData)
              ? const ListViewBuilderNoticiasPropias()
              // ? Container(
              //     color: Colors.green,
              //     width: 200,
              //     height: 200,
              //   )
              : const LoadingGIF2(),
          // : Container(
          //     color: Colors.red,
          //     width: 200,
          //     height: 200,
          //   ),
        );
      },
    );
  }
}
