import 'package:flutter/material.dart';
import 'package:kyari_app/config/use_case_config.dart';
import 'package:kyari_app/ui/common/common_widgets.dart';

import 'widgets/listView_tweets.dart';

class TwitterPage extends StatelessWidget {
  UseCaseConfig useCaseConfig = UseCaseConfig();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: useCaseConfig.getTweetsCase.getTweetsKyary(),
        builder: (context, snapshot) {
          // if (snapshot.hasData) {}
          return (snapshot.hasData) ? const ListTweets() : const LoadingGIF1();
        });
  }
}
