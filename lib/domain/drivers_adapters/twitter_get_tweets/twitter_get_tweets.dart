import '../../entities/entities.dart';

abstract class TwitterTweetsDriverAdapter {
  Future<List<TweetKyaryEntitie>> getTweetsKyary();
}
