import '../../entities/entities.dart';

abstract class TweetsKyaryRepo {
  Future<List<TweetKyaryEntitie>> getTweetsKyary();
}
