import 'package:kyari_app/domain/models/models.dart';

abstract class TweetsKyaryGateway {
  Future<List<TweetKyaryObjeto>> getTweetsKyary();
}
