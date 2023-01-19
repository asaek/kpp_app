import 'package:dart_twitter_api/twitter_api.dart';
import 'package:flutter/material.dart';

class TwitterPage extends StatelessWidget {
  const TwitterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: const Text(
          'Hola Mundo',
        ),
        onTap: () async {
          final twitterApi = TwitterApi(
            client: TwitterClient(
              consumerKey: 'jK7I5oz3Ydg6DuQyHEyyl7eD6',
              consumerSecret:
                  'BeG5Ywf5YgB9lgKzyonYT1YpjcQY0vbMCXYUqEm0SvaS9XeSwz',
              secret: 'GwPXrgz6tZ8mj1cieddHy4YPEnOauDksu3OohZugHwZmr',
              token: '232285960-xhafiE6Y54rPFHxk0T7N7lCorvQ0vnIJ782oMpwm',
            ),
          );

          final homeTimeline =
              await twitterApi.timelineService.homeTimeline(count: 5);
          print(homeTimeline);
        },
      ),
    );
  }
}
