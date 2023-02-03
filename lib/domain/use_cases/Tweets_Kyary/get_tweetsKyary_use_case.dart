import 'package:kyari_app/domain/models/models.dart';
import 'package:kyari_app/domain/models/tweets_kyary/gateway/tweets_kyary_gateway.dart';

class GetTweetsCase {
  final TweetsKyaryGateway _tweetsKyaryGateway;
  GetTweetsCase(this._tweetsKyaryGateway);

  Future<List<TweetKyaryObjeto>> getTweetsKyary() async {
    return _tweetsKyaryGateway.getTweetsKyary();
  }
}
