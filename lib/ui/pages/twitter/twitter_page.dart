import 'package:flutter/material.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart' as v2;

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
          // final twitterApi = TwitterApi(
          //   client: TwitterClient(
          //     consumerKey: 'jK7I5oz3Ydg6DuQyHEyyl7eD6',
          //     consumerSecret:
          //         'BeG5Ywf5YgB9lgKzyonYT1YpjcQY0vbMCXYUqEm0SvaS9XeSwz',
          //     secret: 'GwPXrgz6tZ8mj1cieddHy4YPEnOauDksu3OohZugHwZmr',
          //     token: '232285960-xhafiE6Y54rPFHxk0T7N7lCorvQ0vnIJ782oMpwm',
          //   ),
          // );

          // final homeTimeline = twitterApi.tweetSearchService;
          // print(homeTimeline);

          final twitter = v2.TwitterApi(
            bearerToken:
                'AAAAAAAAAAAAAAAAAAAAALmzSQEAAAAAbklyR2aDd%2BZr6XX6YToyG7rltJs%3D1SZ9qO7APcKBlGioeMLPDLa0zbtO2sxO6ASDkyZV8S2Hq3jCtW',

            oauthTokens: const v2.OAuthTokens(
              consumerKey: 'jK7I5oz3Ydg6DuQyHEyyl7eD6',
              consumerSecret:
                  'BeG5Ywf5YgB9lgKzyonYT1YpjcQY0vbMCXYUqEm0SvaS9XeSwz',
              accessToken: 'GwPXrgz6tZ8mj1cieddHy4YPEnOauDksu3OohZugHwZmr',
              accessTokenSecret:
                  '232285960-xhafiE6Y54rPFHxk0T7N7lCorvQ0vnIJ782oMpwm',
            ),

            retryConfig: v2.RetryConfig(
              maxAttempts: 5,
              onExecute: (event) => print(
                'Retry after ${event.intervalInSeconds} seconds... '
                '[${event.retryCount} times]',
              ),
            ),

            //! The default timeout is 10 seconds.
            timeout: const Duration(seconds: 20),
          );
          try {
            // final me = await twitter.usersService.lookupMe();
            // final tweets = await twitter.tweets.searchAll(query: '@pamyurin');
            final tweets = await twitter.tweets.searchRecent(
              query: 'from:pamyurin',
              maxResults: 10,
            );

            print(tweets);
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}
