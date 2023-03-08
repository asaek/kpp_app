import 'package:flutter/material.dart';
import 'package:kyari_app/infraestructure/driver_adapters/tweets_kyary/tweets_Kyary_api.dart';
import 'package:kyari_app/ui/common/common_widgets.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

import 'widgets/Widgets_twitter.dart';

class TwitterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<TweetsKyaryApi>(context, listen: false).getTweetsKyary(),
      builder: (context, snapshot) => Consumer<TwitterSDKKyary>(
        builder: (context, twitterSDKKyary, _) {
          if (snapshot.hasData) {
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
            child:
                (snapshot.hasData) ? const ListTweets() : const LoadingGIF1(),
          );
        },
      ),
    );
  }
}
