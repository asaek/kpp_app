import 'package:flutter/material.dart';
import 'package:kyari_app/ui/common/common_widgets.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

class TwitterPage extends StatelessWidget {
  const TwitterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<TwitterKyaryProvider>(context, listen: false)
          .getAllTweetsKyary(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final twitterSDKKyary =
              Provider.of<TwitterKyaryProvider>(context, listen: false);
          twitterSDKKyary.setTweetsKyary = snapshot.data!;

          // Se asigna la cantidad de pageController a utilizarse
          twitterSDKKyary.setPageControllerList = snapshot.data!.length;
          twitterSDKKyary.setCantidadSlotsPageView = snapshot.data!.length;
        }
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          // ! Aqui va el widget de " ListTweets "  lo mas seguro es que lop comente
          // ! sera de habilitarlo, dejare un container por ahora

          // ! Tengo que ver quein llamaba a esta pagina para ver si es necesario
          child: (snapshot.hasData)
              ? Container(
                  color: Colors.orange,
                )
              : const LoadingGIF2(),
        );
      },
    );
  }
}
