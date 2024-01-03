import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/common_widgets.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';
import 'widgets/widgets_noticias_page.dart';

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
        future: Provider.of<NoticiasPropiasProvider>(context, listen: false)
            .getAllNoticias(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Provider.of<NoticiasPropiasProvider>(context, listen: false).setCatidadSlotsPageViewList =
            //     snapshot.data!.length;

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
                : const LoadingGIF2(),
          );
        });
  }
}
