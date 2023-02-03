import 'package:kyari_app/domain/models/models.dart';

import '../common/base_mapper.dart';

class TweetsKyaryMapper implements TweetsKyaryBaseMapper<TweetKyaryObjeto> {
  @override
  fromMapAllTweetsKyary(Map<String, dynamic> json) {
    final List<TweetKyaryObjeto> listaTweets = [];

    return listaTweets;
  }
}
