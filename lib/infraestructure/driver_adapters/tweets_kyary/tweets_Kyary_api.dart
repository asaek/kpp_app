import 'package:kyari_app/domain/models/tweets_kyary/gateway/tweets_kyary_gateway.dart';
import 'package:kyari_app/domain/models/tweets_kyary/modelo_tweet_Kyary.dart';
import 'package:kyari_app/infraestructure/helpers/tweetsKyary/TweetsKyaryHelper.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';

class TweetsKyaryApi extends TweetsKyaryGateway {
  final TwitterApi twitter = TwitterApi(
    bearerToken:
        'AAAAAAAAAAAAAAAAAAAAALmzSQEAAAAAbklyR2aDd%2BZr6XX6YToyG7rltJs%3D1SZ9qO7APcKBlGioeMLPDLa0zbtO2sxO6ASDkyZV8S2Hq3jCtW',

    oauthTokens: const OAuthTokens(
      consumerKey: 'jK7I5oz3Ydg6DuQyHEyyl7eD6',
      consumerSecret: 'BeG5Ywf5YgB9lgKzyonYT1YpjcQY0vbMCXYUqEm0SvaS9XeSwz',
      accessToken: 'GwPXrgz6tZ8mj1cieddHy4YPEnOauDksu3OohZugHwZmr',
      accessTokenSecret: '232285960-xhafiE6Y54rPFHxk0T7N7lCorvQ0vnIJ782oMpwm',
    ),

    retryConfig: RetryConfig(
      maxAttempts: 5,
      onExecute: (event) => print(
        'Retry after ${event.intervalInSeconds} seconds... '
        '[${event.retryCount} times]',
      ),
    ),

    //! The default timeout is 10 seconds.
    timeout: const Duration(seconds: 15),
  );

  @override
  Future<List<TweetKyaryObjeto>> getTweetsKyary() async {
    final TweetsKyaryMapper tweetsKyaryMapper = TweetsKyaryMapper();

    final tweets = await twitter.tweets.searchRecent(
      query: 'from:pamyurin',
      mediaFields: [
        MediaField.mediaKey,
        MediaField.url,
        MediaField.previewImageUrl,
        MediaField.altText,
      ],
      expansions: [
        TweetExpansion.attachmentsMediaKeys,
        TweetExpansion.attachmentsPollIds,
      ],
      // tweetFields: [
      //   TweetField.text,
      //   TweetField.attachments,
      // ],
      maxResults: 10,
    );
    final tweetsKyary = tweets.data;
    final imagenesTweets = tweets;
    print(tweets);

    return [];
  }
}

// tweets_Kyary() async {
//   final twitter = TwitterApi(
//     bearerToken:
//         'AAAAAAAAAAAAAAAAAAAAALmzSQEAAAAAbklyR2aDd%2BZr6XX6YToyG7rltJs%3D1SZ9qO7APcKBlGioeMLPDLa0zbtO2sxO6ASDkyZV8S2Hq3jCtW',

//     oauthTokens: const OAuthTokens(
//       consumerKey: 'jK7I5oz3Ydg6DuQyHEyyl7eD6',
//       consumerSecret: 'BeG5Ywf5YgB9lgKzyonYT1YpjcQY0vbMCXYUqEm0SvaS9XeSwz',
//       accessToken: 'GwPXrgz6tZ8mj1cieddHy4YPEnOauDksu3OohZugHwZmr',
//       accessTokenSecret: '232285960-xhafiE6Y54rPFHxk0T7N7lCorvQ0vnIJ782oMpwm',
//     ),

//     retryConfig: RetryConfig(
//       maxAttempts: 5,
//       onExecute: (event) => print(
//         'Retry after ${event.intervalInSeconds} seconds... '
//         '[${event.retryCount} times]',
//       ),
//     ),

//     //! The default timeout is 10 seconds.
//     timeout: const Duration(seconds: 20),
//   );
//   try {
//     // final me = await twitter.usersService.lookupMe();
//     // final tweets = await twitter.tweets.searchAll(query: '@pamyurin');
//     final tweets = await twitter.tweets.searchRecent(
//       query: 'from:pamyurin',
//       mediaFields: [
//         MediaField.mediaKey,
//         MediaField.url,
//         MediaField.previewImageUrl,
//         MediaField.altText,
//       ],
//       expansions: [
//         TweetExpansion.attachmentsMediaKeys,
//         TweetExpansion.attachmentsPollIds,
//       ],
//       // tweetFields: [
//       //   TweetField.text,
//       //   TweetField.attachments,
//       // ],
//       maxResults: 10,
//     );

//     print(tweets);
//   } catch (e) {
//     print(e);
//   }
// }
