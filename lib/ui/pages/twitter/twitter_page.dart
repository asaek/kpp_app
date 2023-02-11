import 'package:flutter/material.dart';
import 'package:kyari_app/config/use_case_config.dart';
import 'package:kyari_app/ui/common/common_widgets.dart';
import 'package:kyari_app/ui/helpers/helpers.dart';
import 'package:provider/provider.dart';

import 'widgets/Widgets_twitter.dart';

class TwitterPage extends StatelessWidget {
  UseCaseConfig useCaseConfig = UseCaseConfig();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: useCaseConfig.getTweetsCase.getTweetsKyary(),
      builder: (context, snapshot) => Consumer<TwitterSDKKyary>(
        builder: (context, twitterSDKKyary, _) {
          if (snapshot.hasData) {
            twitterSDKKyary.setTweetsKyary = snapshot.data!;
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
