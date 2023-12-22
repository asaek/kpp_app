import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/common_widgets.dart';
import 'package:provider/provider.dart';

import '../../../data/driver_adapters_impl/firebase_noticias_propias_impl/noticias_propias_api_impl.dart';

// class BlogNoticiasPage extends StatelessWidget {
//   const BlogNoticiasPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 300),
//       transitionBuilder: (widgetListBuilder, animation) => FadeTransition(
//         opacity: animation,
//         child: widgetListBuilder,
//       ),
//       child: const LoadingGIF2(),
//     );
//   }
// }

class BlogNoticiasPage extends StatelessWidget {
  const BlogNoticiasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<NoticiaPropiaApi>(context, listen: false)
            .getAllNoticias(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final noticiasProvider =
                Provider.of<NoticiasProvider>(context, listen: false);
            noticiasProvider.setNoticiasCargadas = snapshot.data!;

            noticiasProvider.setCatidadSlotsPageViewList =
                snapshot.data!.length;

            noticiasProvider.setPageControllerList = snapshot.data!.length;
          }

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (widgetListBuilder, animation) => FadeTransition(
              opacity: animation,
              child: widgetListBuilder,
            ),
            child: (snapshot.hasData)
                ? const ListViewBuilderNoticiasPropias()
                : const LoadingGIF2(),
          );
        });
  }
}
