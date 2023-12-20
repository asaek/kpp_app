// import 'package:flutter/material.dart';
// import 'package:kyari_app/infraestructure/driver_adapters/firebase_noticias_propias/noticias_propias_api.dart';
// import 'package:kyari_app/ui/common/common_widgets.dart';
// import 'package:kyari_app/ui/helpers/helpers.dart';
// import 'package:kyari_app/ui/pages/noticias_propias/widgets/widgets_noticias_page.dart';
// import 'package:provider/provider.dart';

// class BlogNoticiasPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: Provider.of<NoticiaPropiaApi>(context, listen: false)
//             .getAllNoticias(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final noticiasProvider =
//                 Provider.of<NoticiasProvider>(context, listen: false);
//             noticiasProvider.setNoticiasCargadas = snapshot.data!;

//             noticiasProvider.setCatidadSlotsPageViewList =
//                 snapshot.data!.length;

//             noticiasProvider.setPageControllerList = snapshot.data!.length;
//           }

//           return AnimatedSwitcher(
//             duration: const Duration(milliseconds: 300),
//             transitionBuilder: (widgetListBuilder, animation) => FadeTransition(
//               opacity: animation,
//               child: widgetListBuilder,
//             ),
//             child: (snapshot.hasData)
//                 ? const ListViewBuilderNoticiasPropias()
//                 : const LoadingGIF2(),
//           );
//         });
//   }
// }
