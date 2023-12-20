import '../../entities/entities.dart';

abstract class TwitterTweetsApi {
  Future<List<TweetKyaryEntitie>> getTweetsKyary();
}
