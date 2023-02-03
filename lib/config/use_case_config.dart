import 'package:kyari_app/domain/use_cases/Noticias_Propias/get_noticias_use_case.dart';
import 'package:kyari_app/domain/use_cases/Tweets_Kyary/get_tweetsKyary_use_case.dart';
import 'package:kyari_app/infraestructure/driver_adapters/firebase_noticias_propias/noticias_propias_api.dart';
import 'package:kyari_app/infraestructure/driver_adapters/tweets_kyary/tweets_Kyary_api.dart';

class UseCaseConfig {
  late GetNoticiaCase getAlbumUseCase;
  late NoticiaPropiaApi _noticiaPropiaApi;

  late GetTweetsCase getTweetsCase;
  late TweetsKyaryApi _tweetsKyaryApi;

  UseCaseConfig() {
    _noticiaPropiaApi = NoticiaPropiaApi();
    getAlbumUseCase = GetNoticiaCase(_noticiaPropiaApi);

    _tweetsKyaryApi = TweetsKyaryApi();
    getTweetsCase = GetTweetsCase(_tweetsKyaryApi);
  }
}
