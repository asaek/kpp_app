import 'package:kyari_app/data/models/models.dart';

import '../../../domain/mappers/base_mapper.dart';

class TweetsKyaryMapper
    implements TweetsKyaryBaseMapper<TweetKyaryObjetoModel> {
  @override
  fromMapAllTweetsKyary(Map<String, dynamic> json) {
    final List<TweetKyaryObjetoModel> listaTweets = [];

    return listaTweets;
  }
}
