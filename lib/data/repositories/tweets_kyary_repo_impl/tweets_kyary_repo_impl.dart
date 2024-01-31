import '../../../domain/drivers_adapters/drivers_adapters.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/repositories/tweets_kyary_repo/tweets_kyary_repo.dart';

class TweetsKyaryRepoImpl implements TweetsKyaryRepo {
  final TwitterTweetsDriverAdapter _dataSource;

  TweetsKyaryRepoImpl(this._dataSource);

  @override
  Future<List<TweetKyaryEntitie>> getTweetsKyary() {
    return _dataSource.getTweetsKyary();
  }
}
